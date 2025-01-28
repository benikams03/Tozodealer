<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class ControllerViews{

    // C'est sont toute le page appartenant a la parti public
    public static function home() {
        return function (Request $request, Response $response) {
            require './../templates/public/home.php';
            return $response;
        };
    }

    public static function notfound() {
        return function (Request $request, Response $response) {
            require './../templates/404.html';
            return $response;
        };
    }

}