<?php
require "../classes/DataBase.php";

$dataBase = new DataBase();

if ($dataBase->connect) {
  for ($i = 0; $i <= 50; $i++) {
    $sql = "SELECT COUNT(*) AS count FROM `posts`";

    $query = $dataBase->connect->query($sql);

    $count = $query->fetch(PDO::FETCH_ASSOC)['count'];

    // var_dump($count);

    $title = 'Пост ' . $count;

    $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyz';
    $post_text = substr(str_shuffle($permitted_chars), 0, 30);

    $lukes = mt_rand(0, 100);

    $sql = "INSERT INTO `posts`(`title`, `post_text`, `likes`, `category_id`) 
    VALUES (:title, :post_text, :likes, :category_id)";

    $query = $dataBase->connect->prepare($sql);

    $query->execute([
      'title' => $title,
      'post_text' => $post_text,
      'likes' => $lukes,
      'category_id' => 1,
    ]);
  }
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
