<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\VoiceAudit;
use App\Models\VoiceAuditAppeal;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $voice_audit_count = $this->getVoiceAuditCounts();
        $voice_pending_reviews_count = $this->getVoicePendingReviewsCounts();
        $voice_audit_appeals_count = $this->getVoiceAuditAppealsCounts();
        $voice_actions_count = $this->getVoiceActionsCounts();

        if (in_array(Auth::user()->roles[0]->name, ['Super Admin']) || Auth::user()->campaign_id == 1) {

            $query = new VoiceAudit;

            $query->with('user', 'associate', 'campaign');

            if (Auth::user()->roles[0]->name == 'Associate' && Auth::user()->campaign_id == 1) {
                $query = $query->where('user_id', Auth::user()->id);
            } elseif (in_array(Auth::user()->roles[0]->name, ['Team Lead']) && Auth::user()->campaign_id == 1) {
                $query = $query->whereHas('user', function ($query) {
                    $query = $query->where('reporting_to', Auth::user()->id);
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            } elseif (in_array(Auth::user()->roles[0]->name, ['Team Lead', 'Manager', 'Associate']) && Auth::user()->campaign_id != 1) {
                abort(403);
            }

            $voice_audits = $query->sortable()->orderBy('id', 'desc')->paginate(10);
            if (in_array(Auth::user()->roles[0]->name, ['Director','Manager','Team Lead']) && Auth::user()->campaign_id == 1) {
                    $query = $query->whereHas('user', function ($query) {
                    $query = $query->where('reporting_to', Auth::user()->id);
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            }
            $user_evaluations = User::whereHas('voiceAudits', function($query) use ($request){
                $query = $query->when($request, function ($query, $request) {
                    $query->search($request);
                });
            })->paginate(10);
            return view('home')->with(compact('voice_audit_count', 'voice_pending_reviews_count', 'voice_audit_appeals_count', 'voice_actions_count', 'voice_audits','user_evaluations'));
        } elseif (in_array(Auth::user()->roles[0]->name, ['Director','Manager', 'Team Lead'])) {

            $query = new VoiceAudit;

            $query->with('user', 'associate', 'campaign');

            if (in_array(Auth::user()->roles[0]->name, ['Director','Team Lead', 'Manager']) && Auth::user()->campaign_id != 1) {
                $query = $query->where('campaign_id', Auth::user()->campaign_id);

            }

            $voice_audits = $query->sortable()->orderBy('id', 'desc')->paginate(10);

            return view('home-campaign')->with(compact('voice_audit_count', 'voice_pending_reviews_count', 'voice_audit_appeals_count', 'voice_actions_count', 'voice_audits'));
        }

        return view('home-default');
    }

    public function getVoiceAuditCounts()
    {
        $query = new VoiceAudit;

        if (Auth::user()->campaign_id == 1) {
            if (Auth::user()->roles[0]->name == 'Associate') {
                $query = $query->where('user_id', Auth::user()->id);
            } elseif (Auth::user()->roles[0]->name == 'Team Lead') {
                $query = $query->whereHas('user', function ($query) {
                    $query = $query->where('reporting_to', Auth::user()->id);
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            }
        } elseif (in_array(Auth::user()->roles[0]->name, ['Director','Manager', 'Team Lead'])) {
            $query = $query->where('campaign_id', Auth::user()->campaign_id);
        }

        return $voice_audit_count = $query->count();
    }

    public function getVoicePendingReviewsCounts()
    {
        $query = new VoiceAudit;

        $query = $query->doesnthave('appeal');
        $query = $query->doesnthave('action');

        if (Auth::user()->campaign_id == 1) {
            if (Auth::user()->roles[0]->name == 'Associate') {
                $query = $query->where('user_id', Auth::user()->id);
            } elseif (Auth::user()->roles[0]->name == 'Team Lead') {
                $query = $query->whereHas('user', function ($query) {
                    $query = $query->where('reporting_to', Auth::user()->id);
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            }
        } elseif (in_array(Auth::user()->roles[0]->name, ['Director','Manager', 'Team Lead'])) {
            $query = $query->where('campaign_id', Auth::user()->campaign_id);
        }

        return $voice_pending_reviews_count = $query->where('outcome', 'rejected')->count();
    }

    public function getVoiceAuditAppealsCounts()
    {
        $query = new VoiceAudit;

        $query = $query->has('appeal');

        $query = $query->whereHas('appeal', function ($query) {
            $query = $query->where('status', 'pending');
        });

        if (Auth::user()->campaign_id == 1) {
            if (Auth::user()->roles[0]->name == 'Associate') {
                $query = $query->whereHas('user', function ($query) {
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            } elseif (Auth::user()->roles[0]->name == 'Team Lead') {
                $query = $query->whereHas('user', function ($query) {
                    $query = $query->where('reporting_to', Auth::user()->id);
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            }
        } elseif (in_array(Auth::user()->roles[0]->name, ['Director','Manager', 'Team Lead'])) {
            $query = $query->where('campaign_id', Auth::user()->campaign_id);
        }

        return $voice_audit_appeals_count = $query->count();
    }

    public function getVoiceActionsCounts()
    {
        $query = new VoiceAudit;

        $query = $query->has('action');

        if (Auth::user()->campaign_id == 1) {
            if (Auth::user()->roles[0]->name == 'Associate') {
                $query = $query->where('user_id', Auth::user()->id);
            } elseif (Auth::user()->roles[0]->name == 'Team Lead') {
                $query = $query->whereHas('user', function ($query) {
                    $query = $query->where('reporting_to', Auth::user()->id);
                    $query = $query->orWhere('id', Auth::user()->id);
                });
            }
        } elseif (in_array(Auth::user()->roles[0]->name, ['Director','Manager', 'Team Lead'])) {
            $query = $query->where('campaign_id', Auth::user()->campaign_id);
        }

        return $voice_actions_count = $query->where('outcome', 'rejected')->count();
    }

    /*  public function getAuditsByTime()
    {
        $query = new User;
        $user_evaluations = $query->with('voiceAudits')->where('campaign_id',1)->get();
        return $user_evaluations;

    } */
}
