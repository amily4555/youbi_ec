<?php defined('CORE_DIR') || exit('入口错误'); ?>
<?php
/**
 * ctl_cart
 *
 * @uses shopPage
 * @package
 * @version $Id: ctl.tools.php 1867 2008-04-23 04:00:24Z flaboy $
 * @copyright 2003-2007 ShopEx
 * @author Wanglei <flaboy@zovatech.com>
 * @license Commercial
 */
class ctl_tools extends shopPage{

    var $noCache = true;

    function setcur(){
        if(isset($this->member)){
            $oMem = &$this->system->loadModel('member/member');
            $oMem->save($this->member['member_id'],array('cur'=>$_POST['cur']));
            header('Location:'.$_SERVER['HTTP_REFERER']);
        }else{
            setcookie('S[CUR]',$_POST['cur']);
            header('Location:'.$_SERVER['HTTP_REFERER']);
        }
    }

    function ver(){
        header('Content-type: text/plain');
        foreach($this->system->version() as $k=>$v){
            $out.=$k.'='.$v."\n";
        }
        echo $out;
        $this->system->_succ=true;
        exit();
    }

    function checkSession($sess_id){
        $this->certi_model = &$this->system->loadModel('service/certificate');
        $result = $this->certi_model->getSess($sess_id);
        if($result){
            echo json_encode(array('res'=>'succ','rsp'=>'succ'));
        }else{
            echo json_encode(array('res'=>'fail','rsp'=>'fail'));
        }
    }

    function code(){
        $code = &$this->system->loadModel('utility/vcode');
        $code->init();
    }

    function history(){
        $this->title=__('浏览过的商品');
        $this->output();
    }

    function products(){
        $objGoods  = &$this->system->loadModel('goods/products');

        $filter = array();
        foreach(explode(',',$_POST['goods']) as $gid){
            if(0 !== intval($gid)) $filter['goods_id'][] = intval($gid);
        }
        
        $_POST['goods'] = implode(',',array_unique($filter['goods_id']));
        
        $this->pagedata['products'] = $objGoods->getList($objGoods->defaultCols.',find_in_set(goods_id,"'.$_POST['goods'].'") as rank',$filter,0,-1,array('rank','asc'));

        $view = $this->system->getConf('gallery.default_view');
        if($view=='index') $view='list';
        $this->__tmpl = 'gallery/type/'.$view.'.html';
        $this->output();
    }

    function sel_region($path,$depth){
        header('Content-type: text/html;charset=utf-8');// charset=utf8 lead ie8 7 ajax error: c00ce56e rocky modified 9.19
        $local = &$this->system->loadModel('system/local');
        if($ret = $local->get_area_select($path)){
            echo '&nbsp;-&nbsp;'.$local->get_area_select($path,array('depth'=>$depth));
        }else{
            echo '';
        }
    }

    //查看证书授权
    function cert_login(){
        $certMdl = &$this->system->loadModel('service/certificate');
        $return = $certMdl->to_shopex_certificate('certi.login');
        if($return['status'] != 'success'){
            echo "<pre>"; var_dump($return);exit;            
        }else{
            $temp = array(
                'status' => $return['status'],
                'data'=>array(
                    'created_at'=>$return['data']['service']['created_at'],
                    'authorize_code'=>$return['data']['service']['authorize_code'],
                    'active_time'=>$return['data']['service']['active_time'],
                    'authorize_name'=>$return['data']['service']['authorize_name'],
                    'cert_status'=>$return['data']['service']['status']
                )
            );
            echo "<pre>"; var_dump($temp);exit;
        }
    }

     //查看注册证书
    function cert_reg(){
        $certMdl = &$this->system->loadModel('service/certificate');
        $return = $certMdl->to_shopex_certificate('certi.reg');
        if($return['status'] != 'success'){
            echo "<pre>"; var_dump($return);exit;            
        }else{
            echo "<pre>"; var_dump($return['status']);exit;
        }
    }

    function api_check(){
        $toolsMdl = $this->system->loadModel('utility/tools');
        $items = $toolsMdl->api_check(); 

        $date = date('Y-m-d',time());        
        $api_name = 'api_log('.$date.').log';
        $dir = HOME_DIR.'/logs/'.$api_name;
        if( is_file($dir) ) {
            $this->pagedata['log'] = $this->system->base_url().'home/logs/'.$api_name;
        }

        $this->pagedata['info'] = $items;

        $this->display('tools/checkapi.html');
    }

    function callback(){

        $data = $_POST;
        //验证签名
        $sign = $data["certi_ac"];
        $my_sign = $this->make_shopex_ac($data);
        if( $sign != $my_sign ){
            echo "sign error";
            return;
        }
        $node_type = trim($data['node_type']);
        $bindObj = $this->system->loadModel('service/bindlist');
        if($data['status'] == 'bind'){
            //自动开启ome插件
            if($data['node_type'] == 'ecos.ome'){
                $Mdl = $this->system->loadModel('system/appmgr');
                $ome = $Mdl->_getList('ome');
                $ome = $ome[0];
                if($ome['disabled']=='true'){
                    if($ome['status']=='unused'){
                        $Mdl->install('ome');
                    }
                    $Mdl->enable('ome');
                }
            }
            $data['name'] = $data['shop_name'];
            unset($data['shop_name']);
            //同一种node_type只能绑定一个
            if($bindObj->getBindInfoByType($node_type)){
                echo "node_type is exists";
                return;
            }
            //保存绑定关系
            $bindObj->save($data);
        }else{
            $bindObj->deleteByNodeType($node_type);
        }
        
    }

    private function make_shopex_ac($get_params, $token = "") {
        if($token==""){
            $certificate = &$this->system->loadModel('service/certificate');
            $token = $certificate->getToken();
        }
        ksort($get_params);
        $str = '';
        foreach ($get_params as $key => $value) {
            if ($key != 'certi_ac') {
                $str .= $value;
            }
        }
        return md5($str . $token);
    }
    
}
?>