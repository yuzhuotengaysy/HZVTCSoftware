<?php
    header("Content-type: text/html; charset=utf-8"); 
    session_start();
    $name = $_SESSION['username'];
    $conn = mysqli_connect('localhost', 'root', '123456','rjjs');//连接数据库
    mysqli_query($conn,"set character set 'utf8'");//读库
    $sql = "select nickname from userinfo where username = '$name'";  
    $result = mysqli_query($conn, $sql);  
    $nickname = mysqli_fetch_array($result);
    $message = $_POST['message'];
    //获取最大id
    $sql = "select max(ID) from board";  
    $result = mysqli_query($conn, $sql);  
    $maxID = mysqli_fetch_array($result);
    $maxID[0] = $maxID[0] + 1;
    //存入数据库
    $sql = "insert into board(ID,nickname,text) values('$maxID[0]','$nickname[0]','$message')";
    mysqli_query($conn, $sql);
    header("Location: board/board.php");
    