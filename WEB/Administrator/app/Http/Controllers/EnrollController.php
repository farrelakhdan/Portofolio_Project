<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ProgressModul;
use App\Models\Product;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use FILE;

class EnrollController extends Controller
{
    public function index($id){
        $id_user = Session::get('id_user');
        DB::table('enroll')->insert([
            'ID_mapel' => $id,
            'ID_user' => $id_user,
            'status' => "0"
        ]);
        $count = Product::where('ID_mapel', $id)->count();
        $product = DB::table('product')
                        ->where('ID_mapel',$id)
                        ->select('ID as ID')
                        ->get();
        for ($i=0; $i < $count; $i++) { 
            DB::table('progress_modul')->insert([
                'ID_mapel' => $id,
                'ID_product' => $product[$i]->ID,
                'ID_user' => $id_user
            ]);
        }
        return redirect()->route('home');
    }
}
