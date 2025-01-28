<?php

class Database {

    // Information de la base de donnee
    private $name;
    private $host;
    private $user;
    private $password;
    private $pdo;

    public function __construct($name = 'tozodealer',$host = 'localhost', $user = 'root',$password = ''){
        $this->name = $name;
        $this->host = $host;
        $this->user = $user;
        $this->password = $password;
    }

    public function connect(){
        $this->pdo = null;
        
        try{
            $this->pdo = new PDO('mysql:dbname='. $this->name .';host='.$this->host , $this->user, $this->password);
        } catch (Exception){
            echo "Vous n'etes pas connecter a la base de donnee.\n";
        }
        return $this->pdo;
    }
}