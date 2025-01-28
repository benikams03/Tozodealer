<?php

use DI\Container;
use Slim\Factory\AppFactory;

require './../vendor/autoload.php';
require './../database/Database.php';


// Initialisation de container, qui joue le meme role que la variable global
$container = new Container();
$container->set('pdo', function(){
    // notre connection avec la base de donner
    $pdo = new Database();
    return $pdo->connect();
});


AppFactory::setContainer($container);
$app = AppFactory::create();


require './../routes/web.php';

// Lancement de l'application, qui es Slim
$app->run();