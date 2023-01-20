@extends('layouts.user')

@section('title', $voice_evaluation->name ?? 'New Evaluation')


@section('content')
    @if ($errors->any())
        <div class="alert alert-danger">
            <p><strong>Opps Something went wrong</strong></p>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <div class="back-area mb-3">
        <a href="{{ route('voice-audits.index', $voice_evaluation->id) }}" class="btn btn-secondary btn-sm"><i
                class="fas fa-arrow-left mr-2"></i> Go Back</a>
    </div>


    <form action="{{ route('voice-audits.store') }}" method="post" autocomplete="off">
        @csrf

        <div class="timer-area" style="float: right;">
            <div class="timer" id="timer" style="font-size: 18px;"></div>
            <input type="hidden" name="evaluation_time" class="timer" id="evaluation_time">
        </div>

        <input type="hidden" name="voice_evaluation_id" value="{{ $voice_evaluation->id }}" required>

        <div class="search-area">
            <div class="row">

                <div class="col-md-6">
                    <h4 class="mb-0">New {{ $voice_evaluation->name ?? 'Evaluation' }}</h4>
                </div>

            </div>
        </div>

        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Information (Step 1 of 4)</h3>

            </div>
            <div class="card-body">
                <input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Campaign <span>*</span></label>
                            <input type="hidden" class="form-control" name="campaign_id" id="campaign_id"
                                value="{{ $campaign->id }}">
                            <input type="text" class="form-control" name="campaign_name" value="{{ $campaign->name }}"
                                disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Project <span>*</span></label>
                            <input type="hidden" class="form-control" name="project_id" id="project_id"
                                value="{{ $project->id }}">
                            <input type="text" class="form-control" name="campaign_name" value="{{ $project->name }}"
                                disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Agent Name <span>*</span></label>
                            <select name="associate_id" id="agent" class="form-control select2" required>
                                <option value="">Select Option</option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        @error('associate_id')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">HRMS ID <span>*</span></label>
                            <input type="text" class="form-control" name="hrms_id" id="hrms_id" disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Reporting To <span>*</span></label>
                            <input type="hidden" class="form-control" name="team_lead_id" id="reporting_id">
                            <input type="text" class="form-control" id="reporting_to" disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Call Date <span>*</span></label>
                            <input type="text" class="form-control datetimepicker-input datepicker" name="call_date"
                                data-toggle="datetimepicker" data-target=".datepicker" value="{{ old('call_date') }}"
                                required>
                        </div>
                        @error('call_date')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                </div>

            </div>

        </div>
        <!-- /.card -->

        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Data Points (Step 2 of 4)</h3>
            </div>

            <div class="card-body">

                @php $points = 0; @endphp
                @if (count($categories) > 0)
                    @foreach ($categories as $category)
                        <div class="category">
                            <div class="title">
                                <h4>{{ $category->name }}</h4>
                            </div>

                            @if (count($category->datapoints) > 0)
                                <div class="data-points">
                                    <table class="table table-hover">
                                        @foreach ($category->datapoints as $item)
                                            @php $points++; @endphp
                                            <tr>
                                                <td width="25%">{{ $item->name }}</td>
                                                <td>{{ $item->question }}</td>
                                                <td class="radios">
                                                    <label class="radio-inline qrating"><input type="radio"
                                                            class="radio" value="1"
                                                            name="answer-{{ $item->id }}">Yes</label>
                                                    <label class="radio-inline qrating"><input type="radio"
                                                            class="radio" value="0"
                                                            name="answer-{{ $item->id }}">No</label>
                                                    <label class="radio-inline"><input type="radio" class="radio"
                                                            value="6" name="answer-{{ $item->id }}"
                                                            checked>N/A</label>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </table>
                                </div>
                            @else
                                <h5 class="text-center">No data points found!</h5>
                            @endif

                        </div>
                    @endforeach
                @else
                    <h4 class="text-center">No records found</h4>
                @endif

            </div>

        </div>
        <!-- /.card -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Scoring (Step 3 of 4)</h3>

            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <!-- checkbox -->
                        <div class="form-group clearfix">
                            <div class="icheck-success d-inline">
                                <input type="radio" id="good" value="good" name="rating"
                                    onclick="myFunction()">
                                <label for="good">
                                    Good
                                </label>
                                <span>(100)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- radio -->
                        <div class="form-group clearfix">
                            <div class="icheck-primary d-inline">
                                <input type="radio" id="aboveAverage" value="above average" name="rating"
                                    onclick="myFunction()">
                                <label for="aboveAverage">
                                    Above Average
                                </label>
                                <span>(95)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- radio -->
                        <div class="form-group clearfix">
                            <div class="icheck-info d-inline">
                                <input type="radio" id="average" value="average" name="rating"
                                    onclick="myFunction()">
                                <label for="average">
                                    Average
                                </label>
                                <span>(80)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- radio -->
                        <div class="form-group clearfix">
                            <div class="icheck-warning d-inline">
                                <input type="radio" id="bad" value="bad" name="rating"
                                    onclick="myFunction()">
                                <label for="bad">
                                    Bad
                                </label>
                                <span>(50)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- radio -->
                        <div class="form-group clearfix">
                            <div class="icheck-danger d-inline">
                                <input type="radio" id="fatal" value="fatal" name="rating"
                                    onclick="myFunction()">
                                <label for="fatal">
                                    Fatal
                                </label>
                                <span>(0)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- radio -->
                        <div class="form-group clearfix">
                            <div class="icheck-danger d-inline">
                                <input type="radio" id="other" value="other" name="rating"
                                    onclick="myFunction()">
                                <label for="other">
                                    Other
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Evaluation (Step 4 of 4)</h3>
            </div>
            <div class="card-body">

                <div class="row">

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Percentage <span>*</span></label>
                            <input type="text" name="percentage" id="percentage" class="form-control percentage"
                                readonly>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Customer Name <span>*</span></label>
                            <input type="text" name="customer_name" class="form-control"
                                placeholder="Enter Customer Name" value="{{ old('customer_name') }}" required>
                        </div>
                        @error('customer_name')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Customer Phone <span>*</span></label>
                            <input type="text" name="customer_phone" class="form-control"
                                placeholder="Enter Customer Phone" value="{{ old('customer_phone') }}" required>
                        </div>
                        @error('customer_phone')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Recording Duration <span>*</span></label>
                            <input type="text" name="recording_duration" placeholder="HH:MM:SS" id="duration"
                                class="form-control" value="{{ old('recording_duration') }}" required>
                        </div>
                        @error('recording_duration')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Recording Link</label>
                            <input type="text" name="recording_link" class="form-control"
                                value="{{ old('recording_link') }}" required>
                        </div>
                        @error('recording_link')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>


                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Notes <span>*</span></label>
                            <textarea name="notes" rows="3" class="form-control" required>{{ old('notes') }}</textarea>
                        </div>
                        @error('notes')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Call Type<span>*</span></label>
                            <select name="call_type" id="" class="form-control select2" required>
                                <option value="">Select Option</option>
                                <option value="General" {{ old('call_type') == 'General' ? 'selected' : '' }}>General
                                </option>
                                <option value="Sales" {{ old('call_type') == 'Sales' ? 'selected' : '' }}>Sales</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="custom-control custom-switch custom-switch-md mt-4">
                            <input type="checkbox" value="1" name="review_priority"
                                class="custom-control-input review" id="customSwitch1" onchange="setFatalValue(this)">
                            <label class="custom-control-label" for="customSwitch1">Send Critical Alert / Fatal</label>
                        </div>
                    </div>

                </div>

            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <!-- /.card-footer-->

        </div>
        <!-- /.card -->

    </form>

@endsection


@section('scriptfiles')
    <script type='text/javascript' src="{{ asset('assets/plugins/timer/timer.jquery.min.js') }}"></script>
    <script type='text/javascript' src="{{ asset('assets/js/jquery.idle.js') }}"></script>
@endsection



@section('scripts')

    <script>
        var good = document.getElementById('good');
        var aboveAverage = document.getElementById('aboveAverage');
        var average = document.getElementById('average');
        var bad = document.getElementById('bad');
        var fatal = document.getElementById('fatal');
        var other = document.getElementById('other');
        var percentage = 0;

        function myFunction() {
            if (good.checked == true) {
                percentage = 100;
                document.getElementById('percentage').value = percentage;
            } else if (aboveAverage.checked == true) {
                percentage = 95;
                document.getElementById('percentage').value = percentage;
            } else if (average.checked == true) {
                percentage = 80;
                document.getElementById('percentage').value = percentage;
            } else if (bad.checked == true) {
                percentage = 50;
                document.getElementById('percentage').value = percentage;
            } else if (fatal.checked == true) {
                percentage = 0;
                document.getElementById('percentage').value = percentage;
            } else if (other.checked == true) {
                alert("Please Enter the value in Percentage Field");
                document.getElementById('percentage').readOnly = false;
            } else {
                percentage = 0;
                document.getElementById('percentage').value = percentage;
                document.getElementById('percentage').readOnly = true;
            }
        }

        function setFatalValue(val) {

            if (val.checked == true) {
                document.getElementById('percentage').value = document.getElementById('percentage').value / 2;
            } else {
                document.getElementById('percentage').value = percentage;
            }
        }

        $(function() {
            //start a timer
            var timer = $('.timer');

            timer.timer({
                format: '%H:%M:%S'
            });
            $('.datepicker').datetimepicker({
                format: 'L',
                format: 'DD-MM-YYYY',
                keepInvalid: false
            });

            $('#agent').on('change', function() {
                var user_id = this.value;

                if (user_id != "") {
                    $.ajax({
                        url: `{{ route('main') }}/get-user-detail/${user_id}`,
                        type: 'GET',
                        dataType: 'json', // added data type
                        success: function(res) {
                            console.log(res);
                            $("#hrms_id").val(res.hrms_id);
                            $("#reporting_id").val(res.reporting_id);
                            $("#reporting_to").val(res.reporting_to);
                        }
                    });
                } else {
                    $("#hrms_id").val('');
                    $("#reporting_id").val('');
                    $("#reporting_to").val('');
                }
            });
            $("#duration").inputmask({
                mask: '99:99:99',
                placeholder: ' ',
                showMaskOnHover: false,
                showMaskOnFocus: false,
                onBeforePaste: function(pastedValue, opts) {
                    var processedValue = pastedValue;

                    //do something with it

                    return processedValue;
                }
            });

            $(document).idle({
                onIdle: function() {
                    window.location.href = `{{ route('main') }}/logout`;
                },
                onActive: function() {

                },
                idle: 300000 * 5
            });


        });
    </script>

@endsection
