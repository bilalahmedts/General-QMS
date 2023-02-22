<table class="table">
   
    @if($voice_audit->project->id >=6 && $voice_audit->project->id <=7)
        <tr>
            <th>Date Of Chat/Email/Call</th>
            <td>{{ $voice_audit->date_of_chat_email ?? '' }}</td>
        </tr>
        <tr>
            <th>Ticket #</th>
            <td>{{ $voice_audit->ticke_number ?? '' }}</td>
        </tr> 
    @endif
    @if($voice_audit->project->id =8)

        <tr>
            <th>Start Time</th>
            <td>{{ $voice_audit->start_time ?? '' }}</td>
        </tr>
        <tr>
            <th>Queue</th>
            <td>{{ $voice_audit->queue ?? '' }}</td>
        </tr>
        <tr>
            <th>Agent Group</th>
            <td>{{ $voice_audit->agent_group ?? '' }}</td>
        </tr>
        <tr>
            <th>caller</th>
            <td>{{ $voice_audit->caller ?? '' }}</td>
        </tr>
        <tr>
            <th>Ast Clid</th>
            <td>{{ $voice_audit->ast_clid ?? '' }}</td>
        </tr>
        


    @endif
    <tr>
        <th>Associate</th>
        <td>{{ $voice_audit->associate->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Campaign</th>
        <td>{{ $voice_audit->campaign->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Project</th>
        <td>{{ $voice_audit->project->name ?? '' }}</td>
    </tr>
    <tr>
        <th>Customer</th>
        <td>{{ $voice_audit->customer_name ?? '' }}</td>
    </tr>
    <tr>
        <th>Phone</th>
        <td>{{ $voice_audit->customer_phone ?? '' }}</td>
    </tr>
    
    <tr>
        <th>Score</th>
        <td>{{ $voice_audit->percentage ?? '' }}%</td>
    </tr>
    <th>Customer Rating</th>
    <td>
        {{$voice_audit->customer_rating}}
    </td>
    <tr>
        <th>Customer Feedback</th>
    <td>
        {{$voice_audit->customer_feedback}}
    </td>
    </tr>
    
    
    <tr>
        <th>Status</th>
        <td>
            @include('pci-audits.include.voice-audit-status', ['status' => $voice_audit->status])
        </td>
    </tr>
    <tr>
        <th>Call Type</th>
        <td>
            {{ $voice_audit->call_type }}
        </td>
    </tr>
    <tr>
        <td><strong>Evaluation Time</strong></td>
        <td>{{ $voice_audit->evaluation_time ?? '00:00:00' }}</td>
    </tr>
    {{-- <tr>
        <td colspan="2">
            <strong>Notes</strong><br>
            {{ $voice_audit->notes ?? '' }}
        </td>
    </tr> --}}
    @if ($voice_audit->appeal)
        <tr>
            <td colspan="2">
                <strong>Appeal Remarks</strong><br>
                {{ $voice_audit->appeal->remarks ?? '' }}
            </td>
        </tr>
    @endif

    @if ($voice_audit->action)
        <tr>
            <th>Action</th>
            <td>{{ $voice_audit->action->action->name }}</td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>Action Remarks</strong><br>
                {{ $voice_audit->action->remarks ?? '' }}
            </td>
        </tr>
    @endif
    {{-- <tr>
        <td colspan="2">
            <strong>Call Recording</strong><br><br>
            <audio controls style="width: 100%;">
                <source src="https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"
                    type="audio/mpeg">
            </audio>
            <br>
            {{ $voice_audit->recording_link ?? '' }}
        </td>
    </tr> --}}
</table>
