<?php
require "../classes/DataBase.php";

$dataBase = new DataBase();

if ($dataBase->connect) {
  $sql = "SELECT COUNT(*) AS count FROM `posts`";

  $query = $dataBase->connect->query($sql);

  $count = $query->fetchAll(PDO::FETCH_ASSOC);

  $json = json_encode($count, JSON_UNESCAPED_UNICODE);

  echo $json;
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
