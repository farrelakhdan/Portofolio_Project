<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Enroll extends Model
{
    
    protected $table='enroll';
    
    protected $fillable = [
        'ID_mapel',
        'ID_user',
        'status',
        'active'
    ];
    public function mapel()
    {
        return $this->belongsTo(Mapel::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
