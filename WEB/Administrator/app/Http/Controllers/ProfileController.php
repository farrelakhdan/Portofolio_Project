<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ProfileController extends Controller
{
    public function index(){
        $status = Session::get('status');
        $id_user = Session::get('id_user');
        $user = User::where('ID', $id_user)->get();
        $course = DB::table('enroll')
                            ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                            ->join('user', 'enroll.ID_user', '=', 'user.ID')
                            ->where('ID_user', $id_user)
                            ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                            ->get();    
        return view('profile.edit', compact('user','course'));
    }
}
