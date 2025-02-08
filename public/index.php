<?php

use DI\Container;
use Slim\Factory\AppFactory;
use Slim\Views\PhpRenderer;

require './../vendor/autoload.php';
require './../database/Database.php';


// Initialisation de container, qui joue le meme role que la variable global
$container = new Container();
$container->set('pdo', function(){
    // notre connection avec la base de donner
    $pdo = new Database();
    return $pdo->connect();
});

// Notre chemin pour acceder a tout le template du coter client
$container->set('ViewsClient', function(){
    return $viewsClient = new PhpRenderer('./../templates/client');
});

// Notre chemin pour acceder a tout le template du coter vendeur
$container->set('ViewsVendeur', function(){
    return $viewsClient = new PhpRenderer('./../templates/vendeur');
});

// Notre chemin pour acceder a tout le template du coter admin
$container->set('ViewsAdmin', function(){
    return $viewsClient = new PhpRenderer('./../templates/admin');
});

// Notre chemin pour acceder a tout le template du coter auth
$container->set('ViewsAuth', function(){
    return $viewsClient = new PhpRenderer('./../templates/auth');
});

AppFactory::setContainer($container);
$app = AppFactory::create();


require './../routes/web.php';

// Lancement de l'application, qui es Slim
$app->run();