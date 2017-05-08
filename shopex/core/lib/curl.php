<?php
/**
 * ShopEx licence
 *
 * @copyright  Copyright (c) 2005-2010 ShopEx Technologies Inc. (http://www.shopex.cn)
 * @license  http://ecos.shopex.com/license/gpl GPL License
 */

define('HTTP_TIME_OUT',-3);
class curl{

    var $read_timeout = 30;
    var $_fp_timeout = 30;
    var $defaultChunk = 4096;
    var $http_ver = '1.1';
    var $hostaddr = null;
    var $default_headers = array(
        'Expect'=>'',
        'Pragma'=>"no-cache",
        'Cache-Control'=>"no-cache",
        'Connection'=>"close"
        );
    
    function set_timeout($timeout){
        $this->read_timeout = $timeout;
        return $this;
    }

    function action($action,$url,$headers=null,$callback=null,$data=null,$ping_only=false){
        $action = $action=='post'?true:false;
        $headers = array_merge($this->default_headers,(array)$headers);

        foreach((array)$headers as $k=>$v){
            $set_headers[] .= $k.': '.$v;
        }

        $this->responseBody = '';
        
        $postdata = '';
        reset($data);
        while(list($key,$val) = each($data)) {
            if (is_array($val) || is_object($val)) {
                while (list($cur_key, $cur_val) = each($val)) {
                    $postdata .= urlencode($key)."[]=".urlencode($cur_val)."&";
                }
            } else
                $postdata .= urlencode($key)."=".urlencode($val)."&";
        }

        $ch = curl_init();
        if( constant('USE_PLATFORM_PROXY') && strpos($url,'api-b2b.shopex.cn') ){
            curl_setopt($ch, CURLOPT_PROXY, USE_PLATFORM_PROXY);
        }elseif (constant('USE_MATRIX_PROXY') && strpos($url,'matrix.ecos.shopex.cn') ) {
            curl_setopt($ch, CURLOPT_PROXY, USE_MATRIX_PROXY);
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, $this->read_timeout);
        curl_setopt($ch, CURLOPT_HEADERFUNCTION, array($this,'callback_header'));
        curl_setopt($ch, CURLOPT_WRITEFUNCTION, array($this,'callback_body'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
        if($set_headers)
            curl_setopt($ch, CURLOPT_HTTPHEADER, $set_headers);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, $this->http_ver);
        curl_setopt($ch, CURLOPT_POST, $action=='post'?true:false);
        curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
        $this->error = false;
        if(!curl_exec($ch)){
            $this->error = curl_error($ch);
        }

        curl_close($ch);

        $this->callback = $callback;
        preg_match('/\d{3}/',$this->responseHeader,$match);
        $this->responseCode = $match[0];
        switch($this->responseCode){
            case 301:
            case 302:
//            kernel::log(" Redirect \n\t--> ".$responseHeader['location']);
            return false;

            case 200:
//            kernel::log(' OK');
            if($this->callback){
                if(!call_user_func_array($this->callback,array(&$this,&$this->responseBody))){
                    break;
                }
            }
            return $this->responseBody;

            case 404:
//            kernel::log(' file not found');
            return false;

            default:
            return false;
        }

    }
    function weixin_action($action,$url,$headers=null,$callback=null,$data=null,$ping_only=false){
        $action = $action=='post'?true:false;
        $headers = array_merge($this->default_headers,(array)$headers);

        $set_headers = array();
        if($headers){
            foreach((array)$headers as $k=>$v){
                $set_headers[] .= $k.': '.$v;
            }
        }
        

        $this->responseBody = '';

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, $this->read_timeout);
        curl_setopt($ch, CURLOPT_HEADERFUNCTION, array($this,'callback_header'));
        curl_setopt($ch, CURLOPT_WRITEFUNCTION, array($this,'callback_body'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        if($set_headers)
            curl_setopt($ch, CURLOPT_HTTPHEADER, $set_headers);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, $this->http_ver);
        curl_setopt($ch, CURLOPT_POST, $action=='post'?true:false);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 1); // 从证书中检查SSL加密算法是否存在
        curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器

        curl_exec($ch);

        curl_close($ch);

        $this->callback = $callback;
        preg_match('/\d{3}/',$this->responseHeader,$match);
        $this->responseCode = $match[0];
        
        switch($this->responseCode){
            case 301:
            case 302:
            return false;

            case 200:
            if($this->callback){
                if(!call_user_func_array($this->callback,array($this,$this->responseBody))){
                    break;
                }
            }
            return $this->responseBody;

            case 404:
            return false;

            default:
            return false;
        }

    }

    function fetch($url,$data=array(),$headers=null,$callback=null,$ping_only=false){        
        $this->action('get',$url,$headers,$callback,$data,$ping_only);
        $this->results = $this->responseBody;
        return $this->results;
    }
    function weixin_submit($url,$data,$headers=null,$callback=null,$ping_only=false){
        error_log(print_r($url,1),3,'/tmp/goods.log');
        $this->weixin_action('post',$url,$headers,$callback,$data,$ping_only);
        $this->results = $this->responseBody;
        return $this->results;
    }

    function submit($url,$data,$headers=null,$callback=null,$ping_only=false){
        $this->action('post',$url,$headers,$callback,$data,$ping_only);
        $this->results = $this->responseBody;
        return $this->results;
    }

    function callback_header($curl,$header){
        $this->responseHeader .= $header;
        return strlen($header);
    }
    function callback_body($curl,$content){
        $this->responseBody .= $content;
        return strlen($content);
    }
    function is_addr($ip){
        return preg_match('/^[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}$/',$ip);
    }

    private function microtime(){
        list($usec, $sec) = explode(" ", microtime());
        return ((float)$usec + (float)$sec);
    }

}
