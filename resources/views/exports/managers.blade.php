<table>
    <thead>
        <tr>
            <th>Manager Name</th>
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
                    $qaPercentage = [];
                    $overallQaPercentage = [];
                    
                    $aboveAverageCount = 0;
                    $averageCount = 0;
                    $badCount = 0;
                    $goodCount = 0;
                    $fatalCount = 0;
                    $otherCount = 0;
                    $qaPercentageCount = 0;
                    
                    if (count($item->managerVoiceAudits) > 0) {
                        foreach ($item->managerVoiceAudits as $audit) {
                            $project_ids = [];
                            $projects = $audit->campaign->projects;
                            $sum = 0;
                            $percentage = 0;
                            $total_manager = [];
                            foreach ($projects as $project) {
                                array_push($project_ids, $project->id);
                                foreach ($project_ids as $project_id) {
                                    // echo $project_id.' - '.$project->id."<br>";
                                    if ($project_id == $project->id && $audit->rating == 'above average') {
                                        $aboveAverage[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagervCount($audit->manager_id, 'above average', $project->id);
                                        $aboveAverageCount = $aboveAverage[$audit->manager_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'average') {
                                        $average[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagervCount($audit->manager_id, 'average', $project->id);
                                        $averageCount = $average[$audit->manager_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'bad') {
                                        $bad[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagervCount($audit->manager_id, 'bad', $project->id);
                                        $badCount = $bad[$audit->manager_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'fatal') {
                                        $fatal[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagervCount($audit->manager_id, 'fatal', $project->id);
                                        $fatalCount = $fatal[$audit->manager_id][$project->id];
                                    } elseif ($project_id == $project->id && $audit->rating == 'good') {
                                        $good[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagervCount($audit->manager_id, 'good', $project->id);
                                        $goodCount = $good[$audit->manager_id][$project->id];
                                    } else {
                                        $other[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagervCount($audit->manager_id, 'other', $project->id);
                                        $otherCount = $other[$audit->manager_id][$project->id];
                                    }
                                    $qaPercentage[$audit->manager_id][$project->id] = App\Http\Controllers\Reports\VoiceReportController::getManagerQaScore($audit->manager_id, $project->id);
                                    $qaPercentageCount = $qaPercentage[$audit->manager_id][$project->id];
                                    $overallQaPercentage[$audit->manager_id] = App\Http\Controllers\Reports\VoiceReportController::getManagerOverallQaScore($audit->manager_id);
                                }
                                /* $total[$audit->manager_id][$project->id]['total_count'] = $aboveAverageCount + $averageCount + $badCount + $fatalCount + $goodCount + $otherCount;
                                $percentage = $total[$audit->manager_id][$project->id]['total_count'] / count($user_evaluations);
                                $sum = $percentage + $sum;
                                $total_manager[$audit->manager_id] = $sum; */
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
                                    {{ round($qaPercentage[$item->id][$project->id]) ?? 0 }}
                                    %<br>
                                </div>
                            @endforeach
                        @endif
                    </td>
                    <td>
                        @if ($item->campaign->projects)
                            <div>
                                {{ round($overallQaPercentage[$item->id]) ?? 0 }}
                                %<br>
                            </div>
                        @endif
                    </td>
                    {{-- <td>
                        @if ($item->campaign->projects)
                            @foreach ($item->campaign->projects as $project)
                                <div>
                                    {{ round(($total[$item->id][$project->id]['total_count'] / count($user_evaluations))) }} %
                                </div>
                            @endforeach
                        @endif
                    </td>
                    <td>  
                        @if ($item->campaign->projects)
                                <div>
                                    {{ round(($total_manager[$item->id] / count($project_ids))) }}
                                    %
                                </div>
                            
                        @endif
                    </td> --}}
                </tr>
            @endforeach
        @else
            <tr>
                <td colspan="10">No records found!</td>
            </tr>
        @endif

    </tbody>
</table>
