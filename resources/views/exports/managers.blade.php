<table class="table table-bordered">
    <thead>
        <tr>
            <th>Manager Name</th>
            <th>Campaign</th>
            <th>Project</th>
            <th class="text-center">Above Average</th>
            <th class="text-center">Average</th>
            <th class="text-center">Bad</th>
            <th class="text-center">Fatal</th>
            <th class="text-center">Good</th>
            <th class="text-center">QA Percentage</th>
        </tr>
    </thead>
    <tbody>


        @foreach ($user_evaluations as $key => $item)
            @php
                
                $aboveAverage = [];
                $average = [];
                $bad = [];
                $fatal = [];
                $good = [];
                $other = [];
                
                $aboveAverageCount = 0;
                $averageCount = 0;
                $badCount = 0;
                $goodCount = 0;
                $fatalCount = 0;
                $otherCount = 0;
                
                if (count($item->managerVoiceAudits) > 0) {
                    foreach ($item->managerVoiceAudits as $audit) {
                        $project_ids = [];
                        $projects = $audit->campaign->projects;
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
                            }
                            $total[$audit->manager_id][$project->id]['total_count'] = $aboveAverageCount + $averageCount + $badCount + $fatalCount + $goodCount + $otherCount;
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
                            <div>{{ $project->name ?? '' }}</div>
                        @endforeach
                    @endif
                </td>
                <td class="text-center">
                    @if ($item->campaign->projects)
                        @foreach ($item->campaign->projects as $project)
                            <div>{{ $aboveAverage[$item->id][$project->id] ?? 0 }}</div>
                        @endforeach
                    @endif
                </td>
                <td class="text-center">
                    @if ($item->campaign->projects)
                        @foreach ($item->campaign->projects as $project)
                            <div>{{ $average[$item->id][$project->id] ?? 0 }}</div>
                        @endforeach
                    @endif
                </td>
                <td class="text-center">
                    @if ($item->campaign->projects)
                        @foreach ($item->campaign->projects as $project)
                            <div>{{ $bad[$item->id][$project->id] ?? 0 }}</div>
                        @endforeach
                    @endif
                </td>
                <td class="text-center">
                    @if ($item->campaign->projects)
                        @foreach ($item->campaign->projects as $project)
                            <div>{{ $fatal[$item->id][$project->id] ?? 0 }}</div>
                        @endforeach
                    @endif
                </td>
                <td class="text-center">
                    @if ($item->campaign->projects)
                        @foreach ($item->campaign->projects as $project)
                            <div>{{ $good[$item->id][$project->id] ?? 0 }}</div>
                        @endforeach
                    @endif
                </td>
                <td class="text-center">
                    @if ($item->campaign->projects)
                        @foreach ($item->campaign->projects as $project)
                            <div>
                                {{ round(($total[$item->id][$project->id]['total_count'] / count($item->managerVoiceAudits)) * 100) }}
                                %
                            </div>
                        @endforeach
                    @endif
                </td>
            </tr>
        @endforeach


    </tbody>
</table>
