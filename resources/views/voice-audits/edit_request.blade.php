@extends('layouts.user')

@section('title', 'Voice Audit Detail')


@section('content')

    <div class="back-area mb-3">
        <a href="{{ route('voice-audits.index', $voice_audit->voice_evaluation_id) }}" class="btn btn-secondary btn-sm"><i class="fas fa-arrow-left mr-2"></i> Go Back</a>
    </div>

    <div class="search-area">
        <div class="row">

            <div class="col-md-6">
                <h4 class="mb-0">Voice Audit Detail</h4>
            </div>

            <div class="col-md-6">
                <h4 class="mb-0">Edit Audit Detail</h4>
            </div>

        </div>
    </div>

    <div class="row">

        <div class="col-md-2">
            <!-- Default box -->
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h3 class="card-title">Audit Detail</h3>
                </div>
                <div class="card-body table-responsive">
                    @include('shared.evaluation-review-detail', ['voice_audit' => $voice_audit])
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <!-- Default box -->
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h3 class="card-title">Audit Points</h3>
                </div>
                <div class="card-body">
                    @include('shared.evaluation-review-points', ['voice_audit' => $voice_audit, 'categories' => $categories])
                </div>
            </div>
            <!-- /.card -->
        </div>





        <div class="col-md-2">
            <!-- Default box -->
            <div class="card card-success card-outline">
                <div class="card-header">
                    <h3 class="card-title">Audit Detail</h3>
                </div>
                <div class="card-body table-responsive">
                    @include('shared.edit_request_review_detail', ['voice_audit' => $edit_request_audit])
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <!-- Default box -->
            <div class="card card-success card-outline">
                <div class="card-header">
                    <h3 class="card-title">Audit Points</h3>
                </div>
                <div class="card-body">
                    @include('shared.edit_request_review_points', ['voice_audit' => $voice_audit, 'categories' => $categories])
                </div>
            </div>
            <!-- /.card -->
        </div>



    </div>

    <div class="row">
        <div class="col-md-6">
            
        </div>
        <div class="col-md-6">
            <a href="" class="btn btn-danger">Decline Request</a>
            <a href="{{route('updateEditRequest',[$voice_audit])}}" class="btn btn-success">Accept Request</a>
        </div>
    </div>

@endsection



@section('scripts')

    <script>
        $(function() {

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
