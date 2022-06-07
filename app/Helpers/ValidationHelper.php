<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use RuntimeException;

class ValidationHelper
{
    /**
     * @param array $data
     * @param $rules
     * @throws RuntimeException
     */
    public static function validate(array $data, $rules)
    {
        $validator = Validator::make($data, $rules);
        if ($validator->fails()) {
            Log::debug($validator->errors());
            $messages = implode('|', $validator->errors()->all());
            throw new RuntimeException($messages);
        }
    }

    public static function splitErrors(string $errors): array
    {
        if (strpos($errors, '|')) {
            return explode('|', $errors);
        }
        return [$errors];
    }

}
