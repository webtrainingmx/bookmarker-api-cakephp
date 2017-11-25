<?php

namespace App\Middleware;

class CorsMiddleware
{
    public function __invoke($request, $response, $next)
    {
        // Calling $next() delegates control to the *next* middleware
        // In your application's queue.
        $response = $next($request, $response);

        // When modifying the response, you should do it
        // *after* calling next.


//        $origin = $request->header('Origin');
//        if (!empty($origin))
//        {
//            $response->header('Access-Control-Allow-Origin', $origin);
//        }

//        if ($request->method() == 'OPTIONS')
//        {
//            $method = $request->header('Access-Control-Request-Method');
//            $headers = $request->header('Access-Control-Request-Headers');
//
//            $response->header('Access-Control-Allow-Headers', $headers);
//            $response->header('Access-Control-Allow-Methods', empty($method) ? 'GET, POST, PUT, DELETE' : $method);
//            $response->header('Access-Control-Allow-Credentials', 'true');
//            $response->header('Access-Control-Max-Age', '86400');
//            $response->send();
//            die;
//        }


//        if ($request->method())
        // This works!
        $newResponse = $response
            ->withHeader('Access-Control-Allow-Origin', '*')// TODO: Change to only accepted origins not '*'
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, DELETE, OPTIONS')
            ->withHeader('Access-Control-Allow-Credentials', 'true')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With,Authorization,Content-Type,Api-Token')
            ->withHeader('Access-Control-Max-Age', '86400')
            ->withHeader('Access-Control-Allow-Type', 'application/json');
        return $newResponse;
    }
}