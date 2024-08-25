<?php
require "../classes/DataBase.php";

$dataBase = new DataBase();

if ($dataBase->connect) {
  $sql = "SELECT * FROM `categories`";

  $query = $dataBase->connect->query($sql);

  $categories = $query->fetchAll(PDO::FETCH_ASSOC);

  $json = json_encode($categories, JSON_UNESCAPED_UNICODE);

  echo $json;
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
