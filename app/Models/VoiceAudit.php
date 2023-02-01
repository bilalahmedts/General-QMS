<?php

namespace App\Models;

use Carbon\Carbon;
use Kyslik\ColumnSortable\Sortable;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Znck\Eloquent\Traits\BelongsToThrough;
use Illuminate\Database\Eloquent\SoftDeletes;
use Staudenmeir\EloquentHasManyDeep\HasEagerLimit;
use Staudenmeir\EloquentHasManyDeep\HasRelationships;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VoiceAudit extends Model
{
    use HasFactory, SoftDeletes, HasRelationships, BelongsToThrough, HasEagerLimit, Sortable;

    protected $fillable = ['voice_evaluation_id', 'user_id', 'associate_id', 'team_lead_id','manager_id', 'call_date', 'percentage', 'customer_name', 'customer_phone', 'record_id', 'recording_duration', 'recording_link', 'outcome', 'lead_status', 'notes', 'call_type', 'campaign_id', 'project_id', 'review_priority', 'rating', 'status', 'client_status', 'evaluation_time', 'communication', 'sales', 'compliance', 'customer_service', 'product_presentation'];

    public $sortable = ['id','hrms_id', 'user_id', 'associate_id', 'team_lead_id', 'campaign_id', 'project_id', 'call_date', 'customer_name', 'customer_phone', 'outcome', 'billable_status', 'status', 'evaluation_time', 'created_at', 'updated_at'];

    public function getCallDateAttribute($value)
    {
        $call_date = Carbon::parse($value);
        return $call_date->format('d-m-Y');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function manager()
    {
        return $this->hasOne(User::class, 'id', 'manager_id');
    }
    public function teamLead()
    {
        return $this->hasOne(User::class, 'id', 'team_lead_id');
    }

    public function associate()
    {
        return $this->hasOne(User::class, 'id', 'associate_id');
    }

    public function campaign()
    {
        return $this->hasOne(Campaign::class, 'id', 'campaign_id');
    }
    public function project()
    {
        return $this->hasOne(Project::class, 'id', 'project_id');
    }
    /**
     * Get all of the fields for the VoiceAudit
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function fields()
    {
        return $this->hasMany(VoiceAuditCustomField::class, 'voice_audit_id', 'id')->with('field');
    }

    public function scopeSearch($query, $request)
    {
        if ($request->has('record_id')) {
            if (!empty($request->record_id)) {
                $query = $query->where('record_id', $request->record_id);
            }
        }

        if ($request->has('user_id')) {
            if ($request->user_id > 0) {
                $query = $query->where('user_id', $request->user_id);
            }
        }

        if ($request->has('associate_id')) {
            if ($request->associate_id > 0) {
                $query = $query->where('associate_id', $request->associate_id);
            }
        }

        if ($request->has('campaign_id')) {
            if ($request->campaign_id > 0) {
                $query = $query->where('campaign_id', $request->campaign_id);
            }
        }

        if ($request->has('project_id')) {
            if ($request->project_id > 0) {
                $query = $query->where('project_id', $request->project_id);
            }
        }

        if ($request->has('outcome')) {
            if (!empty($request->outcome)) {
                $query = $query->where('outcome', $request->outcome);
            }
        }
        if ($request->has('search_id')) {
            if ($request->search_id > 0) {
                $query = $query->where('id', $request->search_id);
            }
        }
        if ($request->has('from_date')) {
            if (!empty($request->from_date) && !empty($request->to_date)) {
                $from_date = Carbon::createFromFormat('d/m/Y', $request->from_date);
                $to_date = Carbon::createFromFormat('d/m/Y', $request->to_date);
                $query = $query->whereDate('created_at', '>=', $from_date->toDateString());
                $query = $query->whereDate('created_at', '<=', $to_date->toDateString());
            } elseif (!empty($request->start_date)) {
                $from_date = Carbon::createFromFormat('d/m/Y', $request->start_date);
                $query = $query->whereDate('created_at', $from_date->toDateString());
            }
        }

        return $query;
    }

    /**
     * Get the appeal associated with the VoiceAudit
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function appeal()
    {
        return $this->hasOne(VoiceAuditAppeal::class, 'voice_audit_id', 'id');
    }

    /**
     * Get the action associated with the VoiceAudit
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function action()
    {
        return $this->hasOne(VoiceAuditAction::class, 'voice_audit_id', 'id');
    }

    /**
     * Get all of the points for the VoiceAudit
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function points()
    {
        return $this->hasMany(VoiceAuditPoint::class, 'voice_audit_id', 'id');
    }
}