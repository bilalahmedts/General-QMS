<table class="table table-bordered">
    <thead>
        <tr>
            <th>#</th>
            <th>HRMS ID</th>
            <th>Name</th>
            <th>Campaign</th>
            <th>Project</th>
            <th>Total Evaluations</th>
            <th>Above Average</th>
            <th>Average</th>
            <th>Bad</th>
            <th>Fatal</th>
            <th>Good</th>
            <th>QA Percentage</th>
        </tr>
    </thead>
    <tbody>
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
                    
                    if (count($item->associateVoiceAudits) > 0) {
                        foreach ($item->associateVoiceAudits as $audit) {
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
                            // $evaluatorGrandTotal = $aboveAverage + $average + $bad + $fatal + $good + $other;
                            $total = $audit->percentage + $total;
                            $total_percentage = $total / count($item->associateVoiceAudits);
                        }
                    }
                @endphp
                <tr>
                    <td>{{ $user_evaluations->firstItem() + $key }}</td>
                    <td>{{ $item->hrms_id ?? '' }}</td>
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->campaign->name ?? '' }}</td>
                    <td>{{ $item->project->name ?? '' }}</td>
                    <td>{{ count($item->associateVoiceAudits) }}</td>
                    <td>{{ $aboveAverage }}</td>
                    <td>{{ $average }}</td>
                    <td>{{ $bad }}</td>
                    <td>{{ $fatal }}</td>
                    <td>{{ $good }}</td>
                    <td>{{ round($total_percentage) }}%</td>
                </tr>
            @endforeach
    </tbody>
</table> 