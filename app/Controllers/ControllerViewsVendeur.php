<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ControllerViewsVendeur {


    public static function dashbord() {
        return function (Request $request, Response $response, $args) {
            return $this->get('ViewsVendeur')->render($response, 'dashbord.php', $args );
        };
    }


}