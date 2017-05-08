<?php defined('CORE_DIR') || exit('入口错误'); ?>
<?php
define('MANUAL_SEND','MANUAL_SEND');
class ctl_messenger extends adminPage {

    var $workground = 'member';

    function index($params1,$params2){
        $this->path[] = array('text'=>__('邮件短信配置'));
        $messenger = &$this->system->loadModel('system/messenger');
        $action = $messenger->actions();
        foreach($action as $act=>$info){
            $list = $messenger->getSenders($act);
            foreach($list as $msg){
                $this->pagedata['call'][$act][$msg] = true;
            }
        }

        $this->pagedata['actions'] = $action;
        $this->_show('messenger/index.html');
    }

    function edTmpl($action,$msg){

        $messenger = &$this->system->loadModel('system/messenger');
        $info = $messenger->getParams($msg);

        if($this->pagedata['hasTitle'] = $info['hasTitle']){
            $this->pagedata['title'] = $messenger->loadTitle($action,$msg);
        }
        
        $this->pagedata['body'] = $messenger->loadTmpl($action,$msg);
        $this->pagedata['type'] = $info['isHtml']?'html':'textarea';
        $this->pagedata['messenger'] = $msg;
        $this->pagedata['action'] = $action;

        $actions = $messenger->actions();
        $this->pagedata['varmap'] = $actions[$action]['varmap'];
        $this->pagedata['action_desc'] = $actions[$action]['label'];
        $this->pagedata['msg_desc'] = $info['name'];

        $this->page('messenger/edtmpl.html');
    }
    
    function saveTmpl(){
        $messenger = &$this->system->loadModel('system/messenger');
        if( 'sms' == $_POST['messenger'] && $_POST['content'] ){
            if( substr_count($_POST['content'],'【')>0 || substr_count($_POST['content'],'】')>0 ){
                $this->splash('failed','index.php?ctl=member/messenger&act=edtmpl&p[0]='.$_POST['actdo'].'&p[1]=sms','短信内容不能包含【】符号！');
            }
        }
        $ret = $messenger->saveContent($_POST['actdo'],$_POST['messenger'],array(
            'content'=>$_POST['content'],
            'title'=>$_POST['title']
        ));
        if($ret){
            $this->splash('success','index.php?ctl=member/messenger&act=index');
        }else{
            $this->splash('failed','index.php?ctl=member/messenger&act=index');
        }
    }

    function save(){
        $messenger = &$this->system->loadModel('system/messenger');
        if ($messenger->saveActions($_POST['actdo'])) {
            $this->splash('success', 'index.php?ctl=member/messenger&act=index');
        }else{
            $this->splash('failed','index.php?ctl=member/messenger&act=index');
        }
    }
    
    function _show($tmpl){
        $messenger = &$this->system->loadModel('system/messenger');
        $this->pagedata['messenger'] = $messenger->getList();
        $this->pagedata['__show_page__'] = $tmpl;
        $this->page('messenger/page.html');
    }

    function send($sender){//msgbox
        $messenger = &$this->system->loadModel('system/messenger');
        $member  = &$this->system->loadModel('member/member');
        $senderInfo = $messenger->getParams($sender);
      
        $systmpl = &$this->system->loadModel('content/systmpl');
        $tmpl_name = md5(time());
        $column = 'member_id,uname,'.($senderInfo['dataname']?$senderInfo['dataname']:'custom');

        if( !$systmpl->set($tmpl_name,$_POST['content']) ) {
            $this->splash('failed','index.php?ctl=member/member&act=index');
        }
        
        if( $_POST['targets'] ) {
            $count = count($_POST['targets']);
            $number = 0;
            $step = 200;   //每次读取发送信息条数
            while ( $count >0 && $number < $count ) {
                $targets = array_slice($_POST['targets'],$number, $step,true); //每次取出发送的数量
                $info_name = array();  //清空上次数据
                foreach($member->getList($column,array('member_id'=>array_keys($targets)),0,-1) as $info){
                    $info_name[] = $info;
                }
                $info_name['use_reply'] = $_POST['is_reply'];
                $info_name['sendnum'] = count($targets);
                $info_name['message'] = $_POST['content'];
                
                if ( 'msgbox' == $sender ) { // 群发发站内信
                    $msgMdl = $this->system->loadModel('resources/msgbox');
                    $nOpId = $this->system->op_id ? $this->system->op_id :0;  ////有谁发送
                    $info_name['from_type'] = 1;  //是否管理员
                    $info_name['to_type'] = 0;   //是否发给管理员 0是发给会员
                    $info_name['msg_from'] = $this->system->op_name;   //管理员姓名  无姓名显示用户名
                    $info_name['subject'] = $_POST['title'] ? $_POST['title'] : ''; //标题 
                    
                    foreach($info_name as $items){
                    
                        if(is_array($items) && $items['member_id']){
                             
                            $msgMdl->sendMsg($nOpId,$items['member_id'],$info_name['message'],$info_name);
                        }
                    }
                } else {
                    $messenger->addQueue($sender,$info['mobile'],$_POST['title'],$info_name,$tmpl_name,5,MANUAL_SEND,'');
                }
                
                $number += $step;
            }
            
        }elseif($_POST['filter']){
        
            parse_str($_POST['filter'],$filter);
            $step = 10; //节省内存，10个一组
            $offset = 0;
            do{
                $count = $member->count($filter);
                foreach($member->getList($column,$filter,$offset,$step) as $info){
                    $target = null;
                    if($senderInfo['dataname']){
                        $target = $info[$senderInfo['dataname']];
                    }elseif(($custom = $info['custom']) && ($custom = unserialize($custom))){
                        $target = $custom['contact'][$sender];
                    }
                    $info['title'] = $_POST['title'];
                    if($target){
                        $messenger->addQueue($sender,$target,$info['title'],$info,$tmpl_name,5,MANUAL_SEND);
                    }else{
                        continue;
                    }
                }
            }while($count>($offset+=$step));
        }
        
        $this->splash('success','index.php?ctl=member/messenger&act=outbox&p[0]='.$sender);
    }

    function write($sender){
        $this->workground = 'member';
        $messenger = &$this->system->loadModel('system/messenger');
        $this->pagedata['messenger'] = $sender;
        $this->pagedata['sender'] = $messenger->getParams($sender);
        $this->pagedata['dataname'] = $this->pagedata['sender']['dataname'];
      if($_POST['member_id'][0]=='_ALL_'){
             $_POST = '';
      }
        $member = &$this->system->loadModel('member/member');
        if($this->pagedata['sender']['dataname']){
               $memberList = $member->getList('member_id,uname,'.$this->pagedata['sender']['dataname'].' as target ',$_POST,0,-1);
                foreach($memberList as $k=>$v){
                  if ( 'sms' == $sender &&         $this->system->loadModel('utility/tools')->is_mobile($v['target']) ) {
                        continue;
                  }
                  if ( 'email' == $sender && $this->system->loadModel('utility/tools')->is_email($v['target']) ) {
                        continue;
                  }
                  if('msgbox' == $sender){
                        continue;
                  }
                  $badList[] = $v;
                  unset($memberList[$k]);
                }
            }else{
                $memberList = $member->getList('member_id,uname,custom',$_POST,0,-1);
                foreach($memberList as $k=>$v){
                    if(($custom = unserialize($v['custom'])) && $custom['contact'][$sender]){
                        $memberList[$k]['target'] = $custom['contact'][$sender];
                    }else{
                        $badList[] = $v;
                        unset($memberList[$k]);
                    }
                }
            }
        $this->pagedata['members'] = $memberList;
        $this->pagedata['badList'] = $badList;
        $this->pagedata['badListCount'] = count($badList);

        $this->pagedata['type'] = $this->pagedata['sender']['isHtml']?'html':'textarea';
        $this->page('messenger/write.html');
    }

    function config($name){
        $this->path[] = array('text'=>__('配置'));
        $msgMdl = &$this->system->loadModel('system/messenger');
        $this->pagedata['options'] = $msgMdl->getOptions($name);
        $this->pagedata['messengername'] = $name;
        $this->_show('messenger/config.html');
    }

    function saveCfg(){
        $this->begin('index.php?ctl=member/messenger&act=config&p[0]='.$_POST['messenger']);
        $messenger = &$this->system->loadModel('system/messenger');
        $this->end($messenger->saveCfg($_POST['messenger'],$_POST['config']),__('配置保存成功'));
    }

    //邮件，短信，站内信 队列 
    function queue($sender,$current=1){
        $this->path[] = array('text'=>__('待发队列'));
        $objMessage = &$this->system->loadModel('system/messenger');
        $aData = $objMessage->getQueue($sender,$current);
        $page_data = $this->pagination($current,$aData['page'],'queue',$sender);
        $this->pagedata['method'] = $sender;
        $this->pagedata['data'] = $aData['data'];
        
        $this->pagedata['sender'] = $objMessage->getParams($sender);
        $this->pagedata['sender_'] = $sender; //模版上判断显示时使用 
        $this->pagedata['queue'] = 'queue';
        
        $this->_show('messenger/queue.html');
    }
    
    //邮件，短信，站内信 收件箱
    function outbox($sender,$current=1){
        $this->path[] = array('text'=>__('发件箱'));
        $messenger = &$this->system->loadModel('system/messenger');
        $aData = $messenger->outbox($sender,$current);
        $this->pagedata['data'] = $aData['data'];
        $page_data = $this->pagination($current,$aData['page'],'outbox',$sender);
        $this->pagedata['sender'] = $messenger->getParams($sender);
        $this->pagedata['sender_'] = $sender;  
        $this->pagedata['queue'] = 'outbox';
        //$this->pagedata['email_conf'] = $this->system->getConf('plugin.messenger.email.config.sendway');
       
        $this->_show('messenger/queue.html');
    }
    
    
    //删除 队列和收件箱条目
    function del($queue_id,$method,$queue){
        if($queue_id){
            $this->begin('index.php?ctl=member/messenger&act='.$queue.'&p[0]='.$method);
            $messenger = &$this->system->loadModel('system/messenger');
            if('msgbox' != $method ){
                $this->end($messenger->del_queue($queue_id),__('删除成功'));
            }else{
                $this->end($messenger->del_msgbox($queue_id),__('删除成功'));
            }
        }
    
    }

   function pagination($current,$totalPage,$param = 'queue',$method){ 
        $this->pagedata['pageData'] = array(
            'current'=>$current,
            'total'=>$totalPage,
            'link'=>'index.php?ctl=member/messenger&act='.$param.'&p[0]='.$method.'&p[1]=orz1',
            'token'=>'orz1'
            );
    }
    function testEmail(){
        $this->pagedata['options'] = $_GET['config'];
        if ($_GET['config']['sendway']=="mail")
            $this->pagedata['acceptor']=$_GET['config']['usermail'];
        $this->display('messenger/testemail.html');
    }
    
    function doTestemail(){
        $acceptor = $_POST['acceptor']; //收件人邮箱
        
        $data['title'] = __("来自[").$this->system->getConf('system.shopname').__("]网店的测试邮件");
        $data['content'] = __("这是一封测试邮箱配置的邮件，您的网店能正常发送邮件。");
        $msgMdl = &$this->system->loadModel('system/messenger');
        //$msgMdl->addQueue('email', $acceptor,$subject,$body,'',1,'MANUAL_SEND');
        $send_is_succ = $msgMdl->_send('email','',$acceptor,$data);
        echo $send_is_succ ? __("已发送测试邮件,请注意查收!") : __("邮件发送失败! 请检查邮件配置!");
    }
    
    //购买短信 by zhangxuehui 2011-9-22
    function buySms(){
        $oSms = $this->system->loadModel('system/sms');
        $certMdl = $this->system->loadModel('service/certificate');
        $getent_id = $certMdl->getent_id();
        $getent_ac = $certMdl->getent_ac();
        
        if( !$getent_id || !$getent_ac ){            
            $this->splash('failed','index.php?ctl=service/certificate&act=showIndex',__('请先在 商店设置->授权证书 中输入shopex通行证密码'));
        }

        if( !$this->system->getConf('system.sms_signContent') ){            
            $this->splash('failed','index.php?ctl=member/messenger&act=index',__('请在 邮件短信设置->短信签名 中设置短信签名！'));
        }


        //免登陆地址
        $this->pagedata['login_url'] = $oSms->getSmsUrl('sms','prdsList');
        $this->page('member/sms.html');
    }
    
    //shopex EDM 邮件
    function edm() {       
        $certMdl = $this->system->loadModel('service/certificate');
        $getent_id = $certMdl->getent_id();
        $getent_ac = $certMdl->getent_ac();
        if(!$getent_id || !$getent_ac){            
            $this->splash('failed','index.php?ctl=service/certificate&act=showIndex',__('请先在 商店设置->授权证书 中输入shopex通行证密码'));
        }
        //免登陆地址
        $emailMdl = $this->system->loadModel('system/email');
        $this->pagedata['login_url'] = $emailMdl->get_edm_url();
        
        $this->page('member/sms.html');
    }

    //设置短信签名
    function smsSign(){
        $sms_sign = $this->system->getConf('system.sms_signContent');  //取出已保存的签名  
        if($_POST){
            if( !isset($_POST['smsSign']) ){
                echo json_encode(array('status'=>false,'msg'=>'请输入短信签名'));exit;
            }

            $sign_content = trim($_POST['smsSign']);
            $preg = '/test|测试|[|]|{|}|【|】|\./';
            if( preg_match($preg,$sign_content) ){
                echo json_encode(array('status'=>false,'msg'=>'签名内容不合法'));exit;
            }

            $sign_len =  mb_strlen($sign_content,'UTF8');
            if( $sign_len < 2 || $sign_len >8 ){
                echo json_encode(array('status'=>false,'msg'=>'签名长度为2-8位'));exit;
            }

            $certMdl = $this->system->loadModel('service/certificate');
            if( !$shopexid = $certMdl->getent_id() ){
                echo json_encode(array('status'=>false,'msg'=>'shopexid错误请检查'));exit;
            }
            
            $param = array();
            $param['shopexid'] = $shopexid;
            $param['token'] = $certMdl->getyunqi_token();
            //接口验证签名
            $messengerMdl = $this->system->loadModel('system/messenger');
            $sign_content = '【'.$sign_content.'】';
            if( isset($sms_sign ) && $sms_sign ){
                $param['old_content'] = $sms_sign;
                $param['new_content'] = $sign_content;
                $type = 'update';
            }else{
                $type = 'new';
                $param['content'] = $sign_content;
            }
            $result = $messengerMdl->setSmsSign($param,$type);
            error_log(var_export($param,1),3,HOME_DIR."/logs/sms_sign_".date('Ymd',time()).'.log');
            error_log(var_export($result,1),3,HOME_DIR."/logs/sms_sign_".date('Ymd',time()).'.log');
            error_log(var_export("\r\n-----------------\r\n",1),3,HOME_DIR."/logs/sms_sign_".date('Ymd',time()).'.log');
            if($result['res'] == 'succ'){
                $this->system->setConf('system.sms_signContent',$sign_content); //签名
                $this->system->setConf('system.sms_review',$result['review']); //是否审核通过
                if($type =='update'){                    
                    $this->system->setConf('system.sms_extend_no',$result['new_extend_no']);
                }else{
                    $this->system->setConf('system.sms_extend_no',$result['extend_no']); //扩展码
                }
                echo json_encode(array('status'=>true,'msg'=>'签名设置成功!'));exit;
            }else{
                if(isset($result['code']) && $result['code'] == '1004'){
                    $this->system->setConf('certificate.yunqi_token','',true);//永久token置空
                    echo json_encode(array('status'=>false,'msg'=>'签名设置失败,重新使用云起账号登录后再设置签名!'));exit;
                    // $type = 'new';
                    // $param['content'] = $sign_content;
                    // $r = $messengerMdl->setSmsSign($param,$type);
                    // if($result['res'] == 'succ'){
                    //     $this->system->setConf('system.sms_signContent',$sign_content); //签名
                    //     $this->system->setConf('system.sms_review',$result['review']); //是否审核通过                        
                    //     $this->system->setConf('system.sms_extend_no',$result['extend_no']); //扩展码                       
                    //     echo json_encode(array('status'=>true,'msg'=>'签名设置成功!'));exit;
                    // }else{
                    //     $msg = $messengerMdl->smsSign_error_msg($r['code']);
                    //     echo json_encode(array('status'=>false,'msg'=>$msg ? $msg : '签名设置失败,请重试!'));exit;
                    // }
                }else{
                    $msg = $messengerMdl->smsSign_error_msg($result['code']);
                    echo json_encode(array('status'=>false,'msg'=>$msg ? $msg : '签名设置失败,请重试!'));exit;
                }
            }
        }else{           
            if( isset($sms_sign) && $sms_sign ){
                $sms_sign = str_replace(array('【','】'),'',$sms_sign);//去除中括号显示
            }
            $this->pagedata['smsSign'] = $sms_sign ? $sms_sign : ''; 
            $this->display('messenger/smsSign.html');            
        }

    }    

}
