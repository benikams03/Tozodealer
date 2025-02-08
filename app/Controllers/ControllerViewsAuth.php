<?php

namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\PhpRenderer;

class ControllerViewsAuth {

    // C'est sont toute le page appartenant a la parti public
    public static function connexion() {
        return function (Request $request, Response $response, $args) {
            return $this->get('ViewsAuth')->render($response, 'connexion.php', $args );
        };
    }


    // page 404
    public static function notfound() {
        return function (Request $request, Response $response, $args) {
            $pageErreur = new PhpRenderer('./../templates');
            return $pageErreur->render($response, '404.html', $args);
        };
    }

}