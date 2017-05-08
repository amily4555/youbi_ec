<?php defined('CORE_DIR') || exit('入口错误'); ?>
<?php
class ctl_passport extends adminPage{
    var $login_times_error=3;
    function login(){
        //已登录直接跳转后台
        if( $this->system->op_id ){
            header("Location:index.php");exit;
        }
        $this->pagedata['message'] = $_SESSION['loginmsg'];
        unset($_SESSION['loginmsg']);
        $this->pagedata['show_varycode']=$this->checkVeryCode();
        $this->system->__session_close();
        if($_COOKIE["SHOPEX_LOGIN_NAME"]){
            $this->pagedata['username']=$_COOKIE["SHOPEX_LOGIN_NAME"];
            $this->pagedata['save_login_name']=true;
        }
        $auth_type = $this->system->getConf('certificate.auth_type');
        $auth_code = $this->system->getConf('certificate.auth_code');
        $certificate = $this->system->loadModel('service/certificate');

        if ( 'NCI' == $auth_code ){  //云起授权
            $this->pagedata['authcode'] = $auth_code;
            $this->pagedata['authstate'] = $certificate->getUrl($this->system->getConf('certificate.auth_strname'),'single');            
        }else{ //非终身授权 包含绿卡和未授权
            
            // if('Q' == $auth_code){  //绿卡授权
            //     $this->pagedata['authcode'] = $auth_code;
            //     $this->pagedata['authstate'] = $certificate->getUrl($this->system->getConf('certificate.auth_strname'),'single');                
            // }else{
                $this->pagedata['authcode'] = $auth_code;
                $this->pagedata['authstate'] = $certificate->getUrl('未授权用户','single');
                $this->pagedata['noauthorize'] = $certificate->getUrl('立即激活正版终身商业授权','active');             
            // } 
        }
        if($_GET['return']) $this->pagedata['return'] = htmlspecialchars($_GET['return']);

        if('ZFZ'==$this->system->getConf('system.b2c_shop_type')){
            $shop_type[]=array('text'=>'零售店后台管理','from_action'=>$this->system->base_url());
            $shop_type[]=array('text'=>'批发店后台管理','from_action'=>$this->system->getConf('system.b2b_shop_url'));
            $this->pagedata['shop_type'] = $shop_type;
            $this->display('login_zfz.html');
        }else{
            // if( $_GET['oauth'] == 'cloud' ){
            //     $opt = $this->system->loadModel('admin/operator');
            //     $this->pagedata['oauth_url'] = $opt->authorize_url();
            //     $this->display('cloud_login.html');
            // }else{
            $opt = $this->system->loadModel('admin/operator');
            $this->pagedata['oauth_url'] = $opt->authorize_url();
            $this->display('login.html');
            // }
        }
    }

    function checkVeryCode(){
        if($this->system->getConf('system.admin_verycode') || ($this->system->getConf('system.admin_error_login_times')>$this->login_times_error && intval($this->system->getConf('system.admin_error_login_time')+3600)>time())){
            return true;
        }else{
            return false;
        }
    }
    function dologin(){
        if($this->system->getConf('system.admin_verycode') || $this->system->getConf('system.admin_error_login_times')>$this->login_times_error){
            if(strtolower($_POST["verifycode"]) !== strtolower($_SESSION["RANDOM_CODE"]))
            {
                $_SESSION['loginmsg'] = __("验证码输入错误!");
                header('Location: index.php?ctl=passport&act=login');
                exit;
            }
        }
        
        $oOpt = &$this->system->loadModel('admin/operator');
        $aResult = $oOpt->tryLogin($_POST);
        if ($aResult){
            
            //云起账号调到oauth页面
            // if( $aResult['super']=='1' && $aResult['is_bind']=='1' ){
            //     $_SESSION['loginmsg'] = __('您是超级管理员，请使用系统绑定云起账号登陆!');
            //     header("Location: index.php?ctl=passport&act=login&oauth=cloud");exit;
            // }

            require('magicvars_sys.php');

            $magic = &$this->system->loadModel('system/magicvars');
            $now_magic_data = $magic->getList('var_name','',0,-1);
            $tmp_magic_data = array();
            foreach($now_magic_data as $m_key =>$m_value){
                $tmp_magic_data[$m_value['var_name']]  = 1;
            }
            $import_data = array_diff_key($magicvars,$tmp_magic_data);
            if($import_data){
                foreach($import_data as $me=>$i_data){
                    $magic->insert($i_data);
                }
            }
            if($_POST['save_login_name']){
                setcookie("SHOPEX_LOGIN_NAME",$_POST['usrname'],(time()+86400*10));
            }else{
                setcookie("SHOPEX_LOGIN_NAME","");
            }

            $log_info['username'] = $_POST['usrname'];
            $oOpt->operator_logs('operator',$log_info);

            $status = &$this->system->loadModel('system/status');
            $lg_key = $this->system->getConf('system.admin_dontlogincheckip') ? md5(remote_addr().$aResult['op_id']) :md5($aResult['op_id']);
            $_SESSION['SHOPEX_LG_KEY'] = $lg_key;
            setcookie('SHOPEX_LG_KEY', $lg_key);
            $status->update(1);
            $this->system->op_id = $aResult['op_id'];
            $data['lastlogin']=time();
            $data['logincount'] = $aResult['logincount'] + 1;
            $oOpt->setLogInfo($data,$aResult['op_id']);
            $this->system->setConf('system.admin_error_login_times',0);
            if($_REQUEST['return'] && (false !== strpos($_REQUEST['return'],$this->system->base_url())) ){
                // echo "<script>window.parent.location.reload();</script>";
                header("Location: index.php#".$_REQUEST['return']);exit;
            }else{
                // echo "<script>window.parent.location.reload();</script>";
                header("Location: index.php");exit;
            }

        }else{
            if(intval($this->system->getConf('system.admin_error_login_time')+3600)>time()){
                $this->system->setConf('system.admin_error_login_times',$this->system->getConf('system.admin_error_login_times')+1);
            }else{

                $this->system->setConf('system.admin_error_login_times',1);
            }
            $this->system->setConf('system.admin_error_login_time',time());
            $_SESSION['loginmsg'] = __('用户名或密码错误!');
            header('Location: index.php?ctl=passport&act=login');
            exit;
        }
    }

    function doLoginOauth(){
        // 判断请求来自商家用户中心 激活店铺
        $certiMdl = $this->system->loadModel('service/certificate');
        $appmgrMdl = $this->system->loadModel('system/appmgr');
        if( $_GET['code'] && !$certiMdl->getent_id() ){
            $res = $_GET['res'];
            $res =unserialize(base64_decode($res));
            $opt = $this->system->loadModel('admin/operator');
            if($res['token'] and $res['params']){
                //创建云起单独用户
                $opt->create_user($res);
                $certiMdl->setent_id($res['params']['passport_uid']);
                $certiMdl->setent_email($res['params']['shopexid']);
                $certiMdl->setoauth_token($res['token']);

                //获取云起永久token
                $token_res = $certiMdl->get_yunqi_token($res['token']);
                $token_res['status']=='success' and $certiMdl->setyunqi_token($token_res['data']['token']);

                //云起物流 激活
                $yunqiexp_res = $certiMdl->yqexp_exp_active();
                $yunqiexp_res['status']=='success' and $certiMdl->setyqexp_active(true);

                //云起支付key secret配置 设置获取成功开启云起支付方式
                if( $certiMdl->yqaccount_appget($res['token']) ){
                    //云起支付开启
                    $appmgrMdl->enable_yunqipay('pay_yunqi');
                } 

                //注册证书后 跳转到授权页面
                $regcerti = $certiMdl->toReg($res['token']);
            }
            echo "<script>window.top.location.replace('?ctl=passport&act=login&oauth=cloud');</script>";exit;
        }
        if(isset($_GET['code']) && $_GET['code']){
            $opt = $this->system->loadModel('admin/operator');
            $code = $_GET['code'];
            $res = $opt->get_token($code);
            //获取云起支付key secret
            if(!$app = $this->system->getConf('cloud.appkey')){
                if( $certiMdl->yqaccount_appget($res['token']) ){
                    //云起支付开启
                    $appmgrMdl->enable_yunqipay('pay_yunqi');
                }
            }
            $certiMdl = $this->system->loadModel('service/certificate');
            if($res['token'] and $res['params']){
                if (isset($res['params']['data']) && $res['params']['data']) {
                    foreach ($res['params']['data'] as $d_key => $d_value) {
                        $res['params'][$d_key] = $d_value;
                    }
                    unset($res['params']['data']);
                }
                //判断是否为绑定云起会员
                $aResult = $opt->cloud_operators($res['params']['passport_uid']);
                if( $aResult ){
                    $this->system->setConf('enterprise.oauth_token',$res['token'],true);
                    $objCerti = $this->system->loadModel('service/certificate');
                    //获取云起已经开通的产品列表
                    $snlist_time = $objCerti->getsnlist_time();
                    if(!isset($snlist_time) || $snlist_time!=date("Y-m-d",time())){
                        $result = $objCerti->getsnlistoauth($res['token']);
                        $result['status']=='success' and $objCerti->setsnlist($result['data']);
                    }
                    //获取云起永久token
                    $yunqi_token = $objCerti->getyunqi_token();
                    if(!isset($yunqi_token) || $yunqi_token==''){
                        $token_res = $objCerti->get_yunqi_token($res['token']);
                        $token_res['status']=='success' and $objCerti->setyunqi_token($token_res['data']['token']);
                    }
                    //云起物流 激活
                    $yqexp_active = $objCerti->getyqerp_active();
                    if(!isset($yqexp_active) || $yqexp_active==''){
                        $yunqiexp_res = $certiMdl->yqexp_exp_active();
                        $yunqiexp_res['status']=='success' and $certiMdl->setyqexp_active(true);
                    }
                    //处理登陆
                    $log_info = $res;
                    $log_info['username'] = $aResult['username'];
                    $opt->operator_logs('operator',$log_info);

                    $status = &$this->system->loadModel('system/status');
                    $lg_key = $this->system->getConf('system.admin_dontlogincheckip') ? md5(remote_addr().$aResult['op_id']) :md5($aResult['op_id']);
                    $_SESSION['SHOPEX_LG_KEY'] = $lg_key;
                    setcookie('SHOPEX_LG_KEY', $lg_key);
                    $status->update(1);
                    $this->system->op_id = $aResult['op_id'];
                    $data['lastlogin']=time();
                    $data['logincount'] = $aResult['logincount'] + 1;
                    $opt->setLogInfo($data,$aResult['op_id']);
                    $this->system->setConf('system.admin_error_login_times',0);
                    header('P3P:CP="ALL ADM DEV PSAi COM OUR OTRo STP IND ONL"');
                    if($_REQUEST['return'] && (false !== strpos($_REQUEST['return'],$this->system->base_url())) ){
                        echo "<script>window.top.location.replace('index.php#".$_REQUEST['return']."');</script>";exit;
                    }else{
                        echo "<script>window.top.location.replace('index.php');</script>";exit;
                    }

                }else{
                    $_SESSION['loginmsg'] = __('该账号未绑定超管账号,请使用本地账号登录!');
                    $this->system->op_id = 0;
                    // $opt = $this->system->loadModel('admin/operator');
                    $url = $opt->logout('oauth_logout');
                    header("location: $url");exit;
                }
                
                // echo "<script>window.top.location.reload();</script>";
            }
        }
        
        if( $this->system->op_id ){
            header("Location:index.php");exit;
        }else{
            header('Location: index.php?ctl=passport&act=login');
        }
    }

    function check_login(){
        $oOpt = &$this->system->loadModel('admin/operator');
        $aResult = $oOpt->doLogin($_POST);
        if($aResult){
            echo 'true';
            exit;
        }else{
            echo 'false';
            exit;
        }
    }

    function logout(){
        $this->system->op_id = 0;
        $_SESSION = array();
        $opt = $this->system->loadModel('admin/operator');
        $url = $opt->logout('oauth_logout');
        header("location: $url");
    }

    function oauth_logout(){
        echo "<script>window.top.location.replace('?ctl=passport&act=login');</script>";exit;
    }

    function verifycode(){
        ob_clean();
        $oVerifyCode = &$this->system->loadmodel('utility/vcode');
        $_SESSION["RANDOM_CODE"] = $oVerifyCode->init(4);
        $this->system->__session_close(1);
        $oVerifyCode->output();
    }

    function certi_validate(){
        $return = array(
            'res' => 'succ','msg' => '','info' => ''
        );

        echo json_encode($return);
    }

    function step_complete(){
        $admin_url = $this->system->base_url().SHOPADMIN_PATH;

        $this->pagedata['shop_url']=  $this->system->base_url(); 
        $this->pagedata['shopadmin_url']= $admin_url;
        $this->pagedata['password'] = $_POST['password'];
        $this->pagedata['uname'] = $_POST['uname']?$_POST['uname']:'admin';
        $this->output_('step/step_install_complete.html');
    }

    function changelogin(){
        $this->logout();
        echo "<script>window.top.location.replace('?ctl=passport&act=step_active');</script>";exit;
    }

    function chooselogin(){
        $code=$_GET['code'];
        $opt = $this->system->loadModel('admin/operator');
        $res = $opt->get_token($code);
        $res = base64_encode(serialize($res));
        $auth_url=$this->system->base_url().SHOPADMIN_PATH."/index.php?ctl=passport&act=doLoginOauth";
        $fast_login_url=$this->system->base_url().SHOPADMIN_PATH."/index.php?ctl=passport&act=doLoginOauth&code=".$code.'&res='.$res.'&view=auth_485';
        echo "<script>window.top.location.replace('?ctl=passport&act=step_active&res=".$res."&code=".$code."&authurl=".urlencode($auth_url)."&fast_login_url=".urlencode($fast_login_url)."');</script>";exit;
    }
    function step_active(){
        if($this->system->getConf('enterprise.ent_id')){
            $this->login();exit;
        }
        $certi_model = &$this->system->loadModel('service/certificate');

        $admin_url = $this->system->base_url().SHOPADMIN_PATH;

        if( !$certi_model->getoauth_token() ) {
            $opt = $this->system->loadModel('admin/operator');
            $oauth_url = $opt->authorize_url();
            $this->pagedata['oauth_url'] = str_replace('doLoginOauth','chooselogin',$oauth_url);
            if(isset($_GET['code'])){
                $this->pagedata['oauth_url'] = $_GET['authurl'];
                $this->pagedata['code'] = $_GET['code'];
                $this->pagedata['fast_login_url'] = $_GET['fast_login_url'];
                $res = unserialize(base64_decode($_GET['res']));
                //echo'<pre>';print_r($_GET);exit;
                $passport_uid = $res['params']['passport_uid'];
                $this->pagedata['passport_uid'] = $passport_uid;
            }
            $this->display('cloud_install.html');
            //$this->display('cloud_choose_install.html');
        }else{
            echo "<script>window.top.location.replace('?ctl=passport&act=login');</script>";exit;
        }
    }

    function get_active_oauth(){
        $certi_model = &$this->system->loadModel('service/certificate');
        $this->pagedata['url'] = $certi_model->active_oauth();
        $this->output_('step/step_active.html');
    }

    function output_($file){
        header('Content-type: text/html;charset=utf-8');
        $this->pagedata['PAGE'] = $file;
        $this->pagedata['version'] = $this->system->loadModel('service/certificate')->getVersion();
        
        $smarty = &$this->system->loadModel('system/frontend');
        $smarty->ctl = &$this;
        $smarty->force_compile = true;
        $smarty->template_dir = CORE_DIR.'admin/view/step';
        $smarty->_vars = &$this->pagedata;
        $smarty->display('step/main.html');
        exit();
    }

    function cloud_install(){
        $this->display('cloud_install.html');
    }
}
