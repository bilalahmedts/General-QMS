@extends('layouts.user')

@section('title', 'Campaigns Report')


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

        <form action="{{ route('voice-reports.campaigns') }}" method="get" autocomplete="off">
            <input type="hidden" name="search" value="1">
            @php
                $campaign_id = -1;
                $from_date = '';
                $to_date = '';
                $from_time = '';
                $to_time = '';
                
                if (isset($_GET['search'])) {
                    $campaign_id = $_GET['campaign_id'];
                
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
                            <label for="">Select Campaign</label>
                            <select name="campaign_id" class="form-control select2">
                                <option value="-1">Select Option</option>
                                @foreach ($campaigns as $campaign)
                                    <option value="{{ $campaign->id }}" @if ($campaign->id == $campaign_id) selected @endif>
                                        {{ $campaign->name }}</option>
                                @endforeach
                            </select>
                        </div>

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
                    <a href="{{ route('voice-reports.campaigns') }}" class="ml-5">Clear Search</a>
                </div>
            </div>
        </form>

    </div>

    <!-- Default box -->
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">Campaigns Report</h3>
        </div>

        <div class="card-body">

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Campaign Name</th>
                        <th class="text-center">Quality Score</th>
                        <th class="text-center">Total Evaluations</th>
                        <th class="text-center">Above Average</th>
                        <th class="text-center">Average</th>
                        <th class="text-center">Bad</th>
                        <th class="text-center">Fatal</th>
                        <th class="text-center">Good</th>
                        <th class="text-center">Grand Total</th>
                        <th class="action">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @if (count($campaign_evaluations) > 0)
                        @foreach ($campaign_evaluations as $key => $item)
                            @php
                                $total = 0;
                                $total_percentage = 0;
                                $aboveAverage = 0;
                                $average = 0;
                                $bad = 0;
                                $fatal = 0;
                                $good = 0;
                                $other = 0;
                                $campaignGrandTotal = 0;
                                if (count($item->voiceAudits) > 0) {
                                    foreach ($item->voiceAudits as $audit) {
                                        if ($audit->rating == 'above average') {
                                            $aboveAverage++;
                                        } elseif ($audit->rating == 'average') {
                                            $average++;
                                        } elseif ($audit->rating == 'bad') {
                                            $bad++;
                                        } elseif ($audit->rating == 'fatal') {
                                            $fatal++;
                                        } elseif ($audit->rating == 'good') {
                                            $good++;
                                        } elseif ($audit->rating == 'other') {
                                            $other++;
                                        }
                                        $campaignGrandTotal = $aboveAverage + $average + $bad + $fatal + $good + $other;
                                        $total = $audit->percentage + $total;
                                        $total_percentage = $total / count($item->voiceAudits);
                                    }
                                }
                            @endphp
                            <tr>
                                <td>{{ $campaign_evaluations->firstItem() + $key }}</td>
                                <td>{{ $item->name }}</td>
                                <td class="text-center">{{ round($total_percentage) }}%</td>
                                <td class="text-center">{{ count($item->voiceAudits) }}</td>
                                <td class="text-center">{{ $aboveAverage }}</td>
                                <td class="text-center">{{ $average }}</td>
                                <td class="text-center">{{ $bad }}</td>
                                <td class="text-center">{{ $fatal }}</td>
                                <td class="text-center">{{ $good }}</td>
                                <td class="text-center">{{ $campaignGrandTotal }}</td>
                                <td class="action">
                                    <a href="{{ route('voice-audits.index', 1) }}?search=1&record_id=&user_id=-1&associate_id=-1&campaign_id={{ $item->id }}&outcome=&from_date={{ $from_date }}&to_date={{ $to_date }}&from_time={{ $from_time }}&to_time={{ $to_time }}&review="
                                        class="btn btn-success btn-sm" target="_blank"><i class="fas fa-eye"></i></a>
                                </td>
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

        @if ($campaign_evaluations->total() > 15)
            <!-- /.card-body -->
            <div class="card-footer clearfix">
                {{ $campaign_evaluations->appends(request()->input())->links() }}
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
