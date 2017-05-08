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
class ctl_logistics extends shopPage{

    var $noCache = true;

    function callback() {
        error_log(date("H:i:s",time())."bind callback",3,__FILE__.".logistics.log");
        error_log(var_export($_POST,1),3,__FILE__.".logistics.log");
        $this->bind_shop_node($_POST);exit;
    }

    private function bind_shop_node($data){
        $date = date("Y-m-d",time());
        //验证签名
        $sign = $data["certi_ac"];
        $my_sign = $this->make_shopex_ac($data);
        if( $sign != $my_sign ){
            echo "sign error";
            return false;
        }

        $bindObj = $this->system->loadModel('trading/bind');

        $node_type = trim($data['node_type']);

        if($data['status'] == 'bind'){
            $data['site_id'] = $site_id;
            $data['name'] = $data['shop_name'];
            unset($data['shop_name']);
            //同一种node_type只能绑定一个
            if($bindObj->getBindInfoByType($node_type)){
                // $this->_error_log("node_type is exists");
                echo "node_type is exists";
                return;
            }

            //保存绑定关系
            $bindObj->save($data);
            $this->set_init($site_id);
        }else{
            $bindObj->deleteByNodeType($node_type,$site_id);
        }
        
    }

    private function make_shopex_ac($get_params, $token = "8c1a7e86f4d172fd355052ba1677ab1977856218be7edd4840f5544c1e1fb906") {
        $certificate = &$this->system->loadModel('service/certificate');
        $token = $certificate->getToken();
        ksort($get_params);
        $str = '';
        foreach ($get_params as $key => $value) {
            if ($key != 'certi_ac') {
                $str .= $value;
            }
        }
        return md5($str . $token);
    }

    //添加创建的脚本标识
    public function set_init($site_id){
        $mongodb=$this->system->mongo_database();
        $where['site_id'] = intval($site_id);
        $data['site_id'] = intval($site_id);
        $data['disabled'] = 'false';
        $site_list = $mongodb->where($where)->get('retry_createorder');
        if($site_list){
            $mongodb->update('retry_createorder',$data);
        }else{
            $mongodb->insert('retry_createorder',$data);
        }
    }

    //查询订单物流详情
    public function searchOrderLogistics($order_id){
        $url = $this->system->getSiteUrl(SITE_ID,DISTRIBUTOR_ID);
        $action_url = $this->system->mkUrl("tools","searchOrderLogistics",array($order_id));
        if(!$order_id){
            $this->splash('failed',$url,'非法访问!');exit;
        }

        $this->pagedata['close_header'] = false;
        $this->pagedata['close_menu'] = true;
        $this->pagedata['title'] = "订单详情";
        $this->pagedata['close_menu'] = true;
        $this->pagedata['action']=$action_url;
        $this->pagedata['order_id']=$order_id;
        if($_POST['action'] == 'search'){
            $objMatrix = $this->system->loadModel('system/matrix');
            $objSetting = $this->system->loadModel('system/setting');
            $params['order_id'] = $order_id;
            $logistics_info = $objMatrix->getLogistics($params['order_id'],SITE_ID,'logi_name,logi_no,ship_mobile');
            if($_POST['phone'] != $logistics_info['ship_mobile']){
                $this->splash('failed',$action_url,'收货人手机号错误!');exit;
            }
            $objOrder = $this->system->loadModel('trading/order');
            $objCur = $this->system->loadModel('system/cur');
            $orderDetail = $objOrder->load($order_id);
            if($orderDetail['site_id']){
                $info = $this->system->loadModel('admin/operator');
                $this->pagedata['site_info'] = $info->getInfo($orderDetail['site_id']);
            }

            $orderDetail['amount']['final'] = $objCur->formatNumber($orderDetail['amount']['final']);
            $orderDetail['shipping']['cost'] = $objCur->formatNumber($orderDetail['shipping']['cost']);
            $this->pagedata['order'] = $orderDetail;

            $OrderItems = $objOrder->get_order_item($order_id);
            $goods_amount = 0;
            //图片处理
            $gimage = $this->system->loadModel('system/storager',false,SITE_ID);

            foreach($OrderItems as $key => $item){

                $img = $gimage->parse($item['thumbnail_pic']);
                $OrderItems[$key]['thumbnail_pic'] = $img['url']?$img['url']:'static/image/no.png';
                $gItems[$key]['addon'] = unserialize($item['addon']);
                if($item['minfo'] && unserialize($item['minfo'])){
                    $OrderItems[$key]['minfo'] = unserialize($item['minfo']);
                }else{
                    $OrderItems[$key]['minfo'] = array();
                }
                $OrderItems[$key]['price'] = $objCur->formatNumber($item['price']);
                $goods_amount += $item['nums'];
            }
            //获取物流信息
            $objDelivery = $this->system->loadModel('trading/delivery');
            $delivery = $objDelivery->getDeliveryMessage($order_id);
            if($delivery){
                $delivery['website'] = $delivery['website'] . $delivery['logi_no'];
                $delivery['name'] = trim($delivery['name']);
                $delivery['logi_no'] = trim($delivery['logi_no']);
                $this->pagedata['delivery'] = $delivery;
            }else{
                $this->pagedata['delivery'] = $objDelivery->getOtherDeliveryMessage($order_id);
            }
            $this->pagedata['order']['goods_amount'] = $goods_amount;
            $this->pagedata['order']['items'] = $OrderItems;

            $this->pagedata['weight_type'] = $this->system->getConf('system.weight_type');

            $this->pagedata['comname'] = $comname;
            $this->pagedata['err_message'] = $err_message;
            $this->pagedata['message'] = $message;
            $this->pagedata['last'] = count($message['data']) - 1;
            $this->pagedata['title'] = "订单信息";
            $this->pageData();
            $this->obj_smarty->display('tools/order_details.html');
        }else{
            $this->pageData();
            $this->obj_smarty->display('tools/search_order_logistics.html');
        }
    }

    function searchDeliveryMessage($order_id){
        $objMatrix = $this->system->loadModel('system/matrix');
        $objSetting = $this->system->loadModel('system/setting');
        $params['order_id'] = $order_id;
        $logistics_info = $objMatrix->getLogistics($params['order_id'],SITE_ID,'logi_name,logi_no,ship_mobile');
        $corp_default = $objSetting->corp_default();
        if(in_array($logistics_info['logi_name'], $corp_default)){
            $params['company_code'] = array_search($logistics_info['logi_name'],$corp_default);
            $params['company_name'] = $logistics_info['logi_name'];
            $params['logistic_code'] = $logistics_info['logi_no'];
            // $params['company_code'] = 'YTO';
            // $params['company_name'] = '圆通速递';
            // $params['logistic_code'] = '880754600747133602';
            $res = $objMatrix->logistics_trace_detail_get($params);
            if($res['rsp']=='succ'){
                $comname = $params['company_name'];
                $data = json_decode($res['data'],1);
                if(empty($data['Traces'])){
                    $err_message = $data['Reason'];
                }else{
                    $message['data'] = $data['Traces'];
                }
            }else{
                $comname = '其他';
                $err_message = $res['err_msg'];
            }
        }else{
            $comname = '其他';
            $err_message = '查询失败!';
        }
        krsort($message['data']);
        $this->pagedata['close_header'] = false;
        $this->pagedata['close_menu'] = true;
        $this->pagedata['comname'] = $comname;
        $this->pagedata['err_message'] = $err_message;
        $this->pagedata['message'] = $message;
        $this->pagedata['last'] = count($message['data']) - 1;
        $this->pagedata['title'] = "物流信息";
        $this->pageData();
        $this->obj_smarty->display('member/delivery_message.html');
    }
    
}
?>