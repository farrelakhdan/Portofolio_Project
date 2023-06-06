<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table='product';
    
    protected $fillable = [
        'ID_mapel',
        'name_product',
        'type',
        'file_product'
    ];
    
    public function mapel()
    {
        return $this->belongsTo(Mapel::class);
    }
}
