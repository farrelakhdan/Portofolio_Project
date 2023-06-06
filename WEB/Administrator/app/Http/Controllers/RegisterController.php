<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{
    public function index(){
        return view('auth.register');
    }

    public function regis(Request $request){
        $cek = User::where('email',$request->email)->count();
        $cek1 = User::where('name_user',$request->name_user)->count();
        if ($cek == 0 && $cek1 == 0) {
            DB::table('user')->insert([
                'name_user' => $request->name_user,
                'email' => $request->email,
                'telepon' => $request->telepon,
                'password' => $request->password
            ]);
            return redirect()->route('login');
        }else{
            return redirect()->route('register');
        }
    }
}
