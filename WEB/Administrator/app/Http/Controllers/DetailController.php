<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mapel;
use App\Models\Product;
use App\Models\Categories;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class DetailController extends Controller
{
    public function index($id){
        $status = Session::get('status');
        if ($status = "login") {
            $mapel = Mapel::where('ID',$id)->get();
            $product = Product::where('ID_mapel',$id)->get();
            $id_user = Session::get('id_user');
            $course = DB::table('enroll')
                                ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                                ->join('user', 'enroll.ID_user', '=', 'user.ID')
                                ->where('ID_user', $id_user)
                                ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                                ->get();
            return view('Shop.detail', compact('mapel','product','course'));
        }else {
            $mapel = Mapel::where('ID',$id)->get();
            $product = Product::where('ID_mapel',$id)->get();
            return view('Shop.detail', compact('mapel','product'));
        }
        
    }
}
