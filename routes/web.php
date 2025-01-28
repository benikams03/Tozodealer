<?php

use App\Controllers\ControllerViews  as Render;


$app->get('/', Render::home());

// La page 404 en quand du chemin menant dans une page non existante
$app->get('/{routes:.+}', Render::notfound());