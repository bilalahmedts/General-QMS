<?php

namespace App\Services;

use App\Models\AssignedProject;
use App\Models\Campaign;
use App\Models\Datapoint;
use App\Models\VoiceAudit;
use App\Models\VoiceAuditPoint;
use App\Models\VoiceAuditAppeal;
use App\Models\DatapointCategory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;


/**
 *
 */
class AssignProjectService
{
    public function addAssignedProjects($request, $project){
        // save attendees
        if (!empty($request->projects)) {
            foreach ($request->projects as $project) {
                AssignedProject::create(['project_id' => $project->id, 'user_id' => $request->id]);
            }
        }
    } 

}
