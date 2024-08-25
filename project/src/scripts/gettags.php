<?php
require "../classes/DataBase.php";

$dataBase = new DataBase();

if ($dataBase->connect) {
  $sql = "SELECT * FROM `tags`";

  $query = $dataBase->connect->query($sql);

  $tags = $query->fetchAll(PDO::FETCH_ASSOC);

  $json = json_encode($tags, JSON_UNESCAPED_UNICODE);

  echo $json;
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
