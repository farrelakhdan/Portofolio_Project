<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ProgressModul;
use App\Models\Product;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use FILE;

class CourseController extends Controller
{
    public function index($id){
        $status = Session::get('status');
        if ($status == "login") {
            $id_user = Session::get('id_user');
            $modul = DB::table('progress_modul')
                            ->join('mapel', 'progress_modul.ID_mapel', '=', 'mapel.ID')
                            ->join('product', 'progress_modul.ID_product', '=', 'product.ID')
                            ->where([['progress_modul.ID_mapel', '=', $id],['progress_modul.ID_user','=', $id_user]])
                            ->select('product.ID as ID', 'product.ID_mapel as ID_mapel', 'product.name_product as modul', 'product.type as type', 'mapel.name_mapel as mapel', 'mapel.image as image', 'product.file_product as file', 'progress_modul.status as status')
                            ->get();
            
            $course = DB::table('enroll')
                            ->join('mapel', 'enroll.ID_mapel', '=', 'mapel.ID')
                            ->join('user', 'enroll.ID_user', '=', 'user.ID')
                            ->where('ID_user', $id_user)
                            ->select('enroll.ID_mapel as ID','enroll.status as status' ,'mapel.name_mapel as mapel', 'mapel.image as image', 'enroll.active as active')
                            ->get();
            return view('course.index', compact('modul','course'));
        }else {
            return redirect()->route('login');
        }
        
    }

    public function file($id){
        $status = Session::get('status');
        if ($status = 'login') {
            $id_user = Session::get('id_user');
            $file = Product::where('ID', $id)->get();
            $id_mapel = $file[0]->ID_mapel;
            if ($file[0]->type == "pdf.jpg") {
                $pathToFile = public_path('file/'.$file[0]->file_product);
                DB::select("UPDATE progress_modul SET status='100' WHERE ID_product = '$id' AND ID_user = '$id_user'");
                $count = ProgressModul::where('ID_user',$id_user)->where('ID_mapel',$id_mapel)->count();
                $progress = DB::select("SELECT SUM(status) as progress FROM progress_modul WHERE ID_user='$id_user' AND ID_mapel='$id_mapel'");
                $result = (int)$progress[0]->progress / (int)$count;
                DB::select("UPDATE enroll SET status='$result' WHERE ID_user='$id_user' AND ID_mapel='$id_mapel'");
                return response()->file($pathToFile);
            }else if($file[0]->type == "video.jpg"){
                DB::select("UPDATE progress_modul SET status='100' WHERE ID_product = '$id' AND ID_user = '$id_user'");
                $count = ProgressModul::where('ID_user',$id_user)->where('ID_mapel',$id_mapel)->count();
                $progress = DB::select("SELECT SUM(status) as progress FROM progress_modul WHERE ID_user='$id_user' AND ID_mapel='$id_mapel'");
                $result = (int)$progress[0]->progress / (int)$count;
                DB::select("UPDATE enroll SET status='$result' WHERE ID_user='$id_user' AND ID_mapel='$id_mapel'");
                return redirect()->away($file[0]->file_product);
            }
            
        }else {
            return redirect()->route('login');
        }
        
    }
}
