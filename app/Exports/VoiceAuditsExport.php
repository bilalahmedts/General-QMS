<?php


namespace App\Exports;

use App\Models\VoiceAudit;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\FromView;

class VoiceAuditsExport implements FromView
{
    protected $request;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function view(): View
    {

        $request = $this->request;

        $query = new VoiceAudit;

        $query->with('user', 'associate', 'campaign');


        if(in_array(Auth::user()->roles[0]->name, ['Team Lead', 'Manager', 'Associate']) && Auth::user()->campaign_id != 1){
            abort(403);
        }


        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        if($request->has('review')){
            if(!empty($request->review)){
                $query = $query->doesnthave('appeal');
                $query = $query->doesnthave('action');
                $query = $query->where('outcome', 'rejected');
            }
        }

        $voice_audits = $query->orderBy('id', 'desc')->get();

        return view('exports.voice-audits', [
            'voice_audits' => $voice_audits
        ]);
    }
}
