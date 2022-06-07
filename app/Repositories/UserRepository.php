<?php

namespace App\Repositories;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use RuntimeException;

final class UserRepository
{
    public static function currentUser(): User
    {
        $authID = Auth::id();
        return User::find($authID);
    }

    public function isEmailRegistered(string $email): bool
    {
        return User::where('email', '=', $email)->count();
    }

    public function registerUser(array $data): User
    {
        $user = new User($data);
        $user->password = Hash::make($data['password']);

        if ($user->save()) {
            return $user;
        }
        throw new RuntimeException(__('auth'));
    }

    public function updateUser(array $data): User {

        $user = self::findUser($data['id']);

        if (key_exists("password", $data) && (key_exists("password_confirmation", $data))) {
            if ($data['password'] === $data['password_confirmation']) {
                $data['password'] = Hash::make($data['password']);
            }
        }
        $user->update($data);
        return $user;
    }

    public static function findUser($id): User {
        $user = User::findOrFail($id);
        return $user;
    }

    public function deleteUser($id) :bool {
        $user = self::findUser($id);
        return $user->delete();
    }

    public function listUsers() {
        return User::paginate();
    }

}
