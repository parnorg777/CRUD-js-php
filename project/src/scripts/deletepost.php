<?php
require "../classes/DataBase.php";

$data = json_decode($_POST['data']);

$dataBase = new DataBase();

if ($dataBase->connect) {
  $sql = "DELETE FROM `posts` WHERE `id` = ?";

  $query = $dataBase->connect->prepare($sql);

  $query->execute([$data->post_id]);

  $from = $data->limit->from;
  $entries = $data->limit->entries;

  $sql = "SELECT posts.id, posts.title, posts.likes, categories.title AS category 
  FROM `posts` JOIN `categories` ON posts.category_id = categories.id ORDER BY posts.id ASC LIMIT $from, $entries";

  $query = $dataBase->connect->query($sql);

  $posts = $query->fetchAll(PDO::FETCH_ASSOC);

  $json = json_encode($posts, JSON_UNESCAPED_UNICODE);

  echo $json;
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
