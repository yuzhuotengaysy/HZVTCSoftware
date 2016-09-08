<?php
    session_start();
    $_SESSION['islogin'] = false;
    echo "<script>history.go(-1);</script>";  