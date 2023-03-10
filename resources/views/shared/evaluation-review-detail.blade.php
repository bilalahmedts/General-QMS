<table class="table">
    <tr>
        <th>Call Date</th>
        <td>{{ $voice_audit->call_date ?? '' }}</td>
    </tr>
    <tr>
        <th>Associate</th>
        <td>{{ $voice_audit->associate->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Campaign</th>
        <td>{{ $voice_audit->campaign->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Project</th>
        <td>{{ $voice_audit->project->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Customer</th>
        <td>{{ $voice_audit->customer_name ?? '' }}</td>
    </tr>
    <tr>
        <th>Phone</th>
        <td>{{ $voice_audit->customer_phone ?? '' }}</td>
    </tr>
    <tr>
        <th>Rec. Duration</th>
        <td>{{ $voice_audit->recording_duration ?? '' }}</td>
    </tr>
    <tr>
        <th>Score</th>
        <td>{{ $voice_audit->percentage ?? '' }}%</td>
    </tr>
    <th>Rating</th>
    <td>
        @if ($voice_audit->rating == 'good')
            <span class="badge bg-success">Good</span>
        @elseif ($voice_audit->rating == 'above average')
            <span class="badge bg-primary">Above Average</span>
        @elseif ($voice_audit->rating == 'average')
            <span class="badge bg-info">Average</span>
        @elseif ($voice_audit->rating == 'bad')
            <span class="badge bg-warning">Bad</span>
        @elseif ($voice_audit->rating == 'fatal')
            <span class="badge bg-danger">fatal</span>
        @else
            <span class="badge bg-secondary">Other</span>
        @endif
    </td>
    <tr>
        <th>Status</th>
        <td>
            @include('shared.voice-audit-status', ['status' => $voice_audit->status])
        </td>
    </tr>
    <tr>
        <th>Call Type</th>
        <td>
            {{ $voice_audit->call_type }}
        </td>
    </tr>
    <tr>
        <td><strong>Evaluation Time</strong></td>
        <td>{{ $voice_audit->evaluation_time ?? '00:00:00' }}</td>
    </tr>
    <tr>
        <td colspan="2">
            <strong>Notes</strong><br>
            {{ $voice_audit->notes ?? '' }}
        </td>
    </tr>
    @if ($voice_audit->appeal)
        <tr>
            <td colspan="2">
                <strong>Appeal Remarks</strong><br>
                {{ $voice_audit->appeal->remarks ?? '' }}
            </td>
        </tr>
    @endif

    @if ($voice_audit->action)
        <tr>
            <th>Action</th>
            <td>{{ $voice_audit->action->action->name }}</td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>Action Remarks</strong><br>
                {{ $voice_audit->action->remarks ?? '' }}
            </td>
        </tr>
    @endif
    <tr>
        <td colspan="2">
            <strong>Call Recording</strong><br><br>
            <audio controls style="width: 100%;">
                <source src="https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
                    type="audio/mpeg">
            </audio>
            <br>
            {{ $voice_audit->recording_link ?? '' }}
        </td>
    </tr>
</table>
