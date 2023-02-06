<?php

namespace App\Traits;

use App\Models\Campaign;
use App\Models\User;
use App\Models\Project;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

/**
 *
 */
trait UserTrait
{
    public function campaignUsers(Request $request, $campaign_id)
    {
        $users = User::select('id', DB::raw('name as text'))
            ->where('campaign_id', $campaign_id)
            ->where('status', 1)
            ->where('name', 'LIKE', "%{$request->q}%")
            ->get();
        $data = ['results' => $users];
        return response()->json($data, 200);
    }

    public function getDetail($user_id)
    {
        $user = User::findOrFail($user_id);
        $reporting_id = '';
        $reporting_to = '';
        $manager_id = '';
        $hrms_id = $user->hrms_id;
        if ($user->supervisor) {
            $reporting_to = $user->supervisor->name;
            $reporting_id = $user->supervisor->id;
            $manager_id = $user->supervisor->reporting_to;
        }
        $data = [
            'hrms_id' => $hrms_id,
            'reporting_to' => $reporting_to,
            'reporting_id' => $reporting_id,
            'manager_id' => $manager_id
        ];
        return response()->json($data, 200);
    }

    public function getProjects($campaign_id)
    {
        $projects = Project::select('id', 'name')
            ->where('campaign_id', $campaign_id)
            ->get();
        return response()->json($projects, 200);
    }
    public function getCampaign($campaign_id)
    {
        $campaign = User::findOrFail($campaign_id);
        return response()->json($campaign, 200);
    }
}
