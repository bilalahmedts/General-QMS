@extends('layouts.user')

@section('title', 'Dashboard')


@section('content')


    <div class="row">
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>{{ $voice_audit_count }}</h3>

                    <p>Total Voice Audits</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="{{ route('voice-audits.index', 1) }}" class="small-box-footer">More info <i
                        class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner">
                    <h3>{{ $voice_pending_reviews_count }}</h3>

                    <p>Pending Voice Reviews</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
                <a href="{{ route('voice-audits.index', 1) }}?search=1&record_id=&user_id=-1&associate_id=-1&campaign_id=-1&outcome=&review=pending&from_date=&to_date="
                    class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
                <div class="inner">
                    <h3>{{ $voice_audit_appeals_count }}</h3>

                    <p>Pending Voice Appeals</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
                <a href="{{ route('voice-audit-appeals.index') }}?search=1&record_id=&user_id=-1&associate_id=-1&campaign_id=-1&outcome=&status=pending&from_date=&to_date="
                    class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>{{ $voice_actions_count }}</h3>

                    <p>Total Voice Actions</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
                <a href="{{ route('voice-audit-actions.index') }}" class="small-box-footer">More info <i
                        class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->



    </div>


    <!-- Default box -->
    <div class="card card-primary card-outline">
        <div class="card-header">
            <h3 class="card-title">Recent Voice Audits</h3>
        </div>

        <div class="card-body">

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Evaluator</th>
                        <th>Associate</th>
                        <th>Campaign</th>
                        <th>Project</th>
                        <th>Evaluation Time</th>
                        <th>Result</th>

                        <th>Created Time</th>
                        <th class="action">Action</th>
                    </tr>
                </thead>
                <tbody>

                    @if (count($voice_audits) > 0)

                        @foreach ($voice_audits as $audit)
                            <tr>

                                <td>{{ $audit->user->name ?? 'undefined' }}</td>
                                <td>
                                    {{ $audit->associate->name ?? 'undefined' }}
                                </td>
                                <td>{{ $audit->campaign->name ?? 'undefined' }}</td>
                                <td>{{ $audit->project->name ?? '' }}</td>
                                <td>{{ $audit->evaluation_time }}</td>
                                <td>{{ $audit->percentage }}%</td>

                                <td>{{ $audit->created_at->format('d-m-Y g:i:s A') }}</td>
                                <td class="action">
                                    <a href="{{ route('voice-audits.show', $audit) }}" class="btn btn-success btn-sm"
                                        target="_blank"><i class="fas fa-eye"></i></a>
                                </td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="9" class="text-center">No record found!</td>
                        </tr>
                    @endif

                </tbody>
            </table>

        </div>

    </div>
@endsection
