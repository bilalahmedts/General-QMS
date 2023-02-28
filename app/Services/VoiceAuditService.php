<?php

namespace App\Services;

use App\Models\Campaign;
use App\Models\Datapoint;
use App\Models\VoiceAudit;
use App\Models\VoiceAuditPoint;
use App\Models\EditAuditPoints;
use App\Models\VoiceAuditAppeal;
use App\Models\DatapointCategory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use App\Models\VoiceAuditCustomField;

/**
 *
 */
class VoiceAuditService
{
    // insert audit data points
    public function insertAuditPoints($request, $voice_audit)
    {
        foreach ($request->all() as $key => $item) {
            $key = explode('-', $key);

            if (count($key) > 1) {
                if ($key[0] == 'answer') {
                    $datapoint = Datapoint::find($key[1]);
                    VoiceAuditPoint::create([
                        'voice_audit_id' => $voice_audit->id,
                        'datapoint_category_id' => $datapoint->datapoint_category_id,
                        'datapoint_id' => $datapoint->id,
                        'answer' => $item,
                    ]);
                }
            }
        }
    }
    public function EditAuditPoints($request, $voice_audit)
    { 
        foreach ($request->all() as $key => $item) {
            $key = explode('-', $key);

            if (count($key) > 1) {
                if ($key[0] == 'answer') {
                    $datapoint = \DB::table('voice_audit_points')->where('id',$key[1])->first();
                    EditAuditPoints::create([
                        'voice_audit_id' => $voice_audit->id,
                        'datapoint_category_id' => $datapoint->datapoint_category_id,
                        'datapoint_id' => $datapoint->id,
                        'answer' => $item,
                    ]);
                }
            }
        }
        $voice_audit->tl_edit_status=1;
        $voice_audit->save();
    }

    // insert audit data points
    public function updateAuditPoints($request, $voice_audit)
    {
        foreach ($request->all() as $key => $item) {
            $key = explode('-', $key);

            if (count($key) > 1) {
                if ($key[0] == 'answer') {
                    $ev_point = VoiceAuditPoint::find($key[1]);
                    $ev_point->update(['answer' => $item]);
                }
            }
        }
    }

    public function getAuditCategories($voice_audit)
    {
        $datapoint_categories = DatapointCategory::where('campaign_id', $voice_audit->campaign_id)
            ->where('project_id', $voice_audit->project_id)
            ->orderBy('sort', 'desc')
            ->get();
        // get evaluation categories
        $categories = [];
        foreach ($datapoint_categories as $category) {
            $ev_points = VoiceAuditPoint::with('datapoint')
                ->where('datapoint_category_id', $category->id)
                ->where('voice_audit_id', $voice_audit->id)
                ->orderBy('id', 'asc')
                ->get();

            $categories[$category->name] = $ev_points;
        }
        return $categories;
    }

    public function updateAppeal($voice_audit)
    {
        if ($voice_audit->appeal && $voice_audit->outcome == 'accepted') {
            $appeal = VoiceAuditAppeal::findOrFail($voice_audit->appeal->id);
            $appeal->status = 'accepted';
            $appeal->save();

            $voice_audit->status = 'appeal accepted';
            $voice_audit->save();

            return true;
        }

        return false;
    }

    public function auditShowAccess()
    {
        $access = false;
        if (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead', 'Associate']) && Auth::user()->campaign_id == 1) {
            $access = true;
        } elseif (in_array(Auth::user()->roles[0]->name, ['Super Admin', 'Director'])) {
            $access = true;
        }

        if ($access == false) {
            abort(403);
        }

        return true;
    }

    public function auditEditAccess($voice_audit)
    {
        $access = false;
        if (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead', 'Associate']) && Auth::user()->campaign_id == 1) {
            if (Auth::user()->roles[0]->name == 'Associate' && $voice_audit->user_id == Auth::user()->id) {
                $diff = $voice_audit->created_at->diffInHours(now());
                if ($diff < 24) {
                    $access = true;
                }
            } elseif (in_array(Auth::user()->roles[0]->name, ['Director', 'Manager', 'Team Lead'])) {
                $access = true;
            }
        } elseif (in_array(Auth::user()->roles[0]->name, ['Super Admin'])) {
            $access = true;
        }

        if ($access == false) {
            abort(403);
        }

        return true;
    }

    public function auditDeleteAccess($voice_audit)
    {
        $access = false;

        if (in_array(Auth::user()->roles[0]->name, ['Super Admin'])) {
            $access = true;
        }

        if ($access == false) {
            abort(403);
        }

        return true;
    }
}
