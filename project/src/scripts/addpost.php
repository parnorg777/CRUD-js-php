<?php
require "../classes/DataBase.php";

$data = json_decode($_POST['data']);

$dataBase = new DataBase();

if (!$dataBase->error) {
  $sql = "INSERT INTO `posts`(`title`, `post_text`, `likes`, `category_id`) VALUES (:title, :post_text, :likes, :category_id)";

  $query = $dataBase->connect->prepare($sql);

  $query->execute([
    'title' => $data->post->title,
    'post_text' => $data->post->post_text,
    'likes' => $data->post->likes,
    'category_id' => $data->post->category_id,
  ]);

  $post_id = $dataBase->connect->lastInsertId();

  foreach ($data->post->tags as $tag_id) {
    $sql = "INSERT INTO `posts_tags`(`post_id`, `tag_id`) VALUES (:post_id, :tag_id)";

    $query = $dataBase->connect->prepare($sql);

    $query->execute([
      'post_id' => $post_id,
      'tag_id' => $tag_id,
    ]);
  }

  $from = $data->limit->from;
  $entries = $data->limit->entries;

  $sql = "SELECT posts.id, posts.title, posts.likes, categories.title AS category 
  FROM `posts` JOIN `categories` ON posts.category_id = categories.id ORDER BY posts.id ASC LIMIT $from, $entries";

  $query = $dataBase->connect->query($sql);

  $posts = $query->fetchAll(PDO::FETCH_ASSOC);

  $sendData = [
    "posts" => $posts,
    "postID" => $post_id,
  ];

  $json = json_encode($sendData, JSON_UNESCAPED_UNICODE);

  echo $json;
} else {
  $json = json_encode($dataBase->error, JSON_UNESCAPED_UNICODE);

  echo $json;
}
