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
include_once('objectPage.php');
class ctl_deliverycorp extends objectPage {

    var $workground ='setting';
    var $object = 'trading/deliverycorp';
    var $finder_action_tpl = 'delivery/corp_finder_action.html'; //默认的动作html模板,可以为null
    var $filterUnable = true;

    function _detail(){
        return array('show_detail'=>array('label'=>__('物流公司'),'tpl'=>'delivery/corp_edit.html'));
    }

    function show_detail($nCorpId){
        $oObj = &$this->system->loadModel('trading/delivery');
        $this->pagedata['corp'] = $oObj->getCorpById($nCorpId);
        // $this->pagedata['ctype'] = $this->_getAreaType();
        $this->pagedata['ctype'] = $this->expressCode();
    }

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
}
?>
