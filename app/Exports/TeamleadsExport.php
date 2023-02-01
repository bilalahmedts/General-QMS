<?php

namespace App\Exports;

use App\Models\User;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\FromView;

class TeamleadsExport implements FromView
{
    protected $request;

    public function __construct($request)
    {
        $this->request = $request;
    }
    public function view(): View
    {
        $request = $this->request;
        $query = new User;
        if (in_array(Auth::user()->roles[0]->name, ['Director', 'Team Lead', 'Manager']) && Auth::user()->campaign_id != 1) {
            $query = $query->where('campaign_id', Auth::user()->campaign_id);
        }
        $query = $query->role('Team Lead');

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        $query = $query->whereHas('teamLeadVoiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            }
            );
        });
        $query = $query->with('teamLeadVoiceAudits', function ($query) use ($request) {
            $query = $query->when($request, function ($query, $request) {
                $query->search($request);
            }
            );
        });

        $query = $query->orderBy('name', 'asc');

        $user_evaluations = $query->get();
        return view('exports.team-leads', [
            'user_evaluations' => $user_evaluations
        ]);
    }
}
