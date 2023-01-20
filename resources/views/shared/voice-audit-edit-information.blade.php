<div class="row">
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
            <label for="">Campaign</label>
            <input type="hidden" class="form-control" id="campaign_id" value="{{ $voice_audit->campaign_id ?? '' }}"
                name="team_lead_id">
            <input type="text" class="form-control" id="campaign" value="{{ $voice_audit->project->name ?? '' }}"
                name="" disabled>
        </div>
        @error('campaign_id')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="">Agent Name</label>
            <input type="hidden" class="form-control" id="associate_id" value="{{ $voice_audit->associate_id ?? '' }}"
                name="associate_id">
            <input type="text" class="form-control" id="campaign" value="{{ $voice_audit->associate->name ?? '' }}"
                name="" disabled>
        </div>
        @error('associate_id')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="">HRMS ID</label>
            <input type="text" class="form-control" id="campaign"
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
            <label for="">Call Date <span>*</span></label>
            <input type="text" class="form-control datetimepicker-input datepicker" name="call_date"
                data-toggle="datetimepicker" data-target=".datepicker" value="{{ $voice_audit->call_date }}" required>
        </div>
        @error('call_date')
            <div class="validate-error">{{ $message }}</div>
        @enderror
    </div>
</div>