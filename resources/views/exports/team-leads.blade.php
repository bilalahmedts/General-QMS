<table>
    <thead>
        <tr>
            <th>Team Lead Name</th>
            <th>Campaign</th>
            <th>Project</th>
            <th>Above Average</th>
            <th>Average</th>
            <th>Bad</th>
            <th>Fatal</th>
            <th>Good</th>
            <th>QA Percentage</th>
            <th>Overall QA Percentage</th>
        </tr>
    </thead>
    <tbody>
        @if (count($user_evaluations) > 0)
            @foreach ($user_evaluations as $key => $item)
                @php
                    
                    $aboveAverage = [];
                    $average = [];
                    $bad = [];
                    $fatal = [];
                    $good = [];
                    $other = [];
                    $total = [];
                    $qaPercentage = [];
                    $overallQaPercentage = [];
                    
                    $aboveAverageCount = 0;
                    $averageCount = 0;
                    $badCount = 0;
                    $goodCount = 0;
                    $fatalCount = 0;
                    $otherCount = 0;
                    $qaPercentageCount = 0;
                    
                    if (count($item->teamLeadVoiceAudits) > 0) {
                        foreach ($item->teamLeadVoiceAudits as $audit) {
                            // $count = count($item->teamLeadVoiceAudits);
                            $project_ids = [];
                            $projects = $audit->campaign->projects;
                            $sum = 0;
                            $percentage = 0;
                            $total_tl = [];
                            foreach ($projects as $project) {
                                array_push($project_ids, $project->id);
                                foreach ($project_ids as $project_id) {
                                    // echo $project_id.' - '.$project->id."<br>";
                                    if ($project_id == $project->id && $audit->rating == 'above average') {
                                        $aboveAverage[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'above average', $project->id);
                                        $aboveAverageCount = $aboveAverage[$audit->team_lead_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'average') {
                                        $average[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'average', $project->id);
                                        $averageCount = $average[$audit->team_lead_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'bad') {
                                        $bad[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'bad', $project->id);
                                        $badCount = $bad[$audit->team_lead_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'fatal') {
                                        $fatal[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'fatal', $project->id);
                                        $fatalCount = $fatal[$audit->team_lead_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'good') {
                                        $good[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'good', $project->id);
                                        $goodCount = $good[$audit->team_lead_id][$project->id];
                                    } else {
                                        $other[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlvCount($audit->team_lead_id, 'other', $project->id);
                                        $otherCount = $other[$audit->team_lead_id][$project->id];
                                    }
                                    $qaPercentage[$audit->team_lead_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getTlQaScore($audit->team_lead_id, $project->id);
                                    $qaPercentageCount = $qaPercentage[$audit->team_lead_id][$project->id];
                                    $overallQaPercentage[$audit->team_lead_id] = App\Http\Controllers\Reports\VoiceReportController::getTlOverallQaScore($audit->team_lead_id);
                                }
                                // $total[$audit->team_lead_id][$project->id]['total_count'] = $aboveAverageCount + $averageCount + $badCount + $fatalCount + $goodCount + $otherCount;
                                // $percentage = $total[$audit->team_lead_id][$project->id]['total_count'] / count($user_evaluations);
                                // $sum = $percentage + $sum;
                                // $total_tl[$audit->team_lead_id] = $sum;
                            }
                        }
                    }
                @endphp
                <tr>

                    <td>{{ $item->name ?? '' }}</td>
                    <td>{{ $item->campaign->name ?? '-' }}</td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>{{ $project->name ?? '' }}</div><br>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>{{ $aboveAverage[$item->id][$project->id] ?? 0 }}</div><br>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>{{ $average[$item->id][$project->id] ?? 0 }}</div><br>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>{{ $bad[$item->id][$project->id] ?? 0 }}</div><br>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>{{ $fatal[$item->id][$project->id] ?? 0 }}</div><br>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>{{ $good[$item->id][$project->id] ?? 0 }}</div><br>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>
                                    {{ round($qaPercentage[$item->id][$project->id]) ?? 0 }}%<br>
                                </div>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            <div>
                                {{ round($overallQaPercentage[$item->id]) ?? 0 }}%<br>
                            </div>
                        @endif
                    </td>
                </tr>
            @endforeach
        @else
            <tr>
                <td colspan="10">No records found!</td>
            </tr>
        @endif

    </tbody>
</table>
