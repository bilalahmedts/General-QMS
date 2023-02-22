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
                <input type="hidden" name="associate_id" value="{{ $user->id ?? 0 }}">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">HRMS ID <span>*</span></label>
                            <input type="text" class="form-control" value="{{ $user->hrms_id ?? 0 }}" disabled>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Agent Name <span>*</span></label>
                            <input type="text" class="form-control" value="{{ $user->name ?? '' }}" disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Reporting To <span>*</span></label>
                            <input type="hidden" class="form-control" name="team_lead_id"
                                value="{{ $user->reporting_to ?? 0 }}">
                            <input type="text" class="form-control" value="{{ $user->supervisor->name ?? '' }}"
                                disabled>
                        </div>
                    </div>
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
                            <input type="hidden" class="form-control" name="project_id" 
                                value="{{ $project->id }}">
                            <input type="text" class="form-control" name="campaign_name" value="{{ $project->name }}"
                                disabled>
                        </div>
                    </div>
                    <input type="hidden" name="manager_id" id="manager_id">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Date Of Chat/Email <span>*</span></label>
                            <input type="text" class="form-control datetimepicker-input datepicker" name="date_of_chat_email"
                                data-toggle="datetimepicker" data-target=".datepicker" value="{{ old('date_of_chat_email') }}"
                                required>
                        </div>
                        @error('date_of_chat_email')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Audit Date <span>*</span></label>
                            <input type="date" class="form-control " name="audit_date"  value="{{ old('audit_date') }}"
                                required>
                        </div>
                        @error('audit_date')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Ticket Number <span>*</span></label>
                            <input type="text" class="form-control" name="ticket_number" placeholder="Ticket #" value="{{ old('ticket_number') }}" required>
                        </div>
                        @error('ticket_number')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    @if ($project->id == "8" )
                        
                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Start_time <span>*</span></label>
                            <input type="time" class="form-control" name="start_time"  placeholder="Ticket #" value="{{ old('start_time') }}"
                                required>
                        </div>
                        @error('start_time')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Queue <span>*</span></label>
                            <input type="text" class="form-control" name="queue"  placeholder="Queue" value="{{ old('queue') }}" required>
                        </div>
                        @error('queue')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Agent Group <span>*</span></label>
                            <input type="text" class="form-control" name="agent_group"  placeholder="Agent Group " value="{{ old('agent_group') }}"
                                required>
                        </div>
                        @error('agent_group')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> Caller <span>*</span></label>
                            <input type="text" class="form-control" name="caller"  placeholder="Caller " value="{{ old('caller') }}"
                                required>
                        </div>
                        @error('caller')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for=""> AstClid <span>*</span></label>
                            <input type="text" class="form-control" name="ast_clid"  placeholder="AstClid " value="{{ old('ast_clid') }}"
                                required>
                        </div>
                        @error('ast_clid')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>
                    @endif
                    
                     

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
                                                    <label class="radio-inline qrating">
                                                        <input type="radio" required class="radio" value="{{ $item->score }}" name="answer-{{ $item->id }}">Yes
                                                    </label>
                                                    <label class="radio-inline qrating">
                                                        <input type="radio" required class="radio" value="0" name="answer-{{ $item->id }}">No
                                                    </label>
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
        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Evaluation (Step 3 of 3)</h3>
            </div>
            <div class="card-body">

                <div class="row">
                    <input type="hidden" name="outcome" id="outcome">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Percentage <span>*</span></label>
                            <input type="text" name="percentage" id="percentage" value="0" class="form-control percentage"
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
                            <label for="">Customer Rating<span>*</span></label>
                            <input type="number" maxlength="5" class="form-control" maxlength="5" placeholder="Customer Rating" name="customer_rating" value="{{ old('customer_rating') }}" required>
                        </div>
                        @error('customer_rating')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="">Customer Feedback<span>*</span></label>
                            <input type="text" class="form-control" placeholder="Customer Feedback" name="customer_feedback" value="{{ old('customer_feedback') }}" required>
                        </div>
                        @error('customer_feedback')
                            <div class="validate-error">{{ $message }}</div>
                        @enderror
                    </div>

                    {{-- <div class="col-md-4">
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
                    </div> --}}
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
        let good = document.getElementById('good');
        let aboveAverage = document.getElementById('aboveAverage');
        let average = document.getElementById('average');
        let bad = document.getElementById('bad');
        let fatal = document.getElementById('fatal');
        let other = document.getElementById('other');
        let outcome = document.getElementById('outcome');
        let percentage = 0;
        function myFunction() {
            if (good.checked == true) {
                percentage = 100;
                document.getElementById('percentage').value = percentage;
                outcome.value = 'accepted';
            } else if (aboveAverage.checked == true) {
                percentage = 95;
                document.getElementById('percentage').value = percentage;
                outcome.value = 'rejected';
            } else if (average.checked == true) {
                percentage = 80;
                document.getElementById('percentage').value = percentage;
                outcome.value = 'rejected';
            } else if (bad.checked == true) {
                percentage = 50;
                document.getElementById('percentage').value = percentage;
                outcome.value = 'rejected';
            } else if (fatal.checked == true) {
                percentage = 0;
                document.getElementById('percentage').value = percentage;
                outcome.value = 'rejected';
            } else if (other.checked == true) {
                alert("Please Enter the value in Percentage Field");
                document.getElementById('percentage').readOnly = false;
                outcome.value = 'rejected';
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

        $(".qrating input").click(function percentage() {
            let percentage = 0;
            let total = {{ $points }};
            var checkedButtons = $("input[type='radio']:checked"); 
            console.log(checkedButtons);
            checkedButtons.each(function(chkdButton) {                 
                percentage = parseInt(percentage) + parseInt($(this).val());                 
            });

            resultPercentage = percentage;
            $(".percentage").val(resultPercentage);
        });

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
                            $("#manager_id").val(res.manager_id);
                        }
                    });
                } else {
                    $("#hrms_id").val('');
                    $("#reporting_id").val('');
                    $("#reporting_to").val('');
                    $("#manager_id").val('');
                }
            });
            $("#duration").inputmask({
                mask: '99:99:99',
                placeholder: ' ',
                showMaskOnHover: false,
                showMaskOnFocus: false,
                onBeforePaste: function(pastedValue, opts) {
                    var processedValue = pastedValue;
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
