<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProgressModul extends Model
{
    use HasFactory;

    protected $table = 'progress_modul';
    protected $fillable = ['ID_mapel',
                            'ID_product',
                            'ID_user',
                            'status'];
    public function mapel()
    {
        return $this->belongsTo(Mapel::class);
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
