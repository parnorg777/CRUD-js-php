<?php
require "../classes/DataBase.php";

$post_id = json_decode($_POST['data']);

$dataBase = new DataBase();

if ($dataBase->connect) {
  $sql = "SELECT posts.id, posts.title, posts.post_text, posts.likes, posts.category_id, categories.title AS category 
  FROM `posts` JOIN `categories` ON posts.category_id = categories.id WHERE posts.id = ?";

  $query = $dataBase->connect->prepare($sql);

  $query->execute([$post_id]);

  $post = $query->fetch(PDO::FETCH_ASSOC);

  $sql = "SELECT tags.id AS tag_id, tags.title AS tag_name 
  FROM `posts` JOIN `posts_tags` ON posts.id = posts_tags.post_id JOIN `tags` ON tags.id = posts_tags.tag_id WHERE posts.id = ?";

  $query = $dataBase->connect->prepare($sql);

  $query->execute([$post_id]);

  $tags = $query->fetchAll(PDO::FETCH_ASSOC);

  $post['tags'] = $tags;

  $json = json_encode($post, JSON_UNESCAPED_UNICODE);

  echo $json;
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
