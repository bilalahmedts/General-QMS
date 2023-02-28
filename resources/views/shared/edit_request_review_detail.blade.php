<table class="table">
    <tr>
        <th>Call Date</th>
        <td>{{ @$edit_request_audit->call_date ?? '' }}</td>
    </tr>
    <tr>
        <th>Associate</th>
        <td>{{ @$edit_request_audit->associate->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Campaign</th>
        <td>{{ @$edit_request_audit->campaign->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Project</th>
        <td>{{ @$edit_request_audit->project->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Customer</th>
        <td>{{ @$edit_request_audit->customer_name ?? '' }}</td>
    </tr>
    <tr>
        <th>Phone</th>
        <td>{{ @$edit_request_audit->customer_phone ?? '' }}</td>
    </tr>
    <tr>
        <th>Rec. Duration</th>
        <td>{{ @$edit_request_audit->recording_duration ?? '' }}</td>
    </tr>
    <tr>
        <th>Score</th>
        <td>{{ @$edit_request_audit->percentage ?? '' }}%</td>
    </tr>
    <th>Rating</th>
    <td>
        @if (@$edit_request_audit->rating == 'good')
            <span class="badge bg-success">Good</span>
        @elseif (@$edit_request_audit->rating == 'above average')
            <span class="badge bg-primary">Above Average</span>
        @elseif (@$edit_request_audit->rating == 'average')
            <span class="badge bg-info">Average</span>
        @elseif (@$edit_request_audit->rating == 'bad')
            <span class="badge bg-warning">Bad</span>
        @elseif (@$edit_request_audit->rating == 'fatal')
            <span class="badge bg-danger">fatal</span>
        @else
            <span class="badge bg-secondary">Other</span>
        @endif
    </td>
    <tr>
        <th>Status</th>
        <td>
            @include('shared.voice-audit-status', ['status' => @$edit_request_audit->status])
        </td>
    </tr>
    <tr>
        <th>Call Type</th>
        <td>
            {{ @$edit_request_audit->call_type }}
        </td>
    </tr>
    <tr>
        <td><strong>Evaluation Time</strong></td>
        <td>{{ @$edit_request_audit->evaluation_time ?? '00:00:00' }}</td>
    </tr>
    <tr>
        <td colspan="2">
            <strong>Notes</strong><br>
            {{ @$edit_request_audit->notes ?? '' }}
        </td>
    </tr>
    @if (@$edit_request_audit->appeal)
        <tr>
            <td colspan="2">
                <strong>Appeal Remarks</strong><br>
                {{ @$edit_request_audit->appeal->remarks ?? '' }}
            </td>
        </tr>
    @endif

    @if (@$edit_request_audit->action)
        <tr>
            <th>Action</th>
            <td>{{ @$edit_request_audit->action->action->name }}</td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>Action Remarks</strong><br>
                {{ @$edit_request_audit->action->remarks ?? '' }}
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
            {{ @$edit_request_audit->recording_link ?? '' }}
        </td>
    </tr>
</table>
