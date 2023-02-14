@extends('layouts.user')

@section('title', 'Team Leads Report')


@section('content')


    <div class="search-area">
        <div class="row">

            <div class="col-md-6">
                <h4 class="mb-0">Search</h4>
            </div>
            <div class="col-md-6">
                <div class="button-area">
                    <button type="button" id="btn-search" class="btn btn-primary"><i class="fas fa-filter"></i></button>
                </div>
            </div>

        </div>

        <form action="{{ route('voice-reports.team-leads') }}" method="get" autocomplete="off">
            <input type="hidden" name="search" value="1">
            @php
                $search_id = '';
                $campaign_id = '';
                $from_date = '';
                $to_date = '';
                $from_time = '';
                $to_time = '';
                
                if (isset($_GET['search'])) {
                    if (!empty($_GET['id'])) {
                        $search_id = $_GET['id'];
                    }
                    if (!empty($_GET['campaign_id'])) {
                        $campaign_id = $_GET['campaign_id'];
                    }
                
                    if (!empty($_GET['from_date'])) {
                        $from_date = $_GET['from_date'];
                    }
                    if (!empty($_GET['to_date'])) {
                        $to_date = $_GET['to_date'];
                    }
                    if (!empty($_GET['from_time'])) {
                        $from_time = $_GET['from_time'];
                    }
                    if (!empty($_GET['to_time'])) {
                        $to_time = $_GET['to_time'];
                    }
                }
                
            @endphp

            <div class="card card-primary card-outline mt-3" id="search"
                @if (isset($_GET['search'])) style="display: block;" @endif>
                <div class="card-body">
                    <div class="row">

                        <div class="form-group col-md-4">
                            <label for="">Select Team Lead</label>
                            <select name="id" class="form-control select2">
                                <option value="">Select Option</option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}" @if ($user->id == $search_id) selected @endif>
                                        {{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        @if (
                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) && Auth::user()->campaign_id == 1) ||
                                in_array(Auth::user()->roles[0]->name, ['Super Admin']))
                            <div class="form-group col-md-4">
                                <label for="">Select Campaign</label>
                                <select name="campaign_id" class="form-control select2">
                                    <option value="">Select Option</option>
                                    @foreach ($campaigns as $campaign)
                                        <option value="{{ $campaign->id }}"
                                            @if ($campaign->id == $campaign_id) selected @endif>
                                            {{ $campaign->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        @endif
                        <div class="form-group col-md-4">
                            <label for="">From Date</label>
                            <input type="text" class="form-control datetimepicker-input datepicker1" name="from_date"
                                value="{{ $from_date }}" data-toggle="datetimepicker" data-target=".datepicker1" />
                        </div>

                        <div class="form-group col-md-4">
                            <label for="">To Date</label>
                            <input type="text" class="form-control datetimepicker-input datepicker2" name="to_date"
                                value="{{ $to_date }}" data-toggle="datetimepicker" data-target=".datepicker2" />
                        </div>

                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <a href="{{ route('voice-reports.team-leads') }}" class="ml-5">Clear Search</a>
                </div>
            </div>
        </form>

    </div>

    <!-- Default box -->
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">Team Leads Report</h3>
            <div class="card-tools">
                <a href="{{ route('export.team-leads') }}?search_id={{ $search_id }}&campaign_id={{ $campaign_id }}&from_date={{ $from_date }}&to_date={{ $to_date }}"
                    class="btn btn-success btn-sm ml-2" onclick="return confirm('Are you sure?')">Export Report</a>
            </div>
        </div>

        <div class="card-body">

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Team Lead Name</th>
                        <th>Campaign</th>
                        <th>Project</th>
                        <th class="text-center">Above Average</th>
                        <th class="text-center">Average</th>
                        <th class="text-center">Bad</th>
                        <th class="text-center">Fatal</th>
                        <th class="text-center">Good</th>
                        <th class="text-center">QA Percentage</th>
                        <th class="text-center">Overall QA Percentage</th>
                        @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']))
                            <th class="action">Action</th>
                        @endif
                    </tr>
                </thead>
                <tbody>

                    @if (count($user_evaluations) > 0)
                        @foreach ($user_evaluations as $key => $item)
                            @php
                                
                                $aboveAverage = [];
                                $average = [];
                                $bad = [];
                                $fatal = [];
                                $good = [];
                                $other = [];
                                $total = [];
                                $qaPercentage = [];
                                $overallQaPercentage = [];
                    
                                $aboveAverageCount = 0;
                                $averageCount = 0;
                                $badCount = 0;
                                $goodCount = 0;
                                $fatalCount = 0;
                                $otherCount = 0;
                                $qaPercentageCount = 0;
                                
                                
                                if (count($item->teamLeadVoiceAudits) > 0) {
                                    foreach ($item->teamLeadVoiceAudits as $audit) {
                                        // $count = count($item->teamLeadVoiceAudits);
                                        $project_ids = [];
                                        $projects = $audit->campaign->projects;
                                        $sum = 0;
                                        $percentage = 0;
                                        $total_tl = [];
                                        foreach ($projects as $project) {
                                            array_push($project_ids, $project->id);
                                            foreach ($project_ids as $project_id) {
                                                // echo $project_id.' - '.$project->id."<br>";
                                                if ($project_id == $project->id && $audit->rating == 'above average') {
                                                    $aboveAverage[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'above average', $project->id);
                                                    $aboveAverageCount = $aboveAverage[$audit->team_lead_id][$project->id];
                                                } elseif ($project_id == $project->id && $audit->rating == 'average') {
                                                    $average[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'average', $project->id);
                                                    $averageCount = $average[$audit->team_lead_id][$project->id];
                                                } elseif ($project_id == $project->id && $audit->rating == 'bad') {
                                                    $bad[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'bad', $project->id);
                                                    $badCount = $bad[$audit->team_lead_id][$project->id];
                                                } elseif ($project_id == $project->id && $audit->rating == 'fatal') {
                                                    $fatal[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'fatal', $project->id);
                                                    $fatalCount = $fatal[$audit->team_lead_id][$project->id];
                                                } elseif ($project_id == $project->id && $audit->rating == 'good') {
                                                    $good[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'good', $project->id);
                                                    $goodCount = $good[$audit->team_lead_id][$project->id];
                                                } else {
                                                    $other[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'other', $project->id);
                                                    $otherCount = $other[$audit->team_lead_id][$project->id];
                                                }
                                                $qaPercentage[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlQaScore($audit->team_lead_id, $project->id); 
                                                $qaPercentageCount = $qaPercentage[$audit->team_lead_id][$project->id];
                                                $overallQaPercentage[$audit->team_lead_id] = App\Http\Controllers\Reports\VoiceReportController::getTlOverallQaScore($audit->team_lead_id); 
                                            }
                                            // $total[$audit->team_lead_id][$project->id]['total_count'] = $aboveAverageCount + $averageCount + $badCount + $fatalCount + $goodCount + $otherCount;
                                            // $percentage = $total[$audit->team_lead_id][$project->id]['total_count'] / count($user_evaluations);
                                            // $sum = $percentage + $sum;
                                            // $total_tl[$audit->team_lead_id] = $sum;
                                        }
                                    }
                                }
                            @endphp
                            <tr>
                                <td>{{ $user_evaluations->firstItem() + $key }}</td>
                                <td>{{ $item->name ?? '' }}</td>
                                <td>{{ $item->campaign->name ?? '-' }}</td>
                                <td>
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>{{ $project->name ?? '' }}</div>
                                        @endforeach
                                    @endif
                                </td>


                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>{{ $aboveAverage[$item->id][$project->id] ?? 0 }}</div>
                                        @endforeach
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>{{ $average[$item->id][$project->id] ?? 0 }}</div>
                                        @endforeach
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>{{ $bad[$item->id][$project->id] ?? 0 }}</div>
                                        @endforeach
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>{{ $fatal[$item->id][$project->id] ?? 0 }}</div>
                                        @endforeach
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>{{ $good[$item->id][$project->id] ?? 0 }}</div>
                                        @endforeach
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        @foreach ($item->campaign->projects as $project)
                                            <div>
                                                {{ round($qaPercentage[$item->id][$project->id]) ?? 0 }}
                                                %
                                            </div>
                                        @endforeach
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if ($item->campaign->projects)
                                        <div>
                                            {{ round($overallQaPercentage[$item->id]) ?? 0 }}
                                            %
                                        </div>
                                    @endif
                                </td>
                                @if (
                                    // (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) && Auth::user()->campaign_id == 1) ||
                                    in_array(Auth::user()->roles[0]->name, ['Super Admin']))
                                    <td class="action">
                                        <a href="{{ route('voice-audits.index', 1) }}?search=1&record_id=&user_id=&associate_id=-1&campaign_id={{ $item->campaign_id }}&outcome=&from_date={{ $from_date }}&to_date={{ $to_date }}&from_time={{ $from_time }}&to_time={{ $to_time }}&review="
                                            class="btn btn-success btn-sm" target="_blank"><i class="fas fa-eye"></i></a>
                                    </td>
                                @endif
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="10" class="text-center">No records found!</td>
                        </tr>
                    @endif

                </tbody>
            </table>

        </div>

        @if ($user_evaluations->total() > 15)
            <!-- /.card-body -->
            <div class="card-footer clearfix">
                {{ $user_evaluations->appends(request()->input())->links() }}
            </div>
            <!-- /.card-footer-->
        @endif
    </div>
    <!-- /.card -->
@endsection

@section('scripts')

    <script>
        $(function() {
            $("#btn-search").click(function(e) {
                e.preventDefault();
                $("#search").slideToggle();
            });

            $('.datepicker1').datetimepicker({
                format: 'L',
                format: 'DD/MM/YYYY',
                keepInvalid: false
            });

            $('.datepicker2').datetimepicker({
                format: 'L',
                format: 'DD/MM/YYYY',
                keepInvalid: false
            });

            $('.datepicker3').datetimepicker({
                format: 'L',
                format: 'hh:mm:ss A',
                keepInvalid: false
            });

            $('.datepicker4').datetimepicker({
                format: 'L',
                format: 'hh:mm:ss A',
                keepInvalid: false
            });

        });
    </script>

@endsection
