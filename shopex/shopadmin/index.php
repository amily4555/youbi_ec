<?php
//$phpversion = phpversion();
//if( $phpversion[0].$phpversion[2] != '53'){
//    header('Content-Type:text/html;charset=utf-8');
//    exit('您当前的php版本为php'.$phpversion.', 请更换php版本为php5.3.*');
//}

define('RUN_IN','BACK_END');
ob_start();   //修复部分用户后台验证码不显示
if(!@include('../config/config.php')){
    header('Location: ../install/'); exit;
}

if(strpos($_SERVER["HTTP_USER_AGENT"],"Chrome") && !defined('GD_VCODE')){
    define('GD_VCODE',true);
}
require(CORE_DIR.'/include_v5/adminCore.php');
new adminCore();

