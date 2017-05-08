<?php

class oauth2_request extends oauth2 {
    private $__token;
    private $__response_hash;
    private $__response;

    var $default_headers = array(
        'Pragma'=>"no-cache",
        'Cache-Control'=>"no-cache",
        'Connection'=>"close"
    );
    var $http_ver = '1.1';
    var $timeout = 30;



    function __construct($config, $token){
        parent::__construct($config);
        $this->__token = $token;

    }

    public function get_info($api, $params)
    {
        $params["Authorization"] = "{$this->token_type} {$this->__token}";
        $r = $this->action('post', $api, null, null, $params);
        return $r->__response;
    }

    public function post($api, $params=array(), $signtime=null)
    {
        $url = "{$this->site}/{$api}";
        //echo '请求地址：' . $url;
        //echo '<hr/>';
        $headers = array();
        if ($this->__token) {
            $headers['Authorization'] = 'OAuth2 ' . $this->__token;
        }
        return $this->action('post', "{$url}", $headers, null, $params, $signtime);
    }

    public function put($api, $params=array(), $signtime=null)
    {
        $headers = array();
        if ($this->__token) {
            $headers['Authorization'] = 'OAuth2 ' . $this->__token;
        }
        $url = "{$this->site}/{$api}";
        return $this->action('put', "{$url}", $headers, null, $params, $signtime);
    }

    public function get($api, $params=array(), $signtime=null)
    {
        $headers = array();
        if ($this->__token) {
            $headers['Authorization'] = 'OAuth2 ' . $this->__token;
        }
        $url = "{$this->site}/{$api}";
        return $this->action('get', "{$url}", $headers, null, $params, $signtime);
    }

    public function parsed()
    {
        $this->__response_to_hash();
        return $this->__response_hash;
    }

    public function success() 
    {
        $r = $this->parsed();
        if(isset($r['status']))
            return $r['status']=='success';
        else
            return false;
    }

    public function fail()
    {
        $r = $this->parsed();
        if(isset($r['status']))
            return $r['status']=='error';
        else
            return false;
    }

    private function __response_to_hash()
    {
        $this->__response_hash = json_decode($this->__response, true);
    }

    private function action($action,$url,$headers=array(),$callback=null,$data=null, $signtime=null)
    {
        $res = $this->__action($action, $url, $headers, $callback, $data, $signtime);
        $this->__response = $res;
        return $this;
    }

    private function __action($action,$url,$headers=array(),$callback=null, $data=null, $signtime=null)
    {
        if( !isset($signtime) ){
            // $time_url = 'http://openapi.omnisale.cn/api/platform/timestamp';
            $time_url = 'http://openapi.shopex.cn/api/platform/timestamp';
            $signtime = file_get_contents($time_url);
            
            if( !$signtime ){
                $ch = curl_init();
                $timeout = 5; 
                curl_setopt ($ch, CURLOPT_URL, $time_url);
                curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1); 
                curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
                $signtime = curl_exec($ch);
                curl_close($ch);
            }
        }

        switch(strtoupper($action)){
        case 'GET':
            $urlinfo = parse_url($url);
            $get_params = array();
            $sign_data = $this->sign($action, $urlinfo['path'], $headers, $data, array(), $signtime);
            break;
        case "POST":
        case "PUT":
            $urlinfo = parse_url($url);
            $get_params = array();
            if(isset($urlinfo['query'])){
                $query_array = explode("&", $urlinfo['query']);
                foreach($query_array AS $query){
                    list($g_k, $g_v) = explode("=", $query);
                    $get_params[rawurldecode($g_k)] = rawurldecode($g_v);
                }
            }
            $sign_data = $this->sign($action, $urlinfo['path'], $headers, $get_params, $data, $signtime);
            break;
        }
        $headers = array_merge($this->default_headers,(array)$headers);

        $set_headers = array();
        foreach((array)$headers as $k=>$v){
            $set_headers[] .= $k.': '.$v;
        }
        $set_headers[] = 'Accept: '. $action;

        $this->responseBody = '';

        $ch = curl_init();

        $url_data = array_diff($sign_data, $get_params);
        //print_r($url_data);exit;
        // $url = rtrim($url, '&') . (strpos($url, '?')===false ? '?' : '&'). http_build_query($url_data);
        $url = rtrim($url, '&') . (strpos($url, '?')===false ? '?' : '&'). $this->raw_http_build_query($url_data);//不做&转义
        //echo '<br/><br/><br/><br/>';
        #echo $url, "<HR>";
        curl_setopt($ch, CURLOPT_URL, $url);


        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 0);
        curl_setopt($ch, CURLOPT_TIMEOUT, $this->timeout);
        curl_setopt($ch, CURLOPT_HEADERFUNCTION, array($this,'callback_header'));
        curl_setopt($ch, CURLOPT_WRITEFUNCTION, array($this,'callback_body'));
        curl_setopt($ch, CURLOPT_HTTPHEADER, $set_headers);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, $this->http_ver);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        switch(strtoupper($action)){
        case "GET":
            $this->__action_get($ch, $url, $data);
            break;
        case "POST":
            $this->__action_post($ch, $url, $data);
            break;
        case "PUT":
            $this->__action_put($ch, $url, $data);
            break;
        }
        curl_close($ch);

       // var_dump($this->responseBody);
       // echo "<hr>";
       // var_dump($this->responseHeader);

        preg_match('/\d{3}/',$this->responseHeader,$match);
        $this->responseCode = $match[0];
        switch($this->responseCode){
        case 301:
        case 302:
            return false;

        case 200:
            return $this->responseBody;

        case 404:
            return false;

        default:
            return false;
        }
    }

    private function __action_get($ch, $url, $data)
    {
        curl_setopt($ch, CURLOPT_POST, false);
        curl_exec($ch);
    }

    private function __action_post($ch, $url, $data)
    {
        curl_setopt($ch, CURLOPT_POST, true);
        // curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $this->raw_http_build_query($data));  //不做&转义
        curl_exec($ch);
    }

    private function __action_put($ch, $url, $data)
    {
        #$query = http_build_query($data);
        #curl_setopt($ch, CURLOPT_POSTFIELDS, $query);
        #$fh = fopen('php://memory', 'rw');
        #fwrite($fh, $query);
        #rewind($fh);

        #curl_setopt($ch, CURLOPT_INFILE, $fh);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST ,"PUT");

        // curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data)); //转义
        curl_setopt($ch, CURLOPT_POSTFIELDS, $this->raw_http_build_query($data)); //不做转义
        #curl_setopt($ch, CURLOPT_INFILESIZE, strlen($query));
        #curl_setopt($ch, CURLOPT_PUT, true);
        curl_exec($ch);

        #fclose($fh);
    }

    function callback_header($curl,$header){
        $this->responseHeader .= $header;
        return strlen($header);
    }
    function callback_body($curl,$content){
        $this->responseBody .= $content;
        return strlen($content);
    }
 
    function rawurlencode_path($path){
        $data = explode("/", $path);
        foreach($data AS $k=>$v){
            $data[$k] = rawurlencode($v);
            }
        return join("/", $data);
    }
    
    function raw_http_build_query($params){
        $arr = array();
        foreach($params AS $key=>$val){
            $arr[] = rawurlencode($key) . "=" . rawurlencode($val);
                }
        return join("&", $arr);
    }



}
