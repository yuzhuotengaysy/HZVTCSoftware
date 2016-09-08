<?php
    if(isset($_POST["submit"]) && $_POST["submit"] == "登录")  
        {  
            $user = $_POST["username"];  
            $psw = $_POST["password"];  
            if($user == "" || $psw == "")  
            {  
                echo "<script>alert('请输入用户名或密码！'); history.go(-1);</script>";  
            }  
            else  
            {  
                $conn = mysqli_connect("localhost","root","123456","rjjs");  
                mysqli_query($conn,'set name utf8');
                $sql = "select username,password from userinfo where username = '$_POST[username]' and password = '$_POST[password]'";  
                $result = mysqli_query($conn, $sql);  
                $num = mysqli_num_rows($result);  
                if($num)  
                {  
                    $row = mysqli_fetch_array($result);  //将数据以索引方式储存在数组中  
                    session_start();
                    $_SESSION['username']=$_POST['username'];
                    $_SESSION['islogin'] = true;
                   echo "<script>alert('登陆成功！');history.go(-1);</script>";  
                }  
                else  
                {  
                    echo "<script>alert('用户名或密码不正确！');history.go(-1);</script>";  
                }  
            }  
        }  
        else  
        {  
            echo "<script>alert('提交未成功！'); history.go(-1);</script>";  
        }  
