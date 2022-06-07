<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\ResetPassword;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ForgetPasswordController extends Controller
{
     /*password reset*/
    public function sentForgetCode($email)
    {
        $user = User::where('email', $email)->first();
        $response_message = new User();
        if ($user != null) {

            $id = rand(10, 100000);
            /*send here email and insert the code in */
            // try {
                $user->notify(new ResetPassword($id));
                $user->code = $id;
                $user->save(); //save the code
                $response_message->error = false;
                $response_message->message = "An Activation code is already sent to your email, Please check your email";
            // } catch (\Exception $exception) {
            //     $response_message->error = true;
            //     $response_message->message = 'There are Some Problem. Try again!';
            // }
        } else {
            $response_message->error = true;
            $response_message->message = 'Email Not Found';
        }
        return $response_message;
    }


    public function matchForgetCode($email, $code)
    {

        $user = User::where('email', $email)->where('code', $code)->first();
        $response_message = new User();
        if ($user != null) {
            $response_message->code = false;
            $response_message->message = "Type your new password";
        } else {
            $response_message->error = true;
            $response_message->message = 'Invalid Code';
        }
        return $response_message;
    }


    public function saveForgetCodePassword(Request $request)
    {
        $user = User::where('email', $request->email)
            ->where('code', $request->code)->first();
        $response_message = new User();
        if ($user != null) {
            $user->password = Hash::make($request->password);
            $user->code = null;
            $user->save();
            $response_message->error = false;
            $response_message->message = "Password Is Updated";

        } else {
            $response_message->error = true;
            $response_message->message = 'Invalid Attempt. Try again!';
        }
        return $response_message;
    }
}
