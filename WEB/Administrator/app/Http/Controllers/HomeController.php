<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mapel;
use App\Models\Categories;
use App\Models\Enroll;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class HomeController extends Controller
{
    public function index(){
        $status = Session::get('status');
        if ($status == "login") {
            $categories = Categories::all();
            $mapel = Mapel::all();
            $id = Session::get('id_user');
            $course = DB::table('enroll')
                        ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                        ->join('user', 'enroll.ID_user', '=', 'user.ID')
                        ->where('ID_user', $id)
                        ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                        ->get();
            return view('dashboard', compact('mapel', 'categories'), ['course'=>$course]);
        }else {
            $categories = Categories::all();
            $mapel = Mapel::all();
            return view('dashboard', compact('mapel', 'categories'));
        }
    }
}
