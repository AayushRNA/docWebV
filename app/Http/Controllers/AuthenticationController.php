<?php

namespace App\Http\Controllers;

use App\Helpers\ValidationHelper;
use App\Http\Controllers\BaseApiController;
use App\Http\HttpCode;
use App\Models\User;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Repositories\UserRepository;
use RuntimeException;

final class AuthenticationController extends BaseApiController
{

    public function register(Request $request) 
    {
    //    return $request;
       
        $user = User::where('email', $request->email)->first();
        // return $user;

        $message  = new User();
        if ($user == null) {
            $user = new User();
            $user->email = $request->email;
            $user->name = $request->name;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            $user->role = $request->role;
            if($user->save()){
                $message->result = true;
                $message->message = 'Register Successfully Done';
                $message->user_id = $user->id;
            }
        }else{
            $message->result = false;
            $message->message = 'Email Already Exist';
        }
        
        return response()->json(['message'=>$message->message,'result'=>$message->result,'status'=>200]);
    }



    public function doctorRegister(Request $request)
    {
        // return $request;
        $user = User::where('email', $request->email)->first();

        $message  = new User();
        if ($user == null) {
            $user = new User();
            $user->email = $request->email;
            $user->name = $request->name;
            $user->speciality = $request->speciality;
            $user->qualification = $request->qualification;
            $user->experience = $request->experience;
            $user->address = $request->address;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            $user->role = $request->role;
            if($user->save()){
                $message->result = true;
                $message->message = 'Register Successfully Done';
                $message->user_id = $user->id;
               
            }
        }else{
            $message->result = false;
            $message->message = 'Email Already Exist';
        }
       
        return response()->json(['message'=>$message->message,'result'=>$message->result,'status'=>200]);
    }


    public function login(Request $request)
    {

        // return $request;
        $message = new User();
        $user = User::where('email', $request->email)->first();

        if (! $user || ! Hash::check($request->password, $user->password)) {
            $message->result = false;
            $message->message = 'The provided credentials are incorrect.';
        } else {
            $message->result = true;
            $message->name = $user->name ?? 'username';
            $message->id = $user->id;
            $message->email = $user->email;
            $message->role = $user->role;
            $message->device_token = 'nai ekhon';
            $message->token = $user->createToken(env('APP_TOKEN'))->accessToken;
        }
        return response()->json($message);
    }

    public function logout(Request $request){
        $result = $request->user()->currentAccessToken()->delete(); //or Auth::user()
        return $result;
    }


   public function tokenSave(Request $request)
   {
       $user = User::where('id',$request->id)->first();
       if($user != null){
           $user->device_token = $request->token;
           $user->save();
       }
       return response()->json(['message'=>'ok done']);
   }


}
