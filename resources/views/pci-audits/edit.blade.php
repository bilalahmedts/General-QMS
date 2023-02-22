@extends('layouts.user')

@section('title', $voice_evaluation->name ?? 'Edit Voice Audit')


@section('content')

    <div class="back-area mb-3">
        <a href="{{ route('voice-audits.index', $voice_evaluation->id) }}" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left mr-2"></i> Go Back</a>
    </div>

    <div class="search-area">
        <div class="row">

            <div class="col-md-6">
                <h4 class="mb-0">Edit {{ $voice_evaluation->name }} <small>(ID: {{ $voice_audit->id }})</small></h4>
            </div>

        </div>
    </div>


    <form action="{{ route('voice-audits.update', $voice_audit) }}" method="post" autocomplete="off">
        @csrf
        @method('put')

        <input type="hidden" name="voice_evaluation_id" value="{{ $voice_evaluation->id }}" required>

        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Information (Step 1 of 4)</h3>
            </div>
            <div class="card-body">

                @include('pci-audits.include.voice-audit-edit-information', ['voice_audit' => $voice_audit])

            </div>

        </div>
        <!-- /.card -->

        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Data Points (Step 2 of 4)</h3>
            </div>

            <div class="card-body">

                @php
                    $points = $voice_audit->points->count();
                @endphp

                @include('pci-audits.include.voice-audit-edit-datapoints', ['categories' => $categories])

            </div>

        </div>
        <!-- /.card -->
        
        <!-- Default box -->
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Evaluation (Step 3 of 4)</h3>
            </div>
            <div class="card-body">

                @include('pci-audits.include.voice-audit-edit-evaluation', ['voice_audit' => $voice_audit])

            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <!-- /.card-footer-->

        </div>
        <!-- /.card -->

    </form>

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
        let percentage = document.getElementById('percentage').value;
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
    var resultPercentage = 0;
    $(function() {
        $('.datepicker').datetimepicker({
            format: 'L',
            format: 'DD-MM-YYYY',
            keepInvalid: false
        }); 
        $('#associate').on('change', function() {
            var user_id = this.value;

            if (user_id != "") {
                $.ajax({
                    url: `{{ route('main') }}/get-user-detail/${user_id}`,
                    type: 'GET',
                    dataType: 'json', // added data type
                    success: function(res) {
                        $("#hrms_id").val(res.hrms_id);
                        $("#reporting_id").val(res.reporting_id);
                        $("#reporting").val(res.reporting_to);
                    }
                });
            }
        });
       
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
    });
</script>
     

@endsection
