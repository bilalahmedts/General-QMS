<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Exports\ManagersExport;
use App\Exports\TeamleadsExport;
use App\Exports\AssociatesExport;
use App\Exports\VoiceAuditsExport;
use Maatwebsite\Excel\Facades\Excel;

class ExportController extends Controller
{
    public function voiceAudits(Request $request)
    {
        $now = now();
        return Excel::download(new VoiceAuditsExport($request), "Voice-Audits-{$now->toString()}.xlsx");
    }
    public function associates(Request $request)
    {
        $now = now();
        return Excel::download(new AssociatesExport($request), "Associate-Voice-Audits-Report-{$now->toString()}.xlsx");
    }
    public function teamleads(Request $request)
    {
        $now = now();
        return Excel::download(new TeamleadsExport($request), "Team-Lead-Voice-Audits-Report-{$now->toString()}.xlsx");
    }
    public function managers(Request $request)
    {
        $now = now();
        return Excel::download(new ManagersExport($request), "Manager-Voice-Audits-Report-{$now->toString()}.xlsx");
    }
}
