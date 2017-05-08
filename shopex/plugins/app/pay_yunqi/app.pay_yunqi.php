<?php
class app_pay_yunqi extends app{
    var $ver = 1.0;
    var $name='天工收银';
    var $website = 'http://www.shopex.cn';
    var $author = 'shopex';
    var $help = '';
    var $type = 'yunqi';
    function install(){
        parent::install();
        return true;
    }

    function uninstall(){
        $this->db->exec('delete from sdb_payment_cfg where pay_type ="'.$this->type.'"');
        return parent::uninstall();
    }

    function ctl_mapper(){
        return array(
        );
    }

}
?>
