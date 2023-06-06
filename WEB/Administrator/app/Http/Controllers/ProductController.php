<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mapel;
use App\Models\Categories;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ProductController extends Controller
{
    public function index(){
        $mapel = Mapel::where('ID_categories', 10)->get();
        $id = Session::get('id_user');
        $course = DB::table('enroll')
                        ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                        ->join('user', 'enroll.ID_user', '=', 'user.ID')
                        ->where('ID_user', $id)
                        ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                        ->get();
        return view('dashboard', compact('mapel','course'));
    }

    public function index1(){
        $mapel = Mapel::where('ID_categories', 11)->get();
        $id = Session::get('id_user');
        $course = DB::table('enroll')
                        ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                        ->join('user', 'enroll.ID_user', '=', 'user.ID')
                        ->where('ID_user', $id)
                        ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                        ->get();
        return view('dashboard', compact('mapel','course'));
    }

    public function index2(){
        $mapel = Mapel::where('ID_categories', 12)->get();
        $id = Session::get('id_user');
        $course = DB::table('enroll')
                        ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                        ->join('user', 'enroll.ID_user', '=', 'user.ID')
                        ->where('ID_user', $id)
                        ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                        ->get();
        return view('dashboard', compact('mapel','course'));
    }
}
