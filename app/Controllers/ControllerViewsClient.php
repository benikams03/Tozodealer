<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
class ControllerViewsClient{

    // C'est sont toute le page appartenant a la parti public
    public static function home() {
        return function (Request $request, Response $response, $args) {
            return $this->get('ViewsClient')->render($response, 'home.php', $args );
        };
    }



}