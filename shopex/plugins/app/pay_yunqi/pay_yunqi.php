<?php
require('paymentPlugin.php');
class pay_yunqi extends paymentPlugin{

    var $name = '天工收银';
    var $logo = 'yunqi';
    var $version = 1.0;
    var $charset = 'utf8';
    //var $submitUrl = 'http://pre.netpay.sdo.com/paygate/default.aspx'; //测试请求地址：
    var $submitUrl = 'https://api.teegon.com/charge/pay'; //正式请求地址：
    var $submitButton = 'http://img.shengpay.com/pimg/button_shengpaybutton_o_a.gif'; ##需要完善的地方
    var $desc = '天工收银是上海商派2015年正式推出的专业集成支付平台，致力于为各类用户提供融合、便捷、安全的场景支付服务';
    var $intro = '天工收银是上海商派2015年正式推出的专业集成支付平台，致力于为各类用户提供融合、便捷、安全的场景支付服务';
    var $supportCurrency = array("CNY"=>"01");
    var $supportArea =  array("AREA_CNY");
    var $orderby = 98;

    function toSubmit($payment){
        $merId  = $this->system->getConf('cloud.appkey');  //帐号
        $ikey = $this->system->getConf('cloud.appsecret'); //密钥
        $return['order_no'] = $payment['M_OrderNO']; //订单号
        $return['payment_id'] = $payment['M_OrderId']; //订单号
        if(isset($_COOKIE['pay_yunqi'])) {
            if ($_COOKIE['pay_yunqi'] == 'wxpay') {
                $return['channel'] = 'wxpay';
            }else{
                $return['channel'] = 'alipay';
            }
        }else{
            $return['channel'] = 'alipay';
        }
        $return['return_url'] = $this->callbackUrl;
        $return['amount'] = $payment['M_Amount'];
        if($payment['M_Method'] == 'recharge'){
            $return['subject'] ='充值';
        }else{
            // $return['subject'] =str_replace(" ", "", $payment['M_Goods']);
            $return['subject'] = '订单号:'.$payment['M_OrderNO'];
        }
        //todo 临时解决由于subject半角导致sign错误
        // if($subject_pos = strpos($return['subject'],'（')){
        //    $return['subject'] = substr($return['subject'],0,$subject_pos);
        // }

        $return['metadata'] = md5($return['payment_id'].$ikey).'andpaymentid'.$return['payment_id'];
        $return['notify_url'] = $this->callbackUrl;
        $return['client_ip'] = $_SERVER["REMOTE_ADDR"];
        $return['client_id'] = $merId;
        $return['sign'] = $this->sign($return,$ikey);
        return $return;
    }

    function callback($in,&$paymentId,&$money,&$message,&$tradeno){
        $payment_id = explode('andpaymentid',$in['metadata']);
        $ikey = $this->system->getConf('cloud.appsecret'); //密钥
        $SafetyKey = md5($payment_id['1'].$ikey);

        if($SafetyKey ==  $payment_id['0'] && $in['is_success'] == true){
        $paymentId = $payment_id['1'];
            $money = $in['amount'];
            $tradeno = $in['charge_id'];
            $Status = $in['is_success'];
            if ($Status== true){
                echo "OK";
                $message = "支付成功！";
                return PAY_SUCCESS;
            }else{
                $message = "支付失败！";
                return PAY_FAILED;
            }
         }else{
                $message = "验证签名错误！";
                return PAY_ERROR;
         }
    }
    function getfields(){
        return array();
    }
    /**
     * 生成各个参数的加密串
     * @param 结果字符串，引用值
     * @param 加密串键值
     * @param 加密串的值
     * @return 加密串结果
     */

    public function sign($para_temp,$ikey){
        //除去待签名参数数组中的空值和签名参数
        $para_filter = $this->para_filter($para_temp);

        //对待签名参数数组排序
        $para_sort = $this->arg_sort($para_filter);
        //生成加密字符串
        $prestr = $this->create_string($para_sort);
        $prestr = $ikey .$prestr . $ikey;
        return strtoupper(md5($prestr));
    }


    private function para_filter($para) {
        $para_filter = array();
        while (list ($key, $val) = each ($para)) {
            if($key == "sign")continue;
            else    $para_filter[$key] = $para[$key];
        }
        return $para_filter;
    }

    private function arg_sort($para) {
        ksort($para);
        reset($para);
        return $para;
    }

    private function create_string($para) {
        $arg  = "";
        while (list ($key, $val) = each ($para)) {
            $arg.=$key.$val;
        }


        //如果存在转义字符，那么去掉转义
        if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}

        return $arg;
    }

}
?>
