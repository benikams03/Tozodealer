<?php

use Slim\Factory\AppFactory;

// Appelle du ficher autoload pour le chargement automatique de nos different classe
require './../vendor/autoload.php';

// Creation de notre application
$app = AppFactory::create();

// Appelle le ficher ou se trouve toute nos routes
require './../routes/web.php';

// Lancement de l'application, qui es Slim
$app->run();