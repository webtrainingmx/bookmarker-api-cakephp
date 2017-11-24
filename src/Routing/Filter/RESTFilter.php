<?php

namespace App\Routing\Filter;

use Cake\Event\Event;
use Cake\Routing\DispatcherFilter;

// Copied from:
// https://www.thinkingmedia.ca/2015/07/how-to-fix-404-error-on-options-request-in-cakephp-3-when-making-a-post-request-with-rest/
class RESTFilter extends DispatcherFilter
{
    public function beforeDispatch(Event $event)
    {
        $request = $event->data['request'];
        $response = $event->data['response'];

        $origin = $request->header('Origin');
        if (!empty($origin)) {
            $response->header('Access-Control-Allow-Origin', $origin);
        }

        if ($request->method() == 'OPTIONS') {
            $method = $request->header('Access-Control-Request-Method');
            $headers = $request->header('Access-Control-Request-Headers');
            $response->header('Access-Control-Allow-Headers', $headers);
            $response->header('Access-Control-Allow-Methods', empty($method) ? 'GET, POST, PUT, DELETE' : $method);
            $response->header('Access-Control-Allow-Credentials', 'true');
            $response->header('Access-Control-Max-Age', '86400');
            $response->send();
            die;
        }
    }
}