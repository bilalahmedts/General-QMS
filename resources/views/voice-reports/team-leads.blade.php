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
                    $search_id = $_GET['search_id'];
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
                            <select name="search_id" class="form-control select2">
                                <option value="-1">Select Option</option>
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
                    </tr>
                </thead>
                <tbody>

                    @if (count($user_evaluations) > 0)
                        @foreach ($user_evaluations as $key => $item)
                            @php
                                $aboveAverageEddyEdu = 0;
                                $averageEddyEdu = 0;
                                $badEddyEdu = 0;
                                $fatalEddyEdu = 0;
                                $goodEddyEdu = 0;
                                $otherEddyEdu = 0;
                                
                                $aboveAverageEddyIB = 0;
                                $averageEddyIB = 0;
                                $badEddyIB = 0;
                                $fatalEddyIB = 0;
                                $goodEddyIB = 0;
                                $otherEddyIB = 0;
                                
                                $aboveAverageEddyOB = 0;
                                $averageEddyOB = 0;
                                $badEddyOB = 0;
                                $fatalEddyOB = 0;
                                $goodEddyOB = 0;
                                $otherEddyOB = 0;
                                
                                $aboveAverageGuidance = 0;
                                $averageGuidance = 0;
                                $badGuidance = 0;
                                $fatalGuidance = 0;
                                $goodGuidance = 0;
                                $otherGuidance = 0;
                                
                                $aboveAverageDSS = 0;
                                $averageDSS = 0;
                                $badDSS = 0;
                                $fatalDSS = 0;
                                $goodDSS = 0;
                                $otherDSS = 0;
                                
                                if (count($item->teamLeadVoiceAudits) > 0) {
                                    foreach ($item->teamLeadVoiceAudits as $audit) {
                                        if ($audit->project_id == 1 && $audit->rating == 'above average') {
                                            $aboveAverageEddyEdu++;
                                        } elseif ($audit->project_id == 1 && $audit->rating == 'average') {
                                            $averageEddyEdu++;
                                        } elseif ($audit->project_id == 1 && $audit->rating == 'bad') {
                                            $badEddyEdu++;
                                        } elseif ($audit->project_id == 1 && $audit->rating == 'fatal') {
                                            $fatalEddyEdu++;
                                        } elseif ($audit->project_id == 1 && $audit->rating == 'good') {
                                            $goodEddyEdu++;
                                        } else {
                                            $otherEddyEdu++;
                                        }
                                        if ($audit->project_id == 2 && $audit->rating == 'above average') {
                                            $aboveAverageEddyIB++;
                                        } elseif ($audit->project_id == 2 && $audit->rating == 'average') {
                                            $averageEddyIB++;
                                        } elseif ($audit->project_id == 2 && $audit->rating == 'bad') {
                                            $badEddyIB++;
                                        } elseif ($audit->project_id == 2 && $audit->rating == 'fatal') {
                                            $fatalEddyIB++;
                                        } elseif ($audit->project_id == 2 && $audit->rating == 'good') {
                                            $goodEddyIB++;
                                        } else {
                                            $otherEddyIB++;
                                        }
                                        if ($audit->project_id == 3 && $audit->rating == 'above average') {
                                            $aboveAverageEddyOB++;
                                        } elseif ($audit->project_id == 3 && $audit->rating == 'average') {
                                            $averageEddyOB++;
                                        } elseif ($audit->project_id == 3 && $audit->rating == 'bad') {
                                            $badEddyOB++;
                                        } elseif ($audit->project_id == 3 && $audit->rating == 'fatal') {
                                            $fatalEddyOB++;
                                        } elseif ($audit->project_id == 3 && $audit->rating == 'good') {
                                            $goodEddyOB++;
                                        } else {
                                            $otherEddyOB++;
                                        }
                                        if ($audit->project_id == 4 && $audit->rating == 'above average') {
                                            $aboveAverageGuidance++;
                                        } elseif ($audit->project_id == 4 && $audit->rating == 'average') {
                                            $averageGuidance++;
                                        } elseif ($audit->project_id == 4 && $audit->rating == 'bad') {
                                            $badGuidance++;
                                        } elseif ($audit->project_id == 4 && $audit->rating == 'fatal') {
                                            $fatalGuidance++;
                                        } elseif ($audit->project_id == 4 && $audit->rating == 'good') {
                                            $goodGuidance++;
                                        } else {
                                            $otherGuidance++;
                                        }
                                        if ($audit->project_id == 5 && $audit->rating == 'above average') {
                                            $aboveAverageGuidance++;
                                        } elseif ($audit->project_id == 5 && $audit->rating == 'average') {
                                            $averageGuidance++;
                                        } elseif ($audit->project_id == 5 && $audit->rating == 'bad') {
                                            $badGuidance++;
                                        } elseif ($audit->project_id == 5 && $audit->rating == 'fatal') {
                                            $fatalGuidance++;
                                        } elseif ($audit->project_id == 5 && $audit->rating == 'good') {
                                            $goodGuidance++;
                                        } else {
                                            $otherGuidance++;
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
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 2)))
                                        <div>{{ $aboveAverageEddyEdu }}</div>
                                        <div>{{ $aboveAverageEddyIB }}</div>
                                        <div>{{ $aboveAverageEddyOB }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 3)))
                                        <div>{{ $aboveAverageGuidance }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 4)))
                                        <div>{{ $aboveAverageDSS }}</div>
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 2)))
                                        <div>{{ $averageEddyEdu }}</div>
                                        <div>{{ $averageEddyIB }}</div>
                                        <div>{{ $averageEddyOB }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 3)))
                                        <div>{{ $averageGuidance }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 4)))
                                        <div>{{ $averageDSS }}</div>
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 2)))
                                        <div>{{ $badEddyEdu }}</div>
                                        <div>{{ $badEddyIB }}</div>
                                        <div>{{ $badEddyOB }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 3)))
                                        <div>{{ $badGuidance }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 4)))
                                        <div>{{ $badDSS }}</div>
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 2)))
                                        <div>{{ $fatalEddyEdu }}</div>
                                        <div>{{ $fatalEddyIB }}</div>
                                        <div>{{ $fatalEddyOB }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 3)))
                                        <div>{{ $fatalGuidance }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 4)))
                                        <div>{{ $fatalDSS }}</div>
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 2)))
                                        <div>{{ $goodEddyEdu }}</div>
                                        <div>{{ $goodEddyIB }}</div>
                                        <div>{{ $goodEddyOB }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 3)))
                                        <div>{{ $goodGuidance }}</div>
                                    @endif
                                    @if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) ||
                                            (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead']) &&
                                                (Auth::user()->campaign_id == 1 || Auth::user()->campaign_id == 4)))
                                        <div>{{ $goodDSS }}</div>
                                    @endif
                                </td>

                                <td></td>
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
