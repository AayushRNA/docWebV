<?php

namespace App\Http\Controllers;

use App\Http\Controllers\BaseApiController;
use App\Models\User;
use Illuminate\Contracts\Support\Renderable;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Repositories\UserRepository;
use App\Helpers\ValidationHelper;
use RuntimeException;


class UserController extends BaseApiController
{
    public function getInfo() :JsonResponse
    {
        try {
            if (auth()->check()) {
                $user = UserRepository::currentUser();
                return $this->respond(['data' => $user]);
            } else
                return $this->respondUnauthorized();
        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }
    }

    public function editSelf(): JsonResponse
    {
        $data = request()->all();
        $data['email'] = UserRepository::currentUser()->email;
        $data['id'] = UserRepository::currentUser()->id;
        try {

            ValidationHelper::validate($data, [
//            'email' => 'unique:users',
                'name' => 'required',
                'id' => 'required'
            ]);
            $userRepository = new UserRepository();
            $userRepository->updateUser($data);
            return $this->respond([
                'message' => __('messages.profile-edit-success'),
                'data' => $userRepository::currentUser()
            ]);
        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }
    }

    public function editUser(): JsonResponse
    {
        $data = request()->all();
        try {
            ValidationHelper::validate($data, [
                'id' => 'required',
                'name' => 'required',
                'email' => 'email'
            ]);

            $userRepository = new UserRepository();
            $userRepository->updateUser($data);
            return $this->respond([__("messages.profile-edit-success"), $data]);
        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }
    }

    public function destroyUser(): JsonResponse
    {
        $data = request()->all();

        try {
            ValidationHelper::validate($data, [
                'id' => 'required'
            ]);

            $userRepository = new UserRepository();
            if ($userRepository->deleteUser($data['id'])) {
                return $this->respond([
                    'id' => $data['id'],
                    'message' => __('messages.user-delete-success')
                ]);
            } else
                return $this->respondNotFound();
        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }
    }

    public function changePassword(): JsonResponse
    {
        $data = request()->all('password', 'password_confirmation');
        $data['id'] = UserRepository::currentUser()->id;
        try {
            ValidationHelper::validate($data, [
                'id' => 'required',
                'password' => 'required',
                'password_confirmation' => 'required'
            ]);

            $userRepository = new UserRepository();
            $userRepository->updateUser($data);

            return $this->respond([
                'id' => $data['id'],
                'message' => __("messages.password-changed")
            ]);

        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }
    }
    public function listUsers(): JsonResponse
    {
        $data = request()->all();
        try {

            $userRepository = new UserRepository();
            $users = $userRepository->listUsers(request());
            return $this->respond(['users' => $users]);
        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }
    }

    public function changeEmailSelf(): JsonResponse
    {
        $data = request()->all();
        $data['id'] = UserRepository::currentUser()->id;
        try {

            ValidationHelper::validate($data,[
                'id' => 'required',
                'email' => 'email|unique:users|required'
            ]);

            $userRepository = new UserRepository();
            if (!$userRepository->isEmailRegistered($data['email'])) {
                $userRepository->updateUser($data);
                return $this->respond([
                    'data' => [
                        'email' => $data['email']
                    ]
                ], __('messages.email-changed'), 201);
            }

            return $this->respond([
                'message' => __('messages.email-change-fail')
            ]);

        } catch (RuntimeException $error) {
            return $this->respondWithError(ValidationHelper::splitErrors($error->getMessage()));
        }

    }
}
