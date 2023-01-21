<?php

namespace App\Http\Controllers\Reports;

use Carbon\Carbon;

use App\Models\User;
use App\Models\Campaign;
use App\Models\VoiceAudit;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class VoiceReportController extends Controller
{

    public function timesheet(Request $request)
    {

        $query = new User;

        $query = $query->where('campaign_id', 1);

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        $query = $query->whereHas('voiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->with('voiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->orderBy('name', 'asc');

        $user_evaluations = $query->paginate(15);

        $users = User::where('campaign_id', 1)->orderBy('name', 'asc')->get();
        return view('voice-reports.timesheet')->with(compact('users', 'user_evaluations'));
    }


    public function evaluators(Request $request)
    {

        $query = new User;

        $query = $query->where('campaign_id', 1);

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        $query = $query->whereHas('voiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->with('voiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->orderBy('name', 'asc');

        $user_evaluations = $query->paginate(15);

        $users = User::where('campaign_id', 1)->orderBy('name', 'asc')->get();
        return view('voice-reports.evaluators')->with(compact('users', 'user_evaluations'));
    }

    public function campaigns(Request $request)
    {

        $query = new Campaign;

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        $query = $query->whereHas('voiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->with('voiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->orderBy('name', 'asc');

        $campaign_evaluations = $query->paginate(15);

        $campaigns = Campaign::where('status', 'active')->orderBy('name', 'asc')->get();
        return view('voice-reports.campaigns')->with(compact('campaigns', 'campaign_evaluations'));
    }

    public function teamLeads(Request $request)
    {
        $query = new User;

        $query = $query->role('Team Lead');

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        $query = $query->whereHas('teamLeadVoiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->with('teamLeadVoiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->orderBy('name', 'asc');

        $user_evaluations = $query->paginate(15);

        $users = User::role('Team Lead')->orderBy('name', 'asc')->get();

        return view('voice-reports.team-leads')->with(compact('users', 'user_evaluations'));
    }


    public function associates(Request $request)
    {
        $query = new User;

        $query = $query->role('Associate');

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        $query = $query->whereHas('associateVoiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->with('associateVoiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            });
        });

        $query = $query->orderBy('name', 'asc');

        $user_evaluations = $query->paginate(15);

        $users = User::role('Associate')->where('status', 'active')->orderBy('name', 'asc')->get();

        return view('voice-reports.associates')->with(compact('users', 'user_evaluations'));
    }

    public function fatals(Request $request)
    {
        $query = new VoiceAudit;

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        /* if ($request->has('from_date')) {
            if (!empty($request->from_date) && !empty($request->to_date)) {
                // date
                $from_date = Carbon::createFromFormat('d/m/Y', $request->from_date);
                $to_date = Carbon::createFromFormat('d/m/Y', $request->to_date);

                // from time
                if (!empty($request->from_time)) {
                    $from_time = Carbon::createFromFormat('g:i:s A', $request->from_time);
                    $from_date->hour = $from_time->format('H');
                    $from_date->minute = $from_time->format('i');
                } else {
                    $from_date->startOfDay();
                }

                // to time
                if (!empty($request->to_time)) {
                    $to_time = Carbon::createFromFormat('g:i:s A', $request->to_time);
                    $to_date->hour = $to_time->format('H');
                    $to_date->minute = $to_time->format('i');
                } else {
                    $to_date->startOfDay();
                }

                $query = $query->where('created_at', '>=', $from_date->toDateTimeString());
                $query = $query->where('created_at', '<=', $to_date->toDateTimeString());
            } elseif (!empty($request->from_date)) {
                $from_date = Carbon::createFromFormat('d/m/Y', $request->from_date);
                $query = $query->where('created_at', $from_date->toDateTimeString());
            }
        }
        // associate
        if ($request->has('associate_id')) {
            if (!empty($request->associate_id)) {
                $query = $query->where('associate_id', 'LIKE', "%{$request->associate_id}%");
            }
        }
        // team lead
        if ($request->has('team_lead_id')) {
            if (!empty($request->team_lead_id)) {
                $query = $query->where('team_lead_id', 'LIKE', "%{$request->team_lead_id}%");
            }
        }
        // evaluator
        if ($request->has('user_id')) {
            if (!empty($request->user_id)) {
                $query = $query->where('user_id', 'LIKE', "%{$request->user_id}%");
            }
        } */
        $associates = User::role('Associate')->where('status', 'active')->orderBy('name', 'asc')->get();
        $teamLeads = User::role('Team Lead')->where('status', 'active')->orderBy('name', 'asc')->get();
        $users = User::orderBy('name', 'asc')->get();
        $user_evaluations = $query->with('associate', 'user', 'campaign', 'teamLead')->where('review_priority', 1)->paginate(10);
        return view('voice-reports.fatals')->with(compact('users','associates','teamLeads','user_evaluations'));
    }
}
