<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Models\User;

class LoginController extends Controller
{
    public function index(){
        return view('Auth.login');
    }

    public function Llogin(Request $request){
        $data = DB::select("SELECT * FROM admin WHERE email_admin=? AND password_admin=?", [$request->email, $request->password]);
        if ($data) {
            Session::put('statusAdmin', "login");
            return redirect()->route('admin.index');
        }else if(DB::select("SELECT * FROM user WHERE email='$request->email' AND password='$request->password'")){
            Session::put('status', "login");
            $name = DB::select("SELECT * FROM user WHERE email='$request->email' AND password='$request->password'");
            Session::put('id_user', $name[0]->ID);
            Session::put('user', $name[0]->name_user);
            return redirect()->route('home');
        }else {
            return redirect()->route('login');
        }
    }

    public function logout(){
        Session::forget('status');
        Session::forget('id_user');
        Session::put('status', "logout");
        Session::put('name', "guest");
        return redirect()->route('login');
    }
}
