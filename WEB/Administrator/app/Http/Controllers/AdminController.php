<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Categories;
use App\Models\Product;
use App\Models\ProgressModul;
use App\Models\Mapel;
use App\Models\User;
use App\Models\Enroll;
use FILE;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class AdminController extends Controller
{
    public function index(){
        $data = Categories::all();
        return view('Admin.home', compact('data'));
    }

    public function mapel(){
        $mapel = Mapel::all();
        $categories = Categories::all();
        return view('Admin.mapel', compact('mapel','categories'));
    }

    public function product(){
        $data = Product::all();
        $mapel = Mapel::all();
        return view('Admin.product', compact('data','mapel'));
    }

    public function detail(){
        $data = ProgressModul::all();
        $product = Product::all();
        $mapel = Mapel::all();
        $user = User::all();
        return view('Admin.detail', compact('data','product','mapel','user'));
    }

    public function enroll(){
        $data = Enroll::all();
        $mapel = Mapel::all();
        $user = User::all();
        return view('Admin.enroll', compact('data','mapel','user'));
    }

    //CATEGORIES
    public function det_cat($id){
        $list_data = Categories::where('ID','=', $id)->get();
        return response()->json($list_data);
    }

    public function upd_cat(Request $request, $id){
        if ($id == "new") {
            Categories::create($request->all());
        }else {
            Categories::where('ID', $id)
                        ->update(['name_categories' => $request->name_categories]);
        }
    }

    public function del_cat($id){
        Categories::where('ID',$id)->delete();
    }

    //MAPEL
    public function det_map($id){
        $list_data = Mapel::where('ID','=', $id)->get();
        return response()->json($list_data);
    }

    public function upd_map(Request $request, $id){
        if ($id == "new") {
            $input = $request->all();
            $input['image'] = null;
            if ($request->hasFile('image')){
                $input['image'] = time().'.'.$request->image->getClientOriginalExtension();
                $input1 = time().'.'.$request->image->getClientOriginalExtension();
                $request->image->move(public_path('image/'), $input['image']);
            }
            DB::select('INSERT INTO mapel(ID_categories,name_mapel,image,deskripsi) VALUE(?,?,?,?)', [$request->ID_categories, $request->name_mapel,$input1, $request->deskripsi]);
        }else {
            $lAda = Mapel::where('ID',$id)->count();
            if ($lAda == 1)
            {
                $input = $request->all();
                $input['image'] = null;
                if ($request->hasFile('image')){
                    $input['image'] = time().'.'.$request->image->getClientOriginalExtension();
                    $input1 = time().'.'.$request->image->getClientOriginalExtension();
                    $request->image->move(public_path('image/'), $input['image']);
                    $product = Mapel::findOrFail($id);
                    DB::select("UPDATE mapel SET image='$input1' where ID='$id'");
                    unlink(public_path('file/'.$product->image));
                }

                DB::select("UPDATE mapel SET ID_categories='$request->ID_categories', name_mapel='$request->name_mapel', deskripsi='$request->deskripsi' WHERE ID='$id'");
            } else
            {
                // 
            }
            
        }
    }

    public function del_map($id){
        Mapel::where('ID',$id)->delete();
    }

    //PRODUCT
    public function det_pro($id){
        $list_data = Product::where('ID','=', $id)->get();
        return response()->json($list_data);
    }

    public function upd_pro(Request $request,$id){
        if ($id == "new") {

            $input = $request->all();
            $input['file_product'] = null;
            $mapel = Mapel::where('ID', $request->ID_mapel)->get();
            $name = $mapel[0]->name_mapel.":".$request->name_product;
            if ($request->hasFile('file_product') && $request->type == "pdf.jpg"){
                $input['file_product'] = time().'.'.$request->file_product->getClientOriginalExtension();
                $input1 = time().'.'.$request->file_product->getClientOriginalExtension();
                $request->file_product->move(public_path('file/'), $input['file_product']);
                DB::table('product')->insert([
                    'ID_mapel'      => $request->ID_mapel,
                    'name_product'  => $name,
                    'type'          => $request->type,
                    'file_product'  => $input1
                ]);
            }else if($request->type == "video.jpg"){
                DB::table('product')->insert([
                    'ID_mapel'      => $request->ID_mapel,
                    'name_product'  => $name,
                    'type'          => $request->type,
                    'file_product'  => $request->video_product,
                ]);
            }
        }
        else {
            $lAda = Product::where('ID',$id)->count();
            if ($lAda == 1)
            {
                $input = $request->all();
                $input['file_product'] = null;
                $mapel = DB::table('mapel')->where('ID', $request->ID_mapel)->get();
                $name = $mapel->name_mapel . ':' . $request->name_product;
                if ($request->hasFile('file_product')  && $request->type == "pdf.jpg"){
                    $input['file_product'] = time().'.'.$request->file_product->getClientOriginalExtension();
                    $input1 = time().'.'.$request->file_product->getClientOriginalExtension();
                    $request->file_product->move(public_path('file/'), $input['file_product']);
                    $product = Product::findOrFail($id);
                    DB::select("UPDATE product SET file_product='$input1' where ID='$id'");
                    unlink(public_path('file/'.$product->file_product));
                }else if($request->type == "video.jpg"){
                    DB::select("UPDATE product SET file_product='$request->video_product' where ID='$id'");
                }

                DB::select("UPDATE product SET ID_mapel='$name', name_product='$request->name_product', type='$request->type' WHERE ID='$id'");
            } else
            {
                // 
            }
        }
    }

    //PROGRESS MODUL
    public function det_det($id){
        $list_data = ProgressModul::where('ID','=', $id)->get();
        return response()->json($list_data);
    }

    public function upd_det(Request $request, $id){
        if ($id == "new") {
            DB::table('progress_modul')->insert([
                'ID_mapel' => $request->ID_mapel,
                'ID_product' => $request->ID_product,
                'ID_user' => $request->ID_user,
                'status' => $request->status
            ]);
        }else {
            DB::select("UPDATE progress_modul SET ID_mapel='$request->ID_mapel', ID_user='$request->ID_user', status='$request->status', ID_product='$request->ID_product' WHERE ID='$id'");

        }
    }

    public function del_det($id){
        ProgressModul::where('ID',$id)->delete();
    }

    //ENROLL
    public function det_enr($id){
        $list_data = Enroll::where('ID','=', $id)->get();
        return response()->json($list_data);
    }

    public function upd_enr(Request $request,$id){
        if ($id == "new") {
            DB::table('enroll')->insert([
                'ID_mapel' => $request->ID_mapel,
                'ID_user' => $request->ID_user,
                'status' => $request->status,
                'active' => $request->active
            ]);
        }else {
            $lAda = Enroll::where('ID',$id)->count();
            if ($lAda == 1) {
                DB::select("UPDATE enroll SET ID_mapel='$request->ID_mapel', ID_user='$request->ID_user', status='$request->status', active='$request->active' WHERE ID='$id'");
            }else {
                # code...
            }
        }
    }
}
