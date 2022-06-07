<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use App\Models\Prescription;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Exception;

class AppController extends Controller
{

    public function sendPushMessage($title, $message, $topic = 'No topics', $userId,$toke)
    {
        $fields = array(
            // 'to' => '/topics/' . $topic,
            'registration_ids' => [$toke],
            'notification' => [
                'title' => $title,
                'body' => $message
            ],
            'data' => array(
                'click_action' => 'FLUTTER_NOTIFICATION_CLICK',
                'id' => '1',
                'status' => 'done',
                'user_id' => $userId,
            ),
        );

        return $this->sendPushNotification($fields);
    }

    private function sendPushNotification($fields)
    {
        $url = 'https://fcm.googleapis.com/fcm/send';

        $server_key = "AAAA-2496Io:APA91bHbbc6KtSuCtaBJsaWroVlIwVfGs457NyjO-DRFQglgYKd6GamZ7Ppa09-MOHvQU0zqEGUw6yBCBNTHgHoMv5Hnz-OP9MtlwmdpDI56Xc3DiddSD_kZ1jvf0fUDLB4J_Hfrj7A1";
        $headers = [
            'Authorization: Key=' . $server_key,
            'Content-Type: Application/json'
        ];
        // Open connection
        $ch = curl_init();

        // Set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));

        // Execute post
        $result = curl_exec($ch);
        if ($result === false) {
            die('Curl failed: ' . curl_error($ch));
        }

        // Close connection
        curl_close($ch);

        return $result;
    }

    // all_doctors
    public function all_doctors()
    {
        $doctors = User::where('role', 'doctor')->get();
        return response()->json(['doctors'=>$doctors]);
    }

    //doctors_profile
    public function doctors_profile($user_id)
    {
        $doctor = User::where('id', $user_id)->first();
        return response()->json($doctor);
    }

    //doctors_profile_update
    public function doctors_profile_update($user_id, Request $request)
    {
        $doctor = DoctorProfile::where('id', $user_id)->first();
        if ($doctor) {
            $doctor->speciality = $request->speciality;
            $doctor->qualification = $request->qualification;
            $doctor->experience = $request->experience;
            $doctor->address = $request->address;
            $doctor->phone = $request->phone;
        }else{
            $doctor = new DoctorProfile();
            $doctor->user_id = $user_id;
            $doctor->speciality = $request->speciality;
            $doctor->qualification = $request->qualification;
            $doctor->experience = $request->experience;
            $doctor->address = $request->address;
            $doctor->phone = $request->phone;
        }
        $doctor->save();
        return response()->json($doctor);
    }

    //all_patient
    public function all_patient()
    {
        $patients = User::where('role', 'patient')->get();
        return response()->json($patients);
    }

    //make_appointment
    public function make_appointment(Request $request)
    {
        // return $request;
    //   try
    //   {
        $appointment = new Appointment();
        $appointment->patient_id = $request->user_id;
        $appointment->doctor_id = $request->doctor_id;
        $appointment->date = Carbon::parse($request->date);
        $appointment->time = $request->time;
        $appointment->subject = $request->subject;
        $appointment->desc = $request->desc;
        $appointment->status = 0;
        $appointment->save();

        // notifications
     $user = User::where('id',$appointment->doctor_id)->first();     
   
   if($user->device_token != null){
    $this->sendPushMessage('New Appountment',$appointment->subject,'',$appointment->id,$user->device_token);
   }
        
        return response()->json(['message'=>'Submited successfully']);
    //   }catch(Exception $e){
       
    //     return response()->json(['message'=>'try again']);
    //   }
        
    }

    // accept_appointment
    public function accept_appointment($appointment_id)
    {
        $appointment = \App\Models\Appointment::where('id', $appointment_id)->first();
        $appointment->status = 1;
        $appointment->save();
        return response()->json($appointment);
    }

    // appointment_list
    public function appointment_list()
    {
        $appointments = \App\Models\Appointment::all();
        return response()->json($appointments);
    }

    // appointment_list_doctor
    public function appointment_list_doctor($user_id)
    {
        $appointments = \App\Models\Appointment::where('doctor_id', $user_id)->get();
        return response()->json(['appointments'=>$appointments]);
    }

    // appointment_list_patient
    public function appointment_list_patient($user_id)
    {
        $appointments = \App\Models\Appointment::where('patient_id', $user_id)->get();
        return response()->json(['appointments'=>$appointments]);
    }

    // appointment_list_patient_doctor
    public function appointment_list_patient_doctor($user_id)
    {
        $appointments = \App\Models\Appointment::where('patient_id', $user_id)->orWhere('doctor_id', $user_id)->get();
        return response()->json($appointments);
    }

    // give_prescription
    public function give_prescription(Request $request)
    {
        // return $request;
        $prescription = new \App\Models\Prescription;
        $prescription->appointment_id = $request->appointment_id;
        $prescription->patient_id = $request->patient_id;
        $prescription->doctor_id = $request->doctor_id;
        $prescription->date = Carbon::now();
        // $table->string('date');
        $prescription->medicine = $request->medicine;
        $prescription->dosage = $request->dosage;
        $prescription->instruction = $request->instruction;
        $prescription->date = $request->date;
        $prescription->save();

        $user = User::where('id',$prescription->patient_id)->first();     
   
        if($user->device_token != null){
         $this->sendPushMessage('New Prescription',$prescription->medicine,'',$prescription->appointment_id,$user->device_token);
        }

        return response()->json(['message'=>'Submited successfully']);

    }

    //prescription_list
    public function prescription_list($id)
    {
        // return $id;
        $prescriptions = Prescription::where('appointment_id',$id)->get();
        return response()->json(['prescriptions'=>$prescriptions]);
    }


    public function filter($t)
    {
       
        $doctors = User::where('role', 'doctor')->where('speciality',$t)->get();
        return response()->json(['doctors'=>$doctors]);
    }


    public function  showAppointment($id)
    {
        // return $id;
        # code...
        $appointments = collect();
        $appointment = Appointment::where('patient_id',$id)->get();
        
        foreach($appointment as $item){
            $demo = new User();
            $demo->subject = $item->subject;
            $demo->created_at = $item->date;
            $user = User::where('id',$item->doctor_id)->first();
            $demo->doctor_name =  $user->name;
            $appointments->push($demo);
        }
        return response()->json(['historyappoint'=>$appointments]);
       // apoinment subject, doctor name , apintment date, 
    }


    public function  showPashent($id)
    {
        # code...

        $appointments = collect();
        $appointment = Appointment::where('doctor_id',$id)->get();
        
        foreach($appointment as $item){
            $demo = new User();
            $demo->subject = $item->subject;
            $demo->created_at = $item->date;
            $user = User::where('id',$item->patient_id)->first();
            $demo->doctor_name =  $user->name;
            $appointments->push($demo);
        }
        return response()->json(['historyappoint'=>$appointments]);

       // apoinment subject, pashent  name , apintment date, 
    }




    //ENDS
}
