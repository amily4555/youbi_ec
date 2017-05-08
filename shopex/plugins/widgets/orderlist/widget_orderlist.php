<?php
function widget_orderlist(&$setting,&$system){
    $order =&$system->loadModel('trading/order');
    $number=intval($setting['rowNum'])?intval($setting['rowNum']):5;

    //$result=$order->getList('*',$where,0,$number);
    
    $setting['smallPic'] and $setting['smallPic'] = $system->base_url() . 'statics/icons/' . $setting['smallPic'];

    $result=$order->getLastestOrder($number);
        foreach($result as $key=>$val){
            $aTmp[$key]['order_id'] = $val['order_id'];
            if(preg_match("/[\x7f-\xff]/", $val['ship_name'])){
                $a = utf8_substr($val['ship_name'],0,1);
                $aTmp[$key]['ship_name'] = $a.'**';
            }else{
                $aTmp[$key]['ship_name'] = $val['ship_name'];
            }
            $aTmp[$key]['sex'] = $val['sex'];
            $aTmp[$key]['date'] = date("Y-m-d",$val['createtime']);
            $aTmp[$key]['total_amount'] = $val['total_amount'];
        }
    return $aTmp;
}


/*
    utf-8编码下截取中文字符串,参数可以参照substr函数
    @param $str 要进行截取的字符串
    @param $start 要进行截取的开始位置，负数为反向截取
    @param $end 要进行截取的长度
*/
function utf8_substr($str,$start=0,$end) {
    if(empty($str)){
        return false;
    }
    if (function_exists('mb_substr')){
        if(func_num_args() >= 3) {
            $end = func_get_arg(2);
            return mb_substr($str,$start,$end,'utf-8');
        }
        else {
            mb_internal_encoding("UTF-8");
            return mb_substr($str,$start);
        }       
 
    }else {
        $null = "";
        preg_match_all("/./u", $str, $ar);
        if(func_num_args() >= 3) {
            $end = func_get_arg(2);
            return join($null, array_slice($ar[0],$start,$end));
        }
        else {
            return join($null, array_slice($ar[0],$start));
        }
    }
}
?>