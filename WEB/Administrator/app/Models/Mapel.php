<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mapel extends Model
{
    use HasFactory;
    protected $table='mapel';
    
    protected $fillable = [
        'ID_categories',
        'name_mapel',
        'image',
        'deskripsi'
    ];
    
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
