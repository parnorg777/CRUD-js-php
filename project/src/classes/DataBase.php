<?php
class DataBase
{
  protected $host = 'mysql';
  protected $dbname = 'CRUD';
  protected $port = '3306';
  protected $login = 'root';
  protected $password = '132231';

  public $error;
  public $connect;

  public function __construct()
  {
    $this->dbConect();
  }

  public function dbConect()
  {
    try {
      $this->connect = new PDO("mysql:host=$this->host;dbname=$this->dbname;port=$this->port", $this->login, $this->password);
    } catch (\PDOException) {
      $this->error = 'Ошибка подключения к базе данных';
    }
  }
}
