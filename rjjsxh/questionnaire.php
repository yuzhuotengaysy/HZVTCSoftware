<?php
    header("Content-type: text/html; charset=utf-8");
    $conn = mysqli_connect('localhost', 'root', '123456','rjjs');//连接数据库
    mysqli_query($conn,"set character set 'utf8'");//读库
    //$no1 = $_POST['message'];
    $no = [];
    $counts = 0;
    for($i = 1; $i <=16; $i++){
        //多选题
        if($i >= 12 && $i <= 13){
            foreach($_REQUEST["no$i"] as $no[$i]){
            }
        }
        //单选、简答题
        else{
            $no[$i] = $_POST['no'.$i];
        }
        if($no[$i] == ""){
            echo "<script>alert('第 $i 题未填写！');</script>";
        } else {
            $counts++;
        }
    }
    //如果全部填写
    if($counts == 16){
        //获取ID
        $sql = "select max(ID) from questionnaire";
        //echo $sql.'<br>';
        $result = mysqli_query($conn, $sql);
        $maxID = mysqli_fetch_array($result);
        $maxID[0] = $maxID[0] + 1;
        for($i = 1; $i <=16; $i++){
            if($i == 1){
                $sql = "INSERT INTO questionnaire(ID,no$i) VALUES($maxID[0],'$no[$i]');";
                mysqli_query($conn, $sql);
                //echo $sql.'<br>';
            }
            else if($i >= 12 && $i <= 13){
                if($_POST['no'.$i]){//判断post过来的变量是否为空
                    $text =  implode(' ', $_POST['no'.$i]);//处理
                }
                $sql="UPDATE questionnaire SET no$i = '$text' WHERE ID = $maxID[0];";
                mysqli_query($conn, $sql);
                //echo $sql.'<br>';
            } else {
                $sql = "UPDATE questionnaire SET no$i = '$no[$i]' WHERE ID = $maxID[0];";
                mysqli_query($conn, $sql);
                //echo $sql.'<br>';
            }
        }
    }
    echo "<script>history.go(-1)</script>";