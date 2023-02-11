@extends('layouts.user')

@section('title', 'Evaluators Report')

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

        <form action="{{ route('voice-reports.evaluators') }}" method="get" autocomplete="off">
            <input type="hidden" name="search" value="1">
            @php
                $search_id = -1;
                $from_date = '';
                $to_date = '';
                $from_time = '';
                $to_time = '';
                
                if (isset($_GET['search'])) {
                    $search_id = $_GET['search_id'];
                
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
                            <label for="">Select Evaluator</label>
                            <select name="search_id" class="form-control select2">
                                <option value="-1">Select Option</option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}" @if ($user->id == $search_id) selected @endif>
                                        {{ $user->name }}</option>
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
                        <div class="form-group col-md-4">
                            
                            <input type="hidden">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="">From Time</label>
                            <input type="text" class="form-control datetimepicker-input datepicker3" name="from_time"
                                value="{{ $from_time }}" data-toggle="datetimepicker" data-target=".datepicker3" />
                        </div>

                        <div class="form-group col-md-4">
                            <label for="">To Time</label>
                            <input type="text" class="form-control datetimepicker-input datepicker4" name="to_time"
                                value="{{ $to_time }}" data-toggle="datetimepicker" data-target=".datepicker4" />
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <a href="{{ route('voice-reports.evaluators') }}" class="ml-5">Clear Search</a>
                </div>
            </div>
        </form>

    </div>

    <!-- Default box -->
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">Evaluators Report</h3>
        </div>

        <div class="card-body">

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Evaluator Name</th>
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
                    @if (count($user_evaluations) > 0)
                        @foreach ($user_evaluations as $key => $item)
                            @php
                                $total = 0;
                                $total_percentage = 0;
                                $aboveAverage = 0;
                                $average = 0;
                                $bad = 0;
                                $fatal = 0;
                                $good = 0;
                                $other = 0;
                                $evaluatorGrandTotal = 0;
                                $grandQualityScore = 0;
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
                                        $evaluatorGrandTotal = $aboveAverage + $average + $bad + $fatal + $good + $other;
                                        $total = $audit->percentage + $total;
                                        $total_percentage = $total / count($item->voiceAudits);
                                    }
                                }
                            @endphp
                            <tr>
                                <td>{{ $user_evaluations->firstItem() + $key }}</td>
                                <td>{{ $item->name }}</td>
                                <td class="text-center">{{ round($total_percentage) }}%</td>
                                <td class="text-center">{{ count($item->voiceAudits) }}</td>
                                <td class="text-center">{{ $aboveAverage }}</td>
                                <td class="text-center">{{ $average }}</td>
                                <td class="text-center">{{ $bad }}</td>
                                <td class="text-center">{{ $fatal }}</td>
                                <td class="text-center">{{ $good }}</td>
                                <td class="text-center">{{ $evaluatorGrandTotal }}</td>
                                <td class="action">
                                    <a href="{{ route('voice-audits.index', 1) }}?search=1&record_id=&user_id={{ $item->id }}&associate_id=-1&campaign_id=-1&outcome=&from_date={{ $from_date }}&to_date={{ $to_date }}&from_time={{ $from_time }}&to_time={{ $to_time }}&review="
                                        class="btn btn-success btn-sm" target="_blank"><i class="fas fa-eye"></i></a>
                                </td>
                            </tr>
                        @endforeach
                        {{-- <tr>
                            <th class="text-center" colspan="2">Grand Total</th>
                            <td class="text-center">{{ round($grandQualityScore) }}%</td>
                            <td class="text-center"></td>
                            <td class="text-center"></td>
                            <td class="text-center"></td>
                            <td class="text-center"></td>
                            <td class="text-center"></td>
                            <td class="text-center"></td>
                            <td class="text-center"></td>
                        </tr> --}}
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
