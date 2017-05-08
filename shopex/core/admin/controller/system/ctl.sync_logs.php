<?php
require_once('objectPage.php');
class ctl_sync_logs extends objectPage{
    var $workground = 'setting';
    var $canRemove = false;
    var $deleteAble = false;
    var $allowImport = false;
    var $allowExport = false;
    var $noRecycle = true;
    var $finder_action_tpl = 'system/sync_logs/finder_action.html';
    // var $finder_default_cols = 'entity_id,entity_type,status,apiname,msg_id,message,send_num,log_create_time';
    var $object = 'system/sync_logs';
    var $filterUnable = true;
    var $shopex_app = array('taodali','ecos.ome');
    
    function index($params1,$params2){
        $bind_type = in_array($_GET['bind_type'],$this->shopex_app) ? $_GET['bind_type'] : 'ecos.ome';
        if( $bind_type =='ecos.ome' ){
            if ( !$this->system->getConf('app.ome.omenodeid') ) {
                $this->splash('failed','?ctl=system/appmgr&act=setting&p[0]=ome&operation_type=config&version=2.0','请先绑定OME后使用该功能');
            }
            $this->filter['bind_type'] = 'ecos.ome';
        }elseif($bind_type=='taodali'){
            $this->filter['bind_type'] = 'taodali';
        }else{

        }
        parent::index();
    }

    function _detail(){
        return array(
            'show_detail'=>array('label'=>__('详细信息'),'tpl'=>'system/sync_logs/detail.html'),
        );
    }

    function add($order_id,$return=false) {
        if ( !$order_id ) return;

        $matrixMdl = $this->system->loadModel('system/matrix');

        // 订单数据
        $trade = $matrixMdl->format_matrix_trade($order_id);
        // $this->system->loadModel('plugins/ome/ome_queue')->add($trade,$order_id,'order','store.trade.add');
        $return  = $this->system->loadModel('system/sync_logs')->add($trade,$order_id,'order','store.trade.add');
        
        if ( $return ) {
            return true;
        }
        $this->splash('success','?ctl=order/order','订单已入队列等待发送');
    }
    
    function multi_add() {

        if ( !$orders = (array)$_POST['order_id'] ) {
            return;
        }
        foreach( $orders as $order_id ) {
            $this->add($order_id, true);
        }
        
        $this->splash('success','?ctl=order/order','订单已入队列等待发送');
    }
    
    function retry($queue_id,$return=false) {
        if ( !($queue_id = (int)$queue_id) ) return;
        $sql = "select * from sdb_sync_logs where queue_id=".$queue_id;
        $row = $this->db->selectrow($sql);
        if($row['bind_type']=='taodali'){
            if($row['status']=='succ') return;
            $objMatrix = $this->system->loadModel('system/matrix');
            if(!$objMatrix->check_node_link('taodali',$bind_info)) return;
            $objMatrix->to_matrix(json_decode($row['data'],1),$bind_info);
        }else{

        }
        $sql = "UPDATE sdb_sync_logs SET status='ready',send_num=0,message='',log_create_time='0',last_send_time='0' WHERE status NOT IN ('ready','locking') AND queue_id='$queue_id'";
        
        $this->db->exec($sql);
        
        if ( $return ) {
            return true;
        }
        $this->splash('success','?ctl=system/sync_logs&act=index&bind_type='.$row['bind_type'],'重置队列等待发送');
    }
    
    function multi_retry() {
        foreach( $_POST['queue_id'] as $queue_id ) {
            $this->retry($queue_id,true);
        }
        
        $this->splash('success','?ctl=system/sync_logs&act=index&bind_type='.$_GET['bind_type'],'重置队列等待发送');
    }
    
    function matrix_callback() {
        $queue_id = $_GET['queue_id'];
        $queueMdl =& $this->system->loadModel('system/sync_logs');
        $queueMdl->update($queue_id,null,$_POST);
        echo 'succ';
    }
    
    function show_detail($log_id){
        $queueMdl =& $this->system->loadModel('system/sync_logs');
        $res = $queueMdl->get_queue_by_id($log_id);

        $res['to_node_id'] = $this->system->getConf('app.ome.omenodeid');
        $res['from_node_id'] = $this->system->loadModel('service/certificate')->getNodeid();
        $res['data'] = strip_tags($res['data']);

        $res['queue_id'] = $log_id;

        $this->pagedata['res'] = $res;
    }

    function _views(){
        return array(
        __('全部')=>'',
        __('进行中')=>array('status'=>array('ready','matrixhold','locking')),
        __('失败')=>array('status'=>array('fail','syncfail','matrixreject')),
        );
    }
}
