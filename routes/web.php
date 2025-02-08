<?php

use App\Controllers\ControllerViewsClient  as Render_Client;
use App\Controllers\ControllerViewsVendeur  as Render_Vendeur;
use App\Controllers\ControllerViewsAdmin  as Render_Admin;
use App\Controllers\ControllerViewsAuth  as Render_Auth;
use Slim\Routing\RouteCollectorProxy as Route;

// PARTIE AUTH
$app->get('/connexion', Render_Auth::connexion());


// PARTIE CLIENT
$app->get('/', Render_Client::home());


// PARTIE VENDEUR
$app->group('/vendeur', function(Route $group){
    $group->get('/dashbord', Render_Vendeur::dashbord());
});


// PARTIE ADMIN
$app->group('/admin', function(Route $group){
    $group->get('/dashbord', Render_Admin::dashbord());
});

// La page 404 en quand du chemin menant dans une page non existante
$app->get('/{routes:.+}', Render_Auth::notfound());