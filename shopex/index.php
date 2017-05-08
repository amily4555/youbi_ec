<?php
//$phpversion = phpversion();
//if($phpversion[0].$phpversion[2] != '53'){
//    header('Content-Type:text/html;charset=utf-8');
//    exit('您当前的php版本为php'.$phpversion.', 请更换php版本为php5.3.*');
//}

define('PERPAGE',10);
define('RUN_IN','FRONT_END');
ob_start();
error_reporting( E_ERROR | E_WARNING | E_PARSE );

    //会员操作过滤字段
if( !function_exists('filterData') ){
    function filterData(&$data,$type){
        $data and filterArray($data,$type);
    }
}

if( !function_exists('filterArray') ){
    function filterArray(&$data,$type){
        foreach ($data as $key => $value) {
            if( is_array($value) ){
                filterArray($data[$key],$type);
            }else{
                if( $key and in_array(strtolower($key), array('goods_id','product_id','cat_id','gid','pid','gids'))){
                    $value and $data[$key] = intval($value);
                }elseif ($key and in_array(strtolower($key),array('member_lv_id','order_num','advance','advance_freeze','point_freeze','point_history','point','score_rate','state','role_type','advance_total','advance_consume'))) {
                    unset($data[$key]);
                }elseif( $value ){
                    $data[$key] = ('cookie'== $type) ? filter(urldecode($value),$type) : filter(htmltotxt(urldecode($value)),$type);
                }
            }
        }
    }
}
if( !function_exists('htmltotxt') ){
    function htmltotxt($document){
        $search = array('@<script[^>]*?>.*?</script>@si',  // Strip out javascript
                       '@<[\\/\\!]*?[^<>]*?>@si',            // Strip out HTML tags
                       '@<style[^>]*?>.*?</style>@siU',    // Strip style tags properly
                       '@<![\\s\\S]*?--[ \\t\\n\\r]*>@'          // Strip multi-line comments including CDATA 
        );
        $text = preg_replace($search, '', $document);
        return htmlspecialchars($text);
    }
}
if( !function_exists('filter') ){
    function filter($str,$type='post'){
        $type or $type='post';
        $filter=array();
        $filter['get'] ="'|\b(alert|confirm|prompt)\b|<[^>]*?>|^\\+\/v(8|9)|\\b(and|or)\\b.+?(>|<|=|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|SDB_OPERATORS|(EXTRACTVALUE|EXISTS|UPDATEXML).+?SELECT|SELECT.+?LOAD_FILE|SDB_MEMBER|SDB_SETTINGS";
        $filter['post'] ="^\\+\/v(8|9)|\\b(and|or)\\b.{1,6}?(=|>|<|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|<\\s*img\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|SDB_OPERATORS|(EXTRACTVALUE|EXISTS|UPDATEXML).+?SELECT|SELECT.+?LOAD_FILE|SDB_MEMBER|SDB_SETTINGS";
        $filter['cookie'] ="\\b(and|or)\\b.{1,6}?(=|>|<|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)|SDB_OPERATORS|(EXTRACTVALUE|EXISTS|UPDATEXML).+?SELECT|SELECT.+?LOAD_FILE|SDB_MEMBER|SDB_SETTINGS";
        $str = preg_replace("/".$filter[$type]."/is", '', $str);
        if(preg_match_all("/".$filter[$type]."/is", $str,$mt)){
            $str = filter($str,$type);
        }
        return $str;
    }
}

function filterxs($string) {  
    $string = str_replace(array("'",'"','<','>','('),array('&#39;','&#34;','&#60;','&#62;','&#40;'),$string);
        return $string;  
} 

foreach($_GET as $key=>$value){ 
        $_GET[$key]=filterxs($value);
}
foreach($_POST as $key=>$value){ 
        $_POST[$key]=filterxs($value);
}
foreach($_COOKIE as $key=>$value){ 
        $_COOKIE[$key]=filterxs($value);
}
filterData($_POST,'post');
filterData($_GET,'get');
filterData($_REQUEST,'post');
filterData($_COOKIE,'cookie');
filterData($_SERVER,'get');

//date_default_timezone_set("Asia/Shanghai");
if(file_exists('config/config.php')){
    require('config/config.php');
    //gpc防护
    require_once CORE_DIR.'/lib/gpc.php';
    ob_end_clean();

    if (isset($_GET['cron']) && $_GET['cron']) {
        require(CORE_INCLUDE_DIR.'/crontab.php');
        $_GET['action'] = $_GET['cron'];
        new crontab();
    }    
    require(CORE_DIR.'/include_v5/shopCore.php');
    new shopCore();
}else header('Location: install/');
