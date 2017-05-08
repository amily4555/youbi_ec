<?php
include_once('objectPage.php');
class ctl_wap extends objectPage{
    var $name = '移动端';
    var $workground = 'wap';
    var $object = 'admin/operator';
    var $finderVar = 'OperatorMgr';

    function wap(){
        $objCerti = $this->system->loadModel('service/certificate');
        $this->pagedata['fy_open'] = $objCerti->check_goods_opened('fy');
        $this->page('wap/wap.html');
    }
}
?>