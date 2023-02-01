<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Evaluator</th>
            <th>Call Date</th>
            <th>Customer Name</th>
            <th>Customer Phone</th>
            <th>HRMS ID</th>
            <th>Associate</th>
            <th>Reporting To</th>
            <th>Campaign</th>
            <th>Result</th>
            <th>Rating</th>
            <th>Handling Time</th>
            <th>Call Time</th>
            <th>Evaluation Date</th>
            <th>QA Notes</th>
            <th>Recording Link</th>
        </tr>
    </thead>
    <tbody>


        @foreach ($voice_audits as $audit)
            <tr>
                <td>{{ $audit->id ?? 0 }}</td>
                <td>{{ $audit->user->name ?? '' }}</td>

                <td>{{ $audit->call_date }}</td>
                <td>{{ $audit->customer_name ?? '' }}</td>
                <td>{{ $audit->customer_phone ?? '' }}</td>
                <td>{{ $audit->associate->hrms_id ?? '' }}</td>
                <td>{{ $audit->associate->name ?? '' }}</td>
                <td>{{ $audit->associate->supervisor->name ?? '' }}</td>
                <td>{{ $audit->campaign->name ?? '' }}</td>
                <td>{{ $audit->percentage }}</td>
                <td>
                    @if ($audit->rating == 'good')
                        <span class="badge bg-success">Good</span>
                    @elseif ($audit->rating == 'above average')
                        <span class="badge bg-primary">Above Average</span>
                    @elseif ($audit->rating == 'average')
                        <span class="badge bg-info">Average</span>
                    @elseif ($audit->rating == 'bad')
                        <span class="badge bg-warning">Bad</span>
                    @elseif ($audit->rating == 'fatal')
                        <span class="badge bg-danger">fatal</span>
                    @else
                        <span class="badge bg-secondary">Other</span>
                    @endif
                </td>
                <td>{{ $audit->evaluation_time }}</td>
                <td>{{ $audit->recording_duration }}</td>
                <td>{{ $audit->created_at->format('d-m-Y g:i:s A') }}</td>
                <td>{{ $audit->notes }}</td>
                <td>{{ $audit->recording_link ?? '' }}</td>
            </tr>
        @endforeach

    </tbody>
</table>
