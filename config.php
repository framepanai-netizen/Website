<?php
session_start();

$host = "localhost";
$user = "root";      // เปลี่ยนตามโฮสต์ของคุณ
$pass = "";          // เปลี่ยนตามโฮสต์ของคุณ
$db   = "frameshop";

$conn = new mysqli($host, $user, $pass, $db);
$conn->set_charset("utf8mb4");

if ($conn->connect_error) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $conn->connect_error);
}

$currentUser = null;
if (isset($_SESSION['user_id'])) {
    $uid = $_SESSION['user_id'];
    $res = $conn->query("SELECT * FROM users WHERE id = $uid");
    $currentUser = $res->fetch_assoc();
}
?>
