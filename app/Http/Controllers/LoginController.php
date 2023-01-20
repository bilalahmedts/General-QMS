<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    public function index()
    {
        return view('login');
    }

    public function login(LoginRequest $request)
    {
        if (Auth::attempt(['hrms_id' => $request->hrms_id, 'password' => $request->password, 'status' => 'active'])) {
            return redirect()->intended('home');
        } else {
            return redirect()
                ->back()
                ->with('error', 'Invalid HRMS ID or Password');
        }
    }

    public function logout()
    {
        Auth::logout();

        return redirect()->route('login');
    }
}
