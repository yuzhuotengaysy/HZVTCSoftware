<?php
    session_start();
    $name = $_SESSION['username'];
    $password1 = $_POST['password1'];
    $password2 = $_POST['password2'];
    if($password1 == $password2){
        $conn = mysqli_connect('localhost', 'root', '123456','rjjs');//连接数据库
        $sql = "update userinfo set password = $password1 where username = $name";  
        mysqli_query($conn, $sql);  
        echo "<script>alert('修改成功');history.go(-1)</script>";
    } else {
        echo "<script>alert('两次密码输入不一致');history.go(-1)</script>";
    }