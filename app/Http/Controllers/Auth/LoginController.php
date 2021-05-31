<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Models\User;
use Illuminate\Http\Request;
use App\Notifications\VerifyRegistration;
use Illuminate\Support\Str;
use Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = RouteServiceProvider::HOME;
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function login(Request $request)
    {
        $this->validate($request, [
          'email' => 'required|email',
          'password' => 'required',
        ]);
        //Find the user
        $user = User::where( 'email', $request->email)->first();

        if($user->status == 1)
        {
          //Login The user
          if(Auth::guard('web')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember))
          {
            //login Now
            return redirect()->intended(route('index'));
          }else{
              session()->flash('sticky_error', ' Invalid Login!!');
              return back();
          }
        }else {

          if(!is_null($user))
          {
            $user->remember_token = Str::random(50);
            $user->notify(new VerifyRegistration($user));
            session()->flash('success','A new confirmation message has been sent to your email, Please check and verify');
            return redirect('/');
          }
          else
          {
            session()->flash('sticky_error', 'Please Login First');
            return redirect()->route('login');
          }
        }

    }
}
