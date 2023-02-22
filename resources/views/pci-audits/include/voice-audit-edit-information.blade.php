<div class="row">
     
    <div class="form-group col-md-4">
        <label for="">Select Associate</label>
        <select name="associate_id" class="form-control select2" id="associate">
            <option value="-1">Select Option</option>
            @foreach ($users as $user)
                <option value="{{ $user->id }}" @if ($user->id == $voice_audit->associate_id) selected @endif>
                    {{ $user->name }}</option>
            @endforeach
        </select>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="">HRMS ID</label>
            <input type="text" class="form-control" id="hrms_id"
                value="{{ $voice_audit->associate->hrms_id ?? '' }}" name="" disabled>
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="">Reporting To</label>
            <input type="hidden" class="form-control" id="reporting_id" value="{{ $voice_audit->team_lead_id ?? '' }}"
                name="team_lead_id">
            <input type="text" class="form-control" id="reporting"
                value="{{ $voice_audit->associate->supervisor->name ?? '' }}" name="" disabled>
        </div>
        @error('reporting')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="">Campaign</label>
            <input type="hidden" class="form-control" id="campaign_id" value="{{ $voice_audit->campaign_id ?? '' }}"
                name="team_lead_id">
            <input type="text" class="form-control" id="campaign"
                value="{{ $voice_audit->associate->campaign->name ?? '' }}" name="" disabled>
        </div>
        @error('campaign_id')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="">Project</label>
            <input type="hidden" class="form-control" id="project_id" value="{{ $voice_audit->project_id ?? '' }}"
                name="project_id">
            <input type="text" class="form-control" id="project" value="{{ $voice_audit->project->name ?? '' }}"
                name="" disabled>
        </div>
        @error('project_id')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Date Of Chat/Email <span>*</span></label>
            <input type="text" class="form-control datetimepicker-input datepicker" name="date_of_chat_email"
                data-toggle="datetimepicker" data-target=".datepicker" value="{{ $voice_audit->date_of_chat_email }}"
                required>
        </div>
        @error('date_of_chat_email')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Audit Date <span>*</span></label>
            <input type="date" class="form-control " name="audit_date"  value="{{ $voice_audit->audit_date }}"
                required>
        </div>
        @error('audit_date')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Ticket Number <span>*</span></label>
            <input type="text" class="form-control" name="ticket_number" placeholder="Ticket #" value="{{ $voice_audit->ticket_number }}" required>
        </div>
        @error('ticket_number')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    @if ($voice_audit->project->id == "8" )
        
    
    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Start_time <span>*</span></label>
            <input type="time" class="form-control" name="start_time"  placeholder="Ticket #" value="{{  $voice_audit->start_time}}" required>
        </div>
        @error('start_time')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Queue <span>*</span></label>
            <input type="text" class="form-control" name="queue"  placeholder="Queue" value="{{  $voice_audit->queue }}" required>
        </div>
        @error('queue')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Agent Group <span>*</span></label>
            <input type="text" class="form-control" name="agent_group"  placeholder="Agent Group " value="{{ $voice_audit->agent_group }}"  required>
        </div>
        @error('agent_group')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-4">
        <div class="form-group">
            <label for=""> Caller <span>*</span></label>
            <input type="text" class="form-control" name="caller"  placeholder="Caller " value="{{  $voice_audit->caller}}" required>
        </div>
        @error('caller')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-4">
        <div class="form-group">
            <label for=""> AstClid <span>*</span></label>
            <input type="text" class="form-control" name="ast_clid"  placeholder="AstClid " value="{{  $voice_audit->ast_clid }}" required>
        </div>
        @error('ast_clid')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    @endif
    <input type="hidden" name="manager_id" id="manager_id" value="{{ $voice_audit->manager_id ?? '' }}">
</div>
