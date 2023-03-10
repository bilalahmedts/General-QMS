<?php

namespace App\Models;

use Illuminate\Support\Str;
use Laravel\Sanctum\HasApiTokens;
use Kyslik\ColumnSortable\Sortable;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes, HasRoles, Sortable;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $guarded = [];

    public $sortable = [
        'id',
        'hrms_id',
        'name',
        'username',
        'email',
        'status',
        'created_at',
        'updated_at'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = Hash::make($password);
    }

    protected static function boot()
    {
        parent::boot();

        User::creating(function($model) {
            $model->access_key = (string) Str::uuid();
        });
    }

    public function campaign()
    {
        return $this->hasOne(Campaign::class, 'id', 'campaign_id');
    }
    public function project()
    {
        return $this->hasOne(Project::class, 'id', 'project_id');
    }

    public function supervisor(){
        return $this->hasOne(User::class, 'id', 'reporting_to');
    }

    /**
     * Get all of the voiceAudits for the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function voiceAudits()
    {
        return $this->hasMany(VoiceAudit::class, 'user_id', 'id')->where('voice_evaluation_id', 1);
    }

    /**
     * Get all of the voiceAudits for the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function teamLeadVoiceAudits()
    {
        return $this->hasMany(VoiceAudit::class, 'team_lead_id', 'id')->where('voice_evaluation_id', 1);
    }

    /**
     * Get all of the voiceAudits for the User
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function associateVoiceAudits()
    {
        return $this->hasMany(VoiceAudit::class, 'associate_id', 'id')->where('voice_evaluation_id', 1);
    }

    public function managerVoiceAudits()
    {
        return $this->hasMany(VoiceAudit::class, 'manager_id', 'id')->where('voice_evaluation_id', 1);
    }
    public function scopeSearch($query, $request){

        if ($request->has('id')) {
            if (!empty($request->id)) {
                $query = $query->where('id', $request->id);
            }
        }
        // if ($request->has('search_id')) {
        //     if (!empty($request->search_id)) {
        //         $query = $query->where('id', $request->search_id);
        //     }
        // }
        if ($request->has('name')) {
            if (!empty($request->name)) {
                $query = $query->where('name', 'LIKE', "%{$request->name}%");
            }
        }

        if ($request->has('username')) {
            if (!empty($request->username)) {
                $query = $query->where('username', 'LIKE', "%{$request->username}%");
            }
        }

        if ($request->has('email')) {
            if (!empty($request->email)) {
                $query = $query->where('email', 'LIKE', "%{$request->email}%");
            }
        }

        if ($request->has('campaign_id')) {
            if (!empty($request->campaign_id)) {
                $query = $query->where('campaign_id', $request->campaign_id);
            }
        }
        if ($request->has('project_id')) {
            if (!empty($request->project_id)) {
                $query = $query->where('project_id', $request->project_id);
            }
        }

        if ($request->has('status')) {
            if (!empty($request->status)) {
                $query = $query->where('status', $request->status);
            }
        }

        return $query;
    }
    

}
