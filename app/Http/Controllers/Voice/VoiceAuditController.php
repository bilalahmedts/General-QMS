<?php

namespace App\Http\Controllers\Voice;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Campaign;
use App\Models\VoiceAudit;
use Illuminate\Http\Request;
use App\Models\VoiceEvaluation;
use App\Models\DatapointCategory;
use App\Services\VoiceAuditService;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\VoiceAuditRequest;
use App\Models\Project;
use App\Traits\UserTrait;

class VoiceAuditController extends Controller
{
    public $voiceAuditService;
    use UserTrait;

    public function __construct(VoiceAuditService $voiceAuditService)
    {
        $this->voiceAuditService = $voiceAuditService;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(VoiceEvaluation $voice_evaluation, Request $request)
    {
        $this->voiceAuditService->auditShowAccess();

        $query = new VoiceAudit();

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

        $query = $query->when($request, function ($query, $request) {
            $query->search($request);
        });

        if ($request->has('review')) {
            if (!empty($request->review)) {
                $query = $query->doesnthave('appeal');
                $query = $query->doesnthave('action');
                $query = $query->where('outcome', 'rejected');
            }
        }

        $voice_audits = $query
            ->sortable()
            ->orderBy('id', 'desc')
            ->paginate(15);

        $users = User::orderBy('name', 'asc')->get();
        $campaigns = Campaign::where('status', 'active')
            ->orderBy('name', 'asc')
            ->get();
        $projects = Project::orderBy('name', 'asc')->get();
        return view('voice-audits.index')->with(compact('voice_evaluation', 'voice_audits', 'users', 'campaigns', 'projects'));
    }

    public function create(Request $request, VoiceEvaluation $voice_evaluation)
    {
        $campaign = Campaign::findOrFail($request->campaign_id);
        $project = Project::findOrFail($request->project_id);
        $users = User::where('campaign_id', $request->campaign_id)
            ->where('project_id', $request->project_id)
            ->where('status', 'active')
            ->orderBy('name', 'asc')
            ->get();
        $categories = DatapointCategory::where('voice_evaluation_id', $voice_evaluation->id)
            ->where('campaign_id', $request->campaign_id)
            ->where('project_id', $request->project_id)
            ->where('status', 'active')
            ->with('datapoints')
            ->orderBy('sort', 'desc')
            ->get();
        return view('voice-audits.create')->with(compact('voice_evaluation', 'categories', 'campaign', 'project', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(VoiceAuditRequest $request)
    {
        // set data
        $call_date = Carbon::createFromFormat('d-m-Y', $request->call_date);

        /*         // get associate
         $associate = User::find($request->associate_id); */

        $request->merge([
            'call_date' => $call_date,
        ]);
        $voice_audit = VoiceAudit::create($request->all());
        $this->voiceAuditService->insertAuditPoints($request, $voice_audit);
        // return redirect()
        //     ->route('voice-audits.index', $voice_audit->voice_evaluation_id)
        //     ->with('success', 'Voice Audit created successfully!');
        return redirect()
            ->back()
            ->with('success', 'Voice Audit created successfully!');
    }

    public function show(VoiceAudit $voice_audit)
    {
        $this->voiceAuditService->auditShowAccess();

        $categories = $this->voiceAuditService->getAuditCategories($voice_audit);

        $voice_evaluation = VoiceEvaluation::findOrFail($voice_audit->voice_evaluation_id);

        return view('voice-audits.show')->with(compact('voice_audit', 'categories', 'voice_evaluation'));
    }

    public function edit(VoiceAudit $voice_audit)
    {
        $this->voiceAuditService->auditEditAccess($voice_audit);

        $users = User::role(['Manager', 'Team Lead', 'Associate'])
            ->orderBy('name', 'ASC')
            ->get();

        $categories = $this->voiceAuditService->getAuditCategories($voice_audit);

        $voice_evaluation = VoiceEvaluation::findOrFail($voice_audit->voice_evaluation_id);

        return view('voice-audits.edit')->with(compact('voice_audit', 'users', 'categories', 'voice_evaluation'));
    }

    public function update(VoiceAuditRequest $request, VoiceAudit $voice_audit)
    {
        $this->voiceAuditService->auditEditAccess($voice_audit);

        // set data
        $call_date = Carbon::createFromFormat('d-m-Y', $request->call_date);

        // get associate
        $associate = User::find($request->associate_id);

        $request->merge([
            'campaign_id' => $associate->campaign_id,
            'call_date' => $call_date,
        ]);

        $this->voiceAuditService->updateAuditPoints($request, $voice_audit);

        $voice_audit->update($request->all());

        $appeal = $this->voiceAuditService->updateAppeal($voice_audit);

        if ($appeal) {
            return redirect()
                ->back()
                ->with('success', 'Appeal accepted & Evaluation updated successfully!');
        }

        return redirect()
            ->back()
            ->with('success', 'Evaluation updated successfully!');
    }

    public function destroy(VoiceAudit $voice_audit)
    {
        $this->voiceAuditService->auditDeleteAccess($voice_audit);

        $voice_audit->delete();
        return redirect()
            ->back()
            ->with('success', 'Voice Audit deleted successfully!');
    }
}
