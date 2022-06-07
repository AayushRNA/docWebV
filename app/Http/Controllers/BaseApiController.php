<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;
use Illuminate\Routing\ResponseFactory;
use Illuminate\Http\Request;
use App\Transformers\ArrayTransformer;

class BaseApiController extends Controller
{
    public ResponseFactory $response;
    public int $successStatus = 200;
    public int $createdStatus = 201;
    public int $errorStatus = 400;
    public int $missingUrlStatus = 404;
    public int $serverErrorStatus = 500;

    public function __construct(ResponseFactory $response, Request $request)
    {
        $this->response = $response;
        $this->$request = $request;
    }

    final public function respond(array $data = null, string $response_message = null, int $status_code = 200): JsonResponse
    {
        $message['status'] = true;

        if ($response_message) {
            $message['message'] = $response_message;
        }
        if (null !== $data && is_array($data)) {
            $message = array_merge($message, $data);
        }
        if (!$this->response) {
            return $this->response->json($message, $status_code, ['Content-Type' => 'application/json'], JSON_UNESCAPED_UNICODE);
        }

        return $this->response->json($message, $status_code,  ['Content-Type' => 'application/json'],JSON_UNESCAPED_UNICODE);
    }

    final public function respondWithError(array $errors, string $message = 'Request failed', int $status_code = 400): JsonResponse
    {
        if (is_string($errors)) {
            $errors = [$errors];
        }
        if (is_object($errors)) {
            $errors = (new ArrayTransformer($errors))->flatten();
        }
        $messageObject = [
            'status' => false,
            'errors' => $errors,
        ];
        if ($message) {
            $messageObject['message'] = $message;
        }
        if (!$this->response) {
            return  $this->response->json($messageObject, $status_code);
        }

        return $this->response->json($messageObject, $status_code);
    }

    final public function respondWithValidationErrors(array $errors, string $message = null, int $status_code = 400): JsonResponse
    {
        return $this->respondWithError($errors, $message, $status_code);
    }

    final public function respondCreated(string $message = 'Resource created'): JsonResponse
    {
        return $this->respond([$message], $this->createdStatus);
    }

    final public function respondUnauthorized(int $error_code, string $message = 'You are not authorized for this'): JsonResponse
    {
        return $this->respondWithError([$message], null, $error_code);
    }

    final public function respondNotFound(int $error_code, string $message = 'Resource not found'): JsonResponse
    {
        return $this->respondWithError([$message], $error_code, $this->missingUrlStatus);
    }

    final public function respondInternalError(int $error_code, string $message = "Internal error"): JsonResponse
    {
        return $this->respondWithError([$message], $error_code, $this->serverErrorStatus);
    }

    final public function respondOk(string $message = 'Done'): JsonResponse
    {
        return $this->respond(null, $message, $this->successStatus);
    }
}
