<?php defined('CORE_DIR') || exit('入口错误'); ?>
<?php
/**
 * ctl_delivery
 *
 * @uses pageFactory
 * @package
 * @version $Id: ctl.delivery.php 1867 2008-04-23 04:00:24Z flaboy $
 * @copyright 2003-2007 ShopEx
 * @author Likunpeng <leoleegood@zovatech.com>
 * @license Commercial
 */
include_once('delivercorp.php');
include_once('objectPage.php');
class ctl_delivery extends objectPage {

    var $workground ='setting';
    var $object = 'trading/delivery';
    var $finder_action_tpl = 'delivery/finder_action.html'; //默认的动作html模板,可以为null
    var $finder_default_cols = '_cmd,dt_name,dt_status,protect,has_cod,ordernum';
    var $allowImport = false;
    var $allowExport = false;
    var $filterUnable = true;

    function _weightunit(){
        return array(
            "500"=>__("500克"),
            "1000"=>__("1公斤"),
            "1200"=>__("1.2公斤"),
            "2000"=>__("2公斤"),
            "5000"=>__("5公斤"),
            "10000"=>__("10公斤"),
            "20000"=>__("20公斤"),
            "50000"=>__("50公斤")
        );
    }
    /**
    * newTypeStep
    *
    * @access public
    * @return void
    */
    function newTypeStep(){
        $this->path[] = array('text'=>__('添加配送方式'));
        $oObj = &$this->system->loadModel('trading/delivery');
        $oConsign=&$this->system->loadModel('trading/payment');
        $aTemp=$oConsign->getList();
        for($i=0;$i<count($aTemp);$i++){
            $aPayment[]=array('pid'=>$aTemp[$i]['payment_id'],'name'=>$aTemp[$i]['name']);
        }
        //配送地区
        //$aArea = $oObj->getDlAreaList();
        $this->pagedata['payment'] = $aPayment;
        //$this->pagedata['area'] = $aArea;
        $this->pagedata['hasCod'] = 0;
        $this->pagedata['price'] = $sPrice;
        //物流公司列表
        $corp=&$this->system->loadModel('trading/deliverycorp');
        $this->pagedata['clist'] = $corp->getCorpList();
        if(defined('SAAS_MODE')&&SAAS_MODE){
        $this->pagedata['clist'] = getdeliverycorplist();
        }

        //
        $this->pagedata['weightunit'] = $this->_weightunit();
        $this->pagedata['config']=array(
                'firstunit' => '1000',
                'continueunit'=>'1000'
        );
        $this->page('delivery/dtype_edit.html');
    }

    function showEdit($nDTid){
        if (!$nDTid) {
            $this->newTypeStep();
            return;
        }
        $oObj = &$this->system->loadModel('trading/delivery');
        $aData = $oObj->getDlTypeById($nDTid);
        $this->pagedata['config'] = unserialize($aData['dt_config']);
        $this->pagedata['dt_id'] = $nDTid;
        $this->pagedata['dt_name'] = $aData['dt_name'];
        $this->pagedata['dt_status'] = $aData['dt_status'];
        $this->pagedata['ordernum'] = $aData['ordernum'];
        $this->pagedata['protect'] = $aData['protect'];
        $this->pagedata['hasCod'] = $aData['has_cod'];
        $this->pagedata['chinaums'] = $aData['chinaums'];
        $this->pagedata['dt_code'] = $aData['dt_code'];
        $corp=&$this->system->loadModel('trading/deliverycorp');
        $this->pagedata['clist'] = $corp->getCorpList();
        if(defined('SAAS_MODE')&&SAAS_MODE){
        $this->pagedata['clist'] = getdeliverycorplist();
        }
        $this->pagedata['corp_id'] = $aData['corp_id'];
        $this->pagedata['detail'] = $aData['detail'];
        $this->pagedata['weightunit'] = $this->_weightunit();
        $area = $oObj->getAreaByDtId($nDTid);
        foreach($area as $key => $val){
            $area[$key]['config'] = unserialize($val['config']);
        }
        $this->pagedata['area'] = $area;
        $this->path[] = array('text'=>__('编辑配送方式'));
        $this->page('delivery/dtype_edit.html');
    }
    /**
    * saveDlType
    *
    * @access public
    * @return void
    */
    function saveDlType(){
        $this->begin('index.php?ctl=trading/delivery&act=index');
        if ($_POST['protect']=="1"){
            if ($_POST['protectrate']==""){
                $this->splash('failed','index.php?ctl=trading/delivery&act=showEdit&p[0]='.$_POST['dt_id'],__('保价百分率不能为空！'));
            }
            if ($_POST['minprotectprice']==""){
                $this->splash('failed','index.php?ctl=trading/delivery&act=showEdit&p[0]='.$_POST['dt_id'],__('最低保价金额不能为空！'));
            }
        }
        $oObj = &$this->system->loadModel('trading/delivery');
        $this->end($oObj->saveDlType($_POST), __('保存成功！'));
    }

    /**
    * delDlType
    *
    * @access public
    * @return void
    */
    function delDlType($sId){
        $oObj = &$this->system->loadModel('trading/delivery');
        if (empty($sId)) {
            $this->splash('failed','index.php?ctl=trading/delivery&act=index',__('请选择要删除的项！'));
        }
        if ($oObj->deleteDlType($sId)) {
            $this->splash('success','index.php?ctl=trading/delivery&act=index',__('删除成功'));
        } else {
            $this->splash('failed','index.php?ctl=trading/delivery&act=index',__('删除失败'));
        }
    }

    /**
    * showRateHelp
    *
    * @access public
    * @return void
    */
    function showRateHelp(){
        $this->page('delivery/help_rate.html');
    }

    /**
    * showMantesHelp
    *
    * @access public
    * @return void
    */
    function showMantesHelp(){
        $this->page('delivery/help_mantes.html');
    }

    /**
    * dlAreaList
    *
    * @access public
    * @return void
    */
    function dlAreaList(){
        $this->path[] = array('text'=>__('配送地区'));
        $oObj = &$this->system->loadModel('trading/delivery');
        $this->pagedata['items'] = $oObj->getDlAreaList();
        $this->page('delivery/area_list.html');
    }

    /**
    * detailDlArea
    *
    * @access public
    * @return void
    */
    function detailDlArea($aRegionId){
        $this->path[] = array('text'=>__('配送地区编辑'));
        $oObj = &$this->system->loadModel('trading/delivery');
        $this->pagedata['area'] = $oObj->getDlAreaById($aRegionId);
        $this->page('delivery/area_edit.html');
    }

    /**
    * saveDlArea
    *
    * @access public
    * @return void
    */
    function saveDlArea(){
        $oObj = &$this->system->loadModel('trading/delivery');
        if(!$oObj->updateDlArea($_POST,$msg)){
            $this->message = array('string'=>__('保存失败，').$msg,'type'=>MSG_ERROR);
            $this->splash('failed','index.php?ctl=trading/delivery&act=detailDlArea&p[0]='.$_POST['region_id'],$this->message['string']);
        }else
            $this->splash('success','index.php?ctl=trading/delivery&act=detailDlArea&p[0]='.$_POST['region_id']);

    }

    /**
    * showNewArea
    *
    * @access public
    * @return void
    */
    function showNewArea(){
        $this->path[] = array('text'=>__('添加配送地区'));
        $this->page('delivery/area_new.html');
    }

    /**
    * addDlArea
    *
    * @access public
    * @return void
    */
    function addDlArea(){
        $oObj = &$this->system->loadModel('trading/delivery');
        if(!$oObj->insertDlArea($_POST,$msg)){
            $this->message = array('string'=>__('保存失败，').$msg,'type'=>MSG_ERROR);
            $this->splash('failed','index.php?ctl=trading/deliveryarea&act=index',$this->message['string']);
        }else
            $this->splash('success','index.php?ctl=trading/deliveryarea&act=index');

    }

    /**
    * delDlArea
    *
    * @access public
    * @return void
    */
    function delDlArea($sId){
        $oObj = &$this->system->loadModel('trading/delivery');
        if (empty($sId)) {
            $this->splash('failed','index.php?ctl=trading/delivery&act=dlAreaList',__('请选择要删除的项！'));
        }
        if ($oObj->deleteDlArea($sId)) {
            $this->splash('success','index.php?ctl=trading/delivery&act=dlAreaList',__('删除成功'));
        } else {
            $this->splash('failed','index.php?ctl=trading/delivery&act=dlAreaList',__('删除失败'));
        }
    }


    /**
    * dlCorpList
    *
    * @access public
    * @return void
    */
    function dlCorpList(){
        $this->path[] = array('text'=>__('物流公司'));
        $this->pagedata['ctype'] = json_encode($this->_getAreaType());
        $oObj = &$this->system->loadModel('trading/delivery');
        $aCorp = $oObj->getCropList();
        if($aCorp){
            $aRel = $this->_getAreaTypeRel();
            foreach($aCorp as $key=>$val) {
                $aCorp[$key]['type'] = $aRel[$val['type']];
            }
        }
        $this->pagedata['items'] = $aCorp;
        $this->page('delivery/corp_list.html');
    }

    /**
    * detailDlCorp
    *
    * @access public
    * @return void
    */
    function detailDlCorp($nCorpId){
        $this->path[] = array('text'=>__('物流公司编辑'));
        $oObj = &$this->system->loadModel('trading/delivery');
        $this->pagedata['corp'] = $oObj->getCorpById($nCorpId);
        $this->pagedata['ctype'] = $this->_getAreaType();
        $this->page('delivery/corp_edit.html');
    }

    /**
    * _getAreaType
    *
    * @access public
    * @return void
    */
    function _getAreaType(){
        return array(
            0=>array("CNEMS",__("中国邮政EMS"),'http://www.ems.com.cn/'),
            1=>array("CNST",__("申通快递"),'http://www.sto.cn/'),
            2=>array("CNTT",__("天天快递"),'http://www.ttkd.cn/'),
            3=>array("CNYT",__("圆通速递"),'http://www.yto.net.cn/'),
            4=>array("CNSF",__("顺丰速运"),'http://www.sf-express.com/'),
            5=>array("CNYD",__("韵达快递"),'http://www.yundaex.com/'),
            6=>array("CNZT",__("中通速递"),'http://www.zto.cn/'),
            7=>array("CNLB",__("龙邦物流"),'http://www.lbex.com.cn/'),
            8=>array("CNZJS",__("宅急送"),'http://www.zjs.com.cn/'),
            9=>array("CNQY",__("全一快递"),'http://www.apex100.com/'),
            10=>array("CNHT",__("汇通速递"),'http://www.htky365.com/'),
            11=>array("CNMH",__("民航快递"),'http://www.cae.com.cn/'),
            12=>array("CNYF",__("亚风速递"),'http://www.airfex.cn/'),
            13=>array("CNKJ",__("快捷速递"),'http://www.fastexpress.com.cn/'),
            14=>array("DDS",__("DDS快递"),'http://www.qc-dds.net/'),
            15=>array("CNHY",__("华宇物流"),'http://www.hoau.net/'),
            16=>array("CNZY",__("中铁快运"),'http://www.cre.cn/'),
            17=>array("FEDEX",__("FedEx"),'http://www.fedex.com/cn/'),
            18=>array("UPS","UPS",'http://www.ups.com/'),
            19=>array("DHL",__("DHL"),'http://www.cn.dhl.com/'),
            20=>array("OTHER",__("其它")),
            21=>array("LBKD",__("联邦快递"),'http://cndxp.apac.fedex.com/dxp.html'),
        );
    }


    /**
     * 快递公司对应编码
     */
    public function expressCode(){
        $expressCodes = array(
            '7TLSWL'    =>  '7天连锁物流',
            'AJ'        =>  '安捷快递',
            'ANE'       =>  '安能物流',
            'AXD'       =>  '安信达快递',
            'BALUNZHI'  =>  '巴伦支快递',
            'BFDF'      =>  '百福东方',
            'BKWL'      =>  '宝凯物流',
            'BQXHM'     =>  '北青小红帽',
            'BSWL'      =>  '邦送物流',
            'BTWL'      =>  '百世物流',
            'CCES'      =>  'CCES快递',
            'CITY100'   =>  '城市100',
            'COE'       =>  'COE东方快递',
            'CSCY'      =>  '长沙创一',
            'CXWL'      =>  '传喜物流',
            'DBL'       =>  '德邦',
            'DCWL'      =>  '德创物流',
            'DHWL'      =>  '东红物流',
            'DSWL'      =>  'D速物流',
            'DTKD'      =>  '店通快递',
            'DTWL'      =>  '大田物流',
            'DYWL'      =>  '大洋物流快递',
            'EMS'       =>  'EMS',
            'FAST'      =>  '快捷速递',
            'FBKD'      =>  '飞豹快递',
            'FEDEX'     =>  'FedEx联邦快递',
            'FHKD'      =>  '飞狐快递',
            'FKD'       =>  '飞康达',
            'FYPS'      =>  '飞远配送',
            'FYSD'      =>  '凡宇速递',
            'GDEMS'     =>  '广东邮政',
            'GDKD'      =>  '冠达快递',
            'GHX'       =>  '挂号信',
            'GKSD'      =>  '港快速递',
            'GSD'       =>  '共速达',
            'GTKD'      =>  '广通速递',
            'GTO'       =>  '国通快递',
            'GTSD'      =>  '高铁速递',
            'HBJH'      =>  '河北建华',
            'HFWL'      =>  '汇丰物流',
            'HHKD'      =>  '华航快递',
            'HHTT'      =>  '天天快递',
            'HLKD'      =>  '韩润物流',
            'HLWL'      =>  '恒路物流',
            'HMJKD'     =>  '黄马甲快递',
            'HMSD'      =>  '海盟速递',
            'HOAU'      =>  '天地华宇',
            'hq568'     =>  '华强物流',
            'HQKY'      =>  '华企快运',
            'HSWL'      =>  '昊盛物流',
            'HTKY'      =>  '百世汇通',
            'HTWL'      =>  '户通物流',
            'HXLWL'     =>  '华夏龙物流',
            'HYLSD'     =>  '好来运快递',
            'JD'        =>  '京东快递',
            'JGSD'      =>  '京广速递',
            'JIUYE'     =>  '九曳供应链',
            'JJKY'      =>  '佳吉快运',
            'JLDT'      =>  '嘉里大通',
            'JTKD'      =>  '捷特快递',
            'JXD'       =>  '急先达',
            'JYKD'      =>  '晋越快递',
            'JYM'       =>  '加运美',
            'JYSD'      =>  '久易快递',
            'JYWL'      =>  '佳怡物流',
            'KLWL'      =>  '康力物流',
            'KTKD'      =>  '快淘快递',
            'KYDSD'     =>  '快优达速递',
            'KYWL'      =>  '跨越速递',
            'LB'        =>  '龙邦快递',
            'LBKD'      =>  '联邦快递',
            'LHKD'      =>  '蓝弧快递',
            'LHT'       =>  '联昊通速递',
            'LJD'       =>  '乐捷递',
            'LJS'       =>  '立即送',
            'MB'        =>  '民邦速递',
            'MDM'       =>  '门对门',
            'MHKD'      =>  '民航快递',
            'MLWL'      =>  '明亮物流',
            'MSKD'      =>  '闽盛快递',
            'NEDA'      =>  '能达速递',
            'NJSBWL'    =>  '南京晟邦物流',
            'PADTF'     =>  '平安达腾飞快递',
            'PXWL'      =>  '陪行物流',
            'QCKD'      =>  '全晨快递',
            'QFKD'      =>  '全峰快递',
            'QRT'       =>  '全日通快递',
            'RFD'       =>  '如风达',
            'RLWL'      =>  '日昱物流',
            'SAD'       =>  '赛澳递',
            'SAWL'      =>  '圣安物流',
            'SBWL'      =>  '盛邦物流',
            'SDHH'      =>  '山东海红',
            'SDWL'      =>  '上大物流',
            'SF'        =>  '顺丰快递',
            'SFWL'      =>  '盛丰物流',
            'SHLDHY'    =>  '上海林道货运',
            'SHWL'      =>  '盛辉物流',
            'SJWL'      =>  '穗佳物流',
            'ST'        =>  '速通物流',
            'STO'       =>  '申通快递',
            'STSD'      =>  '三态速递',
            'SURE'      =>  '速尔快递',
            'SXHMJ'     =>  '山西红马甲',
            'SYJHE'     =>  '沈阳佳惠尔',
            'SYKD'      =>  '世运快递',
            'THTX'      =>  '通和天下',
            'TSSTO'     =>  '唐山申通',
            'UAPEX'     =>  '全一快递',
            'UC'        =>  '优速快递',
            'WJWL'      =>  '万家物流',
            'WTP'       =>  '微特派',
            'WXWL'      =>  '万象物流',
            'XBWL'      =>  '新邦物流',
            'XFEX'      =>  '信丰快递',
            'XGYZ'      =>  '香港邮政',
            'XLYT'      =>  '祥龙运通',
            'XYT'       =>  '希优特',
            'YADEX'     =>  '源安达快递',
            'YBJ'       =>  '邮必佳',
            'CWL'       =>  '远成物流',
            'YD'        =>  '韵达快递',
            'YDH'       =>  '义达国际物流',
            'YFEX'      =>  '越丰物流',
            'YFHEX'     =>  '原飞航物流',
            'YFSD'      =>  '亚风快递',
            'YJSD'      =>  '银捷速递',
            'YLSY'      =>  '亿领速运',
            'YMWL'      =>  '英脉物流',
            'YSH'       =>  '亿顺航',
            'YSKY'      =>  '音素快运',
            'YTD'       =>  '易通达',
            'YTFH'      =>  '一统飞鸿',
            'YTKD'      =>  '运通快递',
            'YTO'       =>  '圆通速递',
            'YXWL'      =>  '宇鑫物流',
            'YZPY'      =>  '邮政平邮/小包',
            'ZENY'      =>  '增益快递',
            'ZHQKD'     =>  '汇强快递',
            'ZJS'       =>  '宅急送',
            'ZMKM'      =>  '芝麻开门',
            'ZRSD'      =>  '中睿速递',
            'ZTE'       =>  '众通快递',
            'ZTKY'      =>  '中铁快运',
            'ZTO'       =>  '中通速递',
            'ZTWL'      =>  '中铁物流',
            'ZTWY'      =>  '中天万运',
            'ZWYSD'     =>  '中外运速递',
            'ZYWL'      =>  '中邮物流',
            'ZZJH'      =>  '郑州建华',
        );
        return $expressCodes;
    }
    
    function _getAreaTypeRel(){
        return array(
            "CNEMS"=>__("中国邮政EMS"),
            "CNST"=>__("申通快递"),
            "CNTT"=>__("天天快递"),
            "CNYT"=>__("圆通速递"),
            "CNSF"=>__("顺丰速运"),
            "CNYD"=>__("韵达快递"),
            "CNZT"=>__("中通速递"),
            "CNLB"=>__("龙邦物流"),
            "CNZJS"=>__("宅急送"),
            "CNQY"=>__("全一快递"),
            "CNHT"=>__("汇通速递"),
            "CNMH"=>__("民航快递"),
            "CNYF"=>__("亚风速递"),
            "CNKJ"=>__("快捷速递"),
            "DDS"=>__("DDS快递"),
            "CNHY"=>__("华宇物流"),
            "CNZY"=>__("中铁快运"),
            "FEDEX"=>__("FedEx"),
            "UPS"=>"UPS",
            "DHL"=>__("DHL"),
            "OTHER"=>__("其它"),
            "LBKD"=>__("联邦快递"),
        );
    }
    /**
    * saveCorp
    *
    * @access public
    * @return void
    */
    function saveCorp(){
        $oObj = &$this->system->loadModel('trading/delivery');
        if(!$oObj->updateCorp($_POST,$msg)){
            $this->message = array('string'=>__('保存失败，').$msg,'type'=>MSG_ERROR);
            $this->splash('failed','index.php?ctl=trading/deliverycorp&act=detail&p[0]='.$_POST['corp_id']);
        }else
            $this->splash('success','index.php?ctl=trading/deliverycorp&act=detail&p[0]='.$_POST['corp_id']);
    }

    /**
    * showNewCorp
    *
    * @access public
    * @return void
    */
    function showNewCorp(){
        $this->path[] = array('text'=>__('添加物流公司'));
        // $this->pagedata['ctype'] = $this->_getAreaType();
        $this->pagedata['ctype'] = $this->expressCode();
        $this->page('delivery/corp_new.html');
    }

    /**
    * addCorp
    *
    * @access public
    * @return void
    */
    function addCorp(){
        $oObj = &$this->system->loadModel('trading/delivery');
        if(!$oObj->insertCorp($_POST,$msg)){
            $this->message = array('string'=>__('保存失败，').$msg,'type'=>MSG_ERROR);
            $this->splash('failed','index.php?ctl=trading/deliverycorp&act=index', $this->message['string']);
        }else
            $this->splash('success','index.php?ctl=trading/deliverycorp&act=index');

    }

    /**
    * delCorp
    *
    * @access public
    * @return void
    */
    function delCorp($sId){
        $oObj = &$this->system->loadModel('trading/delivery');
        if (empty($sId)) {
            $this->message = array('string'=>__('请选择要删除的项！'), 'type'=>MSG_ERROR);
        }
        if ($oObj->deleteCorp($sId)) {
            $this->message = array('string'=>__('Delete succeed!'),'type'=>MSG_OK);
            $this->splash('success','index.php?ctl=trading/delivery&act=dlCorpList');
        } else {
            $this->message = array('string'=>__('Delete failed!'),'type'=>MSG_ERROR);
            $this->splash('failed','index.php?ctl=trading/delivery&act=dlCorpList');
        }
    }

    /**
    * addCorpToType
    *
    * @access public
    * @return void
    */
    function addAreaToType(){
        $oObj = &$this->system->loadModel('trading/delivery');
        $insertId = $oObj->assistantInsertArea($_POST);
        echo $insertId;
    }

    function checkExp(){
        $oObj = &$this->system->loadModel('trading/delivery');
        $this->pagedata['expressions'] = $_GET['expvalue'];
        $this->display('delivery/check_exp.html');
    }
    function getRegionById($pregionid){
        $delivery = &$this->system->loadModel('trading/delivery');
        echo json_encode($delivery->getRegionById($pregionid));
    }
     function showRegionTreeList($serid,$multi=false){
         if($serid){
         $this->pagedata['sid'] = $serid;
         }else{
         $this->pagedata['sid'] = substr(time(),6,4);
         }
         $this->pagedata['multi'] =  $multi;
         $this->display('regionSelect.html');
    }
    function save_cell_value($id,$key){
        if($key == "ordernum"){
            if(intval($_POST['data']) <= 0){
                echo "排序必须为正整数";
                exit;
            }
        }
        parent::save_cell_value($id,$key);
     }
}
?>
