-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 02 月 18 日 03:09
-- 服务器版本: 5.0.90
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jicheng`
--

-- --------------------------------------------------------

--
-- 表的结构 `sdb_admin_roles`
--

DROP TABLE IF EXISTS `sdb_admin_roles`;
CREATE TABLE IF NOT EXISTS `sdb_admin_roles` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `role_name` varchar(100) NOT NULL default '',
  `role_memo` text,
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`role_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sdb_admin_roles`
--

INSERT INTO `sdb_admin_roles` (`role_id`, `role_name`, `role_memo`, `disabled`) VALUES
(1, '商品管理员', '', 'false'),
(2, '订单管理员', '', 'false'),
(3, '促销管理员', '', 'false'),
(4, '内容管理员', '', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_advance_logs`
--

DROP TABLE IF EXISTS `sdb_advance_logs`;
CREATE TABLE IF NOT EXISTS `sdb_advance_logs` (
  `log_id` mediumint(8) unsigned NOT NULL auto_increment,
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `money` decimal(20,3) NOT NULL default '0.000',
  `message` varchar(255) default NULL,
  `mtime` int(10) unsigned NOT NULL default '0',
  `payment_id` varchar(20) default NULL,
  `order_id` bigint(20) unsigned default NULL,
  `paymethod` varchar(100) default NULL,
  `memo` varchar(100) default NULL,
  `import_money` decimal(20,3) NOT NULL default '0.000',
  `explode_money` decimal(20,3) NOT NULL default '0.000',
  `member_advance` decimal(20,3) NOT NULL default '0.000',
  `shop_advance` decimal(20,3) NOT NULL default '0.000',
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`log_id`),
  KEY `ind_mtime` (`mtime`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_advance_logs`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_articles`
--

DROP TABLE IF EXISTS `sdb_articles`;
CREATE TABLE IF NOT EXISTS `sdb_articles` (
  `article_id` mediumint(8) unsigned NOT NULL auto_increment,
  `node_id` mediumint(8) unsigned NOT NULL default '0',
  `title` varchar(200) default NULL,
  `content` longtext,
  `uptime` int(10) unsigned default NULL,
  `ifpub` enum('0','1') default NULL,
  `align` varchar(12) default NULL,
  `filetype` varchar(15) default NULL,
  `filename` varchar(80) default NULL,
  `orderlist` mediumint(6) default NULL,
  `ordernum` int(10) default '50',
  `pubtime` int(10) unsigned default NULL,
  `disabled` enum('true','false') default 'false',
  `goodsinfo` text,
  PRIMARY KEY  (`article_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_orderlist` (`orderlist`),
  KEY `ind_ifpub` (`ifpub`),
  KEY `ind_uptime` (`uptime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `sdb_articles`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_autosync_rule`
--

DROP TABLE IF EXISTS `sdb_autosync_rule`;
CREATE TABLE IF NOT EXISTS `sdb_autosync_rule` (
  `rule_id` mediumint(8) unsigned NOT NULL auto_increment,
  `supplier_op_id` tinyint(3) NOT NULL default '0',
  `local_op_id` tinyint(3) NOT NULL default '0',
  `disabled` enum('true','false') NOT NULL default 'false',
  `memo` varchar(255) default NULL,
  `rule_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`rule_id`),
  KEY `index_1` (`rule_id`,`local_op_id`,`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_autosync_rule`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_autosync_rule_relation`
--

DROP TABLE IF EXISTS `sdb_autosync_rule_relation`;
CREATE TABLE IF NOT EXISTS `sdb_autosync_rule_relation` (
  `rule_id` mediumint(8) unsigned NOT NULL default '0',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `pline_id` tinyint(3) unsigned NOT NULL default '0',
  `memo` text,
  KEY `rsp_index` (`rule_id`,`supplier_id`,`pline_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_autosync_rule_relation`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_autosync_task`
--

DROP TABLE IF EXISTS `sdb_autosync_task`;
CREATE TABLE IF NOT EXISTS `sdb_autosync_task` (
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `command_id` int(10) unsigned NOT NULL default '0',
  `local_op_id` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`supplier_id`,`command_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_autosync_task`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_brand`
--

DROP TABLE IF EXISTS `sdb_brand`;
CREATE TABLE IF NOT EXISTS `sdb_brand` (
  `brand_id` mediumint(8) unsigned NOT NULL auto_increment,
  `supplier_id` int(10) unsigned default NULL,
  `supplier_brand_id` mediumint(8) unsigned default NULL,
  `brand_name` varchar(50) NOT NULL,
  `brand_url` varchar(255) default NULL,
  `brand_desc` longtext,
  `brand_logo` varchar(255) default NULL,
  `brand_keywords` longtext,
  `disabled` enum('true','false') default 'false',
  `ordernum` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`brand_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_ordernum` (`ordernum`),
  KEY `ind_supplier_brand` (`supplier_id`,`supplier_brand_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `sdb_brand`
--

INSERT INTO `sdb_brand` (`brand_id`, `supplier_id`, `supplier_brand_id`, `brand_name`, `brand_url`, `brand_desc`, `brand_logo`, `brand_keywords`, `disabled`, `ordernum`) VALUES
(18, NULL, NULL, '恰恰', 'http://', '洽洽香瓜子是洽洽食品股份有限公司生产的水煮葵花籽。它开创了香瓜子的煮制工艺，实现了香瓜子规模化、机械化的生产流程。洽洽是一个香瓜子品牌，但就我所看到的其在终端上的突出表现并不是一般休闲食品所能做到的。在家乐福、华联超市以及好又多等各类大卖场都发现了与易初莲花货架同样的洽洽产品展示效果。城市各个角落的小型连锁超市和便利店，杂货店乃至高速公路旁边加油站里的便利超市，洽洽也无一不是那么彰显的齐整陈列。中国有这么一家仅仅靠卖香瓜子就能在几年内卖出一个年销售额达到10个亿的休闲食品品牌来的优秀企业！后来关注了一下炒货行业，才知道，洽洽通过几年时间的默默耕耘，目前已经成为炒货行业的第一品牌。', 'http://upin99.ec-ae.com/brandpic/brand8.jpg', NULL, 'false', 0),
(19, NULL, NULL, '阿明', 'http://', '上海三明食品公司是国内知名的专业生产、销售“阿明”品牌休闲食品的企业。同行中，首家通过了ISO9001质量体系认证和HACCP食品卫生安全认证，\n并1998年至今连续被评为上海市名牌产品，2000年至今“阿明”商标被评为上海市著名商标。本公司也是唯一一家获得双殊荣的炒货为主的休闲食品的生产\n企业。', 'http://upin99.ec-ae.com/brandpic/brand5.jpg', '', 'false', 0),
(20, NULL, NULL, '天喔', 'http://', '天喔集团，即天喔食品（集团）有限公司，是以”天喔”休闲食品等品牌为龙头，集生产、代理、销售和物流服务为一体的快速消费品专业营销公司。', 'http://upin99.ec-ae.com/brandpic/brand4.jpg', NULL, 'false', 0),
(21, NULL, NULL, '华味亨', 'http://', '华味亨，中国著名蜜饯行业品牌，其全名为：杭州华味亨食品有限公司。华味亨创办于1992年，是一家传统加工型企业，经过十年的艰苦创业，企业不断壮大，\r\n已经拥有先进的检测设备。华味亨通过十多年的发展，有着完善的生产环节，良好的市场资源与成熟的营销团队，在整个干果蜜饯行业有着良好的口碑', 'http://upin99.ec-ae.com/brandpic/brand2.jpg', NULL, 'false', 0),
(22, NULL, NULL, '乐事', 'http://', '乐事（Lay’s，英国和爱尔兰叫Walkers，埃及叫Chipsy，越南叫Poca，以色列叫Tapuchips）是美国的薯片品牌，也是创立于1932年的一家公司的名字，自1965年起成为百事旗下产品。', 'http://upin99.ec-ae.com/brandpic/brand7.jpg', NULL, 'false', 0),
(23, NULL, NULL, '好丽友', 'http://', '成立于1956年的好丽友是韩国四大食品公司之一。好丽友在20世纪90年代中期进入中国市场，并决心把中国市场建成Best Global Pie Company形象的典范。好丽友在华投资总额超过5，000万美元，拥有2家法人 ― 好丽友食品有限公司和好丽友食品(上海)有限公司，在河北廊坊和上海青浦各建有一个生产基地，设北京本部、天津本部、上海本部、广州本部4个营业本部统管全国30家营业所，负责对华北、东北、西北、华东、华中、华南、西南等地区的销售。', 'http://upin99.ec-ae.com/brandpic/brand11.jpg', NULL, 'false', 0),
(25, NULL, NULL, '康师傅', 'http://', '康师傅控股有限公司（康师傅公司），总部设于中国天津市，主要在中国从事生产和销售方便面、饮品、糕饼以及相关配套产业的经营。2012年3月底，康师傅与百事可乐公司的战略联盟已经被商务部批准，“康师傅可乐”将现身于众。', 'http://upin99.ec-ae.com/brandpic/brand10.jpg', NULL, 'false', 0),
(26, NULL, NULL, '安怡', 'http://', 'Anlene<em>安怡</em>是新西兰乳制品巨头恒天然集团旗下的奶粉品牌，是专为成年人配制含有人体骨骼健康所需的营养物质，如钙、维生素D、锌、镁，以及牛奶蛋白等，用来帮助增强骨骼营养的乳品系列。', 'http://upin99.ec-ae.com/brandpic/brand1.jpg', NULL, 'false', 0),
(27, NULL, NULL, '桂格', 'http://', '桂格1901年，几家美国早期燕麦粉加工商联合成立公司，桂格麦片公司由此诞生。', 'http://upin99.ec-ae.com/brandpic/brand6.jpg', NULL, 'false', 0),
(28, NULL, NULL, '雀巢', 'http://', '雀巢公司，由亨利·雀巢（HenriNestle)于1867年创建，总部设在瑞士日内瓦湖畔的韦威 (Vevey)，在全球拥有500多家工厂，为世界上最大的食品制造商。公司起源于瑞士，最初是以生产婴儿食品起家，以生产巧克力棒和速溶咖啡闻名遐迩。', 'http://upin99.ec-ae.com/brandpic/brand9.jpg', '', 'false', 0),
(29, NULL, NULL, '金龙鱼', 'http://', '“金龙鱼”是新加坡郭兄弟粮油私人有限公司所拥有的食用油品牌。1974年，郭兄弟集团在中国投资了嘉里粮油（中国）有限公司，从此开辟了中国市场。益海嘉里是丰益国际在华投资的全资子公司，是世界最大的小包装油生产商之一。在中国境内 35 个城市设有企业110多家，在最大的货运枢纽附近建立58个生产基地，现在益海嘉里规模宏大的生产、销售和物流网络，覆盖了中国多个省、市、自治区的2839个县市，拥有近350个销售处，1585个经销商5000多家分销商，超过100万个终端保证供应。', 'http://upin99.ec-ae.com/brandpic/brand3.jpg', NULL, 'false', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_cachemgr`
--

DROP TABLE IF EXISTS `sdb_cachemgr`;
CREATE TABLE IF NOT EXISTS `sdb_cachemgr` (
  `cname` varchar(30) NOT NULL default '',
  `modified` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cname`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_cachemgr`
--

INSERT INTO `sdb_cachemgr` (`cname`, `modified`) VALUES
('MSG_MUTEX', 1392692948);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_comments`
--

DROP TABLE IF EXISTS `sdb_comments`;
CREATE TABLE IF NOT EXISTS `sdb_comments` (
  `comment_id` mediumint(8) unsigned NOT NULL auto_increment,
  `for_comment_id` mediumint(8) unsigned default NULL,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `object_type` enum('ask','discuss','buy') NOT NULL default 'ask',
  `author_id` mediumint(8) unsigned default NULL,
  `author` varchar(100) default NULL,
  `levelname` varchar(50) default NULL,
  `contact` varchar(255) default NULL,
  `mem_read_status` enum('true','false') NOT NULL default 'false',
  `adm_read_status` enum('true','false') NOT NULL default 'false',
  `time` int(10) unsigned NOT NULL default '0',
  `lastreply` int(10) unsigned NOT NULL default '0',
  `reply_name` varchar(100) default NULL,
  `title` varchar(255) default NULL,
  `comment` longtext,
  `ip` varchar(15) default NULL,
  `display` enum('true','false') NOT NULL default 'false',
  `p_index` enum('1','0') default '0',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`comment_id`),
  KEY `ind_goods` (`goods_id`),
  KEY `ind_member` (`author_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_pindex` (`p_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_comments`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_cost_sync`
--

DROP TABLE IF EXISTS `sdb_cost_sync`;
CREATE TABLE IF NOT EXISTS `sdb_cost_sync` (
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `bn` varchar(30) NOT NULL,
  `cost` decimal(20,3) NOT NULL default '0.000',
  `version_id` int(10) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`supplier_id`,`bn`),
  KEY `spid_gid` (`supplier_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_cost_sync`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_coupons`
--

DROP TABLE IF EXISTS `sdb_coupons`;
CREATE TABLE IF NOT EXISTS `sdb_coupons` (
  `cpns_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cpns_name` varchar(255) default NULL,
  `pmt_id` mediumint(8) unsigned default NULL,
  `cpns_prefix` varchar(50) NOT NULL default '',
  `cpns_gen_quantity` mediumint(8) unsigned NOT NULL default '0',
  `cpns_key` varchar(20) NOT NULL default '',
  `cpns_status` enum('0','1') NOT NULL default '1',
  `cpns_type` enum('0','1','2') NOT NULL default '1',
  `cpns_point` mediumint(8) unsigned default NULL,
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`cpns_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_cpns_prefix` (`cpns_prefix`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sdb_coupons`
--

INSERT INTO `sdb_coupons` (`cpns_id`, `cpns_name`, `pmt_id`, `cpns_prefix`, `cpns_gen_quantity`, `cpns_key`, `cpns_status`, `cpns_type`, `cpns_point`, `disabled`) VALUES
(1, '购物满200送太阳镜', 2, 'ASHOPEX09001', 0, '|ZD:O', '0', '0', NULL, 'false'),
(2, '购物满300立减30', 3, 'BSHOPEXPROM001', 0, 'hGG^', '0', '1', 300, 'false'),
(3, '注册会员即送10元优惠券', 4, 'B2009100001', 2, 'b!', '0', '1', NULL, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_coupons_p_items`
--

DROP TABLE IF EXISTS `sdb_coupons_p_items`;
CREATE TABLE IF NOT EXISTS `sdb_coupons_p_items` (
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `cpns_id` mediumint(8) unsigned NOT NULL default '0',
  `cpns_name` varchar(255) default NULL,
  `nums` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`order_id`,`cpns_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_coupons_p_items`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_coupons_u_items`
--

DROP TABLE IF EXISTS `sdb_coupons_u_items`;
CREATE TABLE IF NOT EXISTS `sdb_coupons_u_items` (
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `cpns_id` mediumint(8) unsigned NOT NULL default '0',
  `cpns_name` varchar(255) default NULL,
  `memc_code` varchar(255) default NULL,
  `cpns_type` enum('0','1','2') default NULL,
  PRIMARY KEY  (`order_id`,`cpns_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_coupons_u_items`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_ctlmap`
--

DROP TABLE IF EXISTS `sdb_ctlmap`;
CREATE TABLE IF NOT EXISTS `sdb_ctlmap` (
  `controller` varchar(100) NOT NULL,
  `plugin` varchar(100) NOT NULL,
  PRIMARY KEY  (`controller`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_ctlmap`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_currency`
--

DROP TABLE IF EXISTS `sdb_currency`;
CREATE TABLE IF NOT EXISTS `sdb_currency` (
  `cur_code` varchar(8) NOT NULL default '',
  `cur_name` varchar(20) NOT NULL default '',
  `cur_sign` varchar(5) default NULL,
  `cur_rate` decimal(10,4) NOT NULL default '1.0000',
  `def_cur` enum('true','false') NOT NULL default 'false',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`cur_code`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_currency`
--

INSERT INTO `sdb_currency` (`cur_code`, `cur_name`, `cur_sign`, `cur_rate`, `def_cur`, `disabled`) VALUES
('CNY', '人民币', '￥', 1.0000, 'true', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_dapi`
--

DROP TABLE IF EXISTS `sdb_dapi`;
CREATE TABLE IF NOT EXISTS `sdb_dapi` (
  `func` varchar(60) NOT NULL,
  `last_update` int(10) unsigned NOT NULL default '0',
  `checksum` varchar(32) default NULL,
  `code` text NOT NULL,
  PRIMARY KEY  (`func`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_dapi`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_dbver`
--

DROP TABLE IF EXISTS `sdb_dbver`;
CREATE TABLE IF NOT EXISTS `sdb_dbver` (
  `dbver` varchar(255) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_dbver`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_delivery`
--

DROP TABLE IF EXISTS `sdb_delivery`;
CREATE TABLE IF NOT EXISTS `sdb_delivery` (
  `delivery_id` bigint(20) unsigned NOT NULL auto_increment,
  `order_id` bigint(20) unsigned default NULL,
  `member_id` mediumint(8) unsigned default NULL,
  `money` decimal(20,3) NOT NULL default '0.000',
  `type` enum('return','delivery') NOT NULL default 'delivery',
  `is_protect` enum('true','false') NOT NULL default 'false',
  `delivery` varchar(20) default NULL,
  `logi_id` varchar(50) default NULL,
  `logi_name` varchar(100) default NULL,
  `logi_no` varchar(50) default NULL,
  `ship_name` varchar(50) default NULL,
  `ship_area` varchar(255) default NULL,
  `ship_addr` varchar(100) default NULL,
  `ship_zip` varchar(20) default NULL,
  `ship_tel` varchar(30) default NULL,
  `ship_mobile` varchar(50) default NULL,
  `ship_email` varchar(150) default NULL,
  `t_begin` int(10) unsigned default NULL,
  `t_end` int(10) unsigned default NULL,
  `op_name` varchar(50) default NULL,
  `status` enum('succ','failed','cancel','lost','progress','timeout','ready') NOT NULL default 'ready',
  `memo` longtext,
  `disabled` enum('true','false') default 'false',
  `supplier_id` int(10) unsigned default NULL,
  `supplier_delivery_id` varchar(30) default NULL,
  PRIMARY KEY  (`delivery_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_logi_no` (`logi_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120090312000002 ;

--
-- 转存表中的数据 `sdb_delivery`
--

INSERT INTO `sdb_delivery` (`delivery_id`, `order_id`, `member_id`, `money`, `type`, `is_protect`, `delivery`, `logi_id`, `logi_name`, `logi_no`, `ship_name`, `ship_area`, `ship_addr`, `ship_zip`, `ship_tel`, `ship_mobile`, `ship_email`, `t_begin`, `t_end`, `op_name`, `status`, `memo`, `disabled`, `supplier_id`, `supplier_delivery_id`) VALUES
(120090312000001, 20090312138789, 1, 0.000, 'delivery', 'false', '上海同城快递', NULL, NULL, '2222222', '刘刚', 'mainland:上海/上海市/黄浦区:23', '上海上海市黄浦区人民路0号', '200001', '021-66668888', '13966668888', NULL, 1236837075, NULL, 'admin', 'progress', '', 'false', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_delivery_item`
--

DROP TABLE IF EXISTS `sdb_delivery_item`;
CREATE TABLE IF NOT EXISTS `sdb_delivery_item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `delivery_id` bigint(20) unsigned NOT NULL default '0',
  `item_type` enum('goods','gift','adjunct','pkg') NOT NULL default 'goods',
  `product_id` bigint(20) unsigned NOT NULL default '0',
  `product_bn` varchar(30) default NULL,
  `product_name` varchar(200) default NULL,
  `number` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sdb_delivery_item`
--

INSERT INTO `sdb_delivery_item` (`item_id`, `delivery_id`, `item_type`, `product_id`, `product_bn`, `product_name`, `number`) VALUES
(1, 120090312000001, 'goods', 259, 'G49B7B00DB597F-4', '多彩人生多彩裤 (浅蓝色、XL)', 1),
(2, 120090312000001, 'goods', 250, 'G49B7AF2072AF8-2', '花色高邦运动鞋 (深蓝色、38)', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_dly_area`
--

DROP TABLE IF EXISTS `sdb_dly_area`;
CREATE TABLE IF NOT EXISTS `sdb_dly_area` (
  `area_id` mediumint(6) unsigned NOT NULL auto_increment,
  `name` varchar(80) NOT NULL default '',
  `disabled` enum('true','false') default 'false',
  `ordernum` smallint(4) unsigned default NULL,
  PRIMARY KEY  (`area_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_dly_area`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_dly_center`
--

DROP TABLE IF EXISTS `sdb_dly_center`;
CREATE TABLE IF NOT EXISTS `sdb_dly_center` (
  `dly_center_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `address` varchar(200) NOT NULL,
  `region` varchar(255) default NULL,
  `zip` varchar(20) default NULL,
  `phone` varchar(100) default NULL,
  `uname` varchar(100) default NULL,
  `cellphone` varchar(100) default NULL,
  `sex` enum('female','male') default NULL,
  `memo` longtext,
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`dly_center_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sdb_dly_center`
--

INSERT INTO `sdb_dly_center` (`dly_center_id`, `name`, `address`, `region`, `zip`, `phone`, `uname`, `cellphone`, `sex`, `memo`, `disabled`) VALUES
(1, '上海', '上海市徐汇区番愚路0号', 'mainland:上海/上海市/卢湾区:24', '200030', '021-66668888', '收货人Rocky', '13966668888', 'male', '', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_dly_corp`
--

DROP TABLE IF EXISTS `sdb_dly_corp`;
CREATE TABLE IF NOT EXISTS `sdb_dly_corp` (
  `corp_id` mediumint(8) unsigned NOT NULL auto_increment,
  `type` varchar(6) default NULL,
  `name` varchar(200) default NULL,
  `disabled` enum('true','false') default 'false',
  `ordernum` smallint(4) unsigned default NULL,
  `website` varchar(200) default NULL,
  PRIMARY KEY  (`corp_id`),
  KEY `ind_type` (`type`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_ordernum` (`ordernum`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `sdb_dly_corp`
--

INSERT INTO `sdb_dly_corp` (`corp_id`, `type`, `name`, `disabled`, `ordernum`, `website`) VALUES
(1, 'CNEMS', '中国邮政', 'false', NULL, 'http://www.ems.com.cn/'),
(2, 'CNST', '申通快递', 'false', NULL, 'http://www.sto.cn/'),
(3, 'CNYT', '圆通速递', 'false', NULL, 'http://www.yto.net.cn/'),
(4, 'CNSF', '顺丰速运', 'false', NULL, 'http://www.sf-express.com/'),
(5, 'CNTT', '天天快递', 'false', NULL, 'http://www.ttkd.cn/'),
(6, 'CNYD', '韵达快递', 'false', NULL, 'http://www.yundaex.com/'),
(7, 'CNZT', '中通速递', 'false', NULL, 'http://www.zto.cn/'),
(8, 'CNLB', '龙邦物流', 'false', NULL, 'http://www.lbex.com.cn/'),
(9, 'CNZJS', '宅急送', 'false', NULL, 'http://www.zjs.com.cn/'),
(10, 'CNQY', '全一快递', 'false', NULL, 'http://www.apex100.com/'),
(11, 'CNHT', '汇通速递', 'false', NULL, 'http://www.htky365.com/'),
(12, 'CNMH', '民航快递', 'false', NULL, 'http://www.cae.com.cn/'),
(13, 'CNYF', '亚风速递', 'false', NULL, 'http://www.airfex.cn/'),
(14, 'CNKJ', '快捷速递', 'false', NULL, 'http://www.fastexpress.com.cn/'),
(15, 'DDS', 'DDS快递', 'false', NULL, 'http://www.qc-dds.net/'),
(16, 'CNHY', '华宇物流', 'false', NULL, 'http://www.hoau.net/'),
(17, 'CNZY', '中铁快运', 'false', NULL, 'http://www.cre.cn/'),
(18, 'FEDEX', 'FedEx', 'false', NULL, 'http://www.fedex.com/cn/'),
(19, 'UPS', 'UPS', 'false', NULL, 'http://www.ups.com/'),
(20, 'DHL', 'DHL', 'false', NULL, 'http://www.cn.dhl.com/');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_dly_h_area`
--

DROP TABLE IF EXISTS `sdb_dly_h_area`;
CREATE TABLE IF NOT EXISTS `sdb_dly_h_area` (
  `dha_id` mediumint(8) unsigned NOT NULL auto_increment,
  `dt_id` mediumint(8) unsigned default NULL,
  `area_id` mediumint(6) unsigned default '0',
  `price` varchar(100) default '0',
  `has_cod` tinyint(1) unsigned NOT NULL default '0',
  `areaname_group` longtext,
  `areaid_group` longtext,
  `config` varchar(255) default NULL,
  `expressions` varchar(255) default NULL,
  `ordernum` smallint(4) unsigned default NULL,
  PRIMARY KEY  (`dha_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `sdb_dly_h_area`
--

INSERT INTO `sdb_dly_h_area` (`dha_id`, `dt_id`, `area_id`, `price`, `has_cod`, `areaname_group`, `areaid_group`, `config`, `expressions`, `ordernum`) VALUES
(1, 2, 0, NULL, 0, '广东', ',423,565,564,563,562,561,560,559,558,557,556,555,554,553,552,551,550,549,548,547,546,545,544,543,542,541,540,539,538,537,536,535,534,533,532,531,530,529,528,527,526,525,524,523,522,521,520,519,518,517,516,515,514,513,512,511,510,509,508,507,506,505,504,503,502,501,500,499,498,497,496,495,494,493,492,491,490,489,488,487,486,485,484,483,482,481,480,479,478,477,476,475,474,473,472,471,470,469,468,467,466,465,464,463,462,461,460,459,458,457,456,455,454,453,452,451,450,449,448,447,446,445,444,443,442,441,440,439,438,437,436,435,434,433,432,431,430,429,428,427,426,425,424,423,', 'a:5:{s:8:"firstFee";s:1:"8";s:11:"continueFee";s:1:"2";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*8+ {{w-1000}-0.6}*[(w-1000)/1000]*2', NULL),
(2, 2, 0, NULL, 0, '上海,福建,广西,云南', ',21,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,227,321,320,319,318,317,316,315,314,313,312,311,310,309,308,307,306,305,304,303,302,301,300,299,298,297,296,295,294,293,292,291,290,289,288,287,286,285,284,283,282,281,280,279,278,277,276,275,274,273,272,271,270,269,268,267,266,265,264,263,262,261,260,259,258,257,256,255,254,253,252,251,250,249,248,247,246,244,245,243,242,241,240,239,238,237,236,235,234,233,232,231,230,229,228,227,566,689,688,687,686,685,684,683,682,681,680,679,678,677,676,675,674,673,672,671,670,669,668,667,666,665,664,663,662,661,660,659,658,657,656,655,654,653,652,651,650,649,648,647,646,645,644,643,642,641,640,639,638,637,636,635,634,633,632,631,630,629,628,627,626,625,624,623,622,621,620,619,618,617,616,615,614,613,612,611,610,609,608,607,606,605,604,603,602,601,600,599,598,597,595,596,593,594,592,591,590,589,588,587,586,585,584,583,582,581,580,579,578,577,576,575,574,573,572,571,570,569,568,567,566,2987,3132,3131,3130,3129,3128,3127,3125,3126,3124,3123,3122,3121,3119,3120,3118,3117,3116,3115,3114,3113,3112,3111,3110,3109,3108,3107,3106,3105,3104,3102,3103,3101,3099,3100,3098,3091,3097,3096,3095,3094,3093,3092,3090,3088,3089,3087,3086,3085,3084,3083,3082,3081,3080,3078,3079,3076,3077,3075,3074,3073,3070,3071,3072,3069,3068,3067,3066,3065,3064,3063,3062,3061,3054,3055,3056,3060,3059,3058,3057,3053,3052,3049,3050,3051,3048,3047,3046,3045,3044,3043,3042,3041,3040,3039,3038,3037,3036,3035,3034,3033,3032,3031,3030,3028,3029,3027,3026,3025,3024,3023,3022,3021,3020,3019,3018,3017,3016,3015,3014,3013,3012,3011,3010,3009,3008,3007,3006,3005,3004,3003,3002,3001,3000,2999,2998,2997,2996,2995,2994,2993,2992,2991,2990,2989,2988,2987,', 'a:5:{s:8:"firstFee";s:2:"12";s:11:"continueFee";s:1:"2";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*12+ {{w-1000}-0.6}*[(w-1000)/1000]*2', NULL),
(3, 2, 0, NULL, 0, '香港,澳门,台湾', ',3235,3236,3237,3238,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250,3251,3252,3253,3254,3255,3256,3257,3258,3259,3260,3261,3262,3263,3264,3265,3266,', 'a:5:{s:8:"firstFee";s:2:"30";s:11:"continueFee";s:1:"3";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*30+ {{w-1000}-0.6}*[(w-1000)/1000]*3', NULL),
(4, 3, 0, NULL, 0, '上海', ',21,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,', 'a:5:{s:8:"firstFee";s:1:"8";s:11:"continueFee";s:1:"2";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*8+ {{w-1000}-0.6}*[(w-1000)/1000]*2', NULL),
(5, 3, 0, NULL, 0, '江苏,浙江', ',1643,1762,1761,1760,1759,1758,1757,1756,1755,1754,1753,1752,1751,1750,1749,1748,1747,1746,1745,1744,1743,1742,1741,1740,1739,1738,1737,1736,1735,1734,1733,1732,1731,1730,1729,1728,1727,1726,1725,1724,1723,1722,1721,1720,1719,1718,1717,1716,1715,1714,1713,1712,1711,1710,1709,1708,1707,1706,1705,1704,1703,1702,1701,1700,1699,1698,1697,1696,1695,1694,1693,1692,1691,1690,1689,1688,1687,1686,1685,1684,1683,1682,1681,1680,1679,1678,1677,1676,1675,1674,1673,1672,1671,1670,1669,1668,1667,1666,1665,1664,1663,1662,1661,1660,1659,1658,1657,1656,1655,1654,1653,1648,1649,1650,1651,1652,1647,1646,1645,1644,1643,3133,3234,3233,3232,3231,3230,3229,3228,3227,3226,3225,3224,3223,3222,3221,3220,3219,3218,3217,3216,3215,3214,3213,3212,3211,3210,3209,3208,3207,3206,3205,3204,3203,3202,3201,3200,3199,3198,3197,3196,3195,3194,3193,3192,3191,3186,3187,3188,3190,3189,3185,3184,3183,3182,3181,3180,3179,3178,3177,3176,3175,3174,3173,3172,3171,3170,3169,3168,3167,3166,3165,3164,3163,3162,3161,3160,3159,3158,3151,3157,3156,3155,3154,3153,3152,3150,3149,3148,3147,3146,3145,3144,3143,3142,3141,3140,3139,3138,3137,3136,3135,3134,3133,', 'a:5:{s:8:"firstFee";s:2:"15";s:11:"continueFee";s:1:"2";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*15+ {{w-1000}-0.6}*[(w-1000)/1000]*2', NULL),
(6, 3, 0, NULL, 0, '香港,澳门,台湾', ',3235,3236,3237,3238,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250,3251,3252,3253,3254,3255,3256,3257,3258,3259,3260,3261,3262,3263,3264,3265,3266,', 'a:5:{s:8:"firstFee";s:2:"30";s:11:"continueFee";s:1:"3";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*30+ {{w-1000}-0.6}*[(w-1000)/1000]*3', NULL),
(7, 4, 0, NULL, 0, '上海', ',21,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,', 'a:5:{s:8:"firstFee";s:1:"6";s:11:"continueFee";s:1:"2";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*6+ {{w-1000}-0.6}*[(w-1000)/1000]*2', NULL),
(12, 9, 0, NULL, 0, '上海,江苏,浙江', ',21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660,1661,1662,1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683,1684,1685,1686,1687,1688,1689,1690,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1731,1732,1733,1734,1735,1736,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1762,3133,3134,3135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181,3182,3183,3184,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3200,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,3215,3216,3217,3218,3219,3220,3221,3222,3223,3224,3225,3226,3227,3228,3229,3230,3231,3232,3233,3234,', 'a:5:{s:8:"firstFee";s:2:"12";s:11:"continueFee";s:1:"2";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*12+ {{w-1000}-0.6}*[(w-1000)/1000]*2', NULL),
(13, 9, 0, NULL, 0, '﻿北京,天津,广东', ',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,', 'a:5:{s:8:"firstFee";s:2:"20";s:11:"continueFee";s:1:"3";s:6:"hasCod";N;s:11:"expressions";s:0:"";s:6:"useexp";s:1:"0";}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*20+ {{w-1000}-0.6}*[(w-1000)/1000]*3', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_dly_type`
--

DROP TABLE IF EXISTS `sdb_dly_type`;
CREATE TABLE IF NOT EXISTS `sdb_dly_type` (
  `dt_id` mediumint(8) unsigned NOT NULL auto_increment,
  `dt_name` varchar(50) default NULL,
  `dt_config` longtext,
  `dt_expressions` longtext,
  `detail` longtext,
  `price` longtext NOT NULL,
  `type` enum('0','1') NOT NULL default '1',
  `gateway` mediumint(8) unsigned default '0',
  `protect` enum('0','1') NOT NULL default '0',
  `protect_rate` float(6,3) default NULL,
  `ordernum` smallint(4) default '0',
  `has_cod` enum('0','1') NOT NULL default '0',
  `minprice` float(10,2) NOT NULL default '0.00',
  `disabled` enum('true','false') default 'false',
  `corp_id` int(10) unsigned default NULL,
  `dt_status` enum('0','1') default '1',
  PRIMARY KEY  (`dt_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `sdb_dly_type`
--

INSERT INTO `sdb_dly_type` (`dt_id`, `dt_name`, `dt_config`, `dt_expressions`, `detail`, `price`, `type`, `gateway`, `protect`, `protect_rate`, `ordernum`, `has_cod`, `minprice`, `disabled`, `corp_id`, `dt_status`) VALUES
(1, 'EMS-中国邮政（示范）', 'a:9:{s:10:"firstprice";s:2:"20";s:9:"firstunit";s:3:"500";s:13:"continueprice";s:1:"9";s:12:"continueunit";s:3:"500";s:15:"confexpressions";s:0:"";s:7:"setting";s:11:"setting_hda";s:9:"dt_useexp";i:0;s:7:"has_cod";s:1:"0";s:10:"defAreaFee";i:0;}', '{{w-0}-0.4}*{{{500-w}-0.4}+1}*20+ {{w-500}-0.6}*[(w-500)/500]*9', '', '0', '1', 0, '0', 0.000, 50, '0', 0.00, 'false', 1, '1'),
(2, '快递-申通深圳（示范）', 'a:9:{s:10:"firstprice";s:2:"15";s:9:"firstunit";s:4:"1000";s:13:"continueprice";s:2:"10";s:12:"continueunit";s:4:"1000";s:15:"confexpressions";s:0:"";s:7:"setting";s:11:"setting_sda";s:9:"dt_useexp";i:0;s:7:"has_cod";s:1:"0";s:10:"defAreaFee";i:1;}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*15+ {{w-1000}-0.6}*[(w-1000)/1000]*10', '<DIV class=uarea>国内一般1-2天送达</DIV>', '0', '1', 0, '0', 0.000, 50, '0', 0.00, 'false', 2, '1'),
(3, '快递-顺丰上海（示范）', 'a:9:{s:10:"firstprice";s:2:"20";s:9:"firstunit";s:4:"1000";s:13:"continueprice";s:2:"10";s:12:"continueunit";s:4:"1000";s:15:"confexpressions";s:0:"";s:7:"setting";s:11:"setting_sda";s:9:"dt_useexp";i:0;s:7:"has_cod";s:1:"0";s:10:"defAreaFee";i:1;}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*20+ {{w-1000}-0.6}*[(w-1000)/1000]*10', '<DIV class=uarea>\r\n<P>江浙沪当日送达，其他地区隔日送达</P></DIV>', '0', '1', 0, '0', 0.000, 50, '0', 0.00, 'false', 4, '1'),
(4, '上海同城快递（示范）', 'a:9:{s:10:"firstprice";s:0:"";s:9:"firstunit";s:4:"1000";s:13:"continueprice";s:0:"";s:12:"continueunit";s:4:"1000";s:15:"confexpressions";s:0:"";s:7:"setting";s:11:"setting_sda";s:9:"dt_useexp";i:0;s:7:"has_cod";s:1:"0";s:10:"defAreaFee";i:0;}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*+ {{w-1000}-0.6}*[(w-1000)/1000]*', '<DIV class=uarea>当日到达</DIV>', '0', '1', 0, '0', 0.000, 50, '0', 0.00, 'false', 0, '1'),
(8, '平邮（示范）', 'a:9:{s:10:"firstprice";s:1:"5";s:9:"firstunit";s:3:"500";s:13:"continueprice";s:1:"2";s:12:"continueunit";s:3:"500";s:15:"confexpressions";s:0:"";s:7:"setting";s:11:"setting_hda";s:9:"dt_useexp";i:0;s:7:"has_cod";s:1:"0";s:10:"defAreaFee";i:0;}', '{{w-0}-0.4}*{{{500-w}-0.4}+1}*5+ {{w-500}-0.6}*[(w-500)/500]*2', '<DIV class=uarea>&nbsp;</DIV>', '0', '1', 0, '0', 0.000, 50, '0', 0.00, 'false', 0, '1'),
(10, '上门自取（示范）', 'a:9:{s:10:"firstprice";s:1:"0";s:9:"firstunit";s:4:"1000";s:13:"continueprice";s:1:"0";s:12:"continueunit";s:4:"1000";s:15:"confexpressions";s:0:"";s:7:"setting";s:11:"setting_hda";s:9:"dt_useexp";i:0;s:7:"has_cod";s:1:"0";s:10:"defAreaFee";i:0;}', '{{w-0}-0.4}*{{{1000-w}-0.4}+1}*0+ {{w-1000}-0.6}*[(w-1000)/1000]*0', '<DIV class=uarea>到指定门店自取</DIV>', '0', '1', 0, '0', 0.000, 50, '0', 0.00, 'false', 0, '1');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_gift`
--

DROP TABLE IF EXISTS `sdb_gift`;
CREATE TABLE IF NOT EXISTS `sdb_gift` (
  `gift_id` mediumint(8) unsigned NOT NULL auto_increment,
  `gift_bn` varchar(255) default '0',
  `giftcat_id` mediumint(8) unsigned default NULL,
  `insert_time` int(10) unsigned NOT NULL default '0',
  `update_time` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `thumbnail_pic` varchar(255) default NULL,
  `small_pic` varchar(255) default NULL,
  `big_pic` varchar(255) default NULL,
  `image_file` longtext,
  `intro` varchar(255) default NULL,
  `gift_describe` longtext,
  `weight` int(11) NOT NULL default '0',
  `storage` mediumint(8) unsigned NOT NULL default '0',
  `price` varchar(255) default NULL,
  `orderlist` mediumint(8) unsigned default '0',
  `shop_iffb` enum('0','1') NOT NULL default '1',
  `limit_num` mediumint(8) unsigned default '0',
  `limit_start_time` int(10) unsigned NOT NULL default '0',
  `limit_end_time` int(10) unsigned NOT NULL default '0',
  `limit_level` varchar(255) default NULL,
  `ifrecommend` enum('0','1') NOT NULL default '0',
  `point` mediumint(8) unsigned NOT NULL default '0',
  `freez` mediumint(8) unsigned default '0',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`gift_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sdb_gift`
--

INSERT INTO `sdb_gift` (`gift_id`, `gift_bn`, `giftcat_id`, `insert_time`, `update_time`, `name`, `thumbnail_pic`, `small_pic`, `big_pic`, `image_file`, `intro`, `gift_describe`, `weight`, `storage`, `price`, `orderlist`, `shop_iffb`, `limit_num`, `limit_start_time`, `limit_end_time`, `limit_level`, `ifrecommend`, `point`, `freez`, `disabled`) VALUES
(1, '0', 2, 1236838419, 0, '好莱坞热销钛金眼睛', 'http://pic.shopex.cn/pictures/gift/3b70e21faf418afd.gif', 'http://pic.shopex.cn/pictures/gift/edb0a0134b833618.jpg', NULL, NULL, '钛金镜架，质感非同一般', '', 30, 50, '136', 1, '0', 1, 1235836800, 1330531200, '1,2,3', '0', 500, 0, 'false'),
(2, '0', 2, 1236838566, 1236844944, '防紫外线尚酷太阳镜', 'http://pic.shopex.cn/pictures/gift/59626b937f3bd84d.gif', 'http://pic.shopex.cn/pictures/gift/11d05d4066290be9.jpg', NULL, NULL, '军用级别，防紫外线，高强度镜片', '', 30, 50, '136', 2, '0', 1, 1235836800, 1330531200, '1,2,3', '0', 500, 0, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_gift_cat`
--

DROP TABLE IF EXISTS `sdb_gift_cat`;
CREATE TABLE IF NOT EXISTS `sdb_gift_cat` (
  `giftcat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat` varchar(255) default NULL,
  `orderlist` mediumint(6) unsigned default NULL,
  `shop_iffb` enum('0','1') default '1',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`giftcat_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sdb_gift_cat`
--

INSERT INTO `sdb_gift_cat` (`giftcat_id`, `cat`, `orderlist`, `shop_iffb`, `disabled`) VALUES
(1, '数码', 1, '0', 'false'),
(2, '休闲', 2, '0', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_gift_items`
--

DROP TABLE IF EXISTS `sdb_gift_items`;
CREATE TABLE IF NOT EXISTS `sdb_gift_items` (
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `gift_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(200) default NULL,
  `point` int(8) default NULL,
  `nums` mediumint(8) unsigned default NULL,
  `amount` int(10) unsigned default NULL,
  `sendnum` mediumint(8) unsigned default '0',
  `getmethod` enum('present','exchange') NOT NULL default 'present',
  PRIMARY KEY  (`order_id`,`gift_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_gift_items`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_gimages`
--

DROP TABLE IF EXISTS `sdb_gimages`;
CREATE TABLE IF NOT EXISTS `sdb_gimages` (
  `gimage_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned default NULL,
  `is_remote` enum('true','false') NOT NULL default 'false',
  `source` varchar(255) NOT NULL default '',
  `orderby` tinyint(3) unsigned NOT NULL default '0',
  `src_size_width` int(10) unsigned NOT NULL default '0',
  `src_size_height` int(10) unsigned NOT NULL default '0',
  `small` varchar(255) default NULL,
  `big` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  `up_time` int(10) unsigned NOT NULL default '0',
  `supplier_id` int(10) unsigned default NULL,
  `supplier_gimage_id` mediumint(8) unsigned default NULL,
  `sync_time` int(10) unsigned default '0',
  PRIMARY KEY  (`gimage_id`),
  KEY `ind_up_time` (`up_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=494 ;

--
-- 转存表中的数据 `sdb_gimages`
--

INSERT INTO `sdb_gimages` (`gimage_id`, `goods_id`, `is_remote`, `source`, `orderby`, `src_size_width`, `src_size_height`, `small`, `big`, `thumbnail`, `up_time`, `supplier_id`, `supplier_gimage_id`, `sync_time`) VALUES
(457, 78, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic1_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic1_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic1_3.jpg', 1392347454, NULL, NULL, 0),
(458, 79, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic2_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic2_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic2_3.jpg', 1392347911, NULL, NULL, 0),
(459, 80, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic3_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic3_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic3_3.jpg', 1392348291, NULL, NULL, 0),
(460, 81, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic4_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic4_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic4_3.jpg', 1392348533, NULL, NULL, 0),
(461, 82, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic5_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic5_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic5_3.jpg', 1392348881, NULL, NULL, 0),
(462, 83, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic6_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic6_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic6_3.jpg', 1392349312, NULL, NULL, 0),
(463, 84, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic7_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic7_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic7_3.jpg', 1392349544, NULL, NULL, 0),
(464, 85, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic8_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic8_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic8_3.jpg', 1392349857, NULL, NULL, 0),
(465, 86, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic9_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic9_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic9_3.jpg', 1392350153, NULL, NULL, 0),
(466, 87, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic10_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic10_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic10_3.jpg', 1392350406, NULL, NULL, 0),
(467, 88, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic11_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic11_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic11_3.jpg', 1392350877, NULL, NULL, 0),
(468, 89, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic12_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic12_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic12_3.jpg', 1392351109, NULL, NULL, 0),
(469, 90, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic13_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic13_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic13_3.jpg', 1392351283, NULL, NULL, 0),
(470, 91, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic14_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic14_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic14_3.jpg', 1392351416, NULL, NULL, 0),
(471, 92, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic15_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic15_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic15_3.jpg', 1392351652, NULL, NULL, 0),
(472, 93, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic16_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic16_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic16_3.jpg', 1392351874, NULL, NULL, 0),
(473, 94, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic17_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic17_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic17_3.jpg', 1392355224, NULL, NULL, 0),
(474, 95, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic18_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic18_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic18_3.jpg', 1392355463, NULL, NULL, 0),
(475, 96, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic19_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic19_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic19_3.jpg', 1392355723, NULL, NULL, 0),
(476, 97, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic20_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic20_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic20_3.jpg', 1392355984, NULL, NULL, 0),
(477, 98, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic21_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic21_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic21_3.jpg', 1392356288, NULL, NULL, 0),
(478, 99, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic22_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic22_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic22_3.jpg', 1392356507, NULL, NULL, 0),
(479, 100, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic23_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic23_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic23_3.jpg', 1392356774, NULL, NULL, 0),
(480, 101, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic24_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic24_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic24_3.jpg', 1392357507, NULL, NULL, 0),
(481, 102, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic25_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic25_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic25_3.jpg', 1392357806, NULL, NULL, 0),
(482, 103, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic26_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic26_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic26_3.jpg', 1392358182, NULL, NULL, 0),
(483, 104, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic27_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic27_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic27_3.jpg', 1392358350, NULL, NULL, 0),
(484, 105, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic28_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic28_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic28_3.jpg', 1392358715, NULL, NULL, 0),
(485, 106, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic29_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic29_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic29_3.jpg', 1392359056, NULL, NULL, 0),
(486, 107, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic30_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic30_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic30_3.jpg', 1392359258, NULL, NULL, 0),
(487, 108, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic31_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic31_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic31_3.jpg', 1392604428, NULL, NULL, 0),
(488, 109, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic32_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic32_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic32_3.jpg', 1392605120, NULL, NULL, 0),
(489, 110, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic33_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic33_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic33_3.jpg', 1392605501, NULL, NULL, 0),
(490, NULL, 'true', '', 0, 450, 450, NULL, NULL, NULL, 1392605652, NULL, NULL, 0),
(491, NULL, 'true', '', 0, 450, 450, NULL, NULL, NULL, 1392605861, NULL, NULL, 0),
(492, 111, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic34_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic34_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic34_3.jpg', 1392605902, NULL, NULL, 0),
(493, 112, 'true', '', 0, 450, 450, 'http://upin99.ec-ae.com/goodspic/upin99_pic35_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic35_1.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic35_3.jpg', 1392606549, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_gnotify`
--

DROP TABLE IF EXISTS `sdb_gnotify`;
CREATE TABLE IF NOT EXISTS `sdb_gnotify` (
  `gnotify_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned default NULL,
  `member_id` mediumint(8) unsigned default NULL,
  `product_id` mediumint(8) unsigned default NULL,
  `email` varchar(200) default NULL,
  `status` enum('ready','send','progress') NOT NULL default 'ready',
  `send_time` int(10) unsigned default NULL,
  `creat_time` int(10) unsigned default NULL,
  `disabled` enum('true','false') NOT NULL default 'false',
  `remark` longtext,
  PRIMARY KEY  (`gnotify_id`),
  KEY `ind_goods` (`goods_id`,`product_id`,`member_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_gnotify`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods`
--

DROP TABLE IF EXISTS `sdb_goods`;
CREATE TABLE IF NOT EXISTS `sdb_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL auto_increment,
  `cat_id` int(10) NOT NULL default '0',
  `type_id` int(10) default NULL,
  `goods_type` enum('normal','bind') NOT NULL default 'normal',
  `brand_id` mediumint(8) unsigned default NULL,
  `brand` varchar(100) default NULL,
  `supplier_id` int(10) unsigned default NULL,
  `supplier_goods_id` mediumint(8) unsigned default NULL,
  `wss_params` longtext,
  `image_default` longtext,
  `udfimg` enum('true','false') default 'false',
  `thumbnail_pic` varchar(255) default NULL,
  `small_pic` varchar(255) default NULL,
  `big_pic` varchar(255) default NULL,
  `image_file` longtext,
  `brief` varchar(255) default NULL,
  `intro` longtext,
  `mktprice` decimal(20,3) default NULL,
  `cost` decimal(20,3) NOT NULL default '0.000',
  `price` decimal(20,3) NOT NULL default '0.000',
  `bn` varchar(200) default NULL,
  `name` varchar(200) NOT NULL default '',
  `marketable` enum('true','false') NOT NULL default 'true',
  `weight` decimal(20,3) default NULL,
  `unit` varchar(20) default NULL,
  `store` mediumint(8) unsigned default NULL,
  `store_place` varchar(255) default NULL,
  `score_setting` enum('percent','number') default 'number',
  `score` mediumint(8) unsigned default NULL,
  `spec` longtext,
  `pdt_desc` longtext,
  `spec_desc` longtext,
  `params` longtext,
  `uptime` int(10) unsigned default NULL,
  `downtime` int(10) unsigned default NULL,
  `last_modify` int(10) unsigned default NULL,
  `disabled` enum('true','false') NOT NULL default 'false',
  `notify_num` mediumint(8) unsigned NOT NULL default '0',
  `rank` decimal(5,3) default '5.000',
  `rank_count` int(10) unsigned default '0',
  `comments_count` int(10) unsigned NOT NULL default '0',
  `view_w_count` int(10) unsigned NOT NULL default '0',
  `view_count` int(10) unsigned NOT NULL default '0',
  `buy_count` int(10) unsigned NOT NULL default '0',
  `buy_w_count` int(10) unsigned NOT NULL default '0',
  `count_stat` longtext,
  `p_order` mediumint(8) unsigned NOT NULL default '30',
  `d_order` mediumint(8) unsigned NOT NULL default '30',
  `p_1` varchar(255) default NULL,
  `p_2` varchar(255) default NULL,
  `p_3` varchar(255) default NULL,
  `p_4` varchar(255) default NULL,
  `p_5` varchar(255) default NULL,
  `p_6` varchar(255) default NULL,
  `p_7` varchar(255) default NULL,
  `p_8` varchar(255) default NULL,
  `p_9` varchar(255) default NULL,
  `p_10` varchar(255) default NULL,
  `p_11` varchar(255) default NULL,
  `p_12` varchar(255) default NULL,
  `p_13` varchar(255) default NULL,
  `p_14` varchar(255) default NULL,
  `p_15` varchar(255) default NULL,
  `p_16` varchar(255) default NULL,
  `p_17` varchar(255) default NULL,
  `p_18` varchar(255) default NULL,
  `p_19` varchar(255) default NULL,
  `p_20` varchar(255) default NULL,
  `p_21` varchar(255) default NULL,
  `p_22` varchar(255) default NULL,
  `p_23` varchar(255) default NULL,
  `p_24` varchar(255) default NULL,
  `p_25` varchar(255) default NULL,
  `p_26` varchar(255) default NULL,
  `p_27` varchar(255) default NULL,
  `p_28` varchar(255) default NULL,
  `goods_info_update_status` enum('true','false') default 'false',
  `stock_update_status` enum('true','false') default 'false',
  `marketable_update_status` enum('true','false') default 'false',
  `img_update_status` enum('true','false') default 'false',
  PRIMARY KEY  (`goods_id`),
  KEY `uni_bn` (`bn`),
  KEY `ind_p_1` (`p_1`),
  KEY `ind_p_2` (`p_2`),
  KEY `ind_p_3` (`p_3`),
  KEY `ind_p_4` (`p_4`),
  KEY `ind_p_23` (`p_23`),
  KEY `ind_p_22` (`p_22`),
  KEY `ind_p_21` (`p_21`),
  KEY `ind_frontend` (`disabled`,`goods_type`,`marketable`),
  KEY `supplier_goods` (`supplier_id`,`supplier_goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `sdb_goods`
--

INSERT INTO `sdb_goods` (`goods_id`, `cat_id`, `type_id`, `goods_type`, `brand_id`, `brand`, `supplier_id`, `supplier_goods_id`, `wss_params`, `image_default`, `udfimg`, `thumbnail_pic`, `small_pic`, `big_pic`, `image_file`, `brief`, `intro`, `mktprice`, `cost`, `price`, `bn`, `name`, `marketable`, `weight`, `unit`, `store`, `store_place`, `score_setting`, `score`, `spec`, `pdt_desc`, `spec_desc`, `params`, `uptime`, `downtime`, `last_modify`, `disabled`, `notify_num`, `rank`, `rank_count`, `comments_count`, `view_w_count`, `view_count`, `buy_count`, `buy_w_count`, `count_stat`, `p_order`, `d_order`, `p_1`, `p_2`, `p_3`, `p_4`, `p_5`, `p_6`, `p_7`, `p_8`, `p_9`, `p_10`, `p_11`, `p_12`, `p_13`, `p_14`, `p_15`, `p_16`, `p_17`, `p_18`, `p_19`, `p_20`, `p_21`, `p_22`, `p_23`, `p_24`, `p_25`, `p_26`, `p_27`, `p_28`, `goods_info_update_status`, `stock_update_status`, `marketable_update_status`, `img_update_status`) VALUES
(78, 29, 7, 'normal', 18, '恰恰', NULL, NULL, NULL, '457', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic1_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic1_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic1_1.jpg', NULL, '年货 坚果 炒货 送礼 礼品 本商品包装更新升级中，新老包装随机发送', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic1_4.jpg"><br/>\r\n', 13.800, 0.000, 11.500, 'G52FD893DF178B', '洽洽 香瓜子 百煮入味香 308g/袋', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392347454, NULL, 1392360124, 'false', 0, 5.000, 0, 0, 9, 9, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:1;i:16118;i:8;}s:3:"buy";a:0:{}}', 78, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(79, 29, 7, 'normal', 19, '阿明', NULL, NULL, NULL, '458', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic2_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic2_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic2_1.jpg', NULL, '年货 坚果 炒货零食，休闲好选择', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic2_4.jpg">', 13.800, 0.000, 11.500, 'G52FD8B07BC4B2', '阿明 菊花香瓜子 308g/袋', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392347911, NULL, 1392360384, 'false', 0, 5.000, 0, 0, 6, 6, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:6;}s:3:"buy";a:0:{}}', 79, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(80, 30, 7, 'normal', 20, '天喔', NULL, NULL, NULL, '459', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic3_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic3_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic3_1.jpg', NULL, '年货 坚果 本商品包装更新升级中，新老包装随机发送，敬请谅解', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic3_4.jpg">', 50.400, 0.000, 42.000, 'G52FD8C8355ED9', '天喔 美国扁桃仁 230g/罐', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392348291, NULL, 1392360731, 'false', 0, 5.000, 0, 0, 6, 6, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:4;}s:3:"buy";a:0:{}}', 80, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(81, 30, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '460', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic4_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic4_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic4_1.jpg', NULL, '年货 坚果', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic4_4.jpg">', 30.000, 0.000, 25.000, 'G52FD8D756D929', '金百岁农庄 精品扁桃仁 128g/袋', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392348533, NULL, 1392351666, 'false', 0, 5.000, 0, 0, 5, 5, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:1;i:16118;i:4;}s:3:"buy";a:0:{}}', 81, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(82, 31, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '461', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic5_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic5_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic5_1.jpg', NULL, '年货 坚果 坚果 炒货零食，休闲好选择', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic5_4.jpg">', 10.200, 0.000, 8.500, 'G52FD8ED10ED13', '黄飞红 麻辣花生 210g/袋', 'true', 210.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392348881, NULL, 1392348930, 'false', 0, 5.000, 0, 0, 8, 8, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:4;i:16118;i:4;}s:3:"buy";a:0:{}}', 82, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(83, 32, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '462', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic6_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic6_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic6_1.jpg', NULL, '本商品包装更新升级中，新老包装随机发送', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic6_4.jpg">', 2.880, 0.000, 2.400, 'G52FD90619E983', '旺旺 挑豆 回味蚕豆 45g/袋 （随手包）', 'true', 45.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392349281, NULL, 1392349312, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 83, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(84, 32, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '463', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic7_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic7_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic7_1.jpg', NULL, '休闲零嘴，美味健康', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic7_4.jpg">', 3.480, 0.000, 2.900, 'G52FD916834A45', '洽洽 怪味豆 蟹黄味 80g', 'true', 80.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392349544, NULL, 1392349544, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 84, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(85, 33, 7, 'normal', 21, '华味亨', NULL, NULL, NULL, '464', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic8_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic8_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic8_1.jpg', NULL, '本商品包装更新升级中，新老包装随机发送', '<p><font face="宋体" size="2">产地：浙江<br/>\n保质期：360天<br/>\n储藏方法：存放于阴凉干爽处，避免阳光直射。<br/>\n配料表：无核鲜枣、白砂糖、低聚麦芽糖、枣花蜜、阿胶等</font></p>\n<div class="detail_box">\n<p class="detail_page_t shangjiadestemp" id="shangjiaDesTemp_0" name="商品特色">商品特色</p>\n<p><font face="宋体" size="2">本品选用优质红枣为原料，秉承世代相传的蜜枣配方，辅以阿胶、枣花蜜等成份，采用真空、低温、浸渍脱水等现代技术生产，既保持了传统蜜枣色泽晶莹、入口甘甜醇厚、回味绵长的特点，又符合现代生活健康休闲之理念，实为老幼皆宜、四季常备的休闲佳品。</font></p>\n</div>\n<div class="detail_box">\n<p class="detail_page_t shangjiadestemp" id="shangjiaDesTemp_1" name="使用方法">使用方法</p>\n<p><font face="宋体" size="2">开封即食。</font></p>\n</div>\n\n<p class="detail_page_t shangjiadestemp" id="shangjiaDesTemp_2" name="品牌介绍">品牌介绍</p>\n<p>公司座落于杭州市余杭区星桥经济开发区，占地面积25000平方米。交通便捷，近靠320国道，南邻沪杭甬高速公路、沪杭铁路及杭州萧山国际机场，北靠京杭大运河，可通苏州、无锡、和太湖。<br/>\n杭州华味亨食品有限公司（原杭州味亨蜜饯厂）创办于1992年，是一家传统加工型企业，经过十年的艰苦创业，企业不断壮大。拥有先进的检测设备，以产品开发，生产，销售为一体化、专业化、品牌化的生产企业。年生产规模2000吨以上，在蜜饯业里名列前矛。</p>', 10.560, 0.000, 8.800, 'G52FD92A15AF35', '华味亨 阿胶贡枣 227g/袋', 'true', 227.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392349857, NULL, 1392361328, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 85, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(86, 34, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '465', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic9_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic9_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic9_1.jpg', NULL, '休闲零食 零食 小吃 蜜饯 mariani 年货', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic9_4.jpg">', 71.880, 0.000, 59.900, 'G52FD93C94D043', '玛莉安妮 半颗蔓越莓干 500g 美国进口', 'true', 500.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392350153, NULL, 1392350153, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16115;i:2;}s:3:"buy";a:0:{}}', 86, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(87, 34, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '466', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic10_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic10_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic10_1.jpg', NULL, '本商品包装更新升级中，新老包装随机发送', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic10_4.jpg">', 28.800, 0.000, 24.000, 'G52FD94C6848E0', '天喔 西梅 454g/罐', 'true', 454.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392350406, NULL, 1392350406, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 87, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(88, 35, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '467', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic11_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic11_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic11_1.jpg', NULL, '休闲零食 小吃 蜜饯 下午茶 年货', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic11_4.jpg">', 27.480, 0.000, 22.900, 'G52FD969D70C36', '思贝格 牌黑葡萄干 200g', 'true', 200.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392350877, NULL, 1392350877, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16115;i:2;}s:3:"buy";a:0:{}}', 88, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(89, 35, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '468', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic12_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic12_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic12_1.jpg', NULL, '本商品包装更新升级中，新老包装随机发送。零食蜜饯干果佳品', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic12_4.jpg">', 15.840, 0.000, 13.200, 'G52FD97851AE30', '金百岁农庄 绿香妃葡萄干 100g', 'true', 100.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392351109, NULL, 1392351109, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16115;i:2;}s:3:"buy";a:0:{}}', 89, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(90, 36, 7, 'normal', 22, '乐事', NULL, NULL, NULL, '469', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic13_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic13_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic13_1.jpg', NULL, '厂家授权，网络独售。加量不加价，把乐带回家！', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic13_4.jpg">', 11.880, 0.000, 9.900, 'G52FD983321F49', '乐事 美国经典原味薯片 198g（含加量20%）', 'true', 198.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392351283, NULL, 1392361577, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:4;}s:3:"buy";a:0:{}}', 90, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(91, 36, 7, 'normal', 23, '好丽友', NULL, NULL, NULL, '470', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic14_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic14_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic14_1.jpg', NULL, '休闲小吃零食 非油炸，新老包装随机，口味随机', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic14_4.jpg">', 24.600, 0.000, 20.500, 'G52FD98B8C244F', '好丽友 薯愿三连包 312g/组', 'true', 312.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392351416, NULL, 1392361727, 'false', 0, 5.000, 0, 0, 12, 12, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:10;i:16118;i:2;}s:3:"buy";a:0:{}}', 91, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(92, 36, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '471', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic15_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic15_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic15_1.jpg', NULL, '小小一包，美味不怕胖', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic15_4.jpg">', 3.480, 0.000, 2.900, 'G52FD99A42A86D', '乐事 无限薯片（忠于原味）40g/袋', 'true', 40.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392351652, NULL, 1392351652, 'false', 0, 5.000, 0, 0, 6, 6, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:6;}s:3:"buy";a:0:{}}', 92, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(93, 37, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '472', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic16_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic16_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic16_1.jpg', NULL, '休闲零嘴观影美食', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic16_4.jpg">', 30.000, 0.000, 25.000, 'G52FD9A82D329E', '璐美 奶油甜味爆米花 150g/罐', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392351874, NULL, 1392351875, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 93, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(94, 37, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '473', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic17_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic17_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic17_1.jpg', NULL, '店铺促销ing...全场满150元立减20元', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic17_4.jpg">', 27.000, 0.000, 22.500, 'G52FDA7983BEFB', '红鞋の女孩 焦糖口味 爆米花 150g/罐', 'true', 150.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392355224, NULL, 1392355224, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:2;}s:3:"buy";a:0:{}}', 94, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(95, 38, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '474', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic18_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic18_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic18_1.jpg', NULL, '包装更新升级中，新老包装随机发送', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic18_4.jpg">', 27.000, 0.000, 22.500, 'G52FDA8878B34D', '旺旺 雪饼（加量包）500g/袋 另赠118g', 'true', 118.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392355463, NULL, 1392355463, 'false', 0, 5.000, 0, 0, 6, 6, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:4;}s:3:"buy";a:0:{}}', 95, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(96, 39, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '475', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic19_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic19_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic19_1.jpg', NULL, '', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic19_4.jpg">', 7.080, 0.000, 5.900, 'G52FDA98BB3F2E', '农心 辣鲜虾条 90g/袋', 'true', 90.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392355723, NULL, 1392355724, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:2;}s:3:"buy";a:0:{}}', 96, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(97, 39, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '476', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic20_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic20_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic20_1.jpg', NULL, '无反式脂肪 新老包装更替中，随机发货', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic20_4.jpg">', 6.360, 0.000, 5.300, 'G52FDAA901A5BB', '上好佳 芝士条 90g/袋', 'true', 90.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392355984, NULL, 1392355984, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 97, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(98, 40, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '477', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic21_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic21_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic21_1.jpg', NULL, '', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic21_4.jpg">', 10.200, 0.000, 8.500, 'G52FDABC07CD8D', '旺旺 旺仔小馒头210g 精选新西兰进口乳源 儿童的美味小点心', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392356288, NULL, 1392356313, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 98, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(99, 41, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '478', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic22_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic22_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic22_1.jpg', NULL, '本商品包装更新升级中，新老包装随机发送，敬请谅解', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic22_4.jpg">', 6.360, 0.000, 5.300, 'G52FDAC9B9DEFA', '波力 海苔 原味 75g/罐', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392356507, NULL, 1392356508, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16115;i:2;}s:3:"buy";a:0:{}}', 99, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(100, 42, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '479', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic23_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic23_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic23_1.jpg', NULL, '进口 鱼松 肉松 婴儿辅食 台湾 年货', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic23_4.jpg">', 59.880, 0.000, 49.900, 'G52FDADA688C2C', 'WEI-I 味一 金枪鱼松 200g 台湾地区进口', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392356774, NULL, 1392356790, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 100, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(101, 50, 7, 'normal', NULL, '徐福记', NULL, NULL, NULL, '480', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic24_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic24_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic24_1.jpg', NULL, '', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic24_4.jpg">', 18.480, 0.000, 15.400, 'G52FDB083E48B7', '徐福记 276凤梨酥276g/盒', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392357507, NULL, 1392608143, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:2;}s:3:"buy";a:0:{}}', 101, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(102, 51, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '481', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic25_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic25_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic25_1.jpg', NULL, '澳门特别风味 年货 送礼 礼盒 礼品', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic25_4.jpg">', 25.200, 0.000, 21.000, 'G52FDB1AEE973F', '十月初五 麦酥杏仁条 200g/盒', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392357806, NULL, 1392357807, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 102, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(103, 52, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '482', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic26_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic26_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic26_1.jpg', NULL, '', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic26_4.jpg">', 70.800, 0.000, 59.000, 'G52FDB32656987', '周村烧饼 山东特产 中华老字号 牛皮纸袋套装65克x6袋 甜', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392358182, NULL, 1392358182, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16115;i:2;}s:3:"buy";a:0:{}}', 103, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(104, 53, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '483', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic27_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic27_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic27_1.jpg', NULL, '台湾小吃 进口食品 1号店自营', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic27_4.jpg">', 17.880, 0.000, 14.900, 'G52FDB3CE154F7', 'GBG高比高 杏仁千层酥饼干 168g 台湾地区进口', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392358350, NULL, 1392358350, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 104, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(105, 54, 7, 'normal', 23, '好丽友', NULL, NULL, NULL, '484', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic28_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic28_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic28_1.jpg', NULL, '本商品包装更新升级中，新老包装随机发送 年货 送礼 礼盒 节日礼物 节日馈赠', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic28_4.jpg">', 33.600, 0.000, 28.000, 'G52FDB53BC4955', '好丽友 派 巧克力味涂饰蛋类芯饼 680g/盒 20枚', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392358715, NULL, 1392361997, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 105, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(106, 55, 7, 'normal', 25, '康师傅', NULL, NULL, NULL, '485', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic29_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic29_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic29_1.jpg', NULL, '香酥口感，一层层精心卷制，把营养和美味卷起来。蛋卷 早餐 下午茶', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic29_4.jpg">', 7.680, 0.000, 6.400, 'G52FDB6905F237', '康师傅 蛋酥卷（香浓奶油味）90g/袋', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392359056, NULL, 1392362312, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16115;i:2;}s:3:"buy";a:0:{}}', 106, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(107, 56, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '486', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic30_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic30_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic30_1.jpg', NULL, '进口食品 1号店自营', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic30_4.jpg">', 15.480, 0.000, 12.900, 'G52FDB75A30A3C', 'SANRITSU 三立 迷你源氏蝴蝶酥饼 40g 日本进口', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392359258, NULL, 1392359258, 'false', 0, 5.000, 0, 0, 4, 4, 0, 0, 'a:2:{s:4:"view";a:2:{i:16115;i:2;i:16118;i:2;}s:3:"buy";a:0:{}}', 107, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(108, 69, 7, 'normal', 27, '桂格', NULL, NULL, NULL, '487', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic31_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic31_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic31_1.jpg', NULL, '早餐谷物，营养美味无添加！！', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic31_4.jpg">', 33.360, 0.000, 27.800, 'G5301750C28096', 'Quaker/桂格 紫薯高纤醇香燕麦片 540g/盒', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392604428, NULL, 1392607125, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 108, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(109, 72, 7, 'normal', 26, '安怡', NULL, NULL, NULL, '488', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic32_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic32_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic32_1.jpg', NULL, '成人奶粉，健康生活！！', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic32_4.jpg">', 55.200, 0.000, 46.000, 'G530177C056915', '安怡 金装高钙低脂配方奶粉350g', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392605120, NULL, 1392607109, 'false', 0, 5.000, 0, 0, 3, 3, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:3;}s:3:"buy";a:0:{}}', 109, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(110, 74, 7, 'normal', 28, '雀巢', NULL, NULL, NULL, '489', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic33_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic33_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic33_1.jpg', NULL, '成人奶粉，健康生活！！', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic33_4.jpg">', 0.000, 0.000, 105.000, 'G5301793D75095', '雀巢 全脂奶粉听装900g', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392605501, NULL, 1392607359, 'false', 0, 5.000, 0, 0, 2, 2, 0, 0, 'a:2:{s:4:"view";a:1:{i:16118;i:2;}s:3:"buy";a:0:{}}', 110, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(111, 76, 7, 'normal', NULL, NULL, NULL, NULL, NULL, '492', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic34_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic34_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic34_1.jpg', NULL, '纯正果味，四季皆宜！', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic34_4.jpg">', 24.120, 0.000, 20.100, 'G53017ACE6797A', '果珍 清新5条装-冰糖雪梨味75g X 3组合装', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392605902, NULL, 1392605902, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 111, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false'),
(112, 87, 7, 'normal', 29, '金龙鱼', NULL, NULL, NULL, '493', 'false', 'http://upin99.ec-ae.com/goodspic/upin99_pic35_3.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic35_2.jpg', 'http://upin99.ec-ae.com/goodspic/upin99_pic35_1.jpg', NULL, '富含维生素E、维生素D以及丰富的卵磷脂，适合人体吸收。', '<img src="http://upin99.ec-ae.com/goodspic/upin99_pic35_4.jpg">', 59.760, 0.000, 49.800, 'G53017D55DD854', '金龙鱼 大豆油（精炼一级）5L/桶', 'true', 0.000, '', NULL, '', 'number', 0, '', '', '', NULL, 1392606549, NULL, 1392607790, 'false', 0, 5.000, 0, 0, 0, 0, 0, 0, NULL, 112, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', 'false', 'false', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_cat`
--

DROP TABLE IF EXISTS `sdb_goods_cat`;
CREATE TABLE IF NOT EXISTS `sdb_goods_cat` (
  `cat_id` int(10) NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `supplier_id` int(10) unsigned default NULL,
  `supplier_cat_id` mediumint(8) unsigned default NULL,
  `cat_path` varchar(100) default ',',
  `is_leaf` enum('true','false') NOT NULL default 'false',
  `type_id` int(10) default NULL,
  `cat_name` varchar(100) NOT NULL default '',
  `disabled` enum('true','false') NOT NULL default 'false',
  `p_order` mediumint(8) unsigned default NULL,
  `goods_count` mediumint(8) unsigned default NULL,
  `tabs` longtext,
  `finder` longtext,
  `addon` longtext,
  `child_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  KEY `ind_cat_path` (`cat_path`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `sdb_goods_cat`
--

INSERT INTO `sdb_goods_cat` (`cat_id`, `parent_id`, `supplier_id`, `supplier_cat_id`, `cat_path`, `is_leaf`, `type_id`, `cat_name`, `disabled`, `p_order`, `goods_count`, `tabs`, `finder`, `addon`, `child_count`) VALUES
(23, 0, NULL, NULL, ',', 'false', 7, '休闲食品', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(24, 23, NULL, NULL, '23,', 'false', 7, '坚果', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(25, 23, NULL, NULL, '23,', 'false', 7, '蜜饯', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 5),
(26, 23, NULL, NULL, '23,', 'false', 7, '膨化食品', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 5),
(27, 23, NULL, NULL, '23,', 'false', 7, '鱿鱼丝/海味', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 2),
(47, 0, NULL, NULL, ',', 'false', 7, '饼干/糕点', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 2),
(29, 24, NULL, NULL, '23,24,', 'false', 7, '瓜子', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(30, 24, NULL, NULL, '23,24,', 'false', 7, '杏仁', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(31, 24, NULL, NULL, '23,24,', 'false', 7, '花生', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(32, 24, NULL, NULL, '23,24,', 'false', 7, '豆类制品', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(33, 25, NULL, NULL, '23,25,', 'false', 7, '枣类', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(34, 25, NULL, NULL, '23,25,', 'false', 7, '梅类', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(35, 25, NULL, NULL, '23,25,', 'false', 7, '葡萄干', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(36, 26, NULL, NULL, '23,26,', 'false', 7, '薯片', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(37, 26, NULL, NULL, '23,26,', 'false', 7, '爆米花', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(38, 26, NULL, NULL, '23,26,', 'false', 7, '雪米饼', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(39, 26, NULL, NULL, '23,26,', 'false', 7, '虾条', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(40, 26, NULL, NULL, '23,26,', 'false', 7, '小馒头', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(41, 27, NULL, NULL, '23,27,', 'false', 7, '海苔系列', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(42, 27, NULL, NULL, '23,27,', 'false', 7, '鱼系列', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(51, 48, NULL, NULL, '47,48,', 'false', 7, '杏仁饼', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(50, 48, NULL, NULL, '47,48,', 'false', 7, '凤梨酥', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(48, 47, NULL, NULL, '47,', 'false', 7, '传统糕点', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(49, 47, NULL, NULL, '47,', 'false', 7, '西式糕点', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 3),
(52, 48, NULL, NULL, '47,48,', 'false', 7, '烧饼', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(53, 48, NULL, NULL, '47,48,', 'false', 7, '千层饼', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(54, 49, NULL, NULL, '47,49,', 'false', 7, '蛋黄派/巧克力派', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(55, 49, NULL, NULL, '47,49,', 'false', 7, '蛋卷/酥心卷', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(56, 49, NULL, NULL, '47,49,', 'false', 7, '面包/面包干', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(60, 0, NULL, NULL, ',', 'false', 7, '冲饮谷物', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(58, 25, NULL, NULL, '23,25,', 'false', 7, '枣类', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(59, 25, NULL, NULL, '23,25,', 'false', 7, '梅类', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(61, 60, NULL, NULL, '60,', 'false', 7, '蜂蜜', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(62, 60, NULL, NULL, '60,', 'false', 7, '麦片谷物', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 3),
(63, 60, NULL, NULL, '60,', 'false', 7, '奶粉', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(64, 60, NULL, NULL, '60,', 'false', 7, '果味冲饮', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(65, 61, NULL, NULL, '60,61,', 'false', 7, '百花蜜', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(66, 61, NULL, NULL, '60,61,', 'false', 7, '龙眼蜜', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(67, 61, NULL, NULL, '60,61,', 'false', 7, '荔枝蜜', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(68, 61, NULL, NULL, '60,61,', 'false', 7, '柑橘蜜', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(69, 62, NULL, NULL, '60,62,', 'false', 7, '杂粮混合', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(70, 62, NULL, NULL, '60,62,', 'false', 7, '纯麦片', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(71, 62, NULL, NULL, '60,62,', 'false', 7, '谷物类', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(72, 63, NULL, NULL, '60,63,', 'false', 7, '低脂', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(73, 63, NULL, NULL, '60,63,', 'false', 7, '脱脂', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(74, 63, NULL, NULL, '60,63,', 'false', 7, '全脂', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(75, 63, NULL, NULL, '60,63,', 'false', 7, '减脂', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(76, 64, NULL, NULL, '60,64,', 'false', 7, '果珍', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(77, 64, NULL, NULL, '60,64,', 'false', 7, '酸梅晶', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(78, 64, NULL, NULL, '60,64,', 'false', 7, '菊花晶', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(79, 64, NULL, NULL, '60,64,', 'false', 7, '椰子粉', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(80, 0, NULL, NULL, ',', 'false', 7, '粮油/干货', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 3),
(81, 80, NULL, NULL, '80,', 'false', 7, '食用油', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 4),
(82, 80, NULL, NULL, '80,', 'false', 7, '米类', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 5),
(85, 80, NULL, NULL, '80,', 'false', 7, '干货', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 3),
(86, 81, NULL, NULL, '80,81,', 'false', 7, '茶油', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(87, 81, NULL, NULL, '80,81,', 'false', 7, '大豆油', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(88, 81, NULL, NULL, '80,81,', 'false', 7, '橄榄油', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(89, 81, NULL, NULL, '80,81,', 'false', 7, '花生油', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(90, 82, NULL, NULL, '80,82,', 'false', 7, '大米', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(91, 82, NULL, NULL, '80,82,', 'false', 7, '糯米', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(92, 82, NULL, NULL, '80,82,', 'false', 7, '泰国香米', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(93, 82, NULL, NULL, '80,82,', 'false', 7, '小米', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(94, 82, NULL, NULL, '80,82,', 'false', 7, '薏米', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(95, 85, NULL, NULL, '80,85,', 'false', 7, '桂圆/荔枝', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(96, 85, NULL, NULL, '80,85,', 'false', 7, '木耳/银耳', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0),
(97, 85, NULL, NULL, '80,85,', 'false', 7, '莲子/枣子', 'false', 0, NULL, NULL, NULL, 'a:1:{s:4:"meta";a:3:{s:5:"title";s:0:"";s:8:"keywords";s:0:"";s:11:"description";s:0:"";}}', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_keywords`
--

DROP TABLE IF EXISTS `sdb_goods_keywords`;
CREATE TABLE IF NOT EXISTS `sdb_goods_keywords` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `keyword` varchar(40) NOT NULL default '',
  `refer` varchar(255) default '',
  `res_type` enum('goods','article') NOT NULL default 'goods',
  PRIMARY KEY  (`goods_id`,`keyword`,`res_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_goods_keywords`
--

INSERT INTO `sdb_goods_keywords` (`goods_id`, `keyword`, `refer`, `res_type`) VALUES
(4, 'balei', '', 'goods'),
(23, 'OL', '', 'goods'),
(57, 'OL服饰', '', 'goods'),
(38, 'waitao', '', 'goods'),
(1, '上衣', '', 'goods'),
(55, '修身', '', 'goods'),
(59, '修身', '', 'goods'),
(4, '单鞋', '', 'goods'),
(70, '卡哇伊', '', 'goods'),
(48, '圆领', '', 'goods'),
(27, '外套', '', 'goods'),
(58, '女装', '', 'goods'),
(38, '带帽', '', 'goods'),
(50, '春款专柜正品彩虹系列镶钻小脚裤', '', 'goods'),
(58, '春装', '', 'goods'),
(57, '条纹裙', '', 'goods'),
(19, '毛衣', '', 'goods'),
(19, '百搭', '', 'goods'),
(57, '百褶裙', '', 'goods'),
(48, '绸缎', '', 'goods'),
(4, '芭蕾', '', 'goods'),
(1, '衣服', '', 'goods'),
(1, '衬衣', '', 'goods'),
(45, '裙子', '', 'goods'),
(57, '裙子', '', 'goods'),
(70, '裙子', '', 'goods'),
(58, '连衣裙', '', 'goods'),
(63, '连衣裙', '', 'goods'),
(70, '连衣裙', '', 'goods'),
(72, '连衣裙', '', 'goods'),
(55, '针织', '', 'goods'),
(59, '长裤', '', 'goods'),
(63, '雪纺', '', 'goods'),
(27, '韩妆', '', 'goods'),
(70, '韩版', '', 'goods'),
(72, '韩版', '', 'goods');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_lv_price`
--

DROP TABLE IF EXISTS `sdb_goods_lv_price`;
CREATE TABLE IF NOT EXISTS `sdb_goods_lv_price` (
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `level_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `price` decimal(20,3) default NULL,
  PRIMARY KEY  (`product_id`,`level_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_goods_lv_price`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_memo`
--

DROP TABLE IF EXISTS `sdb_goods_memo`;
CREATE TABLE IF NOT EXISTS `sdb_goods_memo` (
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `p_key` varchar(20) NOT NULL default '',
  `p_value` longtext,
  PRIMARY KEY  (`goods_id`,`p_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_goods_memo`
--

INSERT INTO `sdb_goods_memo` (`goods_id`, `p_key`, `p_value`) VALUES
(78, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(78, 'adjunct', NULL),
(79, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(79, 'adjunct', NULL),
(80, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(80, 'adjunct', NULL),
(81, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(81, 'adjunct', NULL),
(82, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(82, 'adjunct', NULL),
(83, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(83, 'adjunct', NULL),
(84, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(84, 'adjunct', NULL),
(85, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(85, 'adjunct', NULL),
(86, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(86, 'adjunct', NULL),
(87, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(87, 'adjunct', NULL),
(88, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(88, 'adjunct', NULL),
(89, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(89, 'adjunct', NULL),
(90, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(90, 'adjunct', NULL),
(91, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(91, 'adjunct', NULL),
(92, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(92, 'adjunct', NULL),
(93, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(93, 'adjunct', NULL),
(94, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(94, 'adjunct', NULL),
(95, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(95, 'adjunct', NULL),
(96, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(96, 'adjunct', NULL),
(97, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(97, 'adjunct', NULL),
(98, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(98, 'adjunct', NULL),
(99, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(99, 'adjunct', NULL),
(100, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(100, 'adjunct', NULL),
(101, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(101, 'adjunct', NULL),
(102, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(102, 'adjunct', NULL),
(103, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(103, 'adjunct', NULL),
(104, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(104, 'adjunct', NULL),
(105, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(105, 'adjunct', NULL),
(106, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(106, 'adjunct', NULL),
(107, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(107, 'adjunct', NULL),
(108, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(108, 'adjunct', NULL),
(109, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(109, 'adjunct', NULL),
(110, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(110, 'adjunct', NULL),
(111, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(111, 'adjunct', NULL),
(112, 'seo_info', 'a:3:{s:9:"seo_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";}'),
(112, 'adjunct', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_rate`
--

DROP TABLE IF EXISTS `sdb_goods_rate`;
CREATE TABLE IF NOT EXISTS `sdb_goods_rate` (
  `goods_1` mediumint(8) unsigned NOT NULL default '0',
  `goods_2` mediumint(8) unsigned NOT NULL default '0',
  `manual` enum('left','both') default NULL,
  `rate` mediumint(8) unsigned NOT NULL default '1',
  PRIMARY KEY  (`goods_1`,`goods_2`),
  KEY `ind_rate` (`goods_1`,`goods_2`,`manual`,`rate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_goods_rate`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_spec_index`
--

DROP TABLE IF EXISTS `sdb_goods_spec_index`;
CREATE TABLE IF NOT EXISTS `sdb_goods_spec_index` (
  `type_id` int(10) NOT NULL default '0',
  `spec_id` mediumint(8) unsigned NOT NULL default '0',
  `spec_value_id` mediumint(8) unsigned NOT NULL default '0',
  `spec_value` varchar(100) NOT NULL default '',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`spec_value_id`,`spec_value`,`product_id`),
  KEY `type_specvalue_index` (`type_id`,`spec_value_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_goods_spec_index`
--

INSERT INTO `sdb_goods_spec_index` (`type_id`, `spec_id`, `spec_value_id`, `spec_value`, `goods_id`, `product_id`) VALUES
(1, 1, 13, '', 1, 270),
(1, 1, 13, '', 1, 274),
(1, 1, 15, '', 1, 271),
(1, 1, 15, '', 1, 275),
(1, 1, 6, '', 1, 273),
(1, 1, 6, '', 1, 277),
(1, 1, 7, '', 1, 272),
(1, 1, 7, '', 1, 276),
(1, 2, 21, '', 1, 270),
(1, 2, 21, '', 1, 271),
(1, 2, 21, '', 1, 272),
(1, 2, 21, '', 1, 273),
(1, 2, 22, '', 1, 274),
(1, 2, 22, '', 1, 275),
(1, 2, 22, '', 1, 276),
(1, 2, 22, '', 1, 277),
(3, 1, 13, '', 1, 29),
(3, 1, 13, '', 1, 33),
(3, 1, 14, '', 1, 26),
(3, 1, 14, '', 1, 30),
(3, 1, 15, '', 1, 27),
(3, 1, 15, '', 1, 31),
(3, 1, 16, '', 1, 10),
(3, 1, 16, '', 1, 13),
(3, 1, 16, '', 1, 16),
(3, 1, 16, '', 1, 19),
(3, 1, 16, '', 1, 22),
(3, 1, 16, '', 1, 25),
(3, 1, 16, '', 1, 4),
(3, 1, 16, '', 1, 7),
(3, 1, 19, '', 1, 11),
(3, 1, 19, '', 1, 17),
(3, 1, 19, '', 1, 23),
(3, 1, 19, '', 1, 25),
(3, 1, 19, '', 1, 5),
(3, 1, 5, '', 1, 14),
(3, 1, 5, '', 1, 2),
(3, 1, 5, '', 1, 8),
(3, 1, 6, '', 1, 12),
(3, 1, 6, '', 1, 15),
(3, 1, 6, '', 1, 18),
(3, 1, 6, '', 1, 21),
(3, 1, 6, '', 1, 24),
(3, 1, 6, '', 1, 28),
(3, 1, 6, '', 1, 3),
(3, 1, 6, '', 1, 32),
(3, 1, 6, '', 1, 6),
(3, 1, 6, '', 1, 9),
(3, 2, 20, '', 1, 14),
(3, 2, 20, '', 1, 2),
(3, 2, 20, '', 1, 20),
(3, 2, 20, '', 1, 21),
(3, 2, 20, '', 1, 22),
(3, 2, 20, '', 1, 26),
(3, 2, 20, '', 1, 31),
(3, 2, 20, '', 1, 8),
(3, 2, 21, '', 1, 15),
(3, 2, 21, '', 1, 21),
(3, 2, 21, '', 1, 23),
(3, 2, 21, '', 1, 27),
(3, 2, 21, '', 1, 3),
(3, 2, 21, '', 1, 32),
(3, 2, 21, '', 1, 9),
(3, 2, 22, '', 1, 10),
(3, 2, 22, '', 1, 12),
(3, 2, 22, '', 1, 16),
(3, 2, 22, '', 1, 18),
(3, 2, 22, '', 1, 22),
(3, 2, 22, '', 1, 24),
(3, 2, 22, '', 1, 28),
(3, 2, 22, '', 1, 33),
(3, 2, 22, '', 1, 4),
(3, 2, 22, '', 1, 6),
(3, 2, 23, '', 1, 11),
(3, 2, 23, '', 1, 13),
(3, 2, 23, '', 1, 17),
(3, 2, 23, '', 1, 19),
(3, 2, 23, '', 1, 20),
(3, 2, 23, '', 1, 23),
(3, 2, 23, '', 1, 25),
(3, 2, 23, '', 1, 29),
(3, 2, 23, '', 1, 5),
(3, 2, 23, '', 1, 7),
(3, 2, 24, '', 1, 30),
(4, 1, 3, '', 13, 82),
(4, 1, 3, '', 13, 84),
(4, 1, 5, '', 13, 83),
(4, 1, 5, '', 13, 85),
(4, 3, 29, '', 13, 82),
(4, 3, 29, '', 13, 83),
(4, 3, 30, '', 13, 84),
(4, 3, 30, '', 13, 85);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_type`
--

DROP TABLE IF EXISTS `sdb_goods_type`;
CREATE TABLE IF NOT EXISTS `sdb_goods_type` (
  `type_id` int(10) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `alias` longtext,
  `is_physical` enum('0','1') NOT NULL default '1',
  `supplier_id` int(10) unsigned default NULL,
  `supplier_type_id` mediumint(8) unsigned default NULL,
  `schema_id` varchar(30) NOT NULL default 'custom',
  `props` longtext,
  `spec` longtext,
  `setting` longtext,
  `minfo` longtext,
  `params` longtext,
  `dly_func` enum('0','1') NOT NULL default '0',
  `ret_func` enum('0','1') NOT NULL default '0',
  `reship` enum('disabled','func','normal','mixed') NOT NULL default 'normal',
  `disabled` enum('true','false') default 'false',
  `is_def` enum('true','false') NOT NULL default 'false',
  `lastmodify` int(10) unsigned default NULL,
  PRIMARY KEY  (`type_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sdb_goods_type`
--

INSERT INTO `sdb_goods_type` (`type_id`, `name`, `alias`, `is_physical`, `supplier_id`, `supplier_type_id`, `schema_id`, `props`, `spec`, `setting`, `minfo`, `params`, `dly_func`, `ret_func`, `reship`, `disabled`, `is_def`, `lastmodify`) VALUES
(1, '通用商品类型', NULL, '1', NULL, NULL, 'simple', '', NULL, 'a:4:{s:8:"use_spec";N;s:9:"use_brand";b:1;s:9:"use_props";b:0;s:10:"use_params";b:0;}', NULL, 'a:0:{}', '0', '0', 'normal', 'false', 'true', NULL),
(7, '食品', '', '1', NULL, NULL, 'custom', 'a:0:{}', NULL, 'a:5:{s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;}', NULL, 'a:0:{}', '0', '0', 'normal', 'false', 'false', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_type_spec`
--

DROP TABLE IF EXISTS `sdb_goods_type_spec`;
CREATE TABLE IF NOT EXISTS `sdb_goods_type_spec` (
  `spec_id` mediumint(8) unsigned default '0',
  `type_id` int(10) default '0',
  `spec_style` enum('select','flat','disabled') NOT NULL default 'flat'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_goods_type_spec`
--

INSERT INTO `sdb_goods_type_spec` (`spec_id`, `type_id`, `spec_style`) VALUES
(1, 3, 'flat'),
(2, 3, 'flat');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_goods_virtual_cat`
--

DROP TABLE IF EXISTS `sdb_goods_virtual_cat`;
CREATE TABLE IF NOT EXISTS `sdb_goods_virtual_cat` (
  `virtual_cat_id` mediumint(8) unsigned NOT NULL auto_increment,
  `virtual_cat_name` varchar(100) NOT NULL default '',
  `filter` longtext,
  `addon` longtext,
  `type_id` int(10) default NULL,
  `disabled` enum('true','false') NOT NULL default 'false',
  `parent_id` mediumint(8) unsigned default '0',
  `cat_id` int(10) default NULL,
  `p_order` mediumint(8) unsigned default NULL,
  `cat_path` varchar(100) default ',',
  `child_count` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`virtual_cat_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_p_order` (`p_order`),
  KEY `ind_cat_path` (`cat_path`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `sdb_goods_virtual_cat`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_gtask`
--

DROP TABLE IF EXISTS `sdb_gtask`;
CREATE TABLE IF NOT EXISTS `sdb_gtask` (
  `goods_id` mediumint(8) unsigned default NULL,
  `tasktime` int(10) unsigned NOT NULL default '0',
  `action` enum('online','offline') NOT NULL default 'online',
  KEY `tasktime` (`tasktime`),
  KEY `goods` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_gtask`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_image_sync`
--

DROP TABLE IF EXISTS `sdb_image_sync`;
CREATE TABLE IF NOT EXISTS `sdb_image_sync` (
  `img_sync_id` int(10) unsigned NOT NULL auto_increment,
  `type` enum('gimage','spec_value','udfimg','brand_logo') NOT NULL default 'gimage',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `supplier_object_id` mediumint(8) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL default '0',
  `command_id` int(10) unsigned NOT NULL default '0',
  `failed` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`img_sync_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_image_sync`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_job_apilist`
--

DROP TABLE IF EXISTS `sdb_job_apilist`;
CREATE TABLE IF NOT EXISTS `sdb_job_apilist` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `api_name` varchar(100) NOT NULL,
  `api_params` longtext,
  `api_version` varchar(10) NOT NULL,
  `api_action` varchar(100) NOT NULL,
  `page` mediumint(8) unsigned NOT NULL default '0',
  `limit` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_job_apilist`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_job_data_sync`
--

DROP TABLE IF EXISTS `sdb_job_data_sync`;
CREATE TABLE IF NOT EXISTS `sdb_job_data_sync` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `from_time` int(10) unsigned NOT NULL default '0',
  `to_time` int(10) unsigned NOT NULL default '0',
  `page` mediumint(8) unsigned NOT NULL default '0',
  `limit` mediumint(8) unsigned NOT NULL default '0',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `supplier_pline` longtext,
  `auto_download` enum('true','false') NOT NULL default 'false',
  `to_cat_id` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_job_data_sync`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_job_goods_download`
--

DROP TABLE IF EXISTS `sdb_job_goods_download`;
CREATE TABLE IF NOT EXISTS `sdb_job_goods_download` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `supplier_goods_id` mediumint(8) unsigned NOT NULL default '0',
  `supplier_goods_count` int(10) unsigned NOT NULL default '1',
  `command_id` int(10) unsigned NOT NULL default '0',
  `failed` enum('true','false') NOT NULL default 'false',
  `to_cat_id` mediumint(8) unsigned default NULL,
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_job_goods_download`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_link`
--

DROP TABLE IF EXISTS `sdb_link`;
CREATE TABLE IF NOT EXISTS `sdb_link` (
  `link_id` mediumint(8) unsigned NOT NULL auto_increment,
  `link_name` varchar(128) NOT NULL,
  `href` varchar(255) NOT NULL,
  `image_url` varchar(255) default NULL,
  `orderlist` mediumint(8) unsigned NOT NULL default '0',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sdb_link`
--

INSERT INTO `sdb_link` (`link_id`, `link_name`, `href`, `image_url`, `orderlist`, `disabled`) VALUES
(1, 'ebay外贸门户', 'http://cc.dmclick.cn/cgi-bin/tc?_cv_code=21-29-561-34810-34168-3710&trk_cid=21&_to_page=http%253A%252F%252Fwww.ebay.cn%252Fpages%252Fjsp%252Ffm%252Fsuccess%252Flead_form1.jsp%253Fsource%253Dshopex_friendlink%2526_cv_code%253D21-29-561-34810-34168-3710', NULL, 2, 'false'),
(2, '财付通网上支付', 'https://www.tenpay.com/', NULL, 1, 'false'),
(3, '易宝网上支付', 'http://yeepay.com/', NULL, 3, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_lnk_acts`
--

DROP TABLE IF EXISTS `sdb_lnk_acts`;
CREATE TABLE IF NOT EXISTS `sdb_lnk_acts` (
  `role_id` int(10) unsigned NOT NULL default '0',
  `action_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`role_id`,`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_lnk_acts`
--

INSERT INTO `sdb_lnk_acts` (`role_id`, `action_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_lnk_roles`
--

DROP TABLE IF EXISTS `sdb_lnk_roles`;
CREATE TABLE IF NOT EXISTS `sdb_lnk_roles` (
  `op_id` mediumint(8) unsigned NOT NULL default '0',
  `role_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`op_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_lnk_roles`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_magicvars`
--

DROP TABLE IF EXISTS `sdb_magicvars`;
CREATE TABLE IF NOT EXISTS `sdb_magicvars` (
  `var_name` varchar(20) NOT NULL,
  `var_title` varchar(100) default NULL,
  `var_remark` varchar(100) NOT NULL,
  `var_value` text,
  `var_type` enum('system','custom') NOT NULL default 'custom',
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`var_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_magicvars`
--

INSERT INTO `sdb_magicvars` (`var_name`, `var_title`, `var_remark`, `var_value`, `var_type`, `disabled`) VALUES
('{register_message}', '会员注册页上方提示信息', '商店前台 > 用户注册', '欢迎来到我们网站，如果您是新用户，请填写下面的表单进行注册<br>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n<br>', 'system', 'false'),
('{login_message}', '会员登陆页上方提示信息', '商店前台 > 用户登录', '如果您已是本站会员，请登录<br>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n<br>', 'system', 'false'),
('{lost_password}', '忘记密码页上方提示信息', '商店前台 > 忘记密码', '如果忘记密码，请填写下面表单来重新获取密码<br>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n<br>', 'system', 'false'),
('{buy_product}', '购物车商品列表上方提示信息', '商店前台 > 购物车', '请在此确认你要购买的商品<br>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n<br>', 'system', 'false'),
('{nologin_buy}', '购物车登陆页直接购买提示信息', '商店前台 > 购物车登陆页', '无需注册会员，直接下订单购买商品<br>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n<br>', 'system', 'false'),
('{reg_succ_mess}', '会员注册成功页上方提示信息', '商店前台 > 用户注册 > 注册成功', '<ul class="list"><li>请补充下列信息</li><li>本商店将最大限度保护您的隐私。</li><li>当然您不购买商品也可以成为本站用户，请填写下面的信息注册。</li><li>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n</li></ul>', 'system', 'false'),
('{pay_message}', '订单付款页(线上付款)提示信息', '商店前台 > 购物车 > 下订单最后一步', '<h3>本网站支持的在线支付方式：</h3>\n（此为默认内容，具体内容可以在后台“页面管理-提示信息管理- 订单付款页(线上付款)提示信息”中修改）\n<table class="liststyle data" border="0" cellpadding="5" cellspacing="5" width="100%">\n  <tbody><tr>\n    <td><img src="statics/copyright_alipay.gif"></td>\n    <td>支付宝（中国）网络技术有限公司是国内领先的独立第三方支付平台，由阿里巴巴集团创办。支付宝致力于为中国电子商务提供“简单、安全、快速”的在线支付解决方案。\n<a href="https://www.alipay.com/static/utoj/utojindex.htm" target="_blank">如何使用支付宝支付？</a></td>\n  </tr>\n  <tr>\n    <td><img src="statics/copyright_tenpay.gif"></td>\n    <td>财付通是腾讯公司于2005年9月正式推出专业在线支付平台，致力于为互联网用户和企业提供安全、便捷、专业的在线支付服务。<a href="http://help.tenpay.com/helpcenter/guidelines.shtml" target="_blank">\n如何使用财务通付款？</a></td>\n  </tr>\n</tbody></table>\n为了更好的让用户完成购物流程，您可以根据您自己网站的情况来，以图文或者视频的方式来告知您的顾客如何进行在线付款。', 'system', 'false'),
('{pay_offline}', '订单付款页(线下付款)提示信息', '商店前台 > 购物车 > 下订单最后一步', '<h3>我们目前支持的汇款方式，请根据您选择的支付方式来选择银行汇款。汇款以后，请立即通知我们。</h3>这里是默认内容，你可以在后台的“页面管理-提示信息管理-订单付款页(线下付款)提示信息”来修改这部分的内容<br> <table class="liststyle data" cellpadding="0" cellspacing="0"> <tbody> <tr> <th rowspan="3"><img alt="" src="statics/bank/zsyh.gif" border="0"></th> <td>持卡人：</td> <td>XXX</td> </tr> <tr> <td>卡号：</td> <td>622580XXXX121256 <strong>(推荐) </strong></td> </tr> <tr> <td align="left">开户行：</td> <td align="left">招行上海长乐支行0号</td> </tr> <tr> <th rowspan="3"><img alt="" src="statics/bank/gsyh.gif" border="0"></th> <td>持卡人：</td> <td>XXX</td> </tr> <tr> <td>卡号：</td> <td>955880XXXX142896791<strong>(推荐)</strong></td> </tr> <tr> <td align="left">开户行：</td> <td align="left">工行上海石城二路支行</td> </tr> <tr> <th rowspan="3"><img alt="" src="statics/bank/jsyh.gif" border="0"></th> <td>持卡人：</td> <td>XXX</td> </tr> <tr> <td>卡号：</td> <td>4367421xxxx84211030<strong>(推荐)</strong></td> </tr> <tr> <td align="left">开户行：</td> <td align="left">建行上海华池路支行0号</td> </tr> <tr> <th rowspan="3"><img alt="" src="statics/bank/nyyh.gif" border="0"></th> <td>持卡人：</td> <td>XXX</td> </tr> <tr> <td>卡号：</td> <td>95599800XXXX3605514</td> </tr> <tr> <td align="left">开户行：</td> <td align="left">农行上海长宁区定西路支行0号</td> </tr> <tr> <th rowspan="3"><img alt="" src="statics/bank/zgyh.gif" border="0"></th> <td>持卡人：</td> <td>XXX</td> </tr> <tr> <td>卡号：</td> <td>456XXXX800013323984</td> </tr> <tr> <td align="left">开户行：</td> <td align="left">中行上海普陀分行长寿路支行0号</td> </tr> </tbody> </table>', 'system', 'false'),
('{pay_succ}', '订单付款成功返回页提示信息', '商店前台 > 订单付款成功返回页', '<a href="index.php">返回首页</a><br>（此为默认内容，具体内容可以在后台“页面管理-提示信息管理”中修改）\n<br>', 'system', 'false'),
('{pay_wait}', '订单付款页(货到付款)提示信息', '商店前台 > 购物车 > 下订单最后一步', '您选择的是货到付款的方式，您只需静待快递人员上门，然后把货款支付给快递人员就可以了，如果有问题请及时联系我们，我们的电话是：800-828-8888。<br>【此段为演示，您可以在“页面管理--提示信息管理中--订单付款页(货到付款)提示信息”中修改这段话。】', 'system', 'false'),
('{SHOPNAME}', NULL, '系统变量', '商店名称', 'system', 'false'),
('{SHOPURL}', NULL, '系统变量', '商店URL', 'system', 'false'),
('{SHOPLOGO}', NULL, '系统变量', '商店LOGO', 'system', 'false'),
('{SHOPTEL}', NULL, '系统变量', '商店电话', 'system', 'false'),
('{SHOPADDRESS}', NULL, '系统变量', '商店地址', 'system', 'false'),
('{SHOPMAIL}', NULL, '系统变量', '商店Email', 'system', 'false'),
('{SHOPZIP}', NULL, '系统变量', '商店邮编', 'system', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_members`
--

DROP TABLE IF EXISTS `sdb_members`;
CREATE TABLE IF NOT EXISTS `sdb_members` (
  `member_id` mediumint(8) unsigned NOT NULL auto_increment,
  `member_lv_id` mediumint(8) unsigned NOT NULL default '0',
  `uname` varchar(50) NOT NULL,
  `name` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `password` varchar(32) default NULL,
  `area` varchar(255) default NULL,
  `mobile` varchar(30) default NULL,
  `tel` varchar(30) default NULL,
  `email` varchar(200) NOT NULL,
  `zip` varchar(20) default NULL,
  `addr` varchar(255) default NULL,
  `province` varchar(20) default NULL,
  `city` varchar(20) default NULL,
  `order_num` mediumint(8) unsigned default '0',
  `refer_id` varchar(50) default NULL,
  `refer_url` varchar(200) default NULL,
  `refer_time` int(10) unsigned default NULL,
  `c_refer_id` varchar(50) default NULL,
  `c_refer_url` varchar(200) default NULL,
  `c_refer_time` int(10) unsigned default NULL,
  `b_year` smallint(5) unsigned default NULL,
  `b_month` tinyint(3) unsigned default NULL,
  `b_day` tinyint(3) unsigned default NULL,
  `sex` enum('0','1') NOT NULL default '1',
  `addon` longtext,
  `wedlock` enum('0','1') NOT NULL default '0',
  `education` varchar(30) default NULL,
  `vocation` varchar(50) default NULL,
  `interest` longtext,
  `advance` decimal(20,3) NOT NULL default '0.000',
  `advance_freeze` decimal(20,3) NOT NULL default '0.000',
  `point_freeze` mediumint(8) unsigned NOT NULL default '0',
  `point_history` mediumint(8) unsigned NOT NULL default '0',
  `point` mediumint(8) unsigned NOT NULL default '0',
  `score_rate` decimal(5,3) default NULL,
  `reg_ip` varchar(16) default NULL,
  `regtime` int(10) unsigned default NULL,
  `state` tinyint(1) NOT NULL default '0',
  `pay_time` mediumint(8) unsigned default NULL,
  `biz_money` decimal(20,3) NOT NULL default '0.000',
  `pw_answer` varchar(250) default NULL,
  `pw_question` varchar(250) default NULL,
  `fav_tags` longtext,
  `custom` longtext,
  `cur` varchar(20) default NULL,
  `lang` varchar(20) default NULL,
  `unreadmsg` smallint(5) unsigned NOT NULL default '0',
  `disabled` enum('true','false') default 'false',
  `remark` text,
  `remark_type` varchar(2) NOT NULL default 'b1',
  `login_count` int(11) NOT NULL default '0',
  `experience` int(10) default '0',
  `foreign_id` varchar(255) default NULL,
  `member_refer` enum('local','mobile','qzone','alipayquick','taobao','sina','baidu','renren','tencent','netease163','windowslive','yahoo','sohu') default 'local',
  PRIMARY KEY  (`member_id`),
  KEY `ind_email` (`email`),
  KEY `uni_user` (`uname`),
  KEY `ind_regtime` (`regtime`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sdb_members`
--

INSERT INTO `sdb_members` (`member_id`, `member_lv_id`, `uname`, `name`, `lastname`, `firstname`, `password`, `area`, `mobile`, `tel`, `email`, `zip`, `addr`, `province`, `city`, `order_num`, `refer_id`, `refer_url`, `refer_time`, `c_refer_id`, `c_refer_url`, `c_refer_time`, `b_year`, `b_month`, `b_day`, `sex`, `addon`, `wedlock`, `education`, `vocation`, `interest`, `advance`, `advance_freeze`, `point_freeze`, `point_history`, `point`, `score_rate`, `reg_ip`, `regtime`, `state`, `pay_time`, `biz_money`, `pw_answer`, `pw_question`, `fav_tags`, `custom`, `cur`, `lang`, `unreadmsg`, `disabled`, `remark`, `remark_type`, `login_count`, `experience`, `foreign_id`, `member_refer`) VALUES
(1, 1, 'demo', '', NULL, NULL, 'fe01ce2a7fbac8fafaed7c982a04e229', 'mainland:上海/上海市/徐汇区:25', '', '', 'demo@demo.com', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1977, 3, 1, '1', 'a:1:{s:4:"cart";s:27:"@g.42-149-na-1,47-282-na-1;";}', '0', NULL, NULL, NULL, 0.000, 0.000, 0, 0, 0, NULL, '127.0.0.1', 1236835996, 0, NULL, 0.000, '', '', NULL, NULL, NULL, NULL, 0, 'false', 'wholesale', 'b1', 0, 0, NULL, 'local'),
(3, 3, 'demovip', '', NULL, NULL, '618c397ee8bfdeb0938bce5813a4a96e', 'mainland:﻿北京/北京市/东城区:3', '', '', 'demovip@demovip.com', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1988, 3, 1, '0', NULL, '0', NULL, NULL, NULL, 0.000, 0.000, 0, 0, 0, NULL, '127.0.0.1', 1236912389, 0, NULL, 0.000, '', '', NULL, NULL, NULL, NULL, 0, 'false', 'wholesale', 'b1', 0, 0, NULL, 'local'),
(4, 1, 'aaaa', NULL, NULL, NULL, 's88dffe06f2c2169d911d33282af3153', NULL, NULL, NULL, 'aa@sina.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'a:1:{s:4:"cart";s:39:"@g.74-252-na-1,73-246-na-1,74-250-na-2;";}', '0', NULL, NULL, NULL, 0.000, 0.000, 0, 0, 0, NULL, '127.0.0.1', 1391910869, 0, NULL, 0.000, NULL, NULL, NULL, NULL, 'CNY', NULL, 0, 'false', NULL, 'b1', 3, 0, NULL, 'local');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_member_addrs`
--

DROP TABLE IF EXISTS `sdb_member_addrs`;
CREATE TABLE IF NOT EXISTS `sdb_member_addrs` (
  `addr_id` mediumint(8) unsigned NOT NULL auto_increment,
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(50) default NULL,
  `area` varchar(255) default NULL,
  `country` varchar(30) default NULL,
  `province` varchar(30) default NULL,
  `city` varchar(50) default NULL,
  `addr` varchar(255) default NULL,
  `zip` varchar(20) default NULL,
  `tel` varchar(30) default NULL,
  `mobile` varchar(30) default NULL,
  `def_addr` tinyint(1) default '0',
  PRIMARY KEY  (`addr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sdb_member_addrs`
--

INSERT INTO `sdb_member_addrs` (`addr_id`, `member_id`, `name`, `area`, `country`, `province`, `city`, `addr`, `zip`, `tel`, `mobile`, `def_addr`) VALUES
(1, 1, '刘刚', 'mainland:上海/上海市/黄浦区:23', NULL, NULL, NULL, '上海上海市黄浦区人民路88号', '200001', '021-66668888', '13966668888', 0),
(2, 2, '张三', 'mainland:广东/广州市/东山区:425', NULL, NULL, NULL, '广东广州市东山区江南镇', '300011', '020-66668888', '13866668888', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_member_attr`
--

DROP TABLE IF EXISTS `sdb_member_attr`;
CREATE TABLE IF NOT EXISTS `sdb_member_attr` (
  `attr_id` int(10) unsigned NOT NULL auto_increment,
  `attr_name` varchar(20) NOT NULL default '',
  `attr_type` varchar(20) NOT NULL default '',
  `attr_required` enum('true','false') NOT NULL default 'false',
  `attr_search` enum('true','false') NOT NULL default 'false',
  `attr_option` text,
  `attr_valtype` varchar(20) NOT NULL default '',
  `disabled` enum('true','false') NOT NULL default 'false',
  `attr_tyname` varchar(20) NOT NULL default '',
  `attr_group` varchar(20) NOT NULL default '',
  `attr_show` enum('true','false') NOT NULL default 'true',
  `attr_order` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`attr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sdb_member_attr`
--

INSERT INTO `sdb_member_attr` (`attr_id`, `attr_name`, `attr_type`, `attr_required`, `attr_search`, `attr_option`, `attr_valtype`, `disabled`, `attr_tyname`, `attr_group`, `attr_show`, `attr_order`) VALUES
(1, '地区', 'area', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 4),
(2, '联系地址', 'addr', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 5),
(3, '姓名', 'name', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 1),
(4, '手机号码', 'mobile', 'false', 'false', '', 'number', 'false', '系统默认', 'defalut', 'true', 7),
(5, '固定电话', 'tel', 'false', 'false', '', 'number', 'false', '系统默认', 'defalut', 'true', 8),
(6, '邮编', 'zip', 'false', 'false', '', 'number', 'false', '系统默认', 'defalut', 'true', 6),
(7, '性别', 'sex', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 2),
(8, '出生日期', 'date', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 3),
(9, '安全问题', 'pw_question', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 9),
(10, '回答', 'pw_answer', 'false', 'false', '', '', 'false', '系统默认', 'defalut', 'true', 10),
(11, 'QQ', 'text', 'false', 'false', '', '', 'false', 'QQ', 'contact', 'true', 11),
(12, 'MSN', 'text', 'false', 'false', '', 'email', 'false', 'MSN', 'contact', 'false', 12),
(13, 'Skype', 'text', 'false', 'false', '', 'alphaint', 'false', 'Skype', 'contact', 'false', 13),
(14, '旺旺', 'text', 'false', 'false', '', '', 'false', '旺旺', 'contact', 'false', 14);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_member_coupon`
--

DROP TABLE IF EXISTS `sdb_member_coupon`;
CREATE TABLE IF NOT EXISTS `sdb_member_coupon` (
  `memc_code` varchar(255) NOT NULL default '',
  `cpns_id` mediumint(8) unsigned NOT NULL default '0',
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `memc_gen_orderid` varchar(15) default NULL,
  `memc_source` enum('a','b','c') NOT NULL default 'a',
  `memc_enabled` enum('true','false') NOT NULL default 'true',
  `memc_used_times` mediumint(9) default '0',
  `memc_gen_time` int(10) unsigned default NULL,
  PRIMARY KEY  (`memc_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_member_coupon`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_member_lv`
--

DROP TABLE IF EXISTS `sdb_member_lv`;
CREATE TABLE IF NOT EXISTS `sdb_member_lv` (
  `member_lv_id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `dis_count` decimal(5,2) NOT NULL default '1.00',
  `pre_id` mediumint(9) default NULL,
  `default_lv` enum('0','1') NOT NULL default '0',
  `deposit_freeze_time` int(11) default '0',
  `deposit` int(11) default '0',
  `more_point` int(11) default '1',
  `point` mediumint(8) NOT NULL default '0',
  `lv_type` enum('retail','wholesale','dealer') NOT NULL default 'retail',
  `disabled` enum('true','false') default 'false',
  `show_other_price` enum('true','false') NOT NULL default 'true',
  `order_limit` tinyint(1) NOT NULL default '0',
  `order_limit_price` decimal(20,3) NOT NULL default '0.000',
  `lv_remark` text,
  `experience` int(10) NOT NULL default '0',
  PRIMARY KEY  (`member_lv_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sdb_member_lv`
--

INSERT INTO `sdb_member_lv` (`member_lv_id`, `name`, `dis_count`, `pre_id`, `default_lv`, `deposit_freeze_time`, `deposit`, `more_point`, `point`, `lv_type`, `disabled`, `show_other_price`, `order_limit`, `order_limit_price`, `lv_remark`, `experience`) VALUES
(1, '普通会员', 1.00, NULL, '1', 0, 0, 1, 0, 'retail', 'false', 'true', 0, 0.000, NULL, 0),
(2, '高级会员', 1.00, NULL, '0', 0, 0, 1, 1000, 'retail', 'false', 'true', 0, 0.000, NULL, 0),
(3, 'VIP会员', 1.00, NULL, '0', 0, 0, 1, 5000, 'retail', 'false', 'true', 0, 0.000, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_member_mattrvalue`
--

DROP TABLE IF EXISTS `sdb_member_mattrvalue`;
CREATE TABLE IF NOT EXISTS `sdb_member_mattrvalue` (
  `attr_id` int(10) unsigned NOT NULL default '0',
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `value` varchar(100) NOT NULL default '',
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sdb_member_mattrvalue`
--

INSERT INTO `sdb_member_mattrvalue` (`attr_id`, `member_id`, `value`, `id`) VALUES
(11, 3, '999999', 1),
(11, 1, '888888', 2);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_message`
--

DROP TABLE IF EXISTS `sdb_message`;
CREATE TABLE IF NOT EXISTS `sdb_message` (
  `msg_id` mediumint(8) unsigned NOT NULL auto_increment,
  `for_id` mediumint(8) unsigned NOT NULL default '0',
  `msg_from` varchar(30) NOT NULL default '',
  `from_id` mediumint(8) unsigned default '0',
  `from_type` tinyint(1) unsigned NOT NULL default '0',
  `to_id` mediumint(8) unsigned NOT NULL default '0',
  `to_type` tinyint(1) unsigned NOT NULL default '0',
  `unread` enum('0','1') NOT NULL default '0',
  `folder` enum('inbox','outbox') NOT NULL default 'inbox',
  `email` varchar(255) default NULL,
  `tel` varchar(30) default NULL,
  `subject` varchar(100) NOT NULL default '',
  `message` longtext NOT NULL,
  `rel_order` bigint(20) unsigned default '0',
  `date_line` int(10) unsigned NOT NULL default '0',
  `is_sec` enum('true','false') NOT NULL default 'true',
  `del_status` enum('0','1','2') default '0',
  `disabled` enum('true','false') NOT NULL default 'false',
  `msg_ip` varchar(20) NOT NULL default '',
  `msg_type` enum('default','payment') NOT NULL default 'default',
  PRIMARY KEY  (`msg_id`),
  KEY `ind_to_id` (`to_id`,`folder`,`from_type`,`unread`),
  KEY `ind_from_id` (`from_id`,`folder`,`to_type`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_message`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_msgqueue`
--

DROP TABLE IF EXISTS `sdb_msgqueue`;
CREATE TABLE IF NOT EXISTS `sdb_msgqueue` (
  `queue_id` mediumint(8) unsigned NOT NULL auto_increment,
  `title` varchar(250) default NULL,
  `target` varchar(250) NOT NULL default '',
  `event_name` varchar(50) default NULL,
  `data` longtext,
  `tmpl_name` varchar(50) NOT NULL default '',
  `level` tinyint(3) unsigned NOT NULL default '5',
  `sender` varchar(50) NOT NULL default '',
  `sender_order` tinyint(3) unsigned NOT NULL default '5',
  `message` longtext,
  `status` enum('ready','succ','fail','locking') default 'ready',
  `error_msg` varchar(255) default NULL,
  `sendnum` smallint(6) default NULL,
  `send_time` int(10) unsigned default '0',
  PRIMARY KEY  (`queue_id`),
  KEY `ind_level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_msgqueue`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_operators`
--

DROP TABLE IF EXISTS `sdb_operators`;
CREATE TABLE IF NOT EXISTS `sdb_operators` (
  `op_id` mediumint(8) unsigned NOT NULL auto_increment,
  `username` varchar(20) NOT NULL default '',
  `userpass` varchar(32) NOT NULL default '',
  `name` varchar(30) default NULL,
  `config` longtext,
  `favorite` longtext,
  `super` enum('0','1') NOT NULL default '0',
  `lastip` varchar(20) default NULL,
  `logincount` mediumint(8) unsigned NOT NULL default '0',
  `lastlogin` int(10) unsigned NOT NULL default '0',
  `status` enum('0','1') NOT NULL default '1',
  `disabled` enum('true','false') NOT NULL default 'false',
  `op_no` varchar(50) default NULL,
  `department` varchar(50) default NULL,
  `memo` text,
  PRIMARY KEY  (`op_id`),
  KEY `uni_username` (`username`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sdb_operators`
--

INSERT INTO `sdb_operators` (`op_id`, `username`, `userpass`, `name`, `config`, `favorite`, `super`, `lastip`, `logincount`, `lastlogin`, `status`, `disabled`, `op_no`, `department`, `memo`) VALUES
(1, 'admin', 's86f3059b228c8acf99e69734b6bb32c', NULL, 'a:1:{s:16:"lister.pagelimit";s:3:"100";}', NULL, '1', NULL, 36, 1392692826, '1', 'false', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_op_sessions`
--

DROP TABLE IF EXISTS `sdb_op_sessions`;
CREATE TABLE IF NOT EXISTS `sdb_op_sessions` (
  `sess_id` varchar(32) NOT NULL default '',
  `op_id` mediumint(6) unsigned default NULL,
  `sess_type` enum('ADMIN','MEMBER') default NULL,
  `login_time` int(10) unsigned default NULL,
  `last_time` int(10) unsigned default NULL,
  `api_id` mediumint(8) unsigned default NULL,
  `sess_data` longtext,
  `status` tinyint(1) default '0',
  `ip` varchar(17) default NULL,
  PRIMARY KEY  (`sess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_op_sessions`
--

INSERT INTO `sdb_op_sessions` (`sess_id`, `op_id`, `sess_type`, `login_time`, `last_time`, `api_id`, `sess_data`, `status`, `ip`) VALUES
('7a396ba110962cff11cd23fd4c835c0e', 1, 'ADMIN', NULL, 1391858004, NULL, 'a:3:{s:11:"RANDOM_CODE";i:2527;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";}', 1, '127.0.0.1'),
('4a9d49c8b4e5cd1dd999546ac42970ae', 1, 'ADMIN', NULL, 1391959276, NULL, 'a:4:{s:11:"RANDOM_CODE";i:8871;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:7:"_tmp_wg";a:1:{i:0;a:8:{s:12:"widgets_type";s:14:"upc_goods_show";s:5:"title";s:0:"";s:6:"border";s:8:"__none__";s:3:"tpl";s:12:"default.html";s:5:"domid";s:0:"";s:9:"classname";s:0:"";s:6:"params";a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"4";s:6:"column";s:1:"4";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"1";s:12:"gname_row_lh";s:2:"18";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:2:"on";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}s:6:"_domid";s:13:"1391928302810";}}}', 1, '127.0.0.1'),
('257f5086b1cc417894d827170d5b959e', NULL, 'MEMBER', NULL, 1391911116, NULL, NULL, 0, '127.0.0.1'),
('5d0b0deb2c64b635440327897c8d5d8e', 1, 'ADMIN', NULL, 1391911641, NULL, 'a:3:{s:11:"RANDOM_CODE";i:8268;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";}', 1, '127.0.0.1'),
('e37b4ec4a7d6faf4ba72f3c8a472fcb0', 1, 'ADMIN', NULL, 1391911704, NULL, 'a:4:{s:11:"RANDOM_CODE";i:9144;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:7:"_tmp_wg";a:1:{i:0;a:8:{s:12:"widgets_type";s:8:"menu_lv1";s:5:"title";s:0:"";s:6:"border";s:8:"__none__";s:3:"tpl";s:12:"default.html";s:5:"domid";s:0:"";s:9:"classname";s:0:"";s:6:"params";a:2:{s:8:"max_leng";s:0:"";s:8:"showinfo";s:0:"";}s:6:"_domid";s:13:"1391911704812";}}}', 1, '127.0.0.1'),
('498562c254e9e40d2053fb2a2e227d53', NULL, 'MEMBER', NULL, 1392692343, NULL, NULL, 0, '127.0.0.1'),
('18c386baf9e1538d32f4fab04c1c053c', NULL, 'MEMBER', NULL, 1391915954, NULL, NULL, 0, '127.0.0.1'),
('c330f71ed32bafa361b8cf2d0818a669', 1, 'ADMIN', NULL, 1391915910, NULL, 'a:3:{s:11:"RANDOM_CODE";i:3381;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";}', 1, '127.0.0.1'),
('cef389d7c9313afceacfd507a1cff258', NULL, 'MEMBER', NULL, 1391949289, NULL, NULL, 0, '127.0.0.1'),
('644ebf648da13e0d352d2de42a3131af', 1, 'ADMIN', NULL, 1392646788, NULL, 'a:3:{s:11:"RANDOM_CODE";i:8999;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";}', 1, '127.0.0.1'),
('95ce704638118371c48688907087cf3d', NULL, 'MEMBER', NULL, 1392647322, NULL, NULL, 0, '127.0.0.1'),
('9046b37e9b6c81f32ab78f54b04c2f48', NULL, 'MEMBER', NULL, 1392032251, NULL, NULL, 0, '127.0.0.1'),
('4ce4f3767365cd84e1379df116428956', 1, 'ADMIN', NULL, 1392047288, NULL, 'a:4:{s:11:"RANDOM_CODE";i:5166;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:7:"_tmp_wg";a:0:{}}', 1, '127.0.0.1'),
('c43a619e5b0993d9e34430776e542274', NULL, 'MEMBER', NULL, 1392108738, NULL, NULL, 0, '127.0.0.1'),
('fb9fb9b827a86afed0acbd8a043340c5', 1, 'ADMIN', NULL, 1392112602, NULL, 'a:4:{s:11:"RANDOM_CODE";i:7543;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:7:"_tmp_wg";a:0:{}}', 1, '127.0.0.1'),
('dc12f1394a4e50d3bf263d546c30f4e7', NULL, 'MEMBER', NULL, 1392108264, NULL, NULL, 0, '127.0.0.1'),
('d2773c1101121621c0844aa2fcd55638', 4, 'MEMBER', NULL, 1392190401, NULL, 'a:2:{s:13:"L_RANDOM_CODE";i:9772;s:13:"S_RANDOM_CODE";i:6158;}', 0, '127.0.0.1'),
('f62823aa8673ea8aec5d1756c4237879', NULL, 'MEMBER', NULL, 1392174359, NULL, NULL, 0, '127.0.0.1'),
('7567166d7f14d25cb789703a0769f69b', NULL, 'MEMBER', NULL, 1392174851, NULL, NULL, 0, '127.0.0.1'),
('796e923b4913056b39b9f5b4b2b11589', 1, 'ADMIN', NULL, 1392194137, NULL, 'a:4:{s:11:"RANDOM_CODE";i:2961;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:7:"_tmp_wg";a:0:{}}', 1, '127.0.0.1'),
('f36acc91f911257d36ab8cfdc484b030', NULL, 'MEMBER', NULL, 1392174958, NULL, NULL, 0, '127.0.0.1'),
('84080ef7e4605eee3945f5d7f93e8c70', NULL, 'MEMBER', NULL, 1392175407, NULL, NULL, 0, '127.0.0.1'),
('a370d41e2a623df14841da4381380faf', NULL, 'MEMBER', NULL, 1392175744, NULL, NULL, 0, '127.0.0.1'),
('586b9fb2b8374cad55fc9917cede81d7', NULL, 'MEMBER', NULL, 1392177176, NULL, NULL, 0, '127.0.0.1'),
('bcbfb463986b4ca7d3f7ee70ce2a1321', NULL, 'MEMBER', NULL, 1392175889, NULL, NULL, 0, '127.0.0.1'),
('12aa2b6d6d8df43bb969ed362d1d8c86', NULL, 'MEMBER', NULL, 1392175908, NULL, NULL, 0, '127.0.0.1'),
('cdcdc5ee1509434be8da2c52ebfe90d3', NULL, 'MEMBER', NULL, 1392176121, NULL, NULL, 0, '127.0.0.1'),
('1b3adc6092def25390804a20e3cca9f4', NULL, 'MEMBER', NULL, 1392177150, NULL, NULL, 0, '127.0.0.1'),
('973114c1cc0dee61d6d1d97e16ac8cc7', NULL, 'MEMBER', NULL, 1392178379, NULL, NULL, 0, '127.0.0.1'),
('9f786a241e9b1a28c84d7efc75482524', NULL, 'MEMBER', NULL, 1392179046, NULL, NULL, 0, '127.0.0.1'),
('a5168c63d0ea39c7523e09f09053a279', NULL, 'MEMBER', NULL, 1392178467, NULL, NULL, 0, '127.0.0.1'),
('95177665eaedded8382273d0e84dd9a7', NULL, 'MEMBER', NULL, 1392178485, NULL, NULL, 0, '127.0.0.1'),
('435d28831e01db2210d30bdb7959dd0f', NULL, 'MEMBER', NULL, 1392178815, NULL, NULL, 0, '127.0.0.1'),
('6bbb22256a4d3c55d391c2a4087e8c6b', NULL, 'MEMBER', NULL, 1392178810, NULL, NULL, 0, '127.0.0.1'),
('31521391a6e2ec36a8d13e272cb2ca2c', NULL, 'MEMBER', NULL, 1392184476, NULL, NULL, 0, '127.0.0.1'),
('ff84f0174af878474c5b32cfea136c97', NULL, 'MEMBER', NULL, 1392189926, NULL, NULL, 0, '127.0.0.1'),
('3ea12e5708f8563ced2043f12f5ca70e', NULL, 'MEMBER', NULL, 1392189354, NULL, NULL, 0, '127.0.0.1'),
('11961133f663a7162686b299caccad9d', NULL, 'MEMBER', NULL, 1392188743, NULL, NULL, 0, '127.0.0.1'),
('968763a757ddd354a8cd07afe832865b', 4, 'MEMBER', NULL, 1392189962, NULL, 'a:1:{s:13:"L_RANDOM_CODE";i:5671;}', 0, '127.0.0.1'),
('378cbc5739bd91d0d083194b63b4ff13', NULL, 'MEMBER', NULL, 1392189938, NULL, NULL, 0, '127.0.0.1'),
('477c08b3ed89a9325662c112356f5df7', NULL, 'MEMBER', NULL, 1392190283, NULL, NULL, 0, '127.0.0.1'),
('e52791938375de51f8644d741e46fbab', NULL, 'MEMBER', NULL, 1392190373, NULL, NULL, 0, '127.0.0.1'),
('5565865bc9a66c609396364ebcf67f6e', NULL, 'MEMBER', NULL, 1392296444, NULL, NULL, 0, '127.0.0.1'),
('953027137db8d5923cb8ffcf7c0b1abd', 1, 'ADMIN', NULL, 1392299542, NULL, 'a:4:{s:11:"RANDOM_CODE";i:5229;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:7:"_tmp_wg";a:1:{i:0;a:8:{s:12:"widgets_type";s:7:"article";s:5:"title";s:0:"";s:6:"border";s:20:"borders/border3.html";s:3:"tpl";s:12:"default.html";s:5:"domid";s:0:"";s:9:"classname";s:0:"";s:6:"params";a:20:{s:8:"onSelect";s:1:"0";s:7:"explain";a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}s:5:"limit";s:1:"5";s:10:"picaddress";s:0:"";s:6:"colums";s:1:"1";s:10:"max_length";s:2:"35";s:8:"showMore";s:3:"off";s:12:"showTitleImg";s:3:"off";s:11:"titleImgSrc";s:0:"";s:12:"titleImgHref";s:0:"";s:11:"titleImgAlt";s:0:"";s:9:"showTitle";s:3:"off";s:9:"titleDesc";s:0:"";s:8:"columNum";s:1:"1";s:12:"changeEffect";s:1:"1";s:3:"id1";s:3:"100";s:3:"id2";s:3:"100";s:3:"id3";s:3:"100";s:8:"smallPic";s:1:"6";s:16:"titleImgPosition";s:3:"top";}s:6:"_domid";s:13:"1392259365226";}}}', 1, '127.0.0.1'),
('ae1457b860f2de2f70e24c86fa2104f0', 1, 'ADMIN', NULL, 1392368584, NULL, 'a:4:{s:11:"RANDOM_CODE";i:5092;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";s:5:"gtype";a:19:{s:7:"type_id";s:1:"7";s:4:"name";s:6:"食品";s:5:"alias";s:0:"";s:11:"is_physical";s:1:"1";s:11:"supplier_id";N;s:16:"supplier_type_id";N;s:9:"schema_id";s:6:"custom";s:5:"props";a:0:{}s:4:"spec";b:0;s:7:"setting";a:4:{s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";}s:5:"minfo";b:0;s:8:"dly_func";s:1:"0";s:8:"ret_func";s:1:"0";s:6:"reship";s:6:"normal";s:8:"disabled";s:5:"false";s:6:"is_def";s:5:"false";s:10:"lastmodify";N;s:8:"ordernum";N;s:6:"brands";a:8:{i:0;s:2:"18";i:1;s:2:"19";i:2;s:2:"20";i:3;s:2:"21";i:4;s:2:"22";i:5;s:2:"23";i:6;s:2:"24";i:7;s:2:"25";}}}', 1, '127.0.0.1'),
('48484143b39452ca3ffe70e4a0b20443', NULL, 'MEMBER', NULL, 1392362617, NULL, NULL, 0, '127.0.0.1'),
('7bb2daa641d2b5385251c7c7921872f6', NULL, 'MEMBER', NULL, 1392362027, NULL, NULL, 0, '127.0.0.1'),
('f48ce92b3ef4f33e3d02704f0b02b5d1', 1, 'ADMIN', NULL, 1392692948, NULL, 'a:3:{s:11:"RANDOM_CODE";i:4132;s:13:"SHOPEX_LG_KEY";s:32:"c4ca4238a0b923820dcc509a6f75849b";s:7:"message";s:0:"";}', 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_orders`
--

DROP TABLE IF EXISTS `sdb_orders`;
CREATE TABLE IF NOT EXISTS `sdb_orders` (
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `member_id` mediumint(8) unsigned default NULL,
  `confirm` enum('Y','N') NOT NULL default 'N',
  `status` enum('active','dead','finish') NOT NULL default 'active',
  `pay_status` enum('0','1','2','3','4','5') NOT NULL default '0',
  `ship_status` enum('0','1','2','3','4') NOT NULL default '0',
  `user_status` enum('null','payed','shipped') NOT NULL default 'null',
  `is_delivery` enum('Y','N') NOT NULL default 'Y',
  `shipping_id` smallint(4) unsigned default NULL,
  `shipping` varchar(100) default NULL,
  `shipping_area` varchar(50) default NULL,
  `payment` mediumint(9) default NULL,
  `weight` decimal(20,3) default NULL,
  `tostr` longtext,
  `itemnum` mediumint(8) unsigned default NULL,
  `acttime` int(10) unsigned default NULL,
  `delivery_time` int(10) unsigned default NULL,
  `delivery_delay_time` int(10) unsigned default NULL,
  `createtime` int(10) unsigned default NULL,
  `refer_id` varchar(50) default NULL,
  `refer_url` text,
  `refer_time` int(10) unsigned default NULL,
  `c_refer_id` varchar(50) default NULL,
  `c_refer_url` text,
  `c_refer_time` int(10) unsigned default NULL,
  `ip` varchar(15) default NULL,
  `ship_name` varchar(50) default NULL,
  `ship_area` varchar(255) default NULL,
  `ship_addr` varchar(100) default NULL,
  `ship_zip` varchar(20) default NULL,
  `ship_tel` varchar(30) default NULL,
  `ship_email` varchar(150) default NULL,
  `ship_time` varchar(50) default NULL,
  `ship_mobile` varchar(50) default NULL,
  `cost_item` decimal(20,3) NOT NULL default '0.000',
  `is_tax` enum('true','false') NOT NULL default 'false',
  `cost_tax` decimal(20,3) NOT NULL default '0.000',
  `tax_company` varchar(255) default NULL,
  `cost_freight` decimal(20,3) NOT NULL default '0.000',
  `is_protect` enum('true','false') NOT NULL default 'false',
  `cost_protect` decimal(20,3) NOT NULL default '0.000',
  `cost_payment` decimal(20,3) default NULL,
  `currency` varchar(8) default NULL,
  `cur_rate` decimal(10,4) default '1.0000',
  `score_u` decimal(20,3) NOT NULL default '0.000',
  `score_g` decimal(20,3) NOT NULL default '0.000',
  `score_e` decimal(20,3) NOT NULL default '0.000',
  `advance` decimal(20,3) default '0.000',
  `discount` decimal(20,3) NOT NULL default '0.000',
  `use_pmt` varchar(30) default NULL,
  `total_amount` decimal(20,3) NOT NULL default '0.000',
  `final_amount` decimal(20,3) NOT NULL default '0.000',
  `pmt_amount` decimal(20,3) default NULL,
  `payed` decimal(20,3) default '0.000',
  `markstar` enum('Y','N') default 'N',
  `memo` longtext,
  `print_status` tinyint(3) unsigned NOT NULL default '0',
  `mark_text` longtext,
  `disabled` enum('true','false') default 'false',
  `last_change_time` int(11) NOT NULL default '0',
  `use_registerinfo` enum('true','false') default 'false',
  `mark_type` varchar(2) NOT NULL default 'b1',
  `extend` varchar(255) default 'false',
  `is_has_remote_pdts` enum('true','false') NOT NULL default 'false',
  `order_refer` enum('local','taobao','paipai','mobile') NOT NULL default 'local',
  `print_id` varchar(20) default NULL,
  `cancel_time` int(10) unsigned default '0',
  PRIMARY KEY  (`order_id`),
  KEY `ind_ship_status` (`ship_status`),
  KEY `ind_pay_status` (`pay_status`),
  KEY `ind_status` (`status`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_print_id` (`print_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_orders`
--

INSERT INTO `sdb_orders` (`order_id`, `member_id`, `confirm`, `status`, `pay_status`, `ship_status`, `user_status`, `is_delivery`, `shipping_id`, `shipping`, `shipping_area`, `payment`, `weight`, `tostr`, `itemnum`, `acttime`, `delivery_time`, `delivery_delay_time`, `createtime`, `refer_id`, `refer_url`, `refer_time`, `c_refer_id`, `c_refer_url`, `c_refer_time`, `ip`, `ship_name`, `ship_area`, `ship_addr`, `ship_zip`, `ship_tel`, `ship_email`, `ship_time`, `ship_mobile`, `cost_item`, `is_tax`, `cost_tax`, `tax_company`, `cost_freight`, `is_protect`, `cost_protect`, `cost_payment`, `currency`, `cur_rate`, `score_u`, `score_g`, `score_e`, `advance`, `discount`, `use_pmt`, `total_amount`, `final_amount`, `pmt_amount`, `payed`, `markstar`, `memo`, `print_status`, `mark_text`, `disabled`, `last_change_time`, `use_registerinfo`, `mark_type`, `extend`, `is_has_remote_pdts`, `order_refer`, `print_id`, `cancel_time`) VALUES
(20090312138789, 1, 'N', 'active', '1', '1', 'null', 'Y', 4, '上海同城快递', '', 28, 0.000, '多彩人生多彩裤 (浅蓝色、XL)(1),花色高邦运动鞋 (深蓝色、38)(1)', 2, 1236837049, NULL, NULL, 1236836229, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '刘刚', 'mainland:上海/上海市/黄浦区:23', '上海上海市黄浦区人民路0号', '200001', '021-66668888', NULL, '任意日期 ', '13966668888', 287.000, 'false', 0.000, '', 0.000, 'false', 0.000, 0.000, 'CNY', 1.0000, 0.000, 0.000, 0.000, 0.000, 0.000, NULL, 287.000, 287.000, 0.000, 287.000, 'N', '', 8, NULL, 'false', 0, 'false', 'b1', 'false', 'false', 'local', NULL, 0),
(20090312133395, 2, 'N', 'dead', '0', '0', 'null', 'Y', 3, '顺丰速递-上海', '', 26, 0.000, '09新款韩版淑连衣裙(1),2009耐克新款运动鞋 (蓝白混色、37)(1)', 2, 1236836345, NULL, NULL, 1236836345, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '张三', 'mainland:广东/广州市/东山区:425', '广东广州市东山区江南镇0号', '300011', '020-66668888', NULL, '任意日期 ', '13866668888', 625.240, 'false', 0.000, '', 20.000, 'false', 0.000, 0.000, 'CNY', 1.0000, 0.000, 0.000, 0.000, 0.000, 0.000, NULL, 645.240, 645.240, 0.000, 0.000, 'N', '', 0, NULL, 'false', 1391909605, 'false', 'b1', 'false', 'false', 'local', NULL, 0),
(20090312137181, 1, 'N', 'dead', '0', '0', 'null', 'Y', 3, '顺丰速递-上海', '', 1, 0.000, '花色高邦运动鞋 (深蓝色、40)(1),09新款职业女裤 (银色、XL)(1),09新款韩版淑连衣裙(1),2009耐克新款运动鞋 (蓝白混色、37)(1)', 4, 1236837023, NULL, NULL, 1236837023, NULL, NULL, NULL, NULL, NULL, NULL, '127.0.0.1', '刘刚', 'mainland:上海/上海市/黄浦区:23', '上海上海市黄浦区人民路0号', '200001', '021-66668888', NULL, '任意日期 ', '13966668888', 1044.000, 'true', 0.000, '', 20.000, 'false', 0.000, 0.000, 'CNY', 1.0000, 0.000, 0.000, 0.000, 0.000, 0.000, NULL, 1064.000, 1064.000, 0.000, 0.000, 'N', '', 8, NULL, 'false', 1391909605, 'false', 'b1', 'false', 'false', 'local', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_order_items`
--

DROP TABLE IF EXISTS `sdb_order_items`;
CREATE TABLE IF NOT EXISTS `sdb_order_items` (
  `item_id` mediumint(8) unsigned NOT NULL auto_increment,
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `dly_status` enum('storage','shipping','return','customer','returned') NOT NULL default 'storage',
  `type_id` int(10) default NULL,
  `bn` varchar(40) default NULL,
  `name` varchar(200) default NULL,
  `cost` decimal(20,3) default NULL,
  `price` decimal(20,3) NOT NULL default '0.000',
  `amount` decimal(20,3) default NULL,
  `score` mediumint(8) unsigned default NULL,
  `nums` mediumint(8) unsigned NOT NULL default '1',
  `minfo` longtext,
  `sendnum` mediumint(8) unsigned NOT NULL default '0',
  `addon` longtext,
  `is_type` enum('goods','pkg') NOT NULL default 'goods',
  `point` mediumint(9) default NULL,
  `supplier_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `sdb_order_items`
--

INSERT INTO `sdb_order_items` (`item_id`, `order_id`, `product_id`, `dly_status`, `type_id`, `bn`, `name`, `cost`, `price`, `amount`, `score`, `nums`, `minfo`, `sendnum`, `addon`, `is_type`, `point`, `supplier_id`) VALUES
(1, 20090312138789, 259, 'shipping', 6, 'G49B7B00DB597F-4', '多彩人生多彩裤 (浅蓝色、XL)', NULL, 99.000, 99.000, 0, 1, 'N;', 1, 'a:11:{s:4:"spec";a:2:{i:1;s:9:"浅蓝色";i:2;s:2:"XL";}s:21:"spec_private_value_id";a:2:{i:1;s:11:"12367748454";i:2;s:11:"12367748787";}s:13:"spec_value_id";a:2:{i:1;s:2:"15";i:2;s:2:"23";}s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(2, 20090312138789, 250, 'shipping', 4, 'G49B7AF2072AF8-2', '花色高邦运动鞋 (深蓝色、38)', NULL, 188.000, 188.000, 0, 1, 'N;', 1, 'a:11:{s:4:"spec";a:2:{i:1;s:9:"深蓝色";i:3;s:2:"38";}s:21:"spec_private_value_id";a:2:{i:1;s:11:"12367746052";i:3;s:11:"12367746084";}s:13:"spec_value_id";a:2:{i:1;s:2:"17";i:3;s:2:"30";}s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(3, 20090312133395, 244, 'storage', 6, 'G49B7ADC300D5A', '09新款韩版淑连衣裙', NULL, 166.600, 166.600, 0, 1, 'N;', 0, 'a:9:{s:5:"idata";N;s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(4, 20090312133395, 240, 'storage', 4, 'G49B7AD7F76E15-1', '2009耐克新款运动鞋 (蓝白混色、37)', NULL, 458.640, 458.640, 0, 1, 'N;', 0, 'a:11:{s:4:"spec";a:2:{i:1;s:12:"蓝白混色";i:3;s:2:"37";}s:21:"spec_private_value_id";a:2:{i:1;s:11:"12367742381";i:3;s:11:"12367742512";}s:13:"spec_value_id";a:2:{i:1;s:2:"17";i:3;s:2:"29";}s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(5, 20090312137181, 255, 'storage', 4, 'G49B7AF2072AF8-7', '花色高邦运动鞋 (深蓝色、40)', NULL, 188.000, 188.000, 0, 1, 'N;', 0, 'a:11:{s:4:"spec";a:2:{i:1;s:9:"深蓝色";i:3;s:2:"40";}s:21:"spec_private_value_id";a:2:{i:1;s:11:"12367746052";i:3;s:11:"12367746096";}s:13:"spec_value_id";a:2:{i:1;s:2:"17";i:3;s:2:"32";}s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(6, 20090312137181, 248, 'storage', 6, 'G49B7AE2B87B03-4', '09新款职业女裤 (银色、XL)', NULL, 218.000, 218.000, 0, 1, 'N;', 0, 'a:11:{s:4:"spec";a:2:{i:1;s:6:"银色";i:2;s:2:"XL";}s:21:"spec_private_value_id";a:2:{i:1;s:11:"12367743583";i:2;s:11:"12367743655";}s:13:"spec_value_id";a:2:{i:1;s:2:"18";i:2;s:2:"23";}s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(7, 20090312137181, 244, 'storage', 6, 'G49B7ADC300D5A', '09新款韩版淑连衣裙', NULL, 170.000, 170.000, 0, 1, 'N;', 0, 'a:9:{s:5:"idata";N;s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL),
(8, 20090312137181, 240, 'storage', 4, 'G49B7AD7F76E15-1', '2009耐克新款运动鞋 (蓝白混色、37)', NULL, 468.000, 468.000, 0, 1, 'N;', 0, 'a:11:{s:4:"spec";a:2:{i:1;s:12:"蓝白混色";i:3;s:2:"37";}s:21:"spec_private_value_id";a:2:{i:1;s:11:"12367742381";i:3;s:11:"12367742512";}s:13:"spec_value_id";a:2:{i:1;s:2:"17";i:3;s:2:"29";}s:9:"use_brand";s:1:"1";s:9:"use_props";s:1:"1";s:10:"use_params";s:1:"0";s:9:"use_minfo";s:1:"0";s:8:"use_spec";N;s:7:"adjinfo";s:2:"na";s:7:"adjname";s:0:"";s:5:"minfo";N;}', 'goods', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_order_log`
--

DROP TABLE IF EXISTS `sdb_order_log`;
CREATE TABLE IF NOT EXISTS `sdb_order_log` (
  `log_id` int(10) NOT NULL auto_increment,
  `order_id` bigint(20) unsigned default NULL,
  `op_id` mediumint(8) default NULL,
  `op_name` varchar(30) default NULL,
  `log_text` longtext,
  `acttime` int(10) unsigned default NULL,
  `behavior` varchar(20) default '',
  `result` enum('success','failure') default 'success',
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `sdb_order_log`
--

INSERT INTO `sdb_order_log` (`log_id`, `order_id`, `op_id`, `op_name`, `log_text`, `acttime`, `behavior`, `result`) VALUES
(1, 20090312138789, 1, 'admin', '订单创建', 1236836229, '添加', 'success'),
(2, 20090312133395, 1, 'admin', '订单创建', 1236836345, '添加', 'success'),
(3, 20090312137181, 1, 'admin', '订单创建', 1236837023, '添加', 'success'),
(4, 20090312138789, 1, 'admin', '订单20090312138789付款287.000', 1236837049, '付款', 'success'),
(5, 20090312138789, 1, 'admin', '订单发货完成，物流公司：<a class="lnk" href="" target="_blank"></a>（可点击进入物流公司网站跟踪配送），物流单号：2222222', 1236837075, '发货', 'success'),
(6, 20090312137181, NULL, '系统', '订单过期系统自动作废', 1391909605, '作废', 'success'),
(7, 20090312133395, NULL, '系统', '订单过期系统自动作废', 1391909605, '作废', 'success');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_order_pmt`
--

DROP TABLE IF EXISTS `sdb_order_pmt`;
CREATE TABLE IF NOT EXISTS `sdb_order_pmt` (
  `pmt_id` bigint(20) unsigned NOT NULL default '0',
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `pmt_amount` decimal(20,3) default NULL,
  `pmt_memo` longtext,
  `pmt_describe` longtext,
  PRIMARY KEY  (`pmt_id`,`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_order_pmt`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_package_product`
--

DROP TABLE IF EXISTS `sdb_package_product`;
CREATE TABLE IF NOT EXISTS `sdb_package_product` (
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `discount` decimal(5,3) default NULL,
  `pkgnum` mediumint(8) unsigned NOT NULL default '1',
  PRIMARY KEY  (`product_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_package_product`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_pages`
--

DROP TABLE IF EXISTS `sdb_pages`;
CREATE TABLE IF NOT EXISTS `sdb_pages` (
  `page_id` mediumint(8) unsigned NOT NULL auto_increment,
  `page_name` varchar(90) NOT NULL default '',
  `page_title` varchar(90) NOT NULL default '',
  `page_content` longtext,
  `page_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`page_id`),
  KEY `uni_pagename` (`page_name`),
  KEY `uni_pagetitle` (`page_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_pages`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_payments`
--

DROP TABLE IF EXISTS `sdb_payments`;
CREATE TABLE IF NOT EXISTS `sdb_payments` (
  `payment_id` varchar(20) NOT NULL default '',
  `order_id` bigint(20) unsigned default NULL,
  `member_id` mediumint(8) unsigned default NULL,
  `account` varchar(50) default NULL,
  `bank` varchar(50) default NULL,
  `pay_account` varchar(50) default NULL,
  `currency` varchar(10) default NULL,
  `money` decimal(20,3) NOT NULL default '0.000',
  `paycost` decimal(20,3) default NULL,
  `cur_money` decimal(20,3) NOT NULL default '0.000',
  `pay_type` enum('online','offline','deposit','recharge','joinfee') NOT NULL default 'online',
  `payment` mediumint(8) unsigned NOT NULL default '0',
  `paymethod` varchar(100) default NULL,
  `op_id` mediumint(8) unsigned default NULL,
  `ip` varchar(20) default NULL,
  `t_begin` int(10) unsigned default NULL,
  `t_end` int(10) unsigned default NULL,
  `status` enum('succ','failed','cancel','error','invalid','progress','timeout','ready') NOT NULL default 'ready',
  `memo` longtext,
  `disabled` enum('true','false') default 'false',
  `trade_no` varchar(30) default NULL,
  PRIMARY KEY  (`payment_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_payments`
--

INSERT INTO `sdb_payments` (`payment_id`, `order_id`, `member_id`, `account`, `bank`, `pay_account`, `currency`, `money`, `paycost`, `cur_money`, `pay_type`, `payment`, `paymethod`, `op_id`, `ip`, `t_begin`, `t_end`, `status`, `memo`, `disabled`, `trade_no`) VALUES
('12368370496740', 20090312138789, 1, '2222555522225555', '招商银行', '', 'CNY', 287.000, 0.000, 287.000, 'offline', 28, '汇款-工商银行', 1, '127.0.0.1', 1236837049, 1236837049, 'succ', '后台admin支付成功！', 'false', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_payment_cfg`
--

DROP TABLE IF EXISTS `sdb_payment_cfg`;
CREATE TABLE IF NOT EXISTS `sdb_payment_cfg` (
  `id` mediumint(9) NOT NULL auto_increment,
  `custom_name` varchar(100) default NULL,
  `pay_type` varchar(30) NOT NULL default '',
  `config` longtext,
  `fee` decimal(9,5) NOT NULL default '0.00000',
  `des` longtext,
  `order_num` smallint(3) unsigned NOT NULL default '0',
  `disabled` enum('true','false') default 'false',
  `orderlist` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `sdb_payment_cfg`
--

INSERT INTO `sdb_payment_cfg` (`id`, `custom_name`, `pay_type`, `config`, `fee`, `des`, `order_num`, `disabled`, `orderlist`) VALUES
(1, '预存款支付', 'deposit', 'a:0:{}', 0.00000, '商店预存款支付', 0, 'false', 5),
(30, '支付宝（示范）', 'alipay', 'a:3:{s:9:"member_id";s:0:"";s:10:"PrivateKey";s:0:"";s:11:"real_method";s:1:"0";}', 0.00000, '', 0, 'false', 3),
(27, '腾讯财付通（示范）', 'tenpaytrad', 'a:2:{s:9:"member_id";s:0:"";s:10:"PrivateKey";s:0:"";}', 0.00000, '<P><FONT color=#ff0000><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA"><FONT color=#000000>财富通担保交易付款，购物更安全<BR></FONT>修改信息</SPAN>请到 商店管理后台 &gt;&gt; 商店配置 &gt;&gt; 支付方式 中进行编辑</FONT></P>', 0, 'false', 2),
(28, '汇款-工商银行（示范）', 'offline', 'a:0:{}', 0.00000, '<SPAN style="FONT-SIZE: 10.5pt; FONT-FAMILY: 宋体; mso-bidi-font-size: 12.0pt; mso-ascii-font-family: ''Times New Roman''; mso-hansi-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">帐号：</SPAN><SPAN lang=EN-US style="FONT-SIZE: 10.5pt; FONT-FAMILY: ''Times New Roman''; mso-bidi-font-size: 12.0pt; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体">95588 25888 66666 XXXX </SPAN><SPAN style="FONT-SIZE: 10.5pt; FONT-FAMILY: 宋体; mso-bidi-font-size: 12.0pt; mso-ascii-font-family: ''Times New Roman''; mso-hansi-font-family: ''Times New Roman''; mso-bidi-font-family: ''Times New Roman''; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">开户名：刘强<BR><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">修改信息请到</SPAN><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体"> </SPAN><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">商店管理后台</SPAN><SPAN lang=EN-US style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体"> &gt;&gt; </SPAN><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">商店配置</SPAN><SPAN lang=EN-US style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体"> &gt;&gt; </SPAN><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">支付方式</SPAN><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA; mso-fareast-font-family: 宋体"> </SPAN><SPAN style="FONT-SIZE: 9pt; COLOR: red; FONT-FAMILY: 宋体; mso-ascii-font-family: Arial; mso-hansi-font-family: Arial; mso-bidi-font-family: Arial; mso-font-kerning: 1.0pt; mso-ansi-language: EN-US; mso-fareast-language: ZH-CN; mso-bidi-language: AR-SA">中进行编辑</SPAN></SPAN>', 0, 'false', 4),
(31, '运筹宝', 'haipay', 'a:3:{s:9:"member_id";s:0:"";s:10:"PrivateKey";s:0: "";s:6:"method";s:1:"1";}', 0.00000, '', 0, 'false', 6);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_plugins`
--

DROP TABLE IF EXISTS `sdb_plugins`;
CREATE TABLE IF NOT EXISTS `sdb_plugins` (
  `plugin_id` mediumint(8) unsigned NOT NULL auto_increment,
  `plugin_ident` varchar(100) NOT NULL default '',
  `plugin_name` varchar(100) NOT NULL default '',
  `plugin_type` enum('io','schema','hook','pmt','local','messenger','pay','passport','admin','shop','action','app','mdl') NOT NULL default 'io',
  `app_type` varchar(100) NOT NULL default '',
  `plugin_base` enum('0','9') NOT NULL default '0',
  `plugin_version` varchar(100) default '1.0',
  `plugin_author` varchar(100) default NULL,
  `plugin_package` varchar(100) default NULL,
  `plugin_website` varchar(200) default NULL,
  `plugin_updatechec` varchar(200) default NULL,
  `plugin_desc` text,
  `plugin_hasopts` enum('true','false') NOT NULL default 'false',
  `plugin_struct` text,
  `plugin_config` text,
  `plugin_path` varchar(255) NOT NULL default '',
  `plugin_mode` enum('file','dir') NOT NULL default 'file',
  `status` enum('unused','used','broken') NOT NULL default 'unused',
  `disabled` enum('true','false') NOT NULL default 'false',
  `plugin_mtime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`plugin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- 转存表中的数据 `sdb_plugins`
--

INSERT INTO `sdb_plugins` (`plugin_id`, `plugin_ident`, `plugin_name`, `plugin_type`, `app_type`, `plugin_base`, `plugin_version`, `plugin_author`, `plugin_package`, `plugin_website`, `plugin_updatechec`, `plugin_desc`, `plugin_hasopts`, `plugin_struct`, `plugin_config`, `plugin_path`, `plugin_mode`, `status`, `disabled`, `plugin_mtime`) VALUES
(1, 'member', '会员触发器可用动作', 'action', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:13:"action_member";s:5:"props";a:2:{s:4:"name";s:27:"会员触发器可用动作";s:10:"action_for";s:14:"member/account";}s:5:"funcs";a:9:{s:13:"action_member";s:13:"action_member";s:7:"actions";s:7:"actions";s:8:"changelv";s:8:"changelv";s:8:"addpoint";s:8:"addpoint";s:8:"delpoint";s:8:"delpoint";s:10:"addadvance";s:10:"addadvance";s:10:"deladvance";s:10:"deladvance";s:10:"sendcoupon";s:10:"sendcoupon";s:6:"settag";s:6:"settag";}}', NULL, '/actions/action.member.php', 'file', 'unused', 'false', 1375076065),
(2, 'order', '订单触发器可用动作', 'action', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:12:"action_order";s:5:"props";a:2:{s:4:"name";s:27:"订单触发器可用动作";s:10:"action_for";s:13:"trading/order";}s:5:"funcs";a:7:{s:12:"action_order";s:12:"action_order";s:7:"actions";s:7:"actions";s:8:"addpoint";s:8:"addpoint";s:8:"delpoint";s:8:"delpoint";s:9:"addcoupon";s:9:"addcoupon";s:10:"addadvance";s:10:"addadvance";s:6:"settag";s:6:"settag";}}', NULL, '/actions/action.order.php', 'file', 'unused', 'false', 1375076065),
(3, 'system', '系统触发器可用动作', 'action', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:13:"action_system";s:5:"props";a:2:{s:4:"name";s:27:"系统触发器可用动作";s:10:"action_for";s:6:"system";}s:5:"funcs";a:1:{s:7:"actions";s:7:"actions";}}', NULL, '/actions/action.system.php', 'file', 'unused', 'false', 1375076065),
(4, 'commodity_radar', '商品雷达', 'app', '', '0', '1.0', 'shopex', 'commodity_radar', NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:19:"app_commodity_radar";s:5:"props";a:8:{s:3:"ver";s:3:"1.0";s:4:"name";s:12:"商品雷达";s:7:"outname";s:12:"商品雷达";s:7:"_app_id";s:15:"commodity_radar";s:7:"_col_id";s:16:"_commodity_radar";s:6:"author";s:6:"shopex";s:8:"help_tip";s:0:"";s:8:"html_url";s:42:"/app/commodity_radar/view/finder_name.html";}s:5:"funcs";a:1:{s:16:"output_modifiers";s:16:"output_modifiers";}}', NULL, '/app/commodity_radar/app.commodity_radar.php', 'file', 'used', 'false', 1376558355),
(5, 'shopex_stat', '营销统计工具', 'app', '', '0', '3.6.4', 'Rocky Anjiaxin Fuxiudong', 'shopex_stat', 'http://www.shopex.cn', NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:15:"app_shopex_stat";s:5:"props";a:4:{s:3:"ver";s:5:"3.6.4";s:4:"name";s:18:"营销统计工具";s:7:"website";s:20:"http://www.shopex.cn";s:6:"author";s:24:"Rocky Anjiaxin Fuxiudong";}s:5:"funcs";a:5:{s:16:"output_modifiers";s:16:"output_modifiers";s:7:"getmenu";s:7:"getmenu";s:15:"modify_pagedata";s:15:"modify_pagedata";s:6:"get_js";s:6:"get_js";s:13:"get_cart_data";s:13:"get_cart_data";}}', NULL, '/app/shopex_stat/app.shopex_stat.php', 'file', 'used', 'false', 1376550875),
(6, 'syj', 'syj', 'admin', '', '0', '1.0', NULL, 'shopex_stat', NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:9:"admin_syj";s:5:"props";a:0:{}s:5:"funcs";a:1:{s:5:"index";s:5:"index";}}', NULL, '/app/shopex_stat/admin.syj.php', 'file', 'unused', 'true', 1376891136),
(7, 'syj', 'syj', 'mdl', '', '0', '1.0', NULL, 'shopex_stat', NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"mdl_syj";s:5:"props";a:0:{}s:5:"funcs";a:6:{s:12:"open_service";s:12:"open_service";s:7:"account";s:7:"account";s:5:"false";s:5:"false";s:12:"_create_sign";s:12:"_create_sign";s:13:"_state_encode";s:13:"_state_encode";s:13:"_state_decode";s:13:"_state_decode";}}', NULL, '/app/shopex_stat/mdl.syj.php', 'file', 'unused', 'true', 1345709524),
(8, 'csv', 'csv-逗号分隔的文本文件', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:6:"io_csv";s:5:"props";a:2:{s:4:"name";s:31:"csv-逗号分隔的文本文件";s:16:"importforObjects";s:5:"goods";}s:5:"funcs";a:6:{s:12:"export_begin";s:12:"export_begin";s:11:"export_rows";s:11:"export_rows";s:13:"export_finish";s:13:"export_finish";s:7:"_escape";s:7:"_escape";s:10:"import_row";s:10:"import_row";s:11:"import_rows";s:11:"import_rows";}}', NULL, '/dataio/io.csv.php', 'file', 'unused', 'false', 1375076065),
(9, 'gtype', '类型定义文件', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:8:"io_gtype";s:5:"props";a:2:{s:4:"name";s:18:"类型定义文件";s:16:"importforObjects";s:5:"gtype";}s:5:"funcs";a:1:{s:11:"import_rows";s:11:"import_rows";}}', NULL, '/dataio/io.gtype.php', 'file', 'unused', 'false', 1375076065),
(10, 'sitezol', 'ZOL数据导入(输入产品参数页链接)', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:10:"io_sitezol";s:5:"props";a:3:{s:4:"name";s:44:"ZOL数据导入(输入产品参数页链接)";s:16:"importforObjects";s:5:"goods";s:10:"developing";b:1;}s:5:"funcs";a:2:{s:10:"import_row";s:10:"import_row";s:11:"import_rows";s:11:"import_rows";}}', NULL, '/dataio/io.sitezol.php', 'file', 'unused', 'false', 1375076065),
(11, 'taobaogoodscsv', 'csv-订单商品（兼容淘宝格式）', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:17:"io_taobaogoodscsv";s:5:"props";a:4:{s:4:"name";s:40:"csv-订单商品（兼容淘宝格式）";s:16:"importforObjects";s:5:"order";s:16:"exportforObjects";s:5:"order";s:7:"columns";s:8:"order_id";}s:5:"funcs";a:6:{s:12:"export_begin";s:12:"export_begin";s:11:"export_rows";s:11:"export_rows";s:13:"export_finish";s:13:"export_finish";s:7:"_escape";s:7:"_escape";s:10:"import_row";s:10:"import_row";s:11:"import_rows";s:11:"import_rows";}}', NULL, '/dataio/io.taobaogoodscsv.php', 'file', 'unused', 'false', 1375076065),
(12, 'taobaoordercsv', 'csv-订单列表（兼容淘宝格式）', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:17:"io_taobaoordercsv";s:5:"props";a:4:{s:4:"name";s:40:"csv-订单列表（兼容淘宝格式）";s:16:"importforObjects";s:5:"order";s:16:"exportforObjects";s:5:"order";s:7:"columns";s:316:"order_id,member_id,member_id as shop_cat,final_amount,cost_freight,score_g as tpayscore,total_amount,total_amount,score_g,payed,score_g as tscore,pay_status,memo,ship_name,ship_area,ship_addr,ship_zip,shipping_id,ship_tel,ship_mobile,createtime,acttime,tostr,tostr as tsort,order_id as delivery_id,shipping,mark_text";}s:5:"funcs";a:6:{s:12:"export_begin";s:12:"export_begin";s:11:"export_rows";s:11:"export_rows";s:13:"export_finish";s:13:"export_finish";s:7:"_escape";s:7:"_escape";s:10:"import_row";s:10:"import_row";s:11:"import_rows";s:11:"import_rows";}}', NULL, '/dataio/io.taobaoordercsv.php', 'file', 'unused', 'false', 1375076065),
(13, 'txt', 'txt-制表符分隔的文本文件', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:6:"io_txt";s:5:"props";a:1:{s:4:"name";s:34:"txt-制表符分隔的文本文件";}s:5:"funcs";a:3:{s:12:"export_begin";s:12:"export_begin";s:11:"export_rows";s:11:"export_rows";s:13:"export_finish";s:13:"export_finish";}}', NULL, '/dataio/io.txt.php', 'file', 'unused', 'false', 1375076066),
(14, 'xls', 'xls-Excel文件', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:6:"io_xls";s:5:"props";a:1:{s:4:"name";s:15:"xls-Excel文件";}s:5:"funcs";a:3:{s:12:"export_begin";s:12:"export_begin";s:11:"export_rows";s:11:"export_rows";s:13:"export_finish";s:13:"export_finish";}}', NULL, '/dataio/io.xls.php', 'file', 'unused', 'false', 1375076065),
(15, 'xml', 'xml-可扩展标识语言', 'io', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:6:"io_xml";s:5:"props";a:1:{s:4:"name";s:25:"xml-可扩展标识语言";}s:5:"funcs";a:1:{s:11:"import_rows";s:11:"import_rows";}}', NULL, '/dataio/io.xml.php', 'file', 'unused', 'false', 1375076066),
(16, 'mainland', '中国地区', 'local', '', '0', '1.0', NULL, NULL, NULL, NULL, '系统默认为中国地区设置，包括港、澳、台地区。', 'false', 'a:3:{s:10:"class_name";s:14:"local_mainland";s:5:"props";a:3:{s:4:"name";s:12:"中国地区";s:4:"desc";s:66:"系统默认为中国地区设置，包括港、澳、台地区。";s:8:"maxdepth";s:1:"3";}s:5:"funcs";a:1:{s:7:"install";s:7:"install";}}', NULL, '/location/mainland/local.mainland.php', 'file', 'unused', 'false', 1375076068),
(17, 'email', '电子邮件', 'messenger', '', '0', '$ver$', NULL, NULL, NULL, NULL, NULL, 'true', 'a:3:{s:10:"class_name";s:15:"messenger_email";s:5:"props";a:13:{s:4:"name";s:12:"电子邮件";s:9:"iconclass";s:18:""sysiconBtn email"";s:9:"name_show";s:9:"发邮件";s:7:"version";s:5:"$ver$";s:9:"updateUrl";s:0:"";s:6:"isHtml";b:1;s:8:"hasTitle";b:1;s:7:"maxtime";s:3:"300";s:13:"maxbodylength";s:3:"300";s:16:"allowMultiTarget";b:0;s:11:"targetSplit";s:1:",";s:8:"dataname";s:5:"email";s:5:"debug";b:0;}s:5:"funcs";a:4:{s:5:"ready";s:5:"ready";s:6:"finish";s:6:"finish";s:4:"send";s:4:"send";s:10:"getoptions";s:10:"getoptions";}}', NULL, '/messenger/email/messenger.email.php', 'file', 'unused', 'false', 1378374068),
(18, 'msgbox', '站内消息', 'messenger', '', '0', '$ver$', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:16:"messenger_msgbox";s:5:"props";a:12:{s:4:"name";s:12:"站内消息";s:9:"iconclass";s:19:""sysiconBtn msgbox"";s:9:"name_show";s:9:"发消息";s:7:"version";s:5:"$ver$";s:9:"updateUrl";b:0;s:6:"isHtml";b:0;s:8:"hasTitle";b:1;s:7:"maxtime";s:3:"300";s:13:"maxbodylength";s:3:"300";s:16:"allowMultiTarget";b:0;s:8:"dataname";s:9:"member_id";s:12:"withoutQueue";b:1;}s:5:"funcs";a:4:{s:16:"messenger_msgbox";s:16:"messenger_msgbox";s:4:"send";s:4:"send";s:5:"ready";s:5:"ready";s:6:"finish";s:6:"finish";}}', NULL, '/messenger/msgbox/messenger.msgbox.php', 'file', 'unused', 'false', 1375076068),
(19, 'sms', '手机短信', 'messenger', '', '0', '$ver$', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:13:"messenger_sms";s:5:"props";a:14:{s:4:"name";s:12:"手机短信";s:9:"iconclass";s:16:""sysiconBtn sms"";s:9:"name_show";s:9:"发短信";s:7:"version";s:5:"$ver$";s:9:"updateUrl";b:0;s:6:"isHtml";b:0;s:8:"hasTitle";b:0;s:7:"maxtime";s:3:"300";s:13:"maxbodylength";s:3:"300";s:16:"allowMultiTarget";b:0;s:12:"withoutQueue";b:0;s:8:"dataname";s:6:"mobile";s:14:"sms_service_ip";s:14:"124.74.193.222";s:11:"sms_service";s:36:"http://idx.sms.shopex.cn/service.php";}s:5:"funcs";a:6:{s:13:"messenger_sms";s:13:"messenger_sms";s:4:"send";s:4:"send";s:5:"apply";s:5:"apply";s:5:"ready";s:5:"ready";s:6:"finish";s:6:"finish";s:9:"extravars";s:9:"extravars";}}', NULL, '/messenger/sms/messenger.sms.php', 'file', 'unused', 'false', 1375076068),
(20, 'discuz', 'discuz', 'passport', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'true', 'a:3:{s:10:"class_name";s:15:"passport_discuz";s:5:"props";a:4:{s:13:"passport_name";s:18:""Discuz论坛V6.0"";s:13:"passport_memo";s:2:"""";s:7:"_config";N;s:7:"forward";s:1:"1";}s:5:"funcs";a:13:{s:9:"setconfig";s:9:"setconfig";s:11:"verifylogin";s:11:"verifylogin";s:6:"decode";s:6:"decode";s:10:"getoptions";s:10:"getoptions";s:8:"validkey";s:8:"validkey";s:9:"ssosignin";s:9:"ssosignin";s:11:"ssologinout";s:11:"ssologinout";s:8:"ssologin";s:8:"ssologin";s:5:"login";s:5:"login";s:6:"regist";s:6:"regist";s:6:"logout";s:6:"logout";s:13:"getplugcookie";s:13:"getplugcookie";s:13:"setplugcookie";s:13:"setplugcookie";}}', NULL, '/passport/passport.discuz.php', 'file', 'unused', 'false', 1375076069),
(21, 'phpwind', '"phpwind"', 'passport', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'true', 'a:3:{s:10:"class_name";s:16:"passport_phpwind";s:5:"props";a:5:{s:13:"passport_name";s:21:""PhpWind论坛V6.3.2"";s:13:"passport_memo";s:192:""此功能可进行第三方系统（譬如论坛系统）用户同步与登录同步设置（Phpwind论坛最新版本已内置本系统接口，其它系统请根据文档自行编写）；"";s:7:"_config";N;s:7:"forward";s:1:"0";s:4:"name";s:9:""phpwind"";}s:5:"funcs";a:13:{s:9:"setconfig";s:9:"setconfig";s:11:"verifylogin";s:11:"verifylogin";s:6:"decode";s:6:"decode";s:10:"getoptions";s:10:"getoptions";s:5:"login";s:5:"login";s:6:"regist";s:6:"regist";s:6:"logout";s:6:"logout";s:8:"_strcode";s:8:"_strcode";s:16:"clientuseraction";s:16:"clientuseraction";s:7:"strcode";s:7:"strcode";s:12:"serverclient";s:12:"serverclient";s:13:"getplugcookie";s:13:"getplugcookie";s:13:"setplugcookie";s:13:"setplugcookie";}}', NULL, '/passport/passport.phpwind.php', 'file', 'unused', 'false', 1375076069),
(22, 'phpwind7', '"phpwind7"', 'passport', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'true', 'a:3:{s:10:"class_name";s:17:"passport_phpwind7";s:5:"props";a:5:{s:13:"passport_name";s:19:""PhpWind论坛V7.0"";s:13:"passport_memo";s:192:""此功能可进行第三方系统（譬如论坛系统）用户同步与登录同步设置（Phpwind论坛最新版本已内置本系统接口，其它系统请根据文档自行编写）；"";s:7:"_config";N;s:7:"forward";s:1:"0";s:4:"name";s:10:""phpwind7"";}s:5:"funcs";a:13:{s:9:"setconfig";s:9:"setconfig";s:11:"verifylogin";s:11:"verifylogin";s:6:"decode";s:6:"decode";s:10:"getoptions";s:10:"getoptions";s:5:"login";s:5:"login";s:6:"regist";s:6:"regist";s:6:"logout";s:6:"logout";s:8:"_strcode";s:8:"_strcode";s:16:"clientuseraction";s:16:"clientuseraction";s:7:"strcode";s:7:"strcode";s:12:"serverclient";s:12:"serverclient";s:13:"getplugcookie";s:13:"getplugcookie";s:13:"setplugcookie";s:13:"setplugcookie";}}', NULL, '/passport/passport.phpwind7.php', 'file', 'unused', 'false', 1375076069),
(23, 'ucenter', '"ucenter"', 'passport', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'true', 'a:3:{s:10:"class_name";s:16:"passport_ucenter";s:5:"props";a:6:{s:13:"passport_name";s:17:""UCenter 1.0/1.5"";s:13:"passport_memo";s:22:""Ucenter1.0/1.5整合"";s:7:"_config";N;s:4:"tmpl";s:23:""passport_ucenter.html"";s:7:"forward";s:1:"0";s:4:"name";s:9:""ucenter"";}s:5:"funcs";a:16:{s:9:"setconfig";s:9:"setconfig";s:11:"verifylogin";s:11:"verifylogin";s:6:"decode";s:6:"decode";s:10:"getoptions";s:10:"getoptions";s:9:"checkuser";s:9:"checkuser";s:11:"regist_user";s:11:"regist_user";s:6:"regist";s:6:"regist";s:6:"logout";s:6:"logout";s:11:"check_login";s:11:"check_login";s:5:"login";s:5:"login";s:8:"get_user";s:8:"get_user";s:12:"getdefinevar";s:12:"getdefinevar";s:15:"implodeusertouc";s:15:"implodeusertouc";s:8:"edituser";s:8:"edituser";s:17:"checkuserregister";s:17:"checkuserregister";s:13:"checkusername";s:13:"checkusername";}}', NULL, '/passport/passport.ucenter.php', 'file', 'unused', 'false', 1375076069),
(24, 'c_1', '优惠券规则--购物车中商品总金额大于指定金额，赠送某个赠品', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_1";s:5:"props";a:3:{s:4:"name";s:83:"优惠券规则--购物车中商品总金额大于指定金额，赠送某个赠品";s:4:"memo";s:57:"购物车的金额大于指定金额，赠送某个赠品";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_1.php', 'file', 'unused', 'false', 1375076066),
(25, 'c_2', '优惠券规则--商品直接打折，如全场女鞋8折。可以对商品任意折扣，适合低价清货促销', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_2";s:5:"props";a:3:{s:4:"name";s:114:"优惠券规则--商品直接打折，如全场女鞋8折。可以对商品任意折扣，适合低价清货促销";s:4:"memo";s:97:"商品直接打折，如全场女鞋8折。可以对商品任意折扣，适合低价清货促销";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_2.php', 'file', 'unused', 'false', 1375076066),
(26, 'c_3', '优惠券规则--顾客购买指定的商品，可获得翻倍积分或者x倍积分', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_3";s:5:"props";a:3:{s:4:"name";s:84:"优惠券规则--顾客购买指定的商品，可获得翻倍积分或者x倍积分";s:4:"memo";s:67:"顾客购买指定的商品，可获得翻倍积分或者x倍积分";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_3.php', 'file', 'unused', 'false', 1375076066),
(27, 'c_4', '优惠券规则--购物车中商品总金额大于指定金额，免运费', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_4";s:5:"props";a:3:{s:4:"name";s:74:"优惠券规则--购物车中商品总金额大于指定金额，免运费";s:4:"memo";s:48:"购物车的金额大于指定金额，免运费";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_4.php', 'file', 'unused', 'false', 1375076066),
(28, 'c_5', '优惠券规则--购物车中商品总金额大于指定金额，客户可获得一张优惠券', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_5";s:5:"props";a:3:{s:4:"name";s:95:"优惠券规则--购物车中商品总金额大于指定金额，客户可获得一张优惠券";s:4:"memo";s:69:"购物车的金额大于指定金额，客户可获得一张优惠券";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_5.php', 'file', 'unused', 'false', 1375076066),
(29, 'c_6', '优惠券规则--购物车中商品总金额大于指定金额，客户就可得到指定的%off折扣', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_6";s:5:"props";a:3:{s:4:"name";s:102:"优惠券规则--购物车中商品总金额大于指定金额，客户就可得到指定的%off折扣";s:4:"memo";s:76:"购物车的金额大于指定金额，客户就可得到指定的%off折扣";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_6.php', 'file', 'unused', 'false', 1375076066),
(30, 'c_7', '优惠券规则--购物车中商品总金额大于指定金额,就可立减某金额', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_c_7";s:5:"props";a:3:{s:4:"name";s:84:"优惠券规则--购物车中商品总金额大于指定金额,就可立减某金额";s:4:"memo";s:58:"购物车的金额大于指定金额,就可立减某金额";s:9:"pmts_type";i:1;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.c_7.php', 'file', 'unused', 'false', 1375076066),
(31, 'n_1', '促销活动规则--购物车中商品总金额大于指定金额，赠送某个赠品', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_1";s:5:"props";a:3:{s:4:"name";s:86:"促销活动规则--购物车中商品总金额大于指定金额，赠送某个赠品";s:4:"memo";s:57:"购物车的金额大于指定金额，赠送某个赠品";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_1.php', 'file', 'unused', 'false', 1375076066),
(32, 'n_2', '促销活动规则--商品直接打折，如全场女鞋8折。可以对商品任意折扣，适合低价清货促销', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_2";s:5:"props";a:3:{s:4:"name";s:117:"促销活动规则--商品直接打折，如全场女鞋8折。可以对商品任意折扣，适合低价清货促销";s:4:"memo";s:97:"商品直接打折，如全场女鞋8折。可以对商品任意折扣，适合低价清货促销";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_2.php', 'file', 'unused', 'false', 1375076066),
(33, 'n_3', '促销活动规则--顾客购买指定的商品，可获得翻倍积分或者x倍积分', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_3";s:5:"props";a:3:{s:4:"name";s:87:"促销活动规则--顾客购买指定的商品，可获得翻倍积分或者x倍积分";s:4:"memo";s:67:"顾客购买指定的商品，可获得翻倍积分或者x倍积分";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_3.php', 'file', 'unused', 'false', 1375076066),
(34, 'n_4', '促销活动规则--购物车中商品总金额大于指定金额，免运费', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_4";s:5:"props";a:3:{s:4:"name";s:77:"促销活动规则--购物车中商品总金额大于指定金额，免运费";s:4:"memo";s:48:"购物车的金额大于指定金额，免运费";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_4.php', 'file', 'unused', 'false', 1375076066),
(35, 'n_5', '促销活动规则--购物车中商品总金额大于指定金额，客户可获得一张优惠券', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_5";s:5:"props";a:3:{s:4:"name";s:98:"促销活动规则--购物车中商品总金额大于指定金额，客户可获得一张优惠券";s:4:"memo";s:69:"购物车的金额大于指定金额，客户可获得一张优惠券";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_5.php', 'file', 'unused', 'false', 1375076066),
(36, 'n_6', '促销活动规则--购物车中商品总金额大于指定金额，客户就可得到指定的%off折扣', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_6";s:5:"props";a:3:{s:4:"name";s:105:"促销活动规则--购物车中商品总金额大于指定金额，客户就可得到指定的%off折扣";s:4:"memo";s:76:"购物车的金额大于指定金额，客户就可得到指定的%off折扣";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_6.php', 'file', 'unused', 'false', 1375076066),
(37, 'n_7', '促销活动规则--购物车中商品总金额大于指定金额,就可立减某金额', 'pmt', '', '0', '1.0', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:7:"pmt_n_7";s:5:"props";a:3:{s:4:"name";s:87:"促销活动规则--购物车中商品总金额大于指定金额,就可立减某金额";s:4:"memo";s:58:"购物车的金额大于指定金额,就可立减某金额";s:9:"pmts_type";i:0;}s:5:"funcs";a:0:{}}', NULL, '/pmtScheme/pmt.n_7.php', 'file', 'unused', 'false', 1375076066),
(38, 'custom', '自定义商品类型', 'schema', '', '0', '$Id: schema.php 11689 2008-06-30 10:34:09Z qingo $', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:13:"schema_custom";s:5:"props";a:6:{s:4:"name";s:21:"自定义商品类型";s:7:"version";s:50:"$Id: schema.php 11689 2008-06-30 10:34:09Z qingo $";s:9:"use_brand";b:1;s:10:"use_params";b:0;s:9:"use_props";b:1;s:9:"use_minfo";b:0;}s:5:"funcs";a:1:{s:4:"init";s:4:"init";}}', NULL, '/schema/custom/schema.custom.php', 'file', 'unused', 'false', 1375076065),
(39, 'simple', '通用商品类型', 'schema', '', '0', '$Id: schema.php 11548 2008-06-26 08:14:24Z ever $', NULL, NULL, NULL, NULL, NULL, 'false', 'a:3:{s:10:"class_name";s:13:"schema_simple";s:5:"props";a:7:{s:4:"name";s:18:"通用商品类型";s:7:"version";s:49:"$Id: schema.php 11548 2008-06-26 08:14:24Z ever $";s:9:"use_brand";b:1;s:10:"use_params";b:0;s:9:"use_props";b:0;s:8:"use_spec";b:1;s:6:"is_def";b:1;}s:5:"funcs";a:0:{}}', NULL, '/schema/simple/schema.simple.php', 'file', 'unused', 'false', 1375076065);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_pmt_gen_coupon`
--

DROP TABLE IF EXISTS `sdb_pmt_gen_coupon`;
CREATE TABLE IF NOT EXISTS `sdb_pmt_gen_coupon` (
  `pmt_id` mediumint(8) unsigned NOT NULL default '0',
  `cpns_id` mediumint(8) unsigned NOT NULL default '0',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`pmt_id`,`cpns_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_pmt_gen_coupon`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_pmt_goods`
--

DROP TABLE IF EXISTS `sdb_pmt_goods`;
CREATE TABLE IF NOT EXISTS `sdb_pmt_goods` (
  `pmt_id` mediumint(8) unsigned NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `count` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`pmt_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_pmt_goods`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_pmt_goods_cat`
--

DROP TABLE IF EXISTS `sdb_pmt_goods_cat`;
CREATE TABLE IF NOT EXISTS `sdb_pmt_goods_cat` (
  `cat_id` int(10) NOT NULL default '0',
  `brand_id` mediumint(8) unsigned NOT NULL default '0',
  `pmt_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`,`brand_id`,`pmt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_pmt_goods_cat`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_pmt_member_lv`
--

DROP TABLE IF EXISTS `sdb_pmt_member_lv`;
CREATE TABLE IF NOT EXISTS `sdb_pmt_member_lv` (
  `member_lv_id` mediumint(9) default NULL,
  `pmt_id` mediumint(8) unsigned default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_pmt_member_lv`
--

INSERT INTO `sdb_pmt_member_lv` (`member_lv_id`, `pmt_id`) VALUES
(3, 1),
(2, 1),
(1, 1),
(3, 2),
(2, 2),
(1, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_point_history`
--

DROP TABLE IF EXISTS `sdb_point_history`;
CREATE TABLE IF NOT EXISTS `sdb_point_history` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `point` int(10) NOT NULL default '0',
  `time` int(10) unsigned NOT NULL default '0',
  `reason` varchar(50) NOT NULL default '',
  `related_id` bigint(20) unsigned default NULL,
  `type` tinyint(1) NOT NULL default '1',
  `operator` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_point_history`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_print_tmpl`
--

DROP TABLE IF EXISTS `sdb_print_tmpl`;
CREATE TABLE IF NOT EXISTS `sdb_print_tmpl` (
  `prt_tmpl_id` int(10) unsigned NOT NULL auto_increment,
  `prt_tmpl_title` varchar(100) NOT NULL default '',
  `shortcut` enum('true','false') default 'false',
  `disabled` enum('true','false') default 'false',
  `prt_tmpl_width` tinyint(3) unsigned NOT NULL default '100',
  `prt_tmpl_height` tinyint(3) unsigned NOT NULL default '100',
  `prt_tmpl_data` longtext,
  PRIMARY KEY  (`prt_tmpl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `sdb_print_tmpl`
--

INSERT INTO `sdb_print_tmpl` (`prt_tmpl_id`, `prt_tmpl_title`, `shortcut`, `disabled`, `prt_tmpl_width`, `prt_tmpl_height`, `prt_tmpl_data`) VALUES
(1, 'EMS', 'true', 'false', 250, 150, '<printer picposition="0:0"><item><name>发货人-姓名</name><ucode>dly_name</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>132:126:91:24</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>189:154:219:23</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>143:180:266:68</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font></font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>323:249:91:20</position></item><item><name>√</name><ucode>tick</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>181:270:26:21</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>488:126:101:24</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>490:181:293:68</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>658:124:122:20</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>339:316:75:54</position></item><item><name>测试内容-物品名称</name><ucode>text</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>center</align><position>75:330:207:21</position></item><item><name>订单-备注</name><ucode>order_memo</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>483:393:289:32</position></item><item><name>收货人-地区2级</name><ucode>ship_area_2</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>480:251:73:21</position></item><item><name>当日日期-年</name><ucode>date_y</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>474:371:42:22</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>532:371:29:20</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>584:371:26:21</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font></font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>672:251:112:21</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>289:122:120:20</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>289:138:120:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>658:144:124:20</position></item></printer>'),
(2, '申通快递单', 'true', 'false', 250, 180, '<printer picposition="0:0"><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>黑体</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>453:217:169:29</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>440:248:103:20</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font></font><fontsize>12</fontsize><fontspace>12</fontspace><border>0</border><italic>0</italic><align>left</align><position>569:259:95:23</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>宋体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>428:124:228:58</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>160:125:193:57</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>129:187:223:25</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>142:220:187:28</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>136:268:105:20</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font></font><fontsize>12</fontsize><fontspace>10</fontspace><border>0</border><italic>0</italic><align>left</align><position>267:261:100:20</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>714:231:62:25</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>黑体</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>714:179:66:44</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>508:361:25:20</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>136:248:106:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>宋体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>432:267:116:20</position></item></printer>'),
(3, '顺丰速运1', 'true', 'false', 250, 180, '<printer picposition="0:0"><item><name>发货人-姓名</name><ucode>dly_name</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>287:127:78:26</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>88:155:279:57</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>223:222:144:20</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>130:223:87:20</position></item><item><name>√</name><ucode>tick</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>367:124:20:20</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>286:254:75:31</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>81:285:281:91</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>125:384:90:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>219:384:140:21</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>302:445:62:28</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>103:125:158:29</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>575:131:20:20</position></item><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>570:74:64:38</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>637:73:60:39</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>599:369:34:20</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>640:369:33:20</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>center</align><position>592:340:157:24</position></item></printer>'),
(4, '顺丰速运2', 'true', 'false', 240, 135, '<printer picposition="0:0"><item><name>网店名称</name><ucode>shop_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>114:134:185:23</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>331:135:79:22</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>653:253:113:32</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>226:239:182:21</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>270:263:135:20</position></item><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>199:160:48:25</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font>undefined</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>114:184:293:54</position></item><item><name>发货人-地区1级</name><ucode>dly_area_0</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>107:159:60:24</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>543:159:66:27</position></item><item><name>收货人-地区1级</name><ucode>ship_area_0</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>472:159:55:24</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>468:186:297:60</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>692:134:75:23</position></item><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>黑体</font><fontsize>18</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>620:91:74:40</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>undefined</font><fontsize>18</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>696:90:70:41</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>399:292:20:20</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>402:454:22:20</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>428:454:20:20</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>532:253:93:34</position></item></printer>'),
(5, '天天快递', 'false', 'false', 250, 180, '<printer picposition="0:0"><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>329:107:84:29</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>141:139:273:72</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font></font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>305:194:87:20</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>115:212:145:23</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>304:214:111:21</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>115:236:297:22</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>483:106:98:33</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>503:141:259:48</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font></font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>664:190:96:22</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>481:213:148:24</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>665:213:94:22</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>500:260:242:25</position></item><item><name>当日日期-年</name><ucode>date_y</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>123:107:36:21</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>158:107:20:21</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>180:106:20:22</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>270:324:119:23</position></item></printer>'),
(6, '圆通速递模板', 'false', 'false', 250, 150, '<printer picposition="0:0"><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>481:112:87:23</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>419:198:366:37</position></item><item><name>当日日期-年</name><ucode>date_y</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>64:407:39:20</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>130:121:272:30</position></item><item><name>发货人-地区1级</name><ucode>dly_area_1</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>126:160:75:30</position></item><item><name>发货人-地区2级</name><ucode>dly_area_2</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>225:160:52:31</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>144:222:114:27</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>57:192:343:28</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>119:95:93:26</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>115:407:21:20</position></item><item><name>收货人-地区1级</name><ucode>ship_area_1</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>481:164:102:31</position></item><item><name>发货人-地区2级</name><ucode>dly_area_2</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>603:163:58:31</position></item><item><name>√</name><ucode>tick</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>131:254:23:21</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>646:107:124:24</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>153:406:20:20</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font></font><fontsize>12</fontsize><fontspace>10</fontspace><border>0</border><italic>0</italic><align>left</align><position>693:230:105:20</position></item><item><name>订单-备注</name><ucode>order_memo</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>473:403:308:20</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>291:317:99:30</position></item><item><name>自定义内容（内件品名）</name><ucode>text</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>59:316:210:31</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font></font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>313:228:99:20</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>246:348:20:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>646:125:125:20</position></item><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>275:95:122:23</position></item></printer>'),
(7, '韵达快运单', 'false', 'false', 250, 150, '<printer picposition="0:0"><item><name>收货人-地址</name><ucode>ship_addr</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>424:160:338:86</position></item><item><name>收货人-地区1级</name><ucode>ship_area_0</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>468:116:76:22</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>542:115:78:24</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>601:140:125:20</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>66:166:341:80</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>104:248:162:20</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>163:111:20:25</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>192:110:20:26</position></item><item><name>当日日期-年</name><ucode>date_y</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>121:110:32:25</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>227:140:180:25</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>461:246:141:20</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>8</fontspace><border>1</border><italic>0</italic><align>left</align><position>653:255:110:26</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>8</fontspace><border>1</border><italic>0</italic><align>left</align><position>315:259:90:22</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>696:404:20:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>461:264:143:20</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>104:266:162:20</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>128:338:110:35</position></item></printer>'),
(8, '宅急送快件', 'false', 'false', 250, 180, '<printer picposition="0:0"><item><name>发货人-姓名</name><ucode>dly_name</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>143:129:100:31</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>108:162:293:59</position></item><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>270:129:126:30</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>513:127:98:31</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>633:127:130:31</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>469:160:294:58</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>112:222:288:28</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>101:251:141:23</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>296:251:105:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>644:248:118:23</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>453:249:143:25</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>102:304:97:26</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>100:464:20:20</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>128:463:20:20</position></item><item><name>订单-备注</name><ucode>order_memo</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>469:376:174:42</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>383:424:20:21</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>66:443:125:25</position></item></printer>'),
(9, '宅急送普件', 'false', 'false', 240, 135, '<printer picposition="0:0"><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>undefined</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>272:132:130:31</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>75:446:103:33</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>106:165:294:59</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>107:225:289:27</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>271:254:131:25</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>482:131:120:32</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>637:132:126:30</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>undefined</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>467:164:296:58</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>622:253:143:25</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>462:253:136:24</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>106:305:93:27</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>383:426:20:20</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>99:465:20:20</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>125:466:20:21</position></item><item><name>订单-备注</name><ucode>order_memo</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>516:363:127:62</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>125:133:116:31</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>103:255:139:22</position></item></printer>'),
(10, '中国邮政普件', 'false', 'false', 240, 135, '<printer picposition="0:0"><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>130:261:107:27</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>275:253:142:20</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>undefined</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>151:188:267:66</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>16</fontspace><border>1</border><italic>0</italic><align>left</align><position>95:160:159:20</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>152:291:266:66</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>276:356:129:20</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>133:365:98:26</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>576:259:20:20</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>505:174:93:75</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>433:354:25:23</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>10</fontspace><border>0</border><italic>0</italic><align>left</align><position>305:400:112:21</position></item><item><name>测试内容物品</name><ucode>text</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>421:175:83:69</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>275:272:143:20</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>275:375:136:20</position></item></printer>'),
(11, '中通速递1', 'false', 'false', 250, 180, '<printer picposition="0:0"><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>Verdana</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>299:113:110:26</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>121:238:156:20</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font></font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>150:115:100:27</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>88:142:321:89</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>424:148:328:89</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>654:111:98:31</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font></font><fontsize>12</fontsize><fontspace>10</fontspace><border>0</border><italic>0</italic><align>left</align><position>657:253:101:20</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font></font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>457:240:163:20</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>315:281:114:29</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>173:381:35:21</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>205:380:20:20</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font></font><fontsize>12</fontsize><fontspace>6</fontspace><border>0</border><italic>0</italic><align>left</align><position>315:252:97:21</position></item><item><name>√</name><ucode>tick</ucode><font></font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>506:407:20:20</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>494:114:106:26</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>456:259:164:20</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>121:258:156:20</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>159:343:106:32</position></item></printer>'),
(12, '中通速递2', 'false', 'false', 240, 135, '<printer picposition="0:0"><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>137:107:102:29</position></item><item><name>发货人-地区2级</name><ucode>dly_area_1</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>285:107:116:30</position></item><item><name>发货人-地址</name><ucode>dly_address</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>137:139:263:57</position></item><item><name>网店名称</name><ucode>shop_name</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>130:199:269:34</position></item><item><name>发货人-电话</name><ucode>dly_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>135:234:130:20</position></item><item><name>发货人-邮编</name><ucode>dly_zip</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>297:249:104:23</position></item><item><name>收货人-地址</name><ucode>ship_addr</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>482:139:272:58</position></item><item><name>收货人-电话</name><ucode>ship_tel</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>488:234:128:20</position></item><item><name>收货人-邮编</name><ucode>ship_zip</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>8</fontspace><border>0</border><italic>0</italic><align>left</align><position>659:248:95:22</position></item><item><name>收货人-姓名</name><ucode>ship_name</ucode><font>黑体</font><fontsize>18</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>483:107:116:31</position></item><item><name>收货人-地区2级</name><ucode>ship_area_1</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>center</align><position>638:107:116:31</position></item><item><name>订单-物品数量</name><ucode>order_count</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>564:277:67:30</position></item><item><name>当日日期-月</name><ucode>date_m</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>142:381:20:20</position></item><item><name>当日日期-日</name><ucode>date_d</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>171:382:20:20</position></item><item><name>订单-备注</name><ucode>order_memo</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>416:342:108:56</position></item><item><name>发货人-手机</name><ucode>dly_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>135:254:128:20</position></item><item><name>收货人-手机</name><ucode>ship_mobile</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>486:253:131:20</position></item><item><name>√</name><ucode>tick</ucode><font>undefined</font><fontsize>12</fontsize><fontspace>0</fontspace><border>0</border><italic>0</italic><align>left</align><position>358:415:20:20</position></item><item><name>发货人-姓名</name><ucode>dly_name</ucode><font>黑体</font><fontsize>14</fontsize><fontspace>0</fontspace><border>1</border><italic>0</italic><align>left</align><position>141:346:95:32</position></item></printer>');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_products`
--

DROP TABLE IF EXISTS `sdb_products`;
CREATE TABLE IF NOT EXISTS `sdb_products` (
  `product_id` mediumint(8) unsigned NOT NULL auto_increment,
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `barcode` varchar(128) default NULL,
  `title` varchar(255) default NULL,
  `bn` varchar(200) default NULL,
  `price` decimal(20,3) NOT NULL default '0.000',
  `cost` decimal(20,3) default '0.000',
  `mktprice` decimal(20,3) default NULL,
  `name` varchar(200) NOT NULL default '',
  `weight` decimal(20,3) default NULL,
  `unit` varchar(20) default NULL,
  `store` mediumint(8) unsigned default NULL,
  `store_place` varchar(255) default NULL,
  `freez` mediumint(8) unsigned default NULL,
  `pdt_desc` longtext,
  `props` longtext,
  `uptime` int(10) unsigned default NULL,
  `last_modify` int(10) unsigned default NULL,
  `disabled` enum('true','false') default 'false',
  `marketable` enum('true','false') NOT NULL default 'true',
  `is_local_stock` enum('true','false') NOT NULL default 'true',
  PRIMARY KEY  (`product_id`),
  KEY `ind_disabled` (`disabled`),
  KEY `ind_bn` (`bn`),
  KEY `ind_goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=346 ;

--
-- 转存表中的数据 `sdb_products`
--

INSERT INTO `sdb_products` (`product_id`, `goods_id`, `barcode`, `title`, `bn`, `price`, `cost`, `mktprice`, `name`, `weight`, `unit`, `store`, `store_place`, `freez`, `pdt_desc`, `props`, `uptime`, `last_modify`, `disabled`, `marketable`, `is_local_stock`) VALUES
(311, 78, NULL, NULL, 'G52FD893DF178B', 11.500, 0.000, 13.800, '洽洽 香瓜子 百煮入味香 308g/袋', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392347453, 'false', 'true', 'true'),
(312, 79, NULL, NULL, 'G52FD8B07BC4B2', 11.500, 0.000, 13.800, '阿明 菊花香瓜子 308g/袋', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392347911, 'false', 'true', 'true'),
(313, 80, NULL, NULL, 'G52FD8C8355ED9', 42.000, 0.000, 50.400, '天喔 美国扁桃仁 230g/罐', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392348291, 'false', 'true', 'true'),
(314, 81, NULL, NULL, 'G52FD8D756D929', 25.000, 0.000, 30.000, '金百岁农庄 精品扁桃仁 128g/袋', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392348533, 'false', 'true', 'true'),
(315, 82, NULL, NULL, 'G52FD8ED10ED13', 8.500, 0.000, 10.200, '黄飞红 麻辣花生 210g/袋', 210.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392348881, 'false', 'true', 'true'),
(316, 83, NULL, NULL, 'G52FD90619E983', 2.400, 0.000, 2.880, '旺旺 挑豆 回味蚕豆 45g/袋 （随手包）', 45.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392349281, 'false', 'true', 'true'),
(317, 84, NULL, NULL, 'G52FD916834A45', 2.900, 0.000, 3.480, '洽洽 怪味豆 蟹黄味 80g', 80.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392349544, 'false', 'true', 'true'),
(318, 85, NULL, NULL, 'G52FD92A15AF35', 8.800, 0.000, 10.560, '华味亨 阿胶贡枣 227g/袋', 227.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392349857, 'false', 'true', 'true'),
(319, 86, NULL, NULL, 'G52FD93C94D043', 59.900, 0.000, 71.880, '玛莉安妮 半颗蔓越莓干 500g 美国进口', 500.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392350153, 'false', 'true', 'true'),
(320, 87, NULL, NULL, 'G52FD94C6848E0', 24.000, 0.000, 28.800, '天喔 西梅 454g/罐', 454.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392350406, 'false', 'true', 'true'),
(321, 88, NULL, NULL, 'G52FD969D70C36', 22.900, 0.000, 27.480, '思贝格 牌黑葡萄干 200g', 200.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392350877, 'false', 'true', 'true'),
(322, 89, NULL, NULL, 'G52FD97851AE30', 13.200, 0.000, 15.840, '金百岁农庄 绿香妃葡萄干 100g', 100.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392351109, 'false', 'true', 'true'),
(323, 90, NULL, NULL, 'G52FD983321F49', 9.900, 0.000, 11.880, '乐事 美国经典原味薯片 198g（含加量20%）', 198.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392351283, 'false', 'true', 'true'),
(324, 91, NULL, NULL, 'G52FD98B8C244F', 20.500, 0.000, 24.600, '好丽友 薯愿三连包 312g/组', 312.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392351416, 'false', 'true', 'true'),
(325, 92, NULL, NULL, 'G52FD99A42A86D', 2.900, 0.000, 3.480, '乐事 无限薯片（忠于原味）40g/袋', 40.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392351652, 'false', 'true', 'true'),
(326, 93, NULL, NULL, 'G52FD9A82D329E', 25.000, 0.000, 30.000, '璐美 奶油甜味爆米花 150g/罐', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392351874, 'false', 'true', 'true'),
(327, 94, NULL, NULL, 'G52FDA7983BEFB', 22.500, 0.000, 27.000, '红鞋の女孩 焦糖口味 爆米花 150g/罐', 150.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392355224, 'false', 'true', 'true'),
(328, 95, NULL, NULL, 'G52FDA8878B34D', 22.500, 0.000, 27.000, '旺旺 雪饼（加量包）500g/袋 另赠118g', 118.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392355463, 'false', 'true', 'true'),
(329, 96, NULL, NULL, 'G52FDA98BB3F2E', 5.900, 0.000, 7.080, '农心 辣鲜虾条 90g/袋', 90.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392355723, 'false', 'true', 'true'),
(330, 97, NULL, NULL, 'G52FDAA901A5BB', 5.300, 0.000, 6.360, '上好佳 芝士条 90g/袋', 90.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392355984, 'false', 'true', 'true'),
(331, 98, NULL, NULL, 'G52FDABC07CD8D', 8.500, 0.000, 10.200, '旺旺 旺仔小馒头210g 精选新西兰进口乳源 儿童的美味小点心', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392356288, 'false', 'true', 'true'),
(332, 99, NULL, NULL, 'G52FDAC9B9DEFA', 5.300, 0.000, 6.360, '波力 海苔 原味 75g/罐', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392356507, 'false', 'true', 'true'),
(333, 100, NULL, NULL, 'G52FDADA688C2C', 49.900, 0.000, 59.880, 'WEI-I 味一 金枪鱼松 200g 台湾地区进口', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392356774, 'false', 'true', 'true'),
(334, 101, NULL, NULL, 'G52FDB083E48B7', 15.400, 0.000, 18.480, '徐福记 276凤梨酥276g/盒', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392357507, 'false', 'true', 'true'),
(335, 102, NULL, NULL, 'G52FDB1AEE973F', 21.000, 0.000, 25.200, '十月初五 麦酥杏仁条 200g/盒', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392357806, 'false', 'true', 'true'),
(336, 103, NULL, NULL, 'G52FDB32656987', 59.000, 0.000, 70.800, '周村烧饼 山东特产 中华老字号 牛皮纸袋套装65克x6袋 甜', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392358182, 'false', 'true', 'true'),
(337, 104, NULL, NULL, 'G52FDB3CE154F7', 14.900, 0.000, 17.880, 'GBG高比高 杏仁千层酥饼干 168g 台湾地区进口', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392358350, 'false', 'true', 'true'),
(338, 105, NULL, NULL, 'G52FDB53BC4955', 28.000, 0.000, 33.600, '好丽友 派 巧克力味涂饰蛋类芯饼 680g/盒 20枚', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392358715, 'false', 'true', 'true'),
(339, 106, NULL, NULL, 'G52FDB6905F237', 6.400, 0.000, 7.680, '康师傅 蛋酥卷（香浓奶油味）90g/袋', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392359056, 'false', 'true', 'true'),
(340, 107, NULL, NULL, 'G52FDB75A30A3C', 12.900, 0.000, 15.480, 'SANRITSU 三立 迷你源氏蝴蝶酥饼 40g 日本进口', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392359258, 'false', 'true', 'true'),
(341, 108, NULL, NULL, 'G5301750C28096', 27.800, 0.000, 33.360, 'Quaker/桂格 紫薯高纤醇香燕麦片 540g/盒', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392604428, 'false', 'true', 'true'),
(342, 109, NULL, NULL, 'G530177C056915', 46.000, 0.000, 55.200, '安怡 金装高钙低脂配方奶粉350g', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392605120, 'false', 'true', 'true'),
(343, 110, NULL, NULL, 'G5301793D75095', 105.000, 0.000, 0.000, '雀巢 全脂奶粉听装900g', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392605501, 'false', 'true', 'true'),
(344, 111, NULL, NULL, 'G53017ACE6797A', 20.100, 0.000, 24.120, '果珍 清新5条装-冰糖雪梨味75g X 3组合装', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392605902, 'false', 'true', 'true'),
(345, 112, NULL, NULL, 'G53017D55DD854', 49.800, 0.000, 59.760, '金龙鱼 大豆油（精炼一级）5L/桶', 0.000, '', NULL, '', NULL, NULL, 'a:1:{s:5:"idata";N;}', NULL, 1392606549, 'false', 'true', 'true');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_product_memo`
--

DROP TABLE IF EXISTS `sdb_product_memo`;
CREATE TABLE IF NOT EXISTS `sdb_product_memo` (
  `product_id` mediumint(8) unsigned NOT NULL default '0',
  `p_key` varchar(20) NOT NULL default '',
  `p_value` longtext,
  PRIMARY KEY  (`product_id`,`p_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_product_memo`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_promotion`
--

DROP TABLE IF EXISTS `sdb_promotion`;
CREATE TABLE IF NOT EXISTS `sdb_promotion` (
  `pmt_id` mediumint(8) unsigned NOT NULL auto_increment,
  `pmts_id` varchar(255) NOT NULL default '',
  `pmta_id` mediumint(8) unsigned default NULL,
  `pmt_time_begin` int(10) unsigned default NULL,
  `pmt_time_end` int(10) unsigned default NULL,
  `order_money_from` decimal(20,3) NOT NULL default '0.000',
  `order_money_to` decimal(20,3) NOT NULL default '9999999.000',
  `seq` tinyint(3) unsigned NOT NULL default '0',
  `pmt_type` enum('0','1','2') NOT NULL default '0',
  `pmt_belong` enum('0','1') NOT NULL default '0',
  `pmt_bond_type` enum('0','1','2') NOT NULL default '0',
  `pmt_describe` longtext,
  `pmt_solution` longtext,
  `pmt_ifcoupon` tinyint(3) unsigned NOT NULL default '1',
  `pmt_update_time` int(10) unsigned default '0',
  `pmt_basic_type` enum('goods','order') default 'goods',
  `disabled` enum('true','false') default 'false',
  `pmt_ifsale` enum('true','false') NOT NULL default 'true',
  `pmt_distype` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pmt_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sdb_promotion`
--

INSERT INTO `sdb_promotion` (`pmt_id`, `pmts_id`, `pmta_id`, `pmt_time_begin`, `pmt_time_end`, `order_money_from`, `order_money_to`, `seq`, `pmt_type`, `pmt_belong`, `pmt_bond_type`, `pmt_describe`, `pmt_solution`, `pmt_ifcoupon`, `pmt_update_time`, `pmt_basic_type`, `disabled`, `pmt_ifsale`, `pmt_distype`) VALUES
(1, 'n_7', 1, 1235836800, 1330531200, 300.000, 9999999.000, 0, '0', '0', '0', '全场购物满300减免50', 'a:3:{s:4:"type";s:5:"order";s:9:"condition";a:3:{i:0;a:2:{i:0;s:4:"mLev";i:1;a:3:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";}}i:1;a:2:{i:0;s:15:"orderMoney_from";i:1;s:3:"300";}i:2;a:2:{i:0;s:13:"orderMoney_to";i:1;s:7:"9999999";}}s:6:"method";a:1:{i:0;a:2:{i:0;s:9:"lessMoney";i:1;s:2:"50";}}}', 1, 1236925413, 'order', 'false', 'true', 0),
(2, 'c_1', NULL, 1235836800, 1330531200, 200.000, 9999999.000, 0, '1', '0', '0', '购物满200送太阳镜', 'a:3:{s:4:"type";s:5:"order";s:9:"condition";a:3:{i:0;a:2:{i:0;s:4:"mLev";i:1;a:3:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";}}i:1;a:2:{i:0;s:15:"orderMoney_from";i:1;s:3:"200";}i:2;a:2:{i:0;s:13:"orderMoney_to";i:1;s:7:"9999999";}}s:6:"method";a:1:{i:0;a:2:{i:0;s:8:"giveGift";i:1;a:1:{i:0;s:1:"1";}}}}', 0, 1236839128, 'order', 'false', 'true', 0),
(3, 'c_7', NULL, 1235836800, 1330531200, 300.000, 9999999.000, 0, '1', '0', '0', '购物满300立减30', 'a:3:{s:4:"type";s:5:"order";s:9:"condition";a:3:{i:0;a:2:{i:0;s:4:"mLev";i:1;a:3:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";}}i:1;a:2:{i:0;s:15:"orderMoney_from";i:1;s:3:"300";}i:2;a:2:{i:0;s:13:"orderMoney_to";i:1;s:7:"9999999";}}s:6:"method";a:1:{i:0;a:2:{i:0;s:9:"lessMoney";i:1;s:2:"30";}}}', 0, 1236839628, 'order', 'false', 'true', 0),
(4, 'c_7', NULL, 1251734400, 1262188800, 100.000, 9999999.000, 0, '1', '0', '0', '满100元，可使用10元优惠券', 'a:3:{s:4:"type";s:5:"order";s:9:"condition";a:3:{i:0;a:2:{i:0;s:4:"mLev";i:1;a:3:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";}}i:1;a:2:{i:0;s:15:"orderMoney_from";i:1;s:3:"100";}i:2;a:2:{i:0;s:13:"orderMoney_to";i:1;s:7:"9999999";}}s:6:"method";a:1:{i:0;a:2:{i:0;s:9:"lessMoney";i:1;s:2:"10";}}}', 0, 1253696451, 'order', 'false', 'true', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_promotion_activity`
--

DROP TABLE IF EXISTS `sdb_promotion_activity`;
CREATE TABLE IF NOT EXISTS `sdb_promotion_activity` (
  `pmta_id` mediumint(8) unsigned NOT NULL auto_increment,
  `pmta_name` varchar(200) default NULL,
  `pmta_enabled` enum('true','false') default NULL,
  `pmta_time_begin` int(10) unsigned default NULL,
  `pmta_time_end` int(10) unsigned default NULL,
  `pmta_describe` longtext,
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`pmta_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sdb_promotion_activity`
--

INSERT INTO `sdb_promotion_activity` (`pmta_id`, `pmta_name`, `pmta_enabled`, `pmta_time_begin`, `pmta_time_end`, `pmta_describe`, `disabled`) VALUES
(1, '全场购物满300减免50', 'true', 1235836800, 1330531200, '全场购物满300减免50', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_promotion_scheme`
--

DROP TABLE IF EXISTS `sdb_promotion_scheme`;
CREATE TABLE IF NOT EXISTS `sdb_promotion_scheme` (
  `pmts_id` mediumint(8) unsigned NOT NULL auto_increment,
  `pmts_name` varchar(250) default NULL,
  `pmts_memo` longtext,
  `pmts_solution` longtext,
  `pmts_type` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (`pmts_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_promotion_scheme`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_pub_files`
--

DROP TABLE IF EXISTS `sdb_pub_files`;
CREATE TABLE IF NOT EXISTS `sdb_pub_files` (
  `file_id` int(11) NOT NULL auto_increment,
  `file_name` varchar(50) default NULL,
  `file_ident` varchar(100) NOT NULL default '',
  `cdate` int(10) unsigned NOT NULL default '0',
  `memo` varchar(250) default NULL,
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`file_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `sdb_pub_files`
--

INSERT INTO `sdb_pub_files` (`file_id`, `file_name`, `file_ident`, `cdate`, `memo`, `disabled`) VALUES
(1, 'CgQCsFLgyHCAFsekAAMXYSxR6T056601.jpg', 'images//20140214/c8f7a58a615cbba4.jpg|//20140214/c8f7a58a615cbba4.jpg|fs_storage', 1392347403, NULL, 'false'),
(2, 'CgQCr1LgyHGATmgSAAOA1PGURPA74901.jpg', 'images//20140214/0af9ab73c81ff912.jpg|//20140214/0af9ab73c81ff912.jpg|fs_storage', 1392347430, NULL, 'false'),
(3, 'CgQCtFLgyHKAWkkPAATAM7Vr7gY57601.jpg', 'images//20140214/12a113c7dcb62985.jpg|//20140214/12a113c7dcb62985.jpg|fs_storage', 1392347445, NULL, 'false'),
(4, 'CgQCs1Ke3zyANAfYAAHBM_8geHk64300.jpg', 'images//20140214/b5137ac4ecce0149.jpg|//20140214/b5137ac4ecce0149.jpg|fs_storage', 1392347901, NULL, 'false'),
(5, 'CgQCtVKdoYCARcVzAAEq7_-x8aI00901.jpg', 'images//20140214/fa11e5150e641f84.jpg|//20140214/fa11e5150e641f84.jpg|fs_storage', 1392348287, NULL, 'false'),
(6, 'CgQCslKFlQ-AP6jcAAHas8Sj4b826501.jpg', 'images//20140214/f9d3578cbb9ae020.jpg|//20140214/f9d3578cbb9ae020.jpg|fs_storage', 1392348527, NULL, 'false'),
(7, 'CgQCtFLgg92AZtnRAALHf1spblE72401.jpg', 'images//20140214/f1ea2de6bbc4fdb4.jpg|//20140214/f1ea2de6bbc4fdb4.jpg|fs_storage', 1392348869, NULL, 'false'),
(8, 'CgQDrlG0MCyAaaZUAALFDyDPk8A62300.jpg', 'images//20140214/39157a84534ada94.jpg|//20140214/39157a84534ada94.jpg|fs_storage', 1392349263, NULL, 'false'),
(9, 'CgMBmVIuutmAO7vzAAJG7blePNc27300.jpg', 'images//20140214/760eac5d9e63a524.jpg|//20140214/760eac5d9e63a524.jpg|fs_storage', 1392349541, NULL, 'false'),
(10, 'CgQDr1HSpEOAEPaPAADAcet5-wE16000.jpg', 'images//20140214/042f2e6aac6d18a3.jpg|//20140214/042f2e6aac6d18a3.jpg|fs_storage', 1392350149, NULL, 'false'),
(11, 'CgQCsFF3iv6ADG_TAAFg8w3g3lM84000.jpg', 'images//20140214/7ea14ee894317e95.jpg|//20140214/7ea14ee894317e95.jpg|fs_storage', 1392350403, NULL, 'false'),
(12, '8f90b342305f30f0c77fecedee40a191.jpg', 'images//20140214/58b95a34ef335607.jpg|//20140214/58b95a34ef335607.jpg|fs_storage', 1392350865, NULL, 'false'),
(13, 'CgQDrVK5R4mAUmXRAAFU4Ri_tt055701.jpg', 'images//20140214/8a82505f38959b08.jpg|//20140214/8a82505f38959b08.jpg|fs_storage', 1392351107, NULL, 'false'),
(14, 'CgQCs1DdMLmATxR9AAJZ38ELFwk50600.jpg', 'images//20140214/4772943e5ce1bb29.jpg|//20140214/4772943e5ce1bb29.jpg|fs_storage', 1392351281, NULL, 'false'),
(15, 'CgQDrlKAT8qAcVLMAAEn3MBL6_o38601.jpg', 'images//20140214/83db35c4b12b2833.jpg|//20140214/83db35c4b12b2833.jpg|fs_storage', 1392351413, NULL, 'false'),
(16, 'CgQCslElwYCAM7yGAAF9lyHqivA98800.jpg', 'images//20140214/3a484e1bc95fc2ad.jpg|//20140214/3a484e1bc95fc2ad.jpg|fs_storage', 1392351651, NULL, 'false'),
(17, 'CgMBmVHJPoqAV9RIAAEPUM55Li472500.jpg', 'images//20140214/8d26f71b2d61eb5e.jpg|//20140214/8d26f71b2d61eb5e.jpg|fs_storage', 1392351867, NULL, 'false'),
(18, 'CgQCr1L8QBaANCXeAAQo7nyif0A55700.jpg', 'images//20140214/cfbbdc64aef224ce.jpg|//20140214/cfbbdc64aef224ce.jpg|fs_storage', 1392355221, NULL, 'false'),
(19, 'CgQCsFFRWgSAGm0gAAJcfimG5AM92100.jpg', 'images//20140214/49d984821d832923.jpg|//20140214/49d984821d832923.jpg|fs_storage', 1392355447, NULL, 'false'),
(20, 'CgQCsFDr2cCALkT1AAFHpnGBI0U18800.jpg', 'images//20140214/1d3e906b55d98dfc.jpg|//20140214/1d3e906b55d98dfc.jpg|fs_storage', 1392355719, NULL, 'false'),
(21, '0000084264-1.jpg', 'images//20140214/0c199397fcc4092e.jpg|//20140214/0c199397fcc4092e.jpg|fs_storage', 1392355961, NULL, 'false'),
(22, 'T288wNXh0aXXXXXXXX_!!784715714.jpg', 'images//20140214/fc087918c2a03db6.jpg|//20140214/fc087918c2a03db6.jpg|fs_storage', 1392356286, NULL, 'false'),
(23, 'CgQDrlFhKeSAIS65AAYCAgejT3c19800.jpg', 'images//20140214/a0d51fb9a5403095.jpg|//20140214/a0d51fb9a5403095.jpg|fs_storage', 1392356502, NULL, 'false'),
(24, 'CgQCtVIMnTeAJINiAAEcP__PdRs32000.jpg', 'images//20140214/c362b941161fe568.jpg|//20140214/c362b941161fe568.jpg|fs_storage', 1392356771, NULL, 'false'),
(25, 'CgQCtFKn8miAWSErAAGVUmuqnwM30200.jpg', 'images//20140214/dc084436fe4e2ae5.jpg|//20140214/dc084436fe4e2ae5.jpg|fs_storage', 1392357453, NULL, 'false'),
(26, 'CgQCtFKn8miAWSErAAGVUmuqnwM30200.jpg', 'images//20140214/30edfd92eab52825.jpg|//20140214/30edfd92eab52825.jpg|fs_storage', 1392357505, NULL, 'false'),
(27, '0000162527.jpg', 'images//20140214/d9b31a6509368cb7.jpg|//20140214/d9b31a6509368cb7.jpg|fs_storage', 1392357804, NULL, 'false'),
(28, 'CgQCtVHw27-ARIJxAASPeBLKUTA50200.jpg', 'images//20140214/a6e783cab15f7cf7.jpg|//20140214/a6e783cab15f7cf7.jpg|fs_storage', 1392358181, NULL, 'false'),
(29, 'CgQCtlHbhs2ABmdeAAFgvmvn_D031100.jpg', 'images//20140214/aa6ca4cd5c1a08d1.jpg|//20140214/aa6ca4cd5c1a08d1.jpg|fs_storage', 1392358347, NULL, 'false'),
(30, 'CgQDrlLPi5uASuGzAAKp2pXfr8I00701.jpg', 'images//20140214/725c036ed1ced270.jpg|//20140214/725c036ed1ced270.jpg|fs_storage', 1392358712, NULL, 'false'),
(31, 'QQ截图20140214142257.jpg', 'images//20140214/aa41f46f2bac47ad.jpg|//20140214/aa41f46f2bac47ad.jpg|fs_storage', 1392359047, NULL, 'false'),
(32, 'CgQCs1IPTr2AGB-NAAEqMEZx15s49400.jpg', 'images//20140214/fd4c8d975f32ad2e.jpg|//20140214/fd4c8d975f32ad2e.jpg|fs_storage', 1392359257, NULL, 'false'),
(33, 'CgQCrVG0D5eABG84AAH1AVvdj0c06300.jpg', 'images//20140217/ea8e225ebe923026.jpg|//20140217/ea8e225ebe923026.jpg|fs_storage', 1392604425, NULL, 'false'),
(34, '1f5681ad53380439c77fecedee40a191.jpg', 'images//20140217/461045be06ac00d1.jpg|//20140217/461045be06ac00d1.jpg|fs_storage', 1392605118, NULL, 'false'),
(35, 'CgQCrlDqZeGAfxnGAAEd_Pf6bvY25700.jpg', 'images//20140217/c08002b8dfe8c06e.jpg|//20140217/c08002b8dfe8c06e.jpg|fs_storage', 1392605498, NULL, 'false'),
(36, 'CgQCrVEtiW-AGIkFAAPnpTI9FwI00600.jpg', 'images//20140217/a7241aa6988c5933.jpg|//20140217/a7241aa6988c5933.jpg|fs_storage', 1392605886, NULL, 'false'),
(37, '4778b290f4251837c77fecedee40a191.jpg', 'images//20140217/a2f329127c48f2bf.jpg|//20140217/a2f329127c48f2bf.jpg|fs_storage', 1392606548, NULL, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_refunds`
--

DROP TABLE IF EXISTS `sdb_refunds`;
CREATE TABLE IF NOT EXISTS `sdb_refunds` (
  `refund_id` bigint(20) unsigned NOT NULL auto_increment,
  `order_id` bigint(20) unsigned default NULL,
  `member_id` mediumint(8) unsigned default NULL,
  `account` varchar(50) default NULL,
  `bank` varchar(50) default NULL,
  `pay_account` varchar(250) default NULL,
  `currency` varchar(8) default NULL,
  `money` decimal(20,3) NOT NULL default '0.000',
  `pay_type` enum('online','offline','deposit','recharge') default 'offline',
  `payment` mediumint(8) unsigned NOT NULL default '0',
  `paymethod` varchar(100) default NULL,
  `ip` varchar(20) default NULL,
  `t_ready` int(10) unsigned NOT NULL default '0',
  `t_sent` int(10) unsigned default NULL,
  `t_received` int(10) unsigned default NULL,
  `status` enum('ready','progress','sent','received','cancel') NOT NULL default 'ready',
  `memo` longtext,
  `title` varchar(255) NOT NULL default '',
  `send_op_id` mediumint(8) unsigned default NULL,
  `disabled` enum('true','false') NOT NULL default 'false',
  `trade_no` varchar(30) default NULL,
  PRIMARY KEY  (`refund_id`),
  KEY `ind_disabled` (`disabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_refunds`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_regions`
--

DROP TABLE IF EXISTS `sdb_regions`;
CREATE TABLE IF NOT EXISTS `sdb_regions` (
  `region_id` int(10) unsigned NOT NULL auto_increment,
  `package` varchar(20) NOT NULL default '',
  `p_region_id` int(10) unsigned default NULL,
  `region_path` varchar(255) default NULL,
  `region_grade` mediumint(8) unsigned default NULL,
  `local_name` varchar(50) NOT NULL default '',
  `en_name` varchar(50) default NULL,
  `p_1` varchar(50) default NULL,
  `p_2` varchar(50) default NULL,
  `ordernum` mediumint(8) unsigned default NULL,
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`region_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3723 ;

--
-- 转存表中的数据 `sdb_regions`
--

INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(1, 'mainland', NULL, ',1,', 1, '北京', NULL, NULL, NULL, NULL, 'false'),
(2, 'mainland', 1, ',1,2,', 2, '北京市', NULL, NULL, NULL, NULL, 'false'),
(3, 'mainland', 2, ',1,2,3,', 3, '东城区', NULL, NULL, NULL, NULL, 'false'),
(4, 'mainland', 2, ',1,2,4,', 3, '西城区', NULL, NULL, NULL, NULL, 'false'),
(5, 'mainland', 2, ',1,2,5,', 3, '崇文区', NULL, NULL, NULL, NULL, 'false'),
(6, 'mainland', 2, ',1,2,6,', 3, '宣武区', NULL, NULL, NULL, NULL, 'false'),
(7, 'mainland', 2, ',1,2,7,', 3, '朝阳区', NULL, NULL, NULL, NULL, 'false'),
(8, 'mainland', 2, ',1,2,8,', 3, '丰台区', NULL, NULL, NULL, NULL, 'false'),
(9, 'mainland', 2, ',1,2,9,', 3, '石景山区', NULL, NULL, NULL, NULL, 'false'),
(10, 'mainland', 2, ',1,2,10,', 3, '海淀区', NULL, NULL, NULL, NULL, 'false'),
(11, 'mainland', 2, ',1,2,11,', 3, '门头沟区', NULL, NULL, NULL, NULL, 'false'),
(12, 'mainland', 2, ',1,2,12,', 3, '房山区', NULL, NULL, NULL, NULL, 'false'),
(13, 'mainland', 2, ',1,2,13,', 3, '通州区', NULL, NULL, NULL, NULL, 'false'),
(14, 'mainland', 2, ',1,2,14,', 3, '顺义区', NULL, NULL, NULL, NULL, 'false'),
(15, 'mainland', 2, ',1,2,15,', 3, '昌平区', NULL, NULL, NULL, NULL, 'false'),
(16, 'mainland', 2, ',1,2,16,', 3, '大兴区', NULL, NULL, NULL, NULL, 'false'),
(17, 'mainland', 2, ',1,2,17,', 3, '怀柔区', NULL, NULL, NULL, NULL, 'false'),
(18, 'mainland', 2, ',1,2,18,', 3, '平谷区', NULL, NULL, NULL, NULL, 'false'),
(19, 'mainland', 2, ',1,2,19,', 3, '密云县', NULL, NULL, NULL, NULL, 'false'),
(20, 'mainland', 2, ',1,2,20,', 3, '延庆县', NULL, NULL, NULL, NULL, 'false'),
(21, 'mainland', 2, ',1,2,21,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(22, 'mainland', NULL, ',22,', 1, '天津', NULL, NULL, NULL, NULL, 'false'),
(23, 'mainland', 22, ',22,23,', 2, '天津市', NULL, NULL, NULL, NULL, 'false'),
(24, 'mainland', 23, ',22,23,24,', 3, '和平区', NULL, NULL, NULL, NULL, 'false'),
(25, 'mainland', 23, ',22,23,25,', 3, '河东区', NULL, NULL, NULL, NULL, 'false'),
(26, 'mainland', 23, ',22,23,26,', 3, '河西区', NULL, NULL, NULL, NULL, 'false'),
(27, 'mainland', 23, ',22,23,27,', 3, '南开区', NULL, NULL, NULL, NULL, 'false'),
(28, 'mainland', 23, ',22,23,28,', 3, '河北区', NULL, NULL, NULL, NULL, 'false'),
(29, 'mainland', 23, ',22,23,29,', 3, '红桥区', NULL, NULL, NULL, NULL, 'false'),
(30, 'mainland', 23, ',22,23,30,', 3, '塘沽区', NULL, NULL, NULL, NULL, 'false'),
(31, 'mainland', 23, ',22,23,31,', 3, '汉沽区', NULL, NULL, NULL, NULL, 'false'),
(32, 'mainland', 23, ',22,23,32,', 3, '大港区', NULL, NULL, NULL, NULL, 'false'),
(33, 'mainland', 23, ',22,23,33,', 3, '东丽区', NULL, NULL, NULL, NULL, 'false'),
(34, 'mainland', 23, ',22,23,34,', 3, '西青区', NULL, NULL, NULL, NULL, 'false'),
(35, 'mainland', 23, ',22,23,35,', 3, '津南区', NULL, NULL, NULL, NULL, 'false'),
(36, 'mainland', 23, ',22,23,36,', 3, '北辰区', NULL, NULL, NULL, NULL, 'false'),
(37, 'mainland', 23, ',22,23,37,', 3, '武清区', NULL, NULL, NULL, NULL, 'false'),
(38, 'mainland', 23, ',22,23,38,', 3, '宝坻区', NULL, NULL, NULL, NULL, 'false'),
(39, 'mainland', 23, ',22,23,39,', 3, '滨海新区', NULL, NULL, NULL, NULL, 'false'),
(40, 'mainland', 23, ',22,23,40,', 3, '宁河县', NULL, NULL, NULL, NULL, 'false'),
(41, 'mainland', 23, ',22,23,41,', 3, '静海县', NULL, NULL, NULL, NULL, 'false'),
(42, 'mainland', 23, ',22,23,42,', 3, '蓟县', NULL, NULL, NULL, NULL, 'false'),
(43, 'mainland', 23, ',22,23,43,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(44, 'mainland', NULL, ',44,', 1, '河北省', NULL, NULL, NULL, NULL, 'false'),
(45, 'mainland', 44, ',44,45,', 2, '石家庄市', NULL, NULL, NULL, NULL, 'false'),
(46, 'mainland', 45, ',44,45,46,', 3, '长安区', NULL, NULL, NULL, NULL, 'false'),
(47, 'mainland', 45, ',44,45,47,', 3, '桥东区', NULL, NULL, NULL, NULL, 'false'),
(48, 'mainland', 45, ',44,45,48,', 3, '桥西区', NULL, NULL, NULL, NULL, 'false'),
(49, 'mainland', 45, ',44,45,49,', 3, '新华区', NULL, NULL, NULL, NULL, 'false'),
(50, 'mainland', 45, ',44,45,50,', 3, '井陉矿区', NULL, NULL, NULL, NULL, 'false'),
(51, 'mainland', 45, ',44,45,51,', 3, '裕华区', NULL, NULL, NULL, NULL, 'false'),
(52, 'mainland', 45, ',44,45,52,', 3, '井陉县', NULL, NULL, NULL, NULL, 'false'),
(53, 'mainland', 45, ',44,45,53,', 3, '正定县', NULL, NULL, NULL, NULL, 'false'),
(54, 'mainland', 45, ',44,45,54,', 3, '栾城县', NULL, NULL, NULL, NULL, 'false'),
(55, 'mainland', 45, ',44,45,55,', 3, '行唐县', NULL, NULL, NULL, NULL, 'false'),
(56, 'mainland', 45, ',44,45,56,', 3, '灵寿县', NULL, NULL, NULL, NULL, 'false'),
(57, 'mainland', 45, ',44,45,57,', 3, '高邑县', NULL, NULL, NULL, NULL, 'false'),
(58, 'mainland', 45, ',44,45,58,', 3, '深泽县', NULL, NULL, NULL, NULL, 'false'),
(59, 'mainland', 45, ',44,45,59,', 3, '赞皇县', NULL, NULL, NULL, NULL, 'false'),
(60, 'mainland', 45, ',44,45,60,', 3, '无极县', NULL, NULL, NULL, NULL, 'false'),
(61, 'mainland', 45, ',44,45,61,', 3, '平山县', NULL, NULL, NULL, NULL, 'false'),
(62, 'mainland', 45, ',44,45,62,', 3, '元氏县', NULL, NULL, NULL, NULL, 'false'),
(63, 'mainland', 45, ',44,45,63,', 3, '赵县', NULL, NULL, NULL, NULL, 'false'),
(64, 'mainland', 45, ',44,45,64,', 3, '辛集市', NULL, NULL, NULL, NULL, 'false'),
(65, 'mainland', 45, ',44,45,65,', 3, '藁城市', NULL, NULL, NULL, NULL, 'false'),
(66, 'mainland', 45, ',44,45,66,', 3, '晋州市', NULL, NULL, NULL, NULL, 'false'),
(67, 'mainland', 45, ',44,45,67,', 3, '新乐市', NULL, NULL, NULL, NULL, 'false'),
(68, 'mainland', 45, ',44,45,68,', 3, '鹿泉市', NULL, NULL, NULL, NULL, 'false'),
(69, 'mainland', 45, ',44,45,69,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(70, 'mainland', 44, ',44,70,', 2, '唐山市', NULL, NULL, NULL, NULL, 'false'),
(71, 'mainland', 70, ',44,70,71,', 3, '路南区', NULL, NULL, NULL, NULL, 'false'),
(72, 'mainland', 70, ',44,70,72,', 3, '路北区', NULL, NULL, NULL, NULL, 'false'),
(73, 'mainland', 70, ',44,70,73,', 3, '古冶区', NULL, NULL, NULL, NULL, 'false'),
(74, 'mainland', 70, ',44,70,74,', 3, '开平区', NULL, NULL, NULL, NULL, 'false'),
(75, 'mainland', 70, ',44,70,75,', 3, '丰南区', NULL, NULL, NULL, NULL, 'false'),
(76, 'mainland', 70, ',44,70,76,', 3, '丰润区', NULL, NULL, NULL, NULL, 'false'),
(77, 'mainland', 70, ',44,70,77,', 3, '滦县', NULL, NULL, NULL, NULL, 'false'),
(78, 'mainland', 70, ',44,70,78,', 3, '滦南县', NULL, NULL, NULL, NULL, 'false'),
(79, 'mainland', 70, ',44,70,79,', 3, '乐亭县', NULL, NULL, NULL, NULL, 'false'),
(80, 'mainland', 70, ',44,70,80,', 3, '迁西县', NULL, NULL, NULL, NULL, 'false'),
(81, 'mainland', 70, ',44,70,81,', 3, '玉田县', NULL, NULL, NULL, NULL, 'false'),
(82, 'mainland', 70, ',44,70,82,', 3, '唐海县', NULL, NULL, NULL, NULL, 'false'),
(83, 'mainland', 70, ',44,70,83,', 3, '遵化市', NULL, NULL, NULL, NULL, 'false'),
(84, 'mainland', 70, ',44,70,84,', 3, '迁安市', NULL, NULL, NULL, NULL, 'false'),
(85, 'mainland', 70, ',44,70,85,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(86, 'mainland', 44, ',44,86,', 2, '秦皇岛市', NULL, NULL, NULL, NULL, 'false'),
(87, 'mainland', 86, ',44,86,87,', 3, '海港区', NULL, NULL, NULL, NULL, 'false'),
(88, 'mainland', 86, ',44,86,88,', 3, '山海关区', NULL, NULL, NULL, NULL, 'false'),
(89, 'mainland', 86, ',44,86,89,', 3, '北戴河区', NULL, NULL, NULL, NULL, 'false'),
(90, 'mainland', 86, ',44,86,90,', 3, '青龙满族自治县', NULL, NULL, NULL, NULL, 'false'),
(91, 'mainland', 86, ',44,86,91,', 3, '昌黎县', NULL, NULL, NULL, NULL, 'false'),
(92, 'mainland', 86, ',44,86,92,', 3, '抚宁县', NULL, NULL, NULL, NULL, 'false'),
(93, 'mainland', 86, ',44,86,93,', 3, '卢龙县', NULL, NULL, NULL, NULL, 'false'),
(94, 'mainland', 86, ',44,86,94,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(95, 'mainland', 86, ',44,86,95,', 3, '经济技术开发区', NULL, NULL, NULL, NULL, 'false'),
(96, 'mainland', 44, ',44,96,', 2, '邯郸市', NULL, NULL, NULL, NULL, 'false'),
(97, 'mainland', 96, ',44,96,97,', 3, '邯山区', NULL, NULL, NULL, NULL, 'false'),
(98, 'mainland', 96, ',44,96,98,', 3, '丛台区', NULL, NULL, NULL, NULL, 'false'),
(99, 'mainland', 96, ',44,96,99,', 3, '复兴区', NULL, NULL, NULL, NULL, 'false'),
(100, 'mainland', 96, ',44,96,100,', 3, '峰峰矿区', NULL, NULL, NULL, NULL, 'false'),
(101, 'mainland', 96, ',44,96,101,', 3, '邯郸县', NULL, NULL, NULL, NULL, 'false'),
(102, 'mainland', 96, ',44,96,102,', 3, '临漳县', NULL, NULL, NULL, NULL, 'false'),
(103, 'mainland', 96, ',44,96,103,', 3, '成安县', NULL, NULL, NULL, NULL, 'false'),
(104, 'mainland', 96, ',44,96,104,', 3, '大名县', NULL, NULL, NULL, NULL, 'false'),
(105, 'mainland', 96, ',44,96,105,', 3, '涉县', NULL, NULL, NULL, NULL, 'false'),
(106, 'mainland', 96, ',44,96,106,', 3, '磁县', NULL, NULL, NULL, NULL, 'false'),
(107, 'mainland', 96, ',44,96,107,', 3, '肥乡县', NULL, NULL, NULL, NULL, 'false'),
(108, 'mainland', 96, ',44,96,108,', 3, '永年县', NULL, NULL, NULL, NULL, 'false'),
(109, 'mainland', 96, ',44,96,109,', 3, '邱县', NULL, NULL, NULL, NULL, 'false'),
(110, 'mainland', 96, ',44,96,110,', 3, '鸡泽县', NULL, NULL, NULL, NULL, 'false'),
(111, 'mainland', 96, ',44,96,111,', 3, '广平县', NULL, NULL, NULL, NULL, 'false'),
(112, 'mainland', 96, ',44,96,112,', 3, '馆陶县', NULL, NULL, NULL, NULL, 'false'),
(113, 'mainland', 96, ',44,96,113,', 3, '魏县', NULL, NULL, NULL, NULL, 'false'),
(114, 'mainland', 96, ',44,96,114,', 3, '曲周县', NULL, NULL, NULL, NULL, 'false'),
(115, 'mainland', 96, ',44,96,115,', 3, '武安市', NULL, NULL, NULL, NULL, 'false'),
(116, 'mainland', 96, ',44,96,116,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(117, 'mainland', 44, ',44,117,', 2, '邢台市', NULL, NULL, NULL, NULL, 'false'),
(118, 'mainland', 117, ',44,117,118,', 3, '桥东区', NULL, NULL, NULL, NULL, 'false'),
(119, 'mainland', 117, ',44,117,119,', 3, '桥西区', NULL, NULL, NULL, NULL, 'false'),
(120, 'mainland', 117, ',44,117,120,', 3, '邢台县', NULL, NULL, NULL, NULL, 'false'),
(121, 'mainland', 117, ',44,117,121,', 3, '临城县', NULL, NULL, NULL, NULL, 'false'),
(122, 'mainland', 117, ',44,117,122,', 3, '内丘县', NULL, NULL, NULL, NULL, 'false'),
(123, 'mainland', 117, ',44,117,123,', 3, '柏乡县', NULL, NULL, NULL, NULL, 'false'),
(124, 'mainland', 117, ',44,117,124,', 3, '隆尧县', NULL, NULL, NULL, NULL, 'false'),
(125, 'mainland', 117, ',44,117,125,', 3, '任县', NULL, NULL, NULL, NULL, 'false'),
(126, 'mainland', 117, ',44,117,126,', 3, '南和县', NULL, NULL, NULL, NULL, 'false'),
(127, 'mainland', 117, ',44,117,127,', 3, '宁晋县', NULL, NULL, NULL, NULL, 'false'),
(128, 'mainland', 117, ',44,117,128,', 3, '巨鹿县', NULL, NULL, NULL, NULL, 'false'),
(129, 'mainland', 117, ',44,117,129,', 3, '新河县', NULL, NULL, NULL, NULL, 'false'),
(130, 'mainland', 117, ',44,117,130,', 3, '广宗县', NULL, NULL, NULL, NULL, 'false'),
(131, 'mainland', 117, ',44,117,131,', 3, '平乡县', NULL, NULL, NULL, NULL, 'false'),
(132, 'mainland', 117, ',44,117,132,', 3, '威县', NULL, NULL, NULL, NULL, 'false'),
(133, 'mainland', 117, ',44,117,133,', 3, '清河县', NULL, NULL, NULL, NULL, 'false'),
(134, 'mainland', 117, ',44,117,134,', 3, '临西县', NULL, NULL, NULL, NULL, 'false'),
(135, 'mainland', 117, ',44,117,135,', 3, '南宫市', NULL, NULL, NULL, NULL, 'false'),
(136, 'mainland', 117, ',44,117,136,', 3, '沙河市', NULL, NULL, NULL, NULL, 'false'),
(137, 'mainland', 117, ',44,117,137,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(138, 'mainland', 44, ',44,138,', 2, '保定市', NULL, NULL, NULL, NULL, 'false'),
(139, 'mainland', 138, ',44,138,139,', 3, '新市区', NULL, NULL, NULL, NULL, 'false'),
(140, 'mainland', 138, ',44,138,140,', 3, '北市区', NULL, NULL, NULL, NULL, 'false'),
(141, 'mainland', 138, ',44,138,141,', 3, '南市区', NULL, NULL, NULL, NULL, 'false'),
(142, 'mainland', 138, ',44,138,142,', 3, '满城县', NULL, NULL, NULL, NULL, 'false'),
(143, 'mainland', 138, ',44,138,143,', 3, '清苑县', NULL, NULL, NULL, NULL, 'false'),
(144, 'mainland', 138, ',44,138,144,', 3, '涞水县', NULL, NULL, NULL, NULL, 'false'),
(145, 'mainland', 138, ',44,138,145,', 3, '阜平县', NULL, NULL, NULL, NULL, 'false'),
(146, 'mainland', 138, ',44,138,146,', 3, '徐水县', NULL, NULL, NULL, NULL, 'false'),
(147, 'mainland', 138, ',44,138,147,', 3, '定兴县', NULL, NULL, NULL, NULL, 'false'),
(148, 'mainland', 138, ',44,138,148,', 3, '唐县', NULL, NULL, NULL, NULL, 'false'),
(149, 'mainland', 138, ',44,138,149,', 3, '高阳县', NULL, NULL, NULL, NULL, 'false'),
(150, 'mainland', 138, ',44,138,150,', 3, '容城县', NULL, NULL, NULL, NULL, 'false'),
(151, 'mainland', 138, ',44,138,151,', 3, '涞源县', NULL, NULL, NULL, NULL, 'false'),
(152, 'mainland', 138, ',44,138,152,', 3, '望都县', NULL, NULL, NULL, NULL, 'false'),
(153, 'mainland', 138, ',44,138,153,', 3, '安新县', NULL, NULL, NULL, NULL, 'false'),
(154, 'mainland', 138, ',44,138,154,', 3, '易县', NULL, NULL, NULL, NULL, 'false'),
(155, 'mainland', 138, ',44,138,155,', 3, '曲阳县', NULL, NULL, NULL, NULL, 'false'),
(156, 'mainland', 138, ',44,138,156,', 3, '蠡县', NULL, NULL, NULL, NULL, 'false'),
(157, 'mainland', 138, ',44,138,157,', 3, '顺平县', NULL, NULL, NULL, NULL, 'false'),
(158, 'mainland', 138, ',44,138,158,', 3, '博野县', NULL, NULL, NULL, NULL, 'false'),
(159, 'mainland', 138, ',44,138,159,', 3, '雄县', NULL, NULL, NULL, NULL, 'false'),
(160, 'mainland', 138, ',44,138,160,', 3, '涿州市', NULL, NULL, NULL, NULL, 'false'),
(161, 'mainland', 138, ',44,138,161,', 3, '定州市', NULL, NULL, NULL, NULL, 'false'),
(162, 'mainland', 138, ',44,138,162,', 3, '安国市', NULL, NULL, NULL, NULL, 'false'),
(163, 'mainland', 138, ',44,138,163,', 3, '高碑店市', NULL, NULL, NULL, NULL, 'false'),
(164, 'mainland', 138, ',44,138,164,', 3, '高开区', NULL, NULL, NULL, NULL, 'false'),
(165, 'mainland', 138, ',44,138,165,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(166, 'mainland', 44, ',44,166,', 2, '张家口市', NULL, NULL, NULL, NULL, 'false'),
(167, 'mainland', 166, ',44,166,167,', 3, '桥东区', NULL, NULL, NULL, NULL, 'false'),
(168, 'mainland', 166, ',44,166,168,', 3, '桥西区', NULL, NULL, NULL, NULL, 'false'),
(169, 'mainland', 166, ',44,166,169,', 3, '宣化区', NULL, NULL, NULL, NULL, 'false'),
(170, 'mainland', 166, ',44,166,170,', 3, '下花园区', NULL, NULL, NULL, NULL, 'false'),
(171, 'mainland', 166, ',44,166,171,', 3, '宣化县', NULL, NULL, NULL, NULL, 'false'),
(172, 'mainland', 166, ',44,166,172,', 3, '张北县', NULL, NULL, NULL, NULL, 'false'),
(173, 'mainland', 166, ',44,166,173,', 3, '康保县', NULL, NULL, NULL, NULL, 'false'),
(174, 'mainland', 166, ',44,166,174,', 3, '沽源县', NULL, NULL, NULL, NULL, 'false'),
(175, 'mainland', 166, ',44,166,175,', 3, '尚义县', NULL, NULL, NULL, NULL, 'false'),
(176, 'mainland', 166, ',44,166,176,', 3, '蔚县', NULL, NULL, NULL, NULL, 'false'),
(177, 'mainland', 166, ',44,166,177,', 3, '阳原县', NULL, NULL, NULL, NULL, 'false'),
(178, 'mainland', 166, ',44,166,178,', 3, '怀安县', NULL, NULL, NULL, NULL, 'false'),
(179, 'mainland', 166, ',44,166,179,', 3, '万全县', NULL, NULL, NULL, NULL, 'false'),
(180, 'mainland', 166, ',44,166,180,', 3, '怀来县', NULL, NULL, NULL, NULL, 'false'),
(181, 'mainland', 166, ',44,166,181,', 3, '涿鹿县', NULL, NULL, NULL, NULL, 'false'),
(182, 'mainland', 166, ',44,166,182,', 3, '赤城县', NULL, NULL, NULL, NULL, 'false'),
(183, 'mainland', 166, ',44,166,183,', 3, '崇礼县', NULL, NULL, NULL, NULL, 'false'),
(184, 'mainland', 166, ',44,166,184,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(185, 'mainland', 44, ',44,185,', 2, '承德市', NULL, NULL, NULL, NULL, 'false'),
(186, 'mainland', 185, ',44,185,186,', 3, '双桥区', NULL, NULL, NULL, NULL, 'false'),
(187, 'mainland', 185, ',44,185,187,', 3, '双滦区', NULL, NULL, NULL, NULL, 'false'),
(188, 'mainland', 185, ',44,185,188,', 3, '鹰手营子矿区', NULL, NULL, NULL, NULL, 'false'),
(189, 'mainland', 185, ',44,185,189,', 3, '承德县', NULL, NULL, NULL, NULL, 'false'),
(190, 'mainland', 185, ',44,185,190,', 3, '兴隆县', NULL, NULL, NULL, NULL, 'false'),
(191, 'mainland', 185, ',44,185,191,', 3, '平泉县', NULL, NULL, NULL, NULL, 'false'),
(192, 'mainland', 185, ',44,185,192,', 3, '滦平县', NULL, NULL, NULL, NULL, 'false'),
(193, 'mainland', 185, ',44,185,193,', 3, '隆化县', NULL, NULL, NULL, NULL, 'false'),
(194, 'mainland', 185, ',44,185,194,', 3, '丰宁满族自治县', NULL, NULL, NULL, NULL, 'false'),
(195, 'mainland', 185, ',44,185,195,', 3, '宽城满族自治县', NULL, NULL, NULL, NULL, 'false'),
(196, 'mainland', 185, ',44,185,196,', 3, '围场满族蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(197, 'mainland', 185, ',44,185,197,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(198, 'mainland', 44, ',44,198,', 2, '沧州市', NULL, NULL, NULL, NULL, 'false'),
(199, 'mainland', 198, ',44,198,199,', 3, '新华区', NULL, NULL, NULL, NULL, 'false'),
(200, 'mainland', 198, ',44,198,200,', 3, '运河区', NULL, NULL, NULL, NULL, 'false'),
(201, 'mainland', 198, ',44,198,201,', 3, '沧县', NULL, NULL, NULL, NULL, 'false'),
(202, 'mainland', 198, ',44,198,202,', 3, '青县', NULL, NULL, NULL, NULL, 'false'),
(203, 'mainland', 198, ',44,198,203,', 3, '东光县', NULL, NULL, NULL, NULL, 'false'),
(204, 'mainland', 198, ',44,198,204,', 3, '海兴县', NULL, NULL, NULL, NULL, 'false'),
(205, 'mainland', 198, ',44,198,205,', 3, '盐山县', NULL, NULL, NULL, NULL, 'false'),
(206, 'mainland', 198, ',44,198,206,', 3, '肃宁县', NULL, NULL, NULL, NULL, 'false'),
(207, 'mainland', 198, ',44,198,207,', 3, '南皮县', NULL, NULL, NULL, NULL, 'false'),
(208, 'mainland', 198, ',44,198,208,', 3, '吴桥县', NULL, NULL, NULL, NULL, 'false'),
(209, 'mainland', 198, ',44,198,209,', 3, '献县', NULL, NULL, NULL, NULL, 'false'),
(210, 'mainland', 198, ',44,198,210,', 3, '孟村回族自治县', NULL, NULL, NULL, NULL, 'false'),
(211, 'mainland', 198, ',44,198,211,', 3, '泊头市', NULL, NULL, NULL, NULL, 'false'),
(212, 'mainland', 198, ',44,198,212,', 3, '任丘市', NULL, NULL, NULL, NULL, 'false'),
(213, 'mainland', 198, ',44,198,213,', 3, '黄骅市', NULL, NULL, NULL, NULL, 'false'),
(214, 'mainland', 198, ',44,198,214,', 3, '河间市', NULL, NULL, NULL, NULL, 'false'),
(215, 'mainland', 198, ',44,198,215,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(216, 'mainland', 44, ',44,216,', 2, '廊坊市', NULL, NULL, NULL, NULL, 'false'),
(217, 'mainland', 216, ',44,216,217,', 3, '安次区', NULL, NULL, NULL, NULL, 'false'),
(218, 'mainland', 216, ',44,216,218,', 3, '广阳区', NULL, NULL, NULL, NULL, 'false'),
(219, 'mainland', 216, ',44,216,219,', 3, '固安县', NULL, NULL, NULL, NULL, 'false'),
(220, 'mainland', 216, ',44,216,220,', 3, '永清县', NULL, NULL, NULL, NULL, 'false'),
(221, 'mainland', 216, ',44,216,221,', 3, '香河县', NULL, NULL, NULL, NULL, 'false'),
(222, 'mainland', 216, ',44,216,222,', 3, '大城县', NULL, NULL, NULL, NULL, 'false'),
(223, 'mainland', 216, ',44,216,223,', 3, '文安县', NULL, NULL, NULL, NULL, 'false'),
(224, 'mainland', 216, ',44,216,224,', 3, '大厂回族自治县', NULL, NULL, NULL, NULL, 'false'),
(225, 'mainland', 216, ',44,216,225,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(226, 'mainland', 216, ',44,216,226,', 3, '燕郊经济技术开发区', NULL, NULL, NULL, NULL, 'false'),
(227, 'mainland', 216, ',44,216,227,', 3, '霸州市', NULL, NULL, NULL, NULL, 'false'),
(228, 'mainland', 216, ',44,216,228,', 3, '三河市', NULL, NULL, NULL, NULL, 'false'),
(229, 'mainland', 216, ',44,216,229,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(230, 'mainland', 44, ',44,230,', 2, '衡水市', NULL, NULL, NULL, NULL, 'false'),
(231, 'mainland', 230, ',44,230,231,', 3, '桃城区', NULL, NULL, NULL, NULL, 'false'),
(232, 'mainland', 230, ',44,230,232,', 3, '枣强县', NULL, NULL, NULL, NULL, 'false'),
(233, 'mainland', 230, ',44,230,233,', 3, '武邑县', NULL, NULL, NULL, NULL, 'false'),
(234, 'mainland', 230, ',44,230,234,', 3, '武强县', NULL, NULL, NULL, NULL, 'false'),
(235, 'mainland', 230, ',44,230,235,', 3, '饶阳县', NULL, NULL, NULL, NULL, 'false'),
(236, 'mainland', 230, ',44,230,236,', 3, '安平县', NULL, NULL, NULL, NULL, 'false'),
(237, 'mainland', 230, ',44,230,237,', 3, '故城县', NULL, NULL, NULL, NULL, 'false'),
(238, 'mainland', 230, ',44,230,238,', 3, '景县', NULL, NULL, NULL, NULL, 'false'),
(239, 'mainland', 230, ',44,230,239,', 3, '阜城县', NULL, NULL, NULL, NULL, 'false'),
(240, 'mainland', 230, ',44,230,240,', 3, '冀州市', NULL, NULL, NULL, NULL, 'false'),
(241, 'mainland', 230, ',44,230,241,', 3, '深州市', NULL, NULL, NULL, NULL, 'false'),
(242, 'mainland', 230, ',44,230,242,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(243, 'mainland', NULL, ',243,', 1, '山西省', NULL, NULL, NULL, NULL, 'false'),
(244, 'mainland', 243, ',243,244,', 2, '太原市', NULL, NULL, NULL, NULL, 'false'),
(245, 'mainland', 244, ',243,244,245,', 3, '小店区', NULL, NULL, NULL, NULL, 'false'),
(246, 'mainland', 244, ',243,244,246,', 3, '迎泽区', NULL, NULL, NULL, NULL, 'false'),
(247, 'mainland', 244, ',243,244,247,', 3, '杏花岭区', NULL, NULL, NULL, NULL, 'false'),
(248, 'mainland', 244, ',243,244,248,', 3, '尖草坪区', NULL, NULL, NULL, NULL, 'false'),
(249, 'mainland', 244, ',243,244,249,', 3, '万柏林区', NULL, NULL, NULL, NULL, 'false'),
(250, 'mainland', 244, ',243,244,250,', 3, '晋源区', NULL, NULL, NULL, NULL, 'false'),
(251, 'mainland', 244, ',243,244,251,', 3, '清徐县', NULL, NULL, NULL, NULL, 'false'),
(252, 'mainland', 244, ',243,244,252,', 3, '阳曲县', NULL, NULL, NULL, NULL, 'false'),
(253, 'mainland', 244, ',243,244,253,', 3, '娄烦县', NULL, NULL, NULL, NULL, 'false'),
(254, 'mainland', 244, ',243,244,254,', 3, '古交市', NULL, NULL, NULL, NULL, 'false'),
(255, 'mainland', 244, ',243,244,255,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(256, 'mainland', 243, ',243,256,', 2, '大同市', NULL, NULL, NULL, NULL, 'false'),
(257, 'mainland', 256, ',243,256,257,', 3, '城区', NULL, NULL, NULL, NULL, 'false'),
(258, 'mainland', 256, ',243,256,258,', 3, '矿区', NULL, NULL, NULL, NULL, 'false'),
(259, 'mainland', 256, ',243,256,259,', 3, '南郊区', NULL, NULL, NULL, NULL, 'false'),
(260, 'mainland', 256, ',243,256,260,', 3, '新荣区', NULL, NULL, NULL, NULL, 'false'),
(261, 'mainland', 256, ',243,256,261,', 3, '阳高县', NULL, NULL, NULL, NULL, 'false'),
(262, 'mainland', 256, ',243,256,262,', 3, '天镇县', NULL, NULL, NULL, NULL, 'false'),
(263, 'mainland', 256, ',243,256,263,', 3, '广灵县', NULL, NULL, NULL, NULL, 'false'),
(264, 'mainland', 256, ',243,256,264,', 3, '灵丘县', NULL, NULL, NULL, NULL, 'false'),
(265, 'mainland', 256, ',243,256,265,', 3, '浑源县', NULL, NULL, NULL, NULL, 'false'),
(266, 'mainland', 256, ',243,256,266,', 3, '左云县', NULL, NULL, NULL, NULL, 'false'),
(267, 'mainland', 256, ',243,256,267,', 3, '大同县', NULL, NULL, NULL, NULL, 'false'),
(268, 'mainland', 256, ',243,256,268,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(269, 'mainland', 243, ',243,269,', 2, '阳泉市', NULL, NULL, NULL, NULL, 'false'),
(270, 'mainland', 269, ',243,269,270,', 3, '城区', NULL, NULL, NULL, NULL, 'false'),
(271, 'mainland', 269, ',243,269,271,', 3, '矿区', NULL, NULL, NULL, NULL, 'false'),
(272, 'mainland', 269, ',243,269,272,', 3, '郊区', NULL, NULL, NULL, NULL, 'false'),
(273, 'mainland', 269, ',243,269,273,', 3, '平定县', NULL, NULL, NULL, NULL, 'false'),
(274, 'mainland', 269, ',243,269,274,', 3, '盂县', NULL, NULL, NULL, NULL, 'false'),
(275, 'mainland', 269, ',243,269,275,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(276, 'mainland', 243, ',243,276,', 2, '长治市', NULL, NULL, NULL, NULL, 'false'),
(277, 'mainland', 276, ',243,276,277,', 3, '长治县', NULL, NULL, NULL, NULL, 'false'),
(278, 'mainland', 276, ',243,276,278,', 3, '襄垣县', NULL, NULL, NULL, NULL, 'false'),
(279, 'mainland', 276, ',243,276,279,', 3, '屯留县', NULL, NULL, NULL, NULL, 'false'),
(280, 'mainland', 276, ',243,276,280,', 3, '平顺县', NULL, NULL, NULL, NULL, 'false'),
(281, 'mainland', 276, ',243,276,281,', 3, '黎城县', NULL, NULL, NULL, NULL, 'false'),
(282, 'mainland', 276, ',243,276,282,', 3, '壶关县', NULL, NULL, NULL, NULL, 'false'),
(283, 'mainland', 276, ',243,276,283,', 3, '长子县', NULL, NULL, NULL, NULL, 'false'),
(284, 'mainland', 276, ',243,276,284,', 3, '武乡县', NULL, NULL, NULL, NULL, 'false'),
(285, 'mainland', 276, ',243,276,285,', 3, '沁县', NULL, NULL, NULL, NULL, 'false'),
(286, 'mainland', 276, ',243,276,286,', 3, '沁源县', NULL, NULL, NULL, NULL, 'false'),
(287, 'mainland', 276, ',243,276,287,', 3, '潞城市', NULL, NULL, NULL, NULL, 'false'),
(288, 'mainland', 276, ',243,276,288,', 3, '城区', NULL, NULL, NULL, NULL, 'false'),
(289, 'mainland', 276, ',243,276,289,', 3, '郊区', NULL, NULL, NULL, NULL, 'false'),
(290, 'mainland', 276, ',243,276,290,', 3, '高新区', NULL, NULL, NULL, NULL, 'false'),
(291, 'mainland', 276, ',243,276,291,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(292, 'mainland', 243, ',243,292,', 2, '晋城市', NULL, NULL, NULL, NULL, 'false'),
(293, 'mainland', 292, ',243,292,293,', 3, '城区', NULL, NULL, NULL, NULL, 'false'),
(294, 'mainland', 292, ',243,292,294,', 3, '沁水县', NULL, NULL, NULL, NULL, 'false'),
(295, 'mainland', 292, ',243,292,295,', 3, '阳城县', NULL, NULL, NULL, NULL, 'false'),
(296, 'mainland', 292, ',243,292,296,', 3, '陵川县', NULL, NULL, NULL, NULL, 'false'),
(297, 'mainland', 292, ',243,292,297,', 3, '泽州县', NULL, NULL, NULL, NULL, 'false'),
(298, 'mainland', 292, ',243,292,298,', 3, '高平市', NULL, NULL, NULL, NULL, 'false'),
(299, 'mainland', 292, ',243,292,299,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(300, 'mainland', 243, ',243,300,', 2, '朔州市', NULL, NULL, NULL, NULL, 'false'),
(301, 'mainland', 300, ',243,300,301,', 3, '朔城区', NULL, NULL, NULL, NULL, 'false'),
(302, 'mainland', 300, ',243,300,302,', 3, '平鲁区', NULL, NULL, NULL, NULL, 'false'),
(303, 'mainland', 300, ',243,300,303,', 3, '山阴县', NULL, NULL, NULL, NULL, 'false'),
(304, 'mainland', 300, ',243,300,304,', 3, '应县', NULL, NULL, NULL, NULL, 'false'),
(305, 'mainland', 300, ',243,300,305,', 3, '右玉县', NULL, NULL, NULL, NULL, 'false'),
(306, 'mainland', 300, ',243,300,306,', 3, '怀仁县', NULL, NULL, NULL, NULL, 'false'),
(307, 'mainland', 300, ',243,300,307,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(308, 'mainland', 243, ',243,308,', 2, '晋中市', NULL, NULL, NULL, NULL, 'false'),
(309, 'mainland', 308, ',243,308,309,', 3, '榆次区', NULL, NULL, NULL, NULL, 'false'),
(310, 'mainland', 308, ',243,308,310,', 3, '榆社县', NULL, NULL, NULL, NULL, 'false'),
(311, 'mainland', 308, ',243,308,311,', 3, '左权县', NULL, NULL, NULL, NULL, 'false'),
(312, 'mainland', 308, ',243,308,312,', 3, '和顺县', NULL, NULL, NULL, NULL, 'false'),
(313, 'mainland', 308, ',243,308,313,', 3, '昔阳县', NULL, NULL, NULL, NULL, 'false'),
(314, 'mainland', 308, ',243,308,314,', 3, '寿阳县', NULL, NULL, NULL, NULL, 'false'),
(315, 'mainland', 308, ',243,308,315,', 3, '太谷县', NULL, NULL, NULL, NULL, 'false'),
(316, 'mainland', 308, ',243,308,316,', 3, '祁县', NULL, NULL, NULL, NULL, 'false'),
(317, 'mainland', 308, ',243,308,317,', 3, '平遥县', NULL, NULL, NULL, NULL, 'false'),
(318, 'mainland', 308, ',243,308,318,', 3, '灵石县', NULL, NULL, NULL, NULL, 'false'),
(319, 'mainland', 308, ',243,308,319,', 3, '介休市', NULL, NULL, NULL, NULL, 'false'),
(320, 'mainland', 308, ',243,308,320,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(321, 'mainland', 243, ',243,321,', 2, '运城市', NULL, NULL, NULL, NULL, 'false'),
(322, 'mainland', 321, ',243,321,322,', 3, '盐湖区', NULL, NULL, NULL, NULL, 'false'),
(323, 'mainland', 321, ',243,321,323,', 3, '临猗县', NULL, NULL, NULL, NULL, 'false'),
(324, 'mainland', 321, ',243,321,324,', 3, '万荣县', NULL, NULL, NULL, NULL, 'false'),
(325, 'mainland', 321, ',243,321,325,', 3, '闻喜县', NULL, NULL, NULL, NULL, 'false'),
(326, 'mainland', 321, ',243,321,326,', 3, '稷山县', NULL, NULL, NULL, NULL, 'false'),
(327, 'mainland', 321, ',243,321,327,', 3, '新绛县', NULL, NULL, NULL, NULL, 'false'),
(328, 'mainland', 321, ',243,321,328,', 3, '绛县', NULL, NULL, NULL, NULL, 'false'),
(329, 'mainland', 321, ',243,321,329,', 3, '垣曲县', NULL, NULL, NULL, NULL, 'false'),
(330, 'mainland', 321, ',243,321,330,', 3, '夏县', NULL, NULL, NULL, NULL, 'false'),
(331, 'mainland', 321, ',243,321,331,', 3, '平陆县', NULL, NULL, NULL, NULL, 'false'),
(332, 'mainland', 321, ',243,321,332,', 3, '芮城县', NULL, NULL, NULL, NULL, 'false'),
(333, 'mainland', 321, ',243,321,333,', 3, '永济市', NULL, NULL, NULL, NULL, 'false'),
(334, 'mainland', 321, ',243,321,334,', 3, '河津市', NULL, NULL, NULL, NULL, 'false'),
(335, 'mainland', 321, ',243,321,335,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(336, 'mainland', 243, ',243,336,', 2, '忻州市', NULL, NULL, NULL, NULL, 'false'),
(337, 'mainland', 336, ',243,336,337,', 3, '忻府区', NULL, NULL, NULL, NULL, 'false'),
(338, 'mainland', 336, ',243,336,338,', 3, '定襄县', NULL, NULL, NULL, NULL, 'false'),
(339, 'mainland', 336, ',243,336,339,', 3, '五台县', NULL, NULL, NULL, NULL, 'false'),
(340, 'mainland', 336, ',243,336,340,', 3, '代县', NULL, NULL, NULL, NULL, 'false'),
(341, 'mainland', 336, ',243,336,341,', 3, '繁峙县', NULL, NULL, NULL, NULL, 'false'),
(342, 'mainland', 336, ',243,336,342,', 3, '宁武县', NULL, NULL, NULL, NULL, 'false'),
(343, 'mainland', 336, ',243,336,343,', 3, '静乐县', NULL, NULL, NULL, NULL, 'false'),
(344, 'mainland', 336, ',243,336,344,', 3, '神池县', NULL, NULL, NULL, NULL, 'false'),
(345, 'mainland', 336, ',243,336,345,', 3, '五寨县', NULL, NULL, NULL, NULL, 'false'),
(346, 'mainland', 336, ',243,336,346,', 3, '岢岚县', NULL, NULL, NULL, NULL, 'false'),
(347, 'mainland', 336, ',243,336,347,', 3, '河曲县', NULL, NULL, NULL, NULL, 'false'),
(348, 'mainland', 336, ',243,336,348,', 3, '保德县', NULL, NULL, NULL, NULL, 'false'),
(349, 'mainland', 336, ',243,336,349,', 3, '偏关县', NULL, NULL, NULL, NULL, 'false'),
(350, 'mainland', 336, ',243,336,350,', 3, '原平市', NULL, NULL, NULL, NULL, 'false'),
(351, 'mainland', 336, ',243,336,351,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(352, 'mainland', 243, ',243,352,', 2, '临汾市', NULL, NULL, NULL, NULL, 'false'),
(353, 'mainland', 352, ',243,352,353,', 3, '尧都区', NULL, NULL, NULL, NULL, 'false'),
(354, 'mainland', 352, ',243,352,354,', 3, '曲沃县', NULL, NULL, NULL, NULL, 'false'),
(355, 'mainland', 352, ',243,352,355,', 3, '翼城县', NULL, NULL, NULL, NULL, 'false'),
(356, 'mainland', 352, ',243,352,356,', 3, '襄汾县', NULL, NULL, NULL, NULL, 'false'),
(357, 'mainland', 352, ',243,352,357,', 3, '洪洞县', NULL, NULL, NULL, NULL, 'false'),
(358, 'mainland', 352, ',243,352,358,', 3, '古县', NULL, NULL, NULL, NULL, 'false'),
(359, 'mainland', 352, ',243,352,359,', 3, '安泽县', NULL, NULL, NULL, NULL, 'false'),
(360, 'mainland', 352, ',243,352,360,', 3, '浮山县', NULL, NULL, NULL, NULL, 'false'),
(361, 'mainland', 352, ',243,352,361,', 3, '吉县', NULL, NULL, NULL, NULL, 'false'),
(362, 'mainland', 352, ',243,352,362,', 3, '乡宁县', NULL, NULL, NULL, NULL, 'false'),
(363, 'mainland', 352, ',243,352,363,', 3, '大宁县', NULL, NULL, NULL, NULL, 'false'),
(364, 'mainland', 352, ',243,352,364,', 3, '隰县', NULL, NULL, NULL, NULL, 'false'),
(365, 'mainland', 352, ',243,352,365,', 3, '永和县', NULL, NULL, NULL, NULL, 'false'),
(366, 'mainland', 352, ',243,352,366,', 3, '蒲县', NULL, NULL, NULL, NULL, 'false'),
(367, 'mainland', 352, ',243,352,367,', 3, '汾西县', NULL, NULL, NULL, NULL, 'false'),
(368, 'mainland', 352, ',243,352,368,', 3, '侯马市', NULL, NULL, NULL, NULL, 'false'),
(369, 'mainland', 352, ',243,352,369,', 3, '霍州市', NULL, NULL, NULL, NULL, 'false'),
(370, 'mainland', 352, ',243,352,370,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(371, 'mainland', 243, ',243,371,', 2, '吕梁市', NULL, NULL, NULL, NULL, 'false'),
(372, 'mainland', 371, ',243,371,372,', 3, '离石区', NULL, NULL, NULL, NULL, 'false'),
(373, 'mainland', 371, ',243,371,373,', 3, '文水县', NULL, NULL, NULL, NULL, 'false'),
(374, 'mainland', 371, ',243,371,374,', 3, '交城县', NULL, NULL, NULL, NULL, 'false'),
(375, 'mainland', 371, ',243,371,375,', 3, '兴县', NULL, NULL, NULL, NULL, 'false'),
(376, 'mainland', 371, ',243,371,376,', 3, '临县', NULL, NULL, NULL, NULL, 'false'),
(377, 'mainland', 371, ',243,371,377,', 3, '柳林县', NULL, NULL, NULL, NULL, 'false'),
(378, 'mainland', 371, ',243,371,378,', 3, '石楼县', NULL, NULL, NULL, NULL, 'false'),
(379, 'mainland', 371, ',243,371,379,', 3, '岚县', NULL, NULL, NULL, NULL, 'false'),
(380, 'mainland', 371, ',243,371,380,', 3, '方山县', NULL, NULL, NULL, NULL, 'false'),
(381, 'mainland', 371, ',243,371,381,', 3, '中阳县', NULL, NULL, NULL, NULL, 'false'),
(382, 'mainland', 371, ',243,371,382,', 3, '交口县', NULL, NULL, NULL, NULL, 'false'),
(383, 'mainland', 371, ',243,371,383,', 3, '孝义市', NULL, NULL, NULL, NULL, 'false'),
(384, 'mainland', 371, ',243,371,384,', 3, '汾阳市', NULL, NULL, NULL, NULL, 'false'),
(385, 'mainland', 371, ',243,371,385,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(386, 'mainland', NULL, ',386,', 1, '内蒙古自治区', NULL, NULL, NULL, NULL, 'false'),
(387, 'mainland', 386, ',386,387,', 2, '呼和浩特市', NULL, NULL, NULL, NULL, 'false'),
(388, 'mainland', 387, ',386,387,388,', 3, '新城区', NULL, NULL, NULL, NULL, 'false'),
(389, 'mainland', 387, ',386,387,389,', 3, '回民区', NULL, NULL, NULL, NULL, 'false'),
(390, 'mainland', 387, ',386,387,390,', 3, '玉泉区', NULL, NULL, NULL, NULL, 'false'),
(391, 'mainland', 387, ',386,387,391,', 3, '赛罕区', NULL, NULL, NULL, NULL, 'false'),
(392, 'mainland', 387, ',386,387,392,', 3, '土默特左旗', NULL, NULL, NULL, NULL, 'false'),
(393, 'mainland', 387, ',386,387,393,', 3, '托克托县', NULL, NULL, NULL, NULL, 'false'),
(394, 'mainland', 387, ',386,387,394,', 3, '和林格尔县', NULL, NULL, NULL, NULL, 'false'),
(395, 'mainland', 387, ',386,387,395,', 3, '清水河县', NULL, NULL, NULL, NULL, 'false'),
(396, 'mainland', 387, ',386,387,396,', 3, '武川县', NULL, NULL, NULL, NULL, 'false'),
(397, 'mainland', 387, ',386,387,397,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(398, 'mainland', 386, ',386,398,', 2, '包头市', NULL, NULL, NULL, NULL, 'false'),
(399, 'mainland', 398, ',386,398,399,', 3, '东河区', NULL, NULL, NULL, NULL, 'false'),
(400, 'mainland', 398, ',386,398,400,', 3, '昆都仑区', NULL, NULL, NULL, NULL, 'false'),
(401, 'mainland', 398, ',386,398,401,', 3, '青山区', NULL, NULL, NULL, NULL, 'false'),
(402, 'mainland', 398, ',386,398,402,', 3, '石拐区', NULL, NULL, NULL, NULL, 'false'),
(403, 'mainland', 398, ',386,398,403,', 3, '白云矿区', NULL, NULL, NULL, NULL, 'false'),
(404, 'mainland', 398, ',386,398,404,', 3, '九原区', NULL, NULL, NULL, NULL, 'false'),
(405, 'mainland', 398, ',386,398,405,', 3, '土默特右旗', NULL, NULL, NULL, NULL, 'false'),
(406, 'mainland', 398, ',386,398,406,', 3, '固阳县', NULL, NULL, NULL, NULL, 'false'),
(407, 'mainland', 398, ',386,398,407,', 3, '达尔罕茂明安联合旗', NULL, NULL, NULL, NULL, 'false'),
(408, 'mainland', 398, ',386,398,408,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(409, 'mainland', 386, ',386,409,', 2, '乌海市', NULL, NULL, NULL, NULL, 'false'),
(410, 'mainland', 409, ',386,409,410,', 3, '海勃湾区', NULL, NULL, NULL, NULL, 'false'),
(411, 'mainland', 409, ',386,409,411,', 3, '海南区', NULL, NULL, NULL, NULL, 'false'),
(412, 'mainland', 409, ',386,409,412,', 3, '乌达区', NULL, NULL, NULL, NULL, 'false'),
(413, 'mainland', 409, ',386,409,413,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(414, 'mainland', 386, ',386,414,', 2, '赤峰市', NULL, NULL, NULL, NULL, 'false'),
(415, 'mainland', 414, ',386,414,415,', 3, '红山区', NULL, NULL, NULL, NULL, 'false'),
(416, 'mainland', 414, ',386,414,416,', 3, '元宝山区', NULL, NULL, NULL, NULL, 'false'),
(417, 'mainland', 414, ',386,414,417,', 3, '松山区', NULL, NULL, NULL, NULL, 'false'),
(418, 'mainland', 414, ',386,414,418,', 3, '阿鲁科尔沁旗', NULL, NULL, NULL, NULL, 'false'),
(419, 'mainland', 414, ',386,414,419,', 3, '巴林左旗', NULL, NULL, NULL, NULL, 'false'),
(420, 'mainland', 414, ',386,414,420,', 3, '巴林右旗', NULL, NULL, NULL, NULL, 'false'),
(421, 'mainland', 414, ',386,414,421,', 3, '林西县', NULL, NULL, NULL, NULL, 'false'),
(422, 'mainland', 414, ',386,414,422,', 3, '克什克腾旗', NULL, NULL, NULL, NULL, 'false'),
(423, 'mainland', 414, ',386,414,423,', 3, '翁牛特旗', NULL, NULL, NULL, NULL, 'false'),
(424, 'mainland', 414, ',386,414,424,', 3, '喀喇沁旗', NULL, NULL, NULL, NULL, 'false'),
(425, 'mainland', 414, ',386,414,425,', 3, '宁城县', NULL, NULL, NULL, NULL, 'false'),
(426, 'mainland', 414, ',386,414,426,', 3, '敖汉旗', NULL, NULL, NULL, NULL, 'false'),
(427, 'mainland', 414, ',386,414,427,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(428, 'mainland', 386, ',386,428,', 2, '通辽市', NULL, NULL, NULL, NULL, 'false'),
(429, 'mainland', 428, ',386,428,429,', 3, '科尔沁区', NULL, NULL, NULL, NULL, 'false'),
(430, 'mainland', 428, ',386,428,430,', 3, '科尔沁左翼中旗', NULL, NULL, NULL, NULL, 'false'),
(431, 'mainland', 428, ',386,428,431,', 3, '科尔沁左翼后旗', NULL, NULL, NULL, NULL, 'false'),
(432, 'mainland', 428, ',386,428,432,', 3, '开鲁县', NULL, NULL, NULL, NULL, 'false'),
(433, 'mainland', 428, ',386,428,433,', 3, '库伦旗', NULL, NULL, NULL, NULL, 'false'),
(434, 'mainland', 428, ',386,428,434,', 3, '奈曼旗', NULL, NULL, NULL, NULL, 'false'),
(435, 'mainland', 428, ',386,428,435,', 3, '扎鲁特旗', NULL, NULL, NULL, NULL, 'false'),
(436, 'mainland', 428, ',386,428,436,', 3, '霍林郭勒市', NULL, NULL, NULL, NULL, 'false'),
(437, 'mainland', 428, ',386,428,437,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(438, 'mainland', 386, ',386,438,', 2, '鄂尔多斯市', NULL, NULL, NULL, NULL, 'false'),
(439, 'mainland', 438, ',386,438,439,', 3, '东胜区', NULL, NULL, NULL, NULL, 'false'),
(440, 'mainland', 438, ',386,438,440,', 3, '达拉特旗', NULL, NULL, NULL, NULL, 'false'),
(441, 'mainland', 438, ',386,438,441,', 3, '准格尔旗', NULL, NULL, NULL, NULL, 'false'),
(442, 'mainland', 438, ',386,438,442,', 3, '鄂托克前旗', NULL, NULL, NULL, NULL, 'false'),
(443, 'mainland', 438, ',386,438,443,', 3, '鄂托克旗', NULL, NULL, NULL, NULL, 'false'),
(444, 'mainland', 438, ',386,438,444,', 3, '杭锦旗', NULL, NULL, NULL, NULL, 'false'),
(445, 'mainland', 438, ',386,438,445,', 3, '乌审旗', NULL, NULL, NULL, NULL, 'false'),
(446, 'mainland', 438, ',386,438,446,', 3, '伊金霍洛旗', NULL, NULL, NULL, NULL, 'false'),
(447, 'mainland', 438, ',386,438,447,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(448, 'mainland', 386, ',386,448,', 2, '呼伦贝尔市', NULL, NULL, NULL, NULL, 'false'),
(449, 'mainland', 448, ',386,448,449,', 3, '海拉尔区', NULL, NULL, NULL, NULL, 'false'),
(450, 'mainland', 448, ',386,448,450,', 3, '阿荣旗', NULL, NULL, NULL, NULL, 'false'),
(451, 'mainland', 448, ',386,448,451,', 3, '莫力达瓦达斡尔族自治旗', NULL, NULL, NULL, NULL, 'false'),
(452, 'mainland', 448, ',386,448,452,', 3, '鄂伦春自治旗', NULL, NULL, NULL, NULL, 'false'),
(453, 'mainland', 448, ',386,448,453,', 3, '鄂温克族自治旗', NULL, NULL, NULL, NULL, 'false'),
(454, 'mainland', 448, ',386,448,454,', 3, '陈巴尔虎旗', NULL, NULL, NULL, NULL, 'false'),
(455, 'mainland', 448, ',386,448,455,', 3, '新巴尔虎左旗', NULL, NULL, NULL, NULL, 'false'),
(456, 'mainland', 448, ',386,448,456,', 3, '新巴尔虎右旗', NULL, NULL, NULL, NULL, 'false'),
(457, 'mainland', 448, ',386,448,457,', 3, '满洲里市', NULL, NULL, NULL, NULL, 'false'),
(458, 'mainland', 448, ',386,448,458,', 3, '牙克石市', NULL, NULL, NULL, NULL, 'false'),
(459, 'mainland', 448, ',386,448,459,', 3, '扎兰屯市', NULL, NULL, NULL, NULL, 'false'),
(460, 'mainland', 448, ',386,448,460,', 3, '额尔古纳市', NULL, NULL, NULL, NULL, 'false'),
(461, 'mainland', 448, ',386,448,461,', 3, '根河市', NULL, NULL, NULL, NULL, 'false'),
(462, 'mainland', 448, ',386,448,462,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(463, 'mainland', 386, ',386,463,', 2, '巴彦淖尔市', NULL, NULL, NULL, NULL, 'false'),
(464, 'mainland', 463, ',386,463,464,', 3, '临河区', NULL, NULL, NULL, NULL, 'false'),
(465, 'mainland', 463, ',386,463,465,', 3, '五原县', NULL, NULL, NULL, NULL, 'false'),
(466, 'mainland', 463, ',386,463,466,', 3, '磴口县', NULL, NULL, NULL, NULL, 'false'),
(467, 'mainland', 463, ',386,463,467,', 3, '乌拉特前旗', NULL, NULL, NULL, NULL, 'false'),
(468, 'mainland', 463, ',386,463,468,', 3, '乌拉特中旗', NULL, NULL, NULL, NULL, 'false'),
(469, 'mainland', 463, ',386,463,469,', 3, '乌拉特后旗', NULL, NULL, NULL, NULL, 'false'),
(470, 'mainland', 463, ',386,463,470,', 3, '杭锦后旗', NULL, NULL, NULL, NULL, 'false'),
(471, 'mainland', 463, ',386,463,471,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(472, 'mainland', 386, ',386,472,', 2, '乌兰察布市', NULL, NULL, NULL, NULL, 'false'),
(473, 'mainland', 472, ',386,472,473,', 3, '集宁区', NULL, NULL, NULL, NULL, 'false'),
(474, 'mainland', 472, ',386,472,474,', 3, '卓资县', NULL, NULL, NULL, NULL, 'false'),
(475, 'mainland', 472, ',386,472,475,', 3, '化德县', NULL, NULL, NULL, NULL, 'false'),
(476, 'mainland', 472, ',386,472,476,', 3, '商都县', NULL, NULL, NULL, NULL, 'false'),
(477, 'mainland', 472, ',386,472,477,', 3, '兴和县', NULL, NULL, NULL, NULL, 'false'),
(478, 'mainland', 472, ',386,472,478,', 3, '凉城县', NULL, NULL, NULL, NULL, 'false'),
(479, 'mainland', 472, ',386,472,479,', 3, '察哈尔右翼前旗', NULL, NULL, NULL, NULL, 'false'),
(480, 'mainland', 472, ',386,472,480,', 3, '察哈尔右翼中旗', NULL, NULL, NULL, NULL, 'false'),
(481, 'mainland', 472, ',386,472,481,', 3, '察哈尔右翼后旗', NULL, NULL, NULL, NULL, 'false'),
(482, 'mainland', 472, ',386,472,482,', 3, '四子王旗', NULL, NULL, NULL, NULL, 'false'),
(483, 'mainland', 472, ',386,472,483,', 3, '丰镇市', NULL, NULL, NULL, NULL, 'false'),
(484, 'mainland', 472, ',386,472,484,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(485, 'mainland', 386, ',386,485,', 2, '兴安盟', NULL, NULL, NULL, NULL, 'false'),
(486, 'mainland', 485, ',386,485,486,', 3, '乌兰浩特市', NULL, NULL, NULL, NULL, 'false'),
(487, 'mainland', 485, ',386,485,487,', 3, '阿尔山市', NULL, NULL, NULL, NULL, 'false'),
(488, 'mainland', 485, ',386,485,488,', 3, '科尔沁右翼前旗', NULL, NULL, NULL, NULL, 'false'),
(489, 'mainland', 485, ',386,485,489,', 3, '科尔沁右翼中旗', NULL, NULL, NULL, NULL, 'false'),
(490, 'mainland', 485, ',386,485,490,', 3, '扎赉特旗', NULL, NULL, NULL, NULL, 'false'),
(491, 'mainland', 485, ',386,485,491,', 3, '突泉县', NULL, NULL, NULL, NULL, 'false'),
(492, 'mainland', 485, ',386,485,492,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(493, 'mainland', 386, ',386,493,', 2, '锡林郭勒盟', NULL, NULL, NULL, NULL, 'false'),
(494, 'mainland', 493, ',386,493,494,', 3, '二连浩特市', NULL, NULL, NULL, NULL, 'false'),
(495, 'mainland', 493, ',386,493,495,', 3, '锡林浩特市', NULL, NULL, NULL, NULL, 'false'),
(496, 'mainland', 493, ',386,493,496,', 3, '阿巴嘎旗', NULL, NULL, NULL, NULL, 'false'),
(497, 'mainland', 493, ',386,493,497,', 3, '苏尼特左旗', NULL, NULL, NULL, NULL, 'false'),
(498, 'mainland', 493, ',386,493,498,', 3, '苏尼特右旗', NULL, NULL, NULL, NULL, 'false'),
(499, 'mainland', 493, ',386,493,499,', 3, '东乌珠穆沁旗', NULL, NULL, NULL, NULL, 'false'),
(500, 'mainland', 493, ',386,493,500,', 3, '西乌珠穆沁旗', NULL, NULL, NULL, NULL, 'false'),
(501, 'mainland', 493, ',386,493,501,', 3, '太仆寺旗', NULL, NULL, NULL, NULL, 'false'),
(502, 'mainland', 493, ',386,493,502,', 3, '镶黄旗', NULL, NULL, NULL, NULL, 'false'),
(503, 'mainland', 493, ',386,493,503,', 3, '正镶白旗', NULL, NULL, NULL, NULL, 'false'),
(504, 'mainland', 493, ',386,493,504,', 3, '正蓝旗', NULL, NULL, NULL, NULL, 'false'),
(505, 'mainland', 493, ',386,493,505,', 3, '多伦县', NULL, NULL, NULL, NULL, 'false'),
(506, 'mainland', 493, ',386,493,506,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(507, 'mainland', 386, ',386,507,', 2, '阿拉善盟', NULL, NULL, NULL, NULL, 'false'),
(508, 'mainland', 507, ',386,507,508,', 3, '阿拉善左旗', NULL, NULL, NULL, NULL, 'false'),
(509, 'mainland', 507, ',386,507,509,', 3, '阿拉善右旗', NULL, NULL, NULL, NULL, 'false'),
(510, 'mainland', 507, ',386,507,510,', 3, '额济纳旗', NULL, NULL, NULL, NULL, 'false'),
(511, 'mainland', 507, ',386,507,511,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(512, 'mainland', NULL, ',512,', 1, '辽宁省', NULL, NULL, NULL, NULL, 'false'),
(513, 'mainland', 512, ',512,513,', 2, '沈阳市', NULL, NULL, NULL, NULL, 'false'),
(514, 'mainland', 513, ',512,513,514,', 3, '和平区', NULL, NULL, NULL, NULL, 'false'),
(515, 'mainland', 513, ',512,513,515,', 3, '沈河区', NULL, NULL, NULL, NULL, 'false'),
(516, 'mainland', 513, ',512,513,516,', 3, '大东区', NULL, NULL, NULL, NULL, 'false'),
(517, 'mainland', 513, ',512,513,517,', 3, '皇姑区', NULL, NULL, NULL, NULL, 'false'),
(518, 'mainland', 513, ',512,513,518,', 3, '铁西区', NULL, NULL, NULL, NULL, 'false'),
(519, 'mainland', 513, ',512,513,519,', 3, '苏家屯区', NULL, NULL, NULL, NULL, 'false'),
(520, 'mainland', 513, ',512,513,520,', 3, '东陵区', NULL, NULL, NULL, NULL, 'false'),
(521, 'mainland', 513, ',512,513,521,', 3, '新城子区', NULL, NULL, NULL, NULL, 'false'),
(522, 'mainland', 513, ',512,513,522,', 3, '于洪区', NULL, NULL, NULL, NULL, 'false'),
(523, 'mainland', 513, ',512,513,523,', 3, '辽中县', NULL, NULL, NULL, NULL, 'false'),
(524, 'mainland', 513, ',512,513,524,', 3, '康平县', NULL, NULL, NULL, NULL, 'false'),
(525, 'mainland', 513, ',512,513,525,', 3, '法库县', NULL, NULL, NULL, NULL, 'false'),
(526, 'mainland', 513, ',512,513,526,', 3, '新民市', NULL, NULL, NULL, NULL, 'false'),
(527, 'mainland', 513, ',512,513,527,', 3, '浑南新区', NULL, NULL, NULL, NULL, 'false'),
(528, 'mainland', 513, ',512,513,528,', 3, '张士开发区', NULL, NULL, NULL, NULL, 'false'),
(529, 'mainland', 513, ',512,513,529,', 3, '沈北新区', NULL, NULL, NULL, NULL, 'false'),
(530, 'mainland', 513, ',512,513,530,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(531, 'mainland', 512, ',512,531,', 2, '大连市', NULL, NULL, NULL, NULL, 'false'),
(532, 'mainland', 531, ',512,531,532,', 3, '中山区', NULL, NULL, NULL, NULL, 'false'),
(533, 'mainland', 531, ',512,531,533,', 3, '西岗区', NULL, NULL, NULL, NULL, 'false'),
(534, 'mainland', 531, ',512,531,534,', 3, '沙河口区', NULL, NULL, NULL, NULL, 'false'),
(535, 'mainland', 531, ',512,531,535,', 3, '甘井子区', NULL, NULL, NULL, NULL, 'false'),
(536, 'mainland', 531, ',512,531,536,', 3, '旅顺口区', NULL, NULL, NULL, NULL, 'false'),
(537, 'mainland', 531, ',512,531,537,', 3, '金州区', NULL, NULL, NULL, NULL, 'false'),
(538, 'mainland', 531, ',512,531,538,', 3, '长海县', NULL, NULL, NULL, NULL, 'false'),
(539, 'mainland', 531, ',512,531,539,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(540, 'mainland', 531, ',512,531,540,', 3, '瓦房店市', NULL, NULL, NULL, NULL, 'false'),
(541, 'mainland', 531, ',512,531,541,', 3, '普兰店市', NULL, NULL, NULL, NULL, 'false'),
(542, 'mainland', 531, ',512,531,542,', 3, '庄河市', NULL, NULL, NULL, NULL, 'false'),
(543, 'mainland', 531, ',512,531,543,', 3, '岭前区', NULL, NULL, NULL, NULL, 'false'),
(544, 'mainland', 531, ',512,531,544,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(545, 'mainland', 512, ',512,545,', 2, '鞍山市', NULL, NULL, NULL, NULL, 'false'),
(546, 'mainland', 545, ',512,545,546,', 3, '铁东区', NULL, NULL, NULL, NULL, 'false'),
(547, 'mainland', 545, ',512,545,547,', 3, '铁西区', NULL, NULL, NULL, NULL, 'false'),
(548, 'mainland', 545, ',512,545,548,', 3, '立山区', NULL, NULL, NULL, NULL, 'false'),
(549, 'mainland', 545, ',512,545,549,', 3, '千山区', NULL, NULL, NULL, NULL, 'false'),
(550, 'mainland', 545, ',512,545,550,', 3, '台安县', NULL, NULL, NULL, NULL, 'false'),
(551, 'mainland', 545, ',512,545,551,', 3, '岫岩满族自治县', NULL, NULL, NULL, NULL, 'false'),
(552, 'mainland', 545, ',512,545,552,', 3, '高新区', NULL, NULL, NULL, NULL, 'false'),
(553, 'mainland', 545, ',512,545,553,', 3, '海城市', NULL, NULL, NULL, NULL, 'false'),
(554, 'mainland', 545, ',512,545,554,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(555, 'mainland', 512, ',512,555,', 2, '抚顺市', NULL, NULL, NULL, NULL, 'false'),
(556, 'mainland', 555, ',512,555,556,', 3, '新抚区', NULL, NULL, NULL, NULL, 'false'),
(557, 'mainland', 555, ',512,555,557,', 3, '东洲区', NULL, NULL, NULL, NULL, 'false'),
(558, 'mainland', 555, ',512,555,558,', 3, '望花区', NULL, NULL, NULL, NULL, 'false'),
(559, 'mainland', 555, ',512,555,559,', 3, '顺城区', NULL, NULL, NULL, NULL, 'false'),
(560, 'mainland', 555, ',512,555,560,', 3, '抚顺县', NULL, NULL, NULL, NULL, 'false'),
(561, 'mainland', 555, ',512,555,561,', 3, '新宾满族自治县', NULL, NULL, NULL, NULL, 'false'),
(562, 'mainland', 555, ',512,555,562,', 3, '清原满族自治县', NULL, NULL, NULL, NULL, 'false'),
(563, 'mainland', 555, ',512,555,563,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(564, 'mainland', 512, ',512,564,', 2, '本溪市', NULL, NULL, NULL, NULL, 'false'),
(565, 'mainland', 564, ',512,564,565,', 3, '平山区', NULL, NULL, NULL, NULL, 'false'),
(566, 'mainland', 564, ',512,564,566,', 3, '溪湖区', NULL, NULL, NULL, NULL, 'false'),
(567, 'mainland', 564, ',512,564,567,', 3, '明山区', NULL, NULL, NULL, NULL, 'false'),
(568, 'mainland', 564, ',512,564,568,', 3, '南芬区', NULL, NULL, NULL, NULL, 'false'),
(569, 'mainland', 564, ',512,564,569,', 3, '本溪满族自治县', NULL, NULL, NULL, NULL, 'false'),
(570, 'mainland', 564, ',512,564,570,', 3, '桓仁满族自治县', NULL, NULL, NULL, NULL, 'false');
INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(571, 'mainland', 564, ',512,564,571,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(572, 'mainland', 512, ',512,572,', 2, '丹东市', NULL, NULL, NULL, NULL, 'false'),
(573, 'mainland', 572, ',512,572,573,', 3, '元宝区', NULL, NULL, NULL, NULL, 'false'),
(574, 'mainland', 572, ',512,572,574,', 3, '振兴区', NULL, NULL, NULL, NULL, 'false'),
(575, 'mainland', 572, ',512,572,575,', 3, '振安区', NULL, NULL, NULL, NULL, 'false'),
(576, 'mainland', 572, ',512,572,576,', 3, '宽甸满族自治县', NULL, NULL, NULL, NULL, 'false'),
(577, 'mainland', 572, ',512,572,577,', 3, '东港市', NULL, NULL, NULL, NULL, 'false'),
(578, 'mainland', 572, ',512,572,578,', 3, '凤城市', NULL, NULL, NULL, NULL, 'false'),
(579, 'mainland', 572, ',512,572,579,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(580, 'mainland', 512, ',512,580,', 2, '锦州市', NULL, NULL, NULL, NULL, 'false'),
(581, 'mainland', 580, ',512,580,581,', 3, '古塔区', NULL, NULL, NULL, NULL, 'false'),
(582, 'mainland', 580, ',512,580,582,', 3, '凌河区', NULL, NULL, NULL, NULL, 'false'),
(583, 'mainland', 580, ',512,580,583,', 3, '太和区', NULL, NULL, NULL, NULL, 'false'),
(584, 'mainland', 580, ',512,580,584,', 3, '黑山县', NULL, NULL, NULL, NULL, 'false'),
(585, 'mainland', 580, ',512,580,585,', 3, '义县', NULL, NULL, NULL, NULL, 'false'),
(586, 'mainland', 580, ',512,580,586,', 3, '凌海市', NULL, NULL, NULL, NULL, 'false'),
(587, 'mainland', 580, ',512,580,587,', 3, '北镇市', NULL, NULL, NULL, NULL, 'false'),
(588, 'mainland', 580, ',512,580,588,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(589, 'mainland', 512, ',512,589,', 2, '营口市', NULL, NULL, NULL, NULL, 'false'),
(590, 'mainland', 589, ',512,589,590,', 3, '站前区', NULL, NULL, NULL, NULL, 'false'),
(591, 'mainland', 589, ',512,589,591,', 3, '西市区', NULL, NULL, NULL, NULL, 'false'),
(592, 'mainland', 589, ',512,589,592,', 3, '鲅鱼圈区', NULL, NULL, NULL, NULL, 'false'),
(593, 'mainland', 589, ',512,589,593,', 3, '老边区', NULL, NULL, NULL, NULL, 'false'),
(594, 'mainland', 589, ',512,589,594,', 3, '盖州市', NULL, NULL, NULL, NULL, 'false'),
(595, 'mainland', 589, ',512,589,595,', 3, '大石桥市', NULL, NULL, NULL, NULL, 'false'),
(596, 'mainland', 589, ',512,589,596,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(597, 'mainland', 512, ',512,597,', 2, '阜新市', NULL, NULL, NULL, NULL, 'false'),
(598, 'mainland', 597, ',512,597,598,', 3, '海州区', NULL, NULL, NULL, NULL, 'false'),
(599, 'mainland', 597, ',512,597,599,', 3, '新邱区', NULL, NULL, NULL, NULL, 'false'),
(600, 'mainland', 597, ',512,597,600,', 3, '太平区', NULL, NULL, NULL, NULL, 'false'),
(601, 'mainland', 597, ',512,597,601,', 3, '清河门区', NULL, NULL, NULL, NULL, 'false'),
(602, 'mainland', 597, ',512,597,602,', 3, '细河区', NULL, NULL, NULL, NULL, 'false'),
(603, 'mainland', 597, ',512,597,603,', 3, '阜新蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(604, 'mainland', 597, ',512,597,604,', 3, '彰武县', NULL, NULL, NULL, NULL, 'false'),
(605, 'mainland', 597, ',512,597,605,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(606, 'mainland', 512, ',512,606,', 2, '辽阳市', NULL, NULL, NULL, NULL, 'false'),
(607, 'mainland', 606, ',512,606,607,', 3, '白塔区', NULL, NULL, NULL, NULL, 'false'),
(608, 'mainland', 606, ',512,606,608,', 3, '文圣区', NULL, NULL, NULL, NULL, 'false'),
(609, 'mainland', 606, ',512,606,609,', 3, '宏伟区', NULL, NULL, NULL, NULL, 'false'),
(610, 'mainland', 606, ',512,606,610,', 3, '弓长岭区', NULL, NULL, NULL, NULL, 'false'),
(611, 'mainland', 606, ',512,606,611,', 3, '太子河区', NULL, NULL, NULL, NULL, 'false'),
(612, 'mainland', 606, ',512,606,612,', 3, '辽阳县', NULL, NULL, NULL, NULL, 'false'),
(613, 'mainland', 606, ',512,606,613,', 3, '灯塔市', NULL, NULL, NULL, NULL, 'false'),
(614, 'mainland', 606, ',512,606,614,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(615, 'mainland', 512, ',512,615,', 2, '盘锦市', NULL, NULL, NULL, NULL, 'false'),
(616, 'mainland', 615, ',512,615,616,', 3, '双台子区', NULL, NULL, NULL, NULL, 'false'),
(617, 'mainland', 615, ',512,615,617,', 3, '兴隆台区', NULL, NULL, NULL, NULL, 'false'),
(618, 'mainland', 615, ',512,615,618,', 3, '大洼县', NULL, NULL, NULL, NULL, 'false'),
(619, 'mainland', 615, ',512,615,619,', 3, '盘山县', NULL, NULL, NULL, NULL, 'false'),
(620, 'mainland', 615, ',512,615,620,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(621, 'mainland', 512, ',512,621,', 2, '铁岭市', NULL, NULL, NULL, NULL, 'false'),
(622, 'mainland', 621, ',512,621,622,', 3, '银州区', NULL, NULL, NULL, NULL, 'false'),
(623, 'mainland', 621, ',512,621,623,', 3, '清河区', NULL, NULL, NULL, NULL, 'false'),
(624, 'mainland', 621, ',512,621,624,', 3, '铁岭县', NULL, NULL, NULL, NULL, 'false'),
(625, 'mainland', 621, ',512,621,625,', 3, '西丰县', NULL, NULL, NULL, NULL, 'false'),
(626, 'mainland', 621, ',512,621,626,', 3, '昌图县', NULL, NULL, NULL, NULL, 'false'),
(627, 'mainland', 621, ',512,621,627,', 3, '调兵山市', NULL, NULL, NULL, NULL, 'false'),
(628, 'mainland', 621, ',512,621,628,', 3, '开原市', NULL, NULL, NULL, NULL, 'false'),
(629, 'mainland', 621, ',512,621,629,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(630, 'mainland', 512, ',512,630,', 2, '朝阳市', NULL, NULL, NULL, NULL, 'false'),
(631, 'mainland', 630, ',512,630,631,', 3, '双塔区', NULL, NULL, NULL, NULL, 'false'),
(632, 'mainland', 630, ',512,630,632,', 3, '龙城区', NULL, NULL, NULL, NULL, 'false'),
(633, 'mainland', 630, ',512,630,633,', 3, '朝阳县', NULL, NULL, NULL, NULL, 'false'),
(634, 'mainland', 630, ',512,630,634,', 3, '建平县', NULL, NULL, NULL, NULL, 'false'),
(635, 'mainland', 630, ',512,630,635,', 3, '喀喇沁左翼蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(636, 'mainland', 630, ',512,630,636,', 3, '北票市', NULL, NULL, NULL, NULL, 'false'),
(637, 'mainland', 630, ',512,630,637,', 3, '凌源市', NULL, NULL, NULL, NULL, 'false'),
(638, 'mainland', 630, ',512,630,638,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(639, 'mainland', 512, ',512,639,', 2, '葫芦岛市', NULL, NULL, NULL, NULL, 'false'),
(640, 'mainland', 639, ',512,639,640,', 3, '连山区', NULL, NULL, NULL, NULL, 'false'),
(641, 'mainland', 639, ',512,639,641,', 3, '龙港区', NULL, NULL, NULL, NULL, 'false'),
(642, 'mainland', 639, ',512,639,642,', 3, '南票区', NULL, NULL, NULL, NULL, 'false'),
(643, 'mainland', 639, ',512,639,643,', 3, '绥中县', NULL, NULL, NULL, NULL, 'false'),
(644, 'mainland', 639, ',512,639,644,', 3, '建昌县', NULL, NULL, NULL, NULL, 'false'),
(645, 'mainland', 639, ',512,639,645,', 3, '兴城市', NULL, NULL, NULL, NULL, 'false'),
(646, 'mainland', 639, ',512,639,646,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(647, 'mainland', NULL, ',647,', 1, '吉林省', NULL, NULL, NULL, NULL, 'false'),
(648, 'mainland', 647, ',647,648,', 2, '长春市', NULL, NULL, NULL, NULL, 'false'),
(649, 'mainland', 648, ',647,648,649,', 3, '南关区', NULL, NULL, NULL, NULL, 'false'),
(650, 'mainland', 648, ',647,648,650,', 3, '宽城区', NULL, NULL, NULL, NULL, 'false'),
(651, 'mainland', 648, ',647,648,651,', 3, '朝阳区', NULL, NULL, NULL, NULL, 'false'),
(652, 'mainland', 648, ',647,648,652,', 3, '二道区', NULL, NULL, NULL, NULL, 'false'),
(653, 'mainland', 648, ',647,648,653,', 3, '绿园区', NULL, NULL, NULL, NULL, 'false'),
(654, 'mainland', 648, ',647,648,654,', 3, '双阳区', NULL, NULL, NULL, NULL, 'false'),
(655, 'mainland', 648, ',647,648,655,', 3, '农安县', NULL, NULL, NULL, NULL, 'false'),
(656, 'mainland', 648, ',647,648,656,', 3, '九台市', NULL, NULL, NULL, NULL, 'false'),
(657, 'mainland', 648, ',647,648,657,', 3, '榆树市', NULL, NULL, NULL, NULL, 'false'),
(658, 'mainland', 648, ',647,648,658,', 3, '德惠市', NULL, NULL, NULL, NULL, 'false'),
(659, 'mainland', 648, ',647,648,659,', 3, '高新技术产业开发区', NULL, NULL, NULL, NULL, 'false'),
(660, 'mainland', 648, ',647,648,660,', 3, '汽车产业开发区', NULL, NULL, NULL, NULL, 'false'),
(661, 'mainland', 648, ',647,648,661,', 3, '经济技术开发区', NULL, NULL, NULL, NULL, 'false'),
(662, 'mainland', 648, ',647,648,662,', 3, '净月旅游开发区', NULL, NULL, NULL, NULL, 'false'),
(663, 'mainland', 648, ',647,648,663,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(664, 'mainland', 647, ',647,664,', 2, '吉林市', NULL, NULL, NULL, NULL, 'false'),
(665, 'mainland', 664, ',647,664,665,', 3, '昌邑区', NULL, NULL, NULL, NULL, 'false'),
(666, 'mainland', 664, ',647,664,666,', 3, '龙潭区', NULL, NULL, NULL, NULL, 'false'),
(667, 'mainland', 664, ',647,664,667,', 3, '船营区', NULL, NULL, NULL, NULL, 'false'),
(668, 'mainland', 664, ',647,664,668,', 3, '丰满区', NULL, NULL, NULL, NULL, 'false'),
(669, 'mainland', 664, ',647,664,669,', 3, '永吉县', NULL, NULL, NULL, NULL, 'false'),
(670, 'mainland', 664, ',647,664,670,', 3, '蛟河市', NULL, NULL, NULL, NULL, 'false'),
(671, 'mainland', 664, ',647,664,671,', 3, '桦甸市', NULL, NULL, NULL, NULL, 'false'),
(672, 'mainland', 664, ',647,664,672,', 3, '舒兰市', NULL, NULL, NULL, NULL, 'false'),
(673, 'mainland', 664, ',647,664,673,', 3, '磐石市', NULL, NULL, NULL, NULL, 'false'),
(674, 'mainland', 664, ',647,664,674,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(675, 'mainland', 647, ',647,675,', 2, '四平市', NULL, NULL, NULL, NULL, 'false'),
(676, 'mainland', 675, ',647,675,676,', 3, '铁西区', NULL, NULL, NULL, NULL, 'false'),
(677, 'mainland', 675, ',647,675,677,', 3, '铁东区', NULL, NULL, NULL, NULL, 'false'),
(678, 'mainland', 675, ',647,675,678,', 3, '梨树县', NULL, NULL, NULL, NULL, 'false'),
(679, 'mainland', 675, ',647,675,679,', 3, '伊通满族自治县', NULL, NULL, NULL, NULL, 'false'),
(680, 'mainland', 675, ',647,675,680,', 3, '公主岭市', NULL, NULL, NULL, NULL, 'false'),
(681, 'mainland', 675, ',647,675,681,', 3, '双辽市', NULL, NULL, NULL, NULL, 'false'),
(682, 'mainland', 675, ',647,675,682,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(683, 'mainland', 647, ',647,683,', 2, '辽源市', NULL, NULL, NULL, NULL, 'false'),
(684, 'mainland', 683, ',647,683,684,', 3, '龙山区', NULL, NULL, NULL, NULL, 'false'),
(685, 'mainland', 683, ',647,683,685,', 3, '西安区', NULL, NULL, NULL, NULL, 'false'),
(686, 'mainland', 683, ',647,683,686,', 3, '东丰县', NULL, NULL, NULL, NULL, 'false'),
(687, 'mainland', 683, ',647,683,687,', 3, '东辽县', NULL, NULL, NULL, NULL, 'false'),
(688, 'mainland', 683, ',647,683,688,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(689, 'mainland', 647, ',647,689,', 2, '通化市', NULL, NULL, NULL, NULL, 'false'),
(690, 'mainland', 689, ',647,689,690,', 3, '东昌区', NULL, NULL, NULL, NULL, 'false'),
(691, 'mainland', 689, ',647,689,691,', 3, '二道江区', NULL, NULL, NULL, NULL, 'false'),
(692, 'mainland', 689, ',647,689,692,', 3, '通化县', NULL, NULL, NULL, NULL, 'false'),
(693, 'mainland', 689, ',647,689,693,', 3, '辉南县', NULL, NULL, NULL, NULL, 'false'),
(694, 'mainland', 689, ',647,689,694,', 3, '柳河县', NULL, NULL, NULL, NULL, 'false'),
(695, 'mainland', 689, ',647,689,695,', 3, '梅河口市', NULL, NULL, NULL, NULL, 'false'),
(696, 'mainland', 689, ',647,689,696,', 3, '集安市', NULL, NULL, NULL, NULL, 'false'),
(697, 'mainland', 689, ',647,689,697,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(698, 'mainland', 647, ',647,698,', 2, '白山市', NULL, NULL, NULL, NULL, 'false'),
(699, 'mainland', 698, ',647,698,699,', 3, '八道江区', NULL, NULL, NULL, NULL, 'false'),
(700, 'mainland', 698, ',647,698,700,', 3, '抚松县', NULL, NULL, NULL, NULL, 'false'),
(701, 'mainland', 698, ',647,698,701,', 3, '靖宇县', NULL, NULL, NULL, NULL, 'false'),
(702, 'mainland', 698, ',647,698,702,', 3, '长白朝鲜族自治县', NULL, NULL, NULL, NULL, 'false'),
(703, 'mainland', 698, ',647,698,703,', 3, '江源县', NULL, NULL, NULL, NULL, 'false'),
(704, 'mainland', 698, ',647,698,704,', 3, '临江市', NULL, NULL, NULL, NULL, 'false'),
(705, 'mainland', 698, ',647,698,705,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(706, 'mainland', 647, ',647,706,', 2, '松原市', NULL, NULL, NULL, NULL, 'false'),
(707, 'mainland', 706, ',647,706,707,', 3, '宁江区', NULL, NULL, NULL, NULL, 'false'),
(708, 'mainland', 706, ',647,706,708,', 3, '前郭尔罗斯蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(709, 'mainland', 706, ',647,706,709,', 3, '长岭县', NULL, NULL, NULL, NULL, 'false'),
(710, 'mainland', 706, ',647,706,710,', 3, '乾安县', NULL, NULL, NULL, NULL, 'false'),
(711, 'mainland', 706, ',647,706,711,', 3, '扶余县', NULL, NULL, NULL, NULL, 'false'),
(712, 'mainland', 706, ',647,706,712,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(713, 'mainland', 647, ',647,713,', 2, '白城市', NULL, NULL, NULL, NULL, 'false'),
(714, 'mainland', 713, ',647,713,714,', 3, '洮北区', NULL, NULL, NULL, NULL, 'false'),
(715, 'mainland', 713, ',647,713,715,', 3, '镇赉县', NULL, NULL, NULL, NULL, 'false'),
(716, 'mainland', 713, ',647,713,716,', 3, '通榆县', NULL, NULL, NULL, NULL, 'false'),
(717, 'mainland', 713, ',647,713,717,', 3, '洮南市', NULL, NULL, NULL, NULL, 'false'),
(718, 'mainland', 713, ',647,713,718,', 3, '大安市', NULL, NULL, NULL, NULL, 'false'),
(719, 'mainland', 713, ',647,713,719,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(720, 'mainland', 647, ',647,720,', 2, '延边朝鲜族自治州', NULL, NULL, NULL, NULL, 'false'),
(721, 'mainland', 720, ',647,720,721,', 3, '延吉市', NULL, NULL, NULL, NULL, 'false'),
(722, 'mainland', 720, ',647,720,722,', 3, '图们市', NULL, NULL, NULL, NULL, 'false'),
(723, 'mainland', 720, ',647,720,723,', 3, '敦化市', NULL, NULL, NULL, NULL, 'false'),
(724, 'mainland', 720, ',647,720,724,', 3, '珲春市', NULL, NULL, NULL, NULL, 'false'),
(725, 'mainland', 720, ',647,720,725,', 3, '龙井市', NULL, NULL, NULL, NULL, 'false'),
(726, 'mainland', 720, ',647,720,726,', 3, '和龙市', NULL, NULL, NULL, NULL, 'false'),
(727, 'mainland', 720, ',647,720,727,', 3, '汪清县', NULL, NULL, NULL, NULL, 'false'),
(728, 'mainland', 720, ',647,720,728,', 3, '安图县', NULL, NULL, NULL, NULL, 'false'),
(729, 'mainland', 720, ',647,720,729,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(730, 'mainland', NULL, ',730,', 1, '黑龙江省', NULL, NULL, NULL, NULL, 'false'),
(731, 'mainland', 730, ',730,731,', 2, '哈尔滨市', NULL, NULL, NULL, NULL, 'false'),
(732, 'mainland', 731, ',730,731,732,', 3, '道里区', NULL, NULL, NULL, NULL, 'false'),
(733, 'mainland', 731, ',730,731,733,', 3, '南岗区', NULL, NULL, NULL, NULL, 'false'),
(734, 'mainland', 731, ',730,731,734,', 3, '道外区', NULL, NULL, NULL, NULL, 'false'),
(735, 'mainland', 731, ',730,731,735,', 3, '香坊区', NULL, NULL, NULL, NULL, 'false'),
(736, 'mainland', 731, ',730,731,736,', 3, '动力区', NULL, NULL, NULL, NULL, 'false'),
(737, 'mainland', 731, ',730,731,737,', 3, '平房区', NULL, NULL, NULL, NULL, 'false'),
(738, 'mainland', 731, ',730,731,738,', 3, '松北区', NULL, NULL, NULL, NULL, 'false'),
(739, 'mainland', 731, ',730,731,739,', 3, '呼兰区', NULL, NULL, NULL, NULL, 'false'),
(740, 'mainland', 731, ',730,731,740,', 3, '依兰县', NULL, NULL, NULL, NULL, 'false'),
(741, 'mainland', 731, ',730,731,741,', 3, '方正县', NULL, NULL, NULL, NULL, 'false'),
(742, 'mainland', 731, ',730,731,742,', 3, '宾县', NULL, NULL, NULL, NULL, 'false'),
(743, 'mainland', 731, ',730,731,743,', 3, '巴彦县', NULL, NULL, NULL, NULL, 'false'),
(744, 'mainland', 731, ',730,731,744,', 3, '木兰县', NULL, NULL, NULL, NULL, 'false'),
(745, 'mainland', 731, ',730,731,745,', 3, '通河县', NULL, NULL, NULL, NULL, 'false'),
(746, 'mainland', 731, ',730,731,746,', 3, '延寿县', NULL, NULL, NULL, NULL, 'false'),
(747, 'mainland', 731, ',730,731,747,', 3, '阿城市', NULL, NULL, NULL, NULL, 'false'),
(748, 'mainland', 731, ',730,731,748,', 3, '双城市', NULL, NULL, NULL, NULL, 'false'),
(749, 'mainland', 731, ',730,731,749,', 3, '尚志市', NULL, NULL, NULL, NULL, 'false'),
(750, 'mainland', 731, ',730,731,750,', 3, '五常市', NULL, NULL, NULL, NULL, 'false'),
(751, 'mainland', 731, ',730,731,751,', 3, '阿城市', NULL, NULL, NULL, NULL, 'false'),
(752, 'mainland', 731, ',730,731,752,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(753, 'mainland', 730, ',730,753,', 2, '齐齐哈尔市', NULL, NULL, NULL, NULL, 'false'),
(754, 'mainland', 753, ',730,753,754,', 3, '龙沙区', NULL, NULL, NULL, NULL, 'false'),
(755, 'mainland', 753, ',730,753,755,', 3, '建华区', NULL, NULL, NULL, NULL, 'false'),
(756, 'mainland', 753, ',730,753,756,', 3, '铁锋区', NULL, NULL, NULL, NULL, 'false'),
(757, 'mainland', 753, ',730,753,757,', 3, '昂昂溪区', NULL, NULL, NULL, NULL, 'false'),
(758, 'mainland', 753, ',730,753,758,', 3, '富拉尔基区', NULL, NULL, NULL, NULL, 'false'),
(759, 'mainland', 753, ',730,753,759,', 3, '碾子山区', NULL, NULL, NULL, NULL, 'false'),
(760, 'mainland', 753, ',730,753,760,', 3, '梅里斯达斡尔族区', NULL, NULL, NULL, NULL, 'false'),
(761, 'mainland', 753, ',730,753,761,', 3, '龙江县', NULL, NULL, NULL, NULL, 'false'),
(762, 'mainland', 753, ',730,753,762,', 3, '依安县', NULL, NULL, NULL, NULL, 'false'),
(763, 'mainland', 753, ',730,753,763,', 3, '泰来县', NULL, NULL, NULL, NULL, 'false'),
(764, 'mainland', 753, ',730,753,764,', 3, '甘南县', NULL, NULL, NULL, NULL, 'false'),
(765, 'mainland', 753, ',730,753,765,', 3, '富裕县', NULL, NULL, NULL, NULL, 'false'),
(766, 'mainland', 753, ',730,753,766,', 3, '克山县', NULL, NULL, NULL, NULL, 'false'),
(767, 'mainland', 753, ',730,753,767,', 3, '克东县', NULL, NULL, NULL, NULL, 'false'),
(768, 'mainland', 753, ',730,753,768,', 3, '拜泉县', NULL, NULL, NULL, NULL, 'false'),
(769, 'mainland', 753, ',730,753,769,', 3, '讷河市', NULL, NULL, NULL, NULL, 'false'),
(770, 'mainland', 753, ',730,753,770,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(771, 'mainland', 730, ',730,771,', 2, '鸡西市', NULL, NULL, NULL, NULL, 'false'),
(772, 'mainland', 771, ',730,771,772,', 3, '鸡冠区', NULL, NULL, NULL, NULL, 'false'),
(773, 'mainland', 771, ',730,771,773,', 3, '恒山区', NULL, NULL, NULL, NULL, 'false'),
(774, 'mainland', 771, ',730,771,774,', 3, '滴道区', NULL, NULL, NULL, NULL, 'false'),
(775, 'mainland', 771, ',730,771,775,', 3, '梨树区', NULL, NULL, NULL, NULL, 'false'),
(776, 'mainland', 771, ',730,771,776,', 3, '城子河区', NULL, NULL, NULL, NULL, 'false'),
(777, 'mainland', 771, ',730,771,777,', 3, '麻山区', NULL, NULL, NULL, NULL, 'false'),
(778, 'mainland', 771, ',730,771,778,', 3, '鸡东县', NULL, NULL, NULL, NULL, 'false'),
(779, 'mainland', 771, ',730,771,779,', 3, '虎林市', NULL, NULL, NULL, NULL, 'false'),
(780, 'mainland', 771, ',730,771,780,', 3, '密山市', NULL, NULL, NULL, NULL, 'false'),
(781, 'mainland', 771, ',730,771,781,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(782, 'mainland', 730, ',730,782,', 2, '鹤岗市', NULL, NULL, NULL, NULL, 'false'),
(783, 'mainland', 782, ',730,782,783,', 3, '向阳区', NULL, NULL, NULL, NULL, 'false'),
(784, 'mainland', 782, ',730,782,784,', 3, '工农区', NULL, NULL, NULL, NULL, 'false'),
(785, 'mainland', 782, ',730,782,785,', 3, '南山区', NULL, NULL, NULL, NULL, 'false'),
(786, 'mainland', 782, ',730,782,786,', 3, '兴安区', NULL, NULL, NULL, NULL, 'false'),
(787, 'mainland', 782, ',730,782,787,', 3, '东山区', NULL, NULL, NULL, NULL, 'false'),
(788, 'mainland', 782, ',730,782,788,', 3, '兴山区', NULL, NULL, NULL, NULL, 'false'),
(789, 'mainland', 782, ',730,782,789,', 3, '萝北县', NULL, NULL, NULL, NULL, 'false'),
(790, 'mainland', 782, ',730,782,790,', 3, '绥滨县', NULL, NULL, NULL, NULL, 'false'),
(791, 'mainland', 782, ',730,782,791,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(792, 'mainland', 730, ',730,792,', 2, '双鸭山市', NULL, NULL, NULL, NULL, 'false'),
(793, 'mainland', 792, ',730,792,793,', 3, '尖山区', NULL, NULL, NULL, NULL, 'false'),
(794, 'mainland', 792, ',730,792,794,', 3, '岭东区', NULL, NULL, NULL, NULL, 'false'),
(795, 'mainland', 792, ',730,792,795,', 3, '四方台区', NULL, NULL, NULL, NULL, 'false'),
(796, 'mainland', 792, ',730,792,796,', 3, '宝山区', NULL, NULL, NULL, NULL, 'false'),
(797, 'mainland', 792, ',730,792,797,', 3, '集贤县', NULL, NULL, NULL, NULL, 'false'),
(798, 'mainland', 792, ',730,792,798,', 3, '友谊县', NULL, NULL, NULL, NULL, 'false'),
(799, 'mainland', 792, ',730,792,799,', 3, '宝清县', NULL, NULL, NULL, NULL, 'false'),
(800, 'mainland', 792, ',730,792,800,', 3, '饶河县', NULL, NULL, NULL, NULL, 'false'),
(801, 'mainland', 792, ',730,792,801,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(802, 'mainland', 730, ',730,802,', 2, '大庆市', NULL, NULL, NULL, NULL, 'false'),
(803, 'mainland', 802, ',730,802,803,', 3, '萨尔图区', NULL, NULL, NULL, NULL, 'false'),
(804, 'mainland', 802, ',730,802,804,', 3, '龙凤区', NULL, NULL, NULL, NULL, 'false'),
(805, 'mainland', 802, ',730,802,805,', 3, '让胡路区', NULL, NULL, NULL, NULL, 'false'),
(806, 'mainland', 802, ',730,802,806,', 3, '红岗区', NULL, NULL, NULL, NULL, 'false'),
(807, 'mainland', 802, ',730,802,807,', 3, '大同区', NULL, NULL, NULL, NULL, 'false'),
(808, 'mainland', 802, ',730,802,808,', 3, '肇州县', NULL, NULL, NULL, NULL, 'false'),
(809, 'mainland', 802, ',730,802,809,', 3, '肇源县', NULL, NULL, NULL, NULL, 'false'),
(810, 'mainland', 802, ',730,802,810,', 3, '林甸县', NULL, NULL, NULL, NULL, 'false'),
(811, 'mainland', 802, ',730,802,811,', 3, '杜尔伯特蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(812, 'mainland', 802, ',730,802,812,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(813, 'mainland', 730, ',730,813,', 2, '伊春市', NULL, NULL, NULL, NULL, 'false'),
(814, 'mainland', 813, ',730,813,814,', 3, '伊春区', NULL, NULL, NULL, NULL, 'false'),
(815, 'mainland', 813, ',730,813,815,', 3, '南岔区', NULL, NULL, NULL, NULL, 'false'),
(816, 'mainland', 813, ',730,813,816,', 3, '友好区', NULL, NULL, NULL, NULL, 'false'),
(817, 'mainland', 813, ',730,813,817,', 3, '西林区', NULL, NULL, NULL, NULL, 'false'),
(818, 'mainland', 813, ',730,813,818,', 3, '翠峦区', NULL, NULL, NULL, NULL, 'false'),
(819, 'mainland', 813, ',730,813,819,', 3, '新青区', NULL, NULL, NULL, NULL, 'false'),
(820, 'mainland', 813, ',730,813,820,', 3, '美溪区', NULL, NULL, NULL, NULL, 'false'),
(821, 'mainland', 813, ',730,813,821,', 3, '金山屯区', NULL, NULL, NULL, NULL, 'false'),
(822, 'mainland', 813, ',730,813,822,', 3, '五营区', NULL, NULL, NULL, NULL, 'false'),
(823, 'mainland', 813, ',730,813,823,', 3, '乌马河区', NULL, NULL, NULL, NULL, 'false'),
(824, 'mainland', 813, ',730,813,824,', 3, '汤旺河区', NULL, NULL, NULL, NULL, 'false'),
(825, 'mainland', 813, ',730,813,825,', 3, '带岭区', NULL, NULL, NULL, NULL, 'false'),
(826, 'mainland', 813, ',730,813,826,', 3, '乌伊岭区', NULL, NULL, NULL, NULL, 'false'),
(827, 'mainland', 813, ',730,813,827,', 3, '红星区', NULL, NULL, NULL, NULL, 'false'),
(828, 'mainland', 813, ',730,813,828,', 3, '上甘岭区', NULL, NULL, NULL, NULL, 'false'),
(829, 'mainland', 813, ',730,813,829,', 3, '嘉荫县', NULL, NULL, NULL, NULL, 'false'),
(830, 'mainland', 813, ',730,813,830,', 3, '铁力市', NULL, NULL, NULL, NULL, 'false'),
(831, 'mainland', 813, ',730,813,831,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(832, 'mainland', 730, ',730,832,', 2, '佳木斯市', NULL, NULL, NULL, NULL, 'false'),
(833, 'mainland', 832, ',730,832,833,', 3, '永红区', NULL, NULL, NULL, NULL, 'false'),
(834, 'mainland', 832, ',730,832,834,', 3, '向阳区', NULL, NULL, NULL, NULL, 'false'),
(835, 'mainland', 832, ',730,832,835,', 3, '前进区', NULL, NULL, NULL, NULL, 'false'),
(836, 'mainland', 832, ',730,832,836,', 3, '东风区', NULL, NULL, NULL, NULL, 'false'),
(837, 'mainland', 832, ',730,832,837,', 3, '郊区', NULL, NULL, NULL, NULL, 'false'),
(838, 'mainland', 832, ',730,832,838,', 3, '桦南县', NULL, NULL, NULL, NULL, 'false'),
(839, 'mainland', 832, ',730,832,839,', 3, '桦川县', NULL, NULL, NULL, NULL, 'false'),
(840, 'mainland', 832, ',730,832,840,', 3, '汤原县', NULL, NULL, NULL, NULL, 'false'),
(841, 'mainland', 832, ',730,832,841,', 3, '抚远县', NULL, NULL, NULL, NULL, 'false'),
(842, 'mainland', 832, ',730,832,842,', 3, '同江市', NULL, NULL, NULL, NULL, 'false'),
(843, 'mainland', 832, ',730,832,843,', 3, '富锦市', NULL, NULL, NULL, NULL, 'false'),
(844, 'mainland', 832, ',730,832,844,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(845, 'mainland', 730, ',730,845,', 2, '七台河市', NULL, NULL, NULL, NULL, 'false'),
(846, 'mainland', 845, ',730,845,846,', 3, '新兴区', NULL, NULL, NULL, NULL, 'false'),
(847, 'mainland', 845, ',730,845,847,', 3, '桃山区', NULL, NULL, NULL, NULL, 'false'),
(848, 'mainland', 845, ',730,845,848,', 3, '茄子河区', NULL, NULL, NULL, NULL, 'false'),
(849, 'mainland', 845, ',730,845,849,', 3, '勃利县', NULL, NULL, NULL, NULL, 'false'),
(850, 'mainland', 845, ',730,845,850,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(851, 'mainland', 730, ',730,851,', 2, '牡丹江市', NULL, NULL, NULL, NULL, 'false'),
(852, 'mainland', 851, ',730,851,852,', 3, '东安区', NULL, NULL, NULL, NULL, 'false'),
(853, 'mainland', 851, ',730,851,853,', 3, '阳明区', NULL, NULL, NULL, NULL, 'false'),
(854, 'mainland', 851, ',730,851,854,', 3, '爱民区', NULL, NULL, NULL, NULL, 'false'),
(855, 'mainland', 851, ',730,851,855,', 3, '西安区', NULL, NULL, NULL, NULL, 'false'),
(856, 'mainland', 851, ',730,851,856,', 3, '东宁县', NULL, NULL, NULL, NULL, 'false'),
(857, 'mainland', 851, ',730,851,857,', 3, '林口县', NULL, NULL, NULL, NULL, 'false'),
(858, 'mainland', 851, ',730,851,858,', 3, '绥芬河市', NULL, NULL, NULL, NULL, 'false'),
(859, 'mainland', 851, ',730,851,859,', 3, '海林市', NULL, NULL, NULL, NULL, 'false'),
(860, 'mainland', 851, ',730,851,860,', 3, '宁安市', NULL, NULL, NULL, NULL, 'false'),
(861, 'mainland', 851, ',730,851,861,', 3, '穆棱市', NULL, NULL, NULL, NULL, 'false'),
(862, 'mainland', 851, ',730,851,862,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(863, 'mainland', 730, ',730,863,', 2, '黑河市', NULL, NULL, NULL, NULL, 'false'),
(864, 'mainland', 863, ',730,863,864,', 3, '爱辉区', NULL, NULL, NULL, NULL, 'false'),
(865, 'mainland', 863, ',730,863,865,', 3, '嫩江县', NULL, NULL, NULL, NULL, 'false'),
(866, 'mainland', 863, ',730,863,866,', 3, '逊克县', NULL, NULL, NULL, NULL, 'false'),
(867, 'mainland', 863, ',730,863,867,', 3, '孙吴县', NULL, NULL, NULL, NULL, 'false'),
(868, 'mainland', 863, ',730,863,868,', 3, '北安市', NULL, NULL, NULL, NULL, 'false'),
(869, 'mainland', 863, ',730,863,869,', 3, '五大连池市', NULL, NULL, NULL, NULL, 'false'),
(870, 'mainland', 863, ',730,863,870,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(871, 'mainland', 730, ',730,871,', 2, '绥化市', NULL, NULL, NULL, NULL, 'false'),
(872, 'mainland', 871, ',730,871,872,', 3, '北林区', NULL, NULL, NULL, NULL, 'false'),
(873, 'mainland', 871, ',730,871,873,', 3, '望奎县', NULL, NULL, NULL, NULL, 'false'),
(874, 'mainland', 871, ',730,871,874,', 3, '兰西县', NULL, NULL, NULL, NULL, 'false'),
(875, 'mainland', 871, ',730,871,875,', 3, '青冈县', NULL, NULL, NULL, NULL, 'false'),
(876, 'mainland', 871, ',730,871,876,', 3, '庆安县', NULL, NULL, NULL, NULL, 'false'),
(877, 'mainland', 871, ',730,871,877,', 3, '明水县', NULL, NULL, NULL, NULL, 'false'),
(878, 'mainland', 871, ',730,871,878,', 3, '绥棱县', NULL, NULL, NULL, NULL, 'false'),
(879, 'mainland', 871, ',730,871,879,', 3, '安达市', NULL, NULL, NULL, NULL, 'false'),
(880, 'mainland', 871, ',730,871,880,', 3, '肇东市', NULL, NULL, NULL, NULL, 'false'),
(881, 'mainland', 871, ',730,871,881,', 3, '海伦市', NULL, NULL, NULL, NULL, 'false'),
(882, 'mainland', 871, ',730,871,882,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(883, 'mainland', 730, ',730,883,', 2, '大兴安岭地区', NULL, NULL, NULL, NULL, 'false'),
(884, 'mainland', 883, ',730,883,884,', 3, '呼玛县', NULL, NULL, NULL, NULL, 'false'),
(885, 'mainland', 883, ',730,883,885,', 3, '塔河县', NULL, NULL, NULL, NULL, 'false'),
(886, 'mainland', 883, ',730,883,886,', 3, '漠河县', NULL, NULL, NULL, NULL, 'false'),
(887, 'mainland', 883, ',730,883,887,', 3, '加格达奇区', NULL, NULL, NULL, NULL, 'false'),
(888, 'mainland', 883, ',730,883,888,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(889, 'mainland', NULL, ',889,', 1, '上海', NULL, NULL, NULL, NULL, 'false'),
(890, 'mainland', 889, ',889,890,', 2, '上海市', NULL, NULL, NULL, NULL, 'false'),
(891, 'mainland', 890, ',889,890,891,', 3, '黄浦区', NULL, NULL, NULL, NULL, 'false'),
(892, 'mainland', 890, ',889,890,892,', 3, '卢湾区', NULL, NULL, NULL, NULL, 'false'),
(893, 'mainland', 890, ',889,890,893,', 3, '徐汇区', NULL, NULL, NULL, NULL, 'false'),
(894, 'mainland', 890, ',889,890,894,', 3, '长宁区', NULL, NULL, NULL, NULL, 'false'),
(895, 'mainland', 890, ',889,890,895,', 3, '静安区', NULL, NULL, NULL, NULL, 'false'),
(896, 'mainland', 890, ',889,890,896,', 3, '普陀区', NULL, NULL, NULL, NULL, 'false'),
(897, 'mainland', 890, ',889,890,897,', 3, '闸北区', NULL, NULL, NULL, NULL, 'false'),
(898, 'mainland', 890, ',889,890,898,', 3, '虹口区', NULL, NULL, NULL, NULL, 'false'),
(899, 'mainland', 890, ',889,890,899,', 3, '杨浦区', NULL, NULL, NULL, NULL, 'false'),
(900, 'mainland', 890, ',889,890,900,', 3, '闵行区', NULL, NULL, NULL, NULL, 'false'),
(901, 'mainland', 890, ',889,890,901,', 3, '宝山区', NULL, NULL, NULL, NULL, 'false'),
(902, 'mainland', 890, ',889,890,902,', 3, '嘉定区', NULL, NULL, NULL, NULL, 'false'),
(903, 'mainland', 890, ',889,890,903,', 3, '浦东新区', NULL, NULL, NULL, NULL, 'false'),
(904, 'mainland', 890, ',889,890,904,', 3, '金山区', NULL, NULL, NULL, NULL, 'false'),
(905, 'mainland', 890, ',889,890,905,', 3, '松江区', NULL, NULL, NULL, NULL, 'false'),
(906, 'mainland', 890, ',889,890,906,', 3, '青浦区', NULL, NULL, NULL, NULL, 'false'),
(907, 'mainland', 890, ',889,890,907,', 3, '南汇区', NULL, NULL, NULL, NULL, 'false'),
(908, 'mainland', 890, ',889,890,908,', 3, '奉贤区', NULL, NULL, NULL, NULL, 'false'),
(909, 'mainland', 890, ',889,890,909,', 3, '川沙区', NULL, NULL, NULL, NULL, 'false'),
(910, 'mainland', 890, ',889,890,910,', 3, '崇明县', NULL, NULL, NULL, NULL, 'false'),
(911, 'mainland', 890, ',889,890,911,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(912, 'mainland', NULL, ',912,', 1, '江苏省', NULL, NULL, NULL, NULL, 'false'),
(913, 'mainland', 912, ',912,913,', 2, '南京市', NULL, NULL, NULL, NULL, 'false'),
(914, 'mainland', 913, ',912,913,914,', 3, '玄武区', NULL, NULL, NULL, NULL, 'false'),
(915, 'mainland', 913, ',912,913,915,', 3, '白下区', NULL, NULL, NULL, NULL, 'false'),
(916, 'mainland', 913, ',912,913,916,', 3, '秦淮区', NULL, NULL, NULL, NULL, 'false'),
(917, 'mainland', 913, ',912,913,917,', 3, '建邺区', NULL, NULL, NULL, NULL, 'false'),
(918, 'mainland', 913, ',912,913,918,', 3, '鼓楼区', NULL, NULL, NULL, NULL, 'false'),
(919, 'mainland', 913, ',912,913,919,', 3, '下关区', NULL, NULL, NULL, NULL, 'false'),
(920, 'mainland', 913, ',912,913,920,', 3, '浦口区', NULL, NULL, NULL, NULL, 'false'),
(921, 'mainland', 913, ',912,913,921,', 3, '栖霞区', NULL, NULL, NULL, NULL, 'false'),
(922, 'mainland', 913, ',912,913,922,', 3, '雨花台区', NULL, NULL, NULL, NULL, 'false'),
(923, 'mainland', 913, ',912,913,923,', 3, '江宁区', NULL, NULL, NULL, NULL, 'false'),
(924, 'mainland', 913, ',912,913,924,', 3, '六合区', NULL, NULL, NULL, NULL, 'false'),
(925, 'mainland', 913, ',912,913,925,', 3, '溧水县', NULL, NULL, NULL, NULL, 'false'),
(926, 'mainland', 913, ',912,913,926,', 3, '高淳县', NULL, NULL, NULL, NULL, 'false'),
(927, 'mainland', 913, ',912,913,927,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(928, 'mainland', 912, ',912,928,', 2, '无锡市', NULL, NULL, NULL, NULL, 'false'),
(929, 'mainland', 928, ',912,928,929,', 3, '崇安区', NULL, NULL, NULL, NULL, 'false'),
(930, 'mainland', 928, ',912,928,930,', 3, '南长区', NULL, NULL, NULL, NULL, 'false'),
(931, 'mainland', 928, ',912,928,931,', 3, '北塘区', NULL, NULL, NULL, NULL, 'false'),
(932, 'mainland', 928, ',912,928,932,', 3, '锡山区', NULL, NULL, NULL, NULL, 'false'),
(933, 'mainland', 928, ',912,928,933,', 3, '惠山区', NULL, NULL, NULL, NULL, 'false'),
(934, 'mainland', 928, ',912,928,934,', 3, '滨湖区', NULL, NULL, NULL, NULL, 'false'),
(935, 'mainland', 928, ',912,928,935,', 3, '江阴市', NULL, NULL, NULL, NULL, 'false'),
(936, 'mainland', 928, ',912,928,936,', 3, '宜兴市', NULL, NULL, NULL, NULL, 'false'),
(937, 'mainland', 928, ',912,928,937,', 3, '新区', NULL, NULL, NULL, NULL, 'false'),
(938, 'mainland', 928, ',912,928,938,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(939, 'mainland', 912, ',912,939,', 2, '徐州市', NULL, NULL, NULL, NULL, 'false'),
(940, 'mainland', 939, ',912,939,940,', 3, '鼓楼区', NULL, NULL, NULL, NULL, 'false'),
(941, 'mainland', 939, ',912,939,941,', 3, '云龙区', NULL, NULL, NULL, NULL, 'false'),
(942, 'mainland', 939, ',912,939,942,', 3, '九里区', NULL, NULL, NULL, NULL, 'false'),
(943, 'mainland', 939, ',912,939,943,', 3, '贾汪区', NULL, NULL, NULL, NULL, 'false'),
(944, 'mainland', 939, ',912,939,944,', 3, '泉山区', NULL, NULL, NULL, NULL, 'false'),
(945, 'mainland', 939, ',912,939,945,', 3, '丰县', NULL, NULL, NULL, NULL, 'false'),
(946, 'mainland', 939, ',912,939,946,', 3, '沛县', NULL, NULL, NULL, NULL, 'false'),
(947, 'mainland', 939, ',912,939,947,', 3, '铜山县', NULL, NULL, NULL, NULL, 'false'),
(948, 'mainland', 939, ',912,939,948,', 3, '睢宁县', NULL, NULL, NULL, NULL, 'false'),
(949, 'mainland', 939, ',912,939,949,', 3, '新沂市', NULL, NULL, NULL, NULL, 'false'),
(950, 'mainland', 939, ',912,939,950,', 3, '邳州市', NULL, NULL, NULL, NULL, 'false'),
(951, 'mainland', 939, ',912,939,951,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(952, 'mainland', 912, ',912,952,', 2, '常州市', NULL, NULL, NULL, NULL, 'false'),
(953, 'mainland', 952, ',912,952,953,', 3, '天宁区', NULL, NULL, NULL, NULL, 'false'),
(954, 'mainland', 952, ',912,952,954,', 3, '钟楼区', NULL, NULL, NULL, NULL, 'false'),
(955, 'mainland', 952, ',912,952,955,', 3, '戚墅堰区', NULL, NULL, NULL, NULL, 'false'),
(956, 'mainland', 952, ',912,952,956,', 3, '新北区', NULL, NULL, NULL, NULL, 'false'),
(957, 'mainland', 952, ',912,952,957,', 3, '武进区', NULL, NULL, NULL, NULL, 'false'),
(958, 'mainland', 952, ',912,952,958,', 3, '溧阳市', NULL, NULL, NULL, NULL, 'false'),
(959, 'mainland', 952, ',912,952,959,', 3, '金坛市', NULL, NULL, NULL, NULL, 'false'),
(960, 'mainland', 952, ',912,952,960,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(961, 'mainland', 912, ',912,961,', 2, '苏州市', NULL, NULL, NULL, NULL, 'false'),
(962, 'mainland', 961, ',912,961,962,', 3, '沧浪区', NULL, NULL, NULL, NULL, 'false'),
(963, 'mainland', 961, ',912,961,963,', 3, '平江区', NULL, NULL, NULL, NULL, 'false'),
(964, 'mainland', 961, ',912,961,964,', 3, '金阊区', NULL, NULL, NULL, NULL, 'false'),
(965, 'mainland', 961, ',912,961,965,', 3, '虎丘区', NULL, NULL, NULL, NULL, 'false'),
(966, 'mainland', 961, ',912,961,966,', 3, '吴中区', NULL, NULL, NULL, NULL, 'false'),
(967, 'mainland', 961, ',912,961,967,', 3, '相城区', NULL, NULL, NULL, NULL, 'false'),
(968, 'mainland', 961, ',912,961,968,', 3, '常熟市', NULL, NULL, NULL, NULL, 'false'),
(969, 'mainland', 961, ',912,961,969,', 3, '张家港市', NULL, NULL, NULL, NULL, 'false'),
(970, 'mainland', 961, ',912,961,970,', 3, '昆山市', NULL, NULL, NULL, NULL, 'false'),
(971, 'mainland', 961, ',912,961,971,', 3, '吴江市', NULL, NULL, NULL, NULL, 'false'),
(972, 'mainland', 961, ',912,961,972,', 3, '太仓市', NULL, NULL, NULL, NULL, 'false'),
(973, 'mainland', 961, ',912,961,973,', 3, '新区', NULL, NULL, NULL, NULL, 'false'),
(974, 'mainland', 961, ',912,961,974,', 3, '园区', NULL, NULL, NULL, NULL, 'false'),
(975, 'mainland', 961, ',912,961,975,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(976, 'mainland', 912, ',912,976,', 2, '南通市', NULL, NULL, NULL, NULL, 'false'),
(977, 'mainland', 976, ',912,976,977,', 3, '崇川区', NULL, NULL, NULL, NULL, 'false'),
(978, 'mainland', 976, ',912,976,978,', 3, '港闸区', NULL, NULL, NULL, NULL, 'false'),
(979, 'mainland', 976, ',912,976,979,', 3, '通州区', NULL, NULL, NULL, NULL, 'false'),
(980, 'mainland', 976, ',912,976,980,', 3, '海安县', NULL, NULL, NULL, NULL, 'false'),
(981, 'mainland', 976, ',912,976,981,', 3, '如东县', NULL, NULL, NULL, NULL, 'false'),
(982, 'mainland', 976, ',912,976,982,', 3, '启东市', NULL, NULL, NULL, NULL, 'false'),
(983, 'mainland', 976, ',912,976,983,', 3, '如皋市', NULL, NULL, NULL, NULL, 'false'),
(984, 'mainland', 976, ',912,976,984,', 3, '通州市', NULL, NULL, NULL, NULL, 'false'),
(985, 'mainland', 976, ',912,976,985,', 3, '海门市', NULL, NULL, NULL, NULL, 'false'),
(986, 'mainland', 976, ',912,976,986,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(987, 'mainland', 976, ',912,976,987,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(988, 'mainland', 912, ',912,988,', 2, '连云港市', NULL, NULL, NULL, NULL, 'false'),
(989, 'mainland', 988, ',912,988,989,', 3, '连云区', NULL, NULL, NULL, NULL, 'false'),
(990, 'mainland', 988, ',912,988,990,', 3, '新浦区', NULL, NULL, NULL, NULL, 'false'),
(991, 'mainland', 988, ',912,988,991,', 3, '海州区', NULL, NULL, NULL, NULL, 'false'),
(992, 'mainland', 988, ',912,988,992,', 3, '赣榆县', NULL, NULL, NULL, NULL, 'false'),
(993, 'mainland', 988, ',912,988,993,', 3, '东海县', NULL, NULL, NULL, NULL, 'false'),
(994, 'mainland', 988, ',912,988,994,', 3, '灌云县', NULL, NULL, NULL, NULL, 'false'),
(995, 'mainland', 988, ',912,988,995,', 3, '灌南县', NULL, NULL, NULL, NULL, 'false'),
(996, 'mainland', 988, ',912,988,996,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(997, 'mainland', 912, ',912,997,', 2, '淮安市', NULL, NULL, NULL, NULL, 'false'),
(998, 'mainland', 997, ',912,997,998,', 3, '清河区', NULL, NULL, NULL, NULL, 'false'),
(999, 'mainland', 997, ',912,997,999,', 3, '楚州区', NULL, NULL, NULL, NULL, 'false'),
(1000, 'mainland', 997, ',912,997,1000,', 3, '淮阴区', NULL, NULL, NULL, NULL, 'false'),
(1001, 'mainland', 997, ',912,997,1001,', 3, '清浦区', NULL, NULL, NULL, NULL, 'false'),
(1002, 'mainland', 997, ',912,997,1002,', 3, '涟水县', NULL, NULL, NULL, NULL, 'false'),
(1003, 'mainland', 997, ',912,997,1003,', 3, '洪泽县', NULL, NULL, NULL, NULL, 'false'),
(1004, 'mainland', 997, ',912,997,1004,', 3, '盱眙县', NULL, NULL, NULL, NULL, 'false'),
(1005, 'mainland', 997, ',912,997,1005,', 3, '金湖县', NULL, NULL, NULL, NULL, 'false'),
(1006, 'mainland', 997, ',912,997,1006,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1007, 'mainland', 912, ',912,1007,', 2, '盐城市', NULL, NULL, NULL, NULL, 'false'),
(1008, 'mainland', 1007, ',912,1007,1008,', 3, '亭湖区', NULL, NULL, NULL, NULL, 'false'),
(1009, 'mainland', 1007, ',912,1007,1009,', 3, '盐都区', NULL, NULL, NULL, NULL, 'false'),
(1010, 'mainland', 1007, ',912,1007,1010,', 3, '响水县', NULL, NULL, NULL, NULL, 'false'),
(1011, 'mainland', 1007, ',912,1007,1011,', 3, '滨海县', NULL, NULL, NULL, NULL, 'false'),
(1012, 'mainland', 1007, ',912,1007,1012,', 3, '阜宁县', NULL, NULL, NULL, NULL, 'false'),
(1013, 'mainland', 1007, ',912,1007,1013,', 3, '射阳县', NULL, NULL, NULL, NULL, 'false'),
(1014, 'mainland', 1007, ',912,1007,1014,', 3, '建湖县', NULL, NULL, NULL, NULL, 'false'),
(1015, 'mainland', 1007, ',912,1007,1015,', 3, '东台市', NULL, NULL, NULL, NULL, 'false'),
(1016, 'mainland', 1007, ',912,1007,1016,', 3, '大丰市', NULL, NULL, NULL, NULL, 'false'),
(1017, 'mainland', 1007, ',912,1007,1017,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1018, 'mainland', 912, ',912,1018,', 2, '扬州市', NULL, NULL, NULL, NULL, 'false'),
(1019, 'mainland', 1018, ',912,1018,1019,', 3, '广陵区', NULL, NULL, NULL, NULL, 'false'),
(1020, 'mainland', 1018, ',912,1018,1020,', 3, '邗江区', NULL, NULL, NULL, NULL, 'false'),
(1021, 'mainland', 1018, ',912,1018,1021,', 3, '维扬区', NULL, NULL, NULL, NULL, 'false'),
(1022, 'mainland', 1018, ',912,1018,1022,', 3, '宝应县', NULL, NULL, NULL, NULL, 'false'),
(1023, 'mainland', 1018, ',912,1018,1023,', 3, '仪征市', NULL, NULL, NULL, NULL, 'false'),
(1024, 'mainland', 1018, ',912,1018,1024,', 3, '高邮市', NULL, NULL, NULL, NULL, 'false'),
(1025, 'mainland', 1018, ',912,1018,1025,', 3, '江都市', NULL, NULL, NULL, NULL, 'false'),
(1026, 'mainland', 1018, ',912,1018,1026,', 3, '经济开发区', NULL, NULL, NULL, NULL, 'false'),
(1027, 'mainland', 1018, ',912,1018,1027,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1028, 'mainland', 912, ',912,1028,', 2, '镇江市', NULL, NULL, NULL, NULL, 'false'),
(1029, 'mainland', 1028, ',912,1028,1029,', 3, '京口区', NULL, NULL, NULL, NULL, 'false'),
(1030, 'mainland', 1028, ',912,1028,1030,', 3, '润州区', NULL, NULL, NULL, NULL, 'false'),
(1031, 'mainland', 1028, ',912,1028,1031,', 3, '丹徒区', NULL, NULL, NULL, NULL, 'false'),
(1032, 'mainland', 1028, ',912,1028,1032,', 3, '丹阳市', NULL, NULL, NULL, NULL, 'false'),
(1033, 'mainland', 1028, ',912,1028,1033,', 3, '扬中市', NULL, NULL, NULL, NULL, 'false'),
(1034, 'mainland', 1028, ',912,1028,1034,', 3, '句容市', NULL, NULL, NULL, NULL, 'false'),
(1035, 'mainland', 1028, ',912,1028,1035,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1036, 'mainland', 912, ',912,1036,', 2, '泰州市', NULL, NULL, NULL, NULL, 'false'),
(1037, 'mainland', 1036, ',912,1036,1037,', 3, '海陵区', NULL, NULL, NULL, NULL, 'false'),
(1038, 'mainland', 1036, ',912,1036,1038,', 3, '高港区', NULL, NULL, NULL, NULL, 'false'),
(1039, 'mainland', 1036, ',912,1036,1039,', 3, '兴化市', NULL, NULL, NULL, NULL, 'false'),
(1040, 'mainland', 1036, ',912,1036,1040,', 3, '靖江市', NULL, NULL, NULL, NULL, 'false'),
(1041, 'mainland', 1036, ',912,1036,1041,', 3, '泰兴市', NULL, NULL, NULL, NULL, 'false'),
(1042, 'mainland', 1036, ',912,1036,1042,', 3, '姜堰市', NULL, NULL, NULL, NULL, 'false'),
(1043, 'mainland', 1036, ',912,1036,1043,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1044, 'mainland', 912, ',912,1044,', 2, '宿迁市', NULL, NULL, NULL, NULL, 'false'),
(1045, 'mainland', 1044, ',912,1044,1045,', 3, '宿城区', NULL, NULL, NULL, NULL, 'false'),
(1046, 'mainland', 1044, ',912,1044,1046,', 3, '宿豫区', NULL, NULL, NULL, NULL, 'false'),
(1047, 'mainland', 1044, ',912,1044,1047,', 3, '沭阳县', NULL, NULL, NULL, NULL, 'false'),
(1048, 'mainland', 1044, ',912,1044,1048,', 3, '泗阳县', NULL, NULL, NULL, NULL, 'false'),
(1049, 'mainland', 1044, ',912,1044,1049,', 3, '泗洪县', NULL, NULL, NULL, NULL, 'false'),
(1050, 'mainland', 1044, ',912,1044,1050,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1051, 'mainland', NULL, ',1051,', 1, '浙江省', NULL, NULL, NULL, NULL, 'false'),
(1052, 'mainland', 1051, ',1051,1052,', 2, '杭州市', NULL, NULL, NULL, NULL, 'false'),
(1053, 'mainland', 1052, ',1051,1052,1053,', 3, '上城区', NULL, NULL, NULL, NULL, 'false'),
(1054, 'mainland', 1052, ',1051,1052,1054,', 3, '下城区', NULL, NULL, NULL, NULL, 'false'),
(1055, 'mainland', 1052, ',1051,1052,1055,', 3, '江干区', NULL, NULL, NULL, NULL, 'false'),
(1056, 'mainland', 1052, ',1051,1052,1056,', 3, '拱墅区', NULL, NULL, NULL, NULL, 'false'),
(1057, 'mainland', 1052, ',1051,1052,1057,', 3, '西湖区', NULL, NULL, NULL, NULL, 'false'),
(1058, 'mainland', 1052, ',1051,1052,1058,', 3, '滨江区', NULL, NULL, NULL, NULL, 'false'),
(1059, 'mainland', 1052, ',1051,1052,1059,', 3, '萧山区', NULL, NULL, NULL, NULL, 'false'),
(1060, 'mainland', 1052, ',1051,1052,1060,', 3, '余杭区', NULL, NULL, NULL, NULL, 'false'),
(1061, 'mainland', 1052, ',1051,1052,1061,', 3, '桐庐县', NULL, NULL, NULL, NULL, 'false'),
(1062, 'mainland', 1052, ',1051,1052,1062,', 3, '淳安县', NULL, NULL, NULL, NULL, 'false'),
(1063, 'mainland', 1052, ',1051,1052,1063,', 3, '建德市', NULL, NULL, NULL, NULL, 'false'),
(1064, 'mainland', 1052, ',1051,1052,1064,', 3, '富阳市', NULL, NULL, NULL, NULL, 'false'),
(1065, 'mainland', 1052, ',1051,1052,1065,', 3, '临安市', NULL, NULL, NULL, NULL, 'false'),
(1066, 'mainland', 1052, ',1051,1052,1066,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1067, 'mainland', 1051, ',1051,1067,', 2, '宁波市', NULL, NULL, NULL, NULL, 'false'),
(1068, 'mainland', 1067, ',1051,1067,1068,', 3, '海曙区', NULL, NULL, NULL, NULL, 'false'),
(1069, 'mainland', 1067, ',1051,1067,1069,', 3, '江东区', NULL, NULL, NULL, NULL, 'false'),
(1070, 'mainland', 1067, ',1051,1067,1070,', 3, '江北区', NULL, NULL, NULL, NULL, 'false'),
(1071, 'mainland', 1067, ',1051,1067,1071,', 3, '北仑区', NULL, NULL, NULL, NULL, 'false'),
(1072, 'mainland', 1067, ',1051,1067,1072,', 3, '镇海区', NULL, NULL, NULL, NULL, 'false'),
(1073, 'mainland', 1067, ',1051,1067,1073,', 3, '鄞州区', NULL, NULL, NULL, NULL, 'false'),
(1074, 'mainland', 1067, ',1051,1067,1074,', 3, '象山县', NULL, NULL, NULL, NULL, 'false'),
(1075, 'mainland', 1067, ',1051,1067,1075,', 3, '宁海县', NULL, NULL, NULL, NULL, 'false'),
(1076, 'mainland', 1067, ',1051,1067,1076,', 3, '余姚市', NULL, NULL, NULL, NULL, 'false'),
(1077, 'mainland', 1067, ',1051,1067,1077,', 3, '慈溪市', NULL, NULL, NULL, NULL, 'false'),
(1078, 'mainland', 1067, ',1051,1067,1078,', 3, '奉化市', NULL, NULL, NULL, NULL, 'false'),
(1079, 'mainland', 1067, ',1051,1067,1079,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1080, 'mainland', 1051, ',1051,1080,', 2, '温州市', NULL, NULL, NULL, NULL, 'false'),
(1081, 'mainland', 1080, ',1051,1080,1081,', 3, '鹿城区', NULL, NULL, NULL, NULL, 'false'),
(1082, 'mainland', 1080, ',1051,1080,1082,', 3, '龙湾区', NULL, NULL, NULL, NULL, 'false'),
(1083, 'mainland', 1080, ',1051,1080,1083,', 3, '瓯海区', NULL, NULL, NULL, NULL, 'false'),
(1084, 'mainland', 1080, ',1051,1080,1084,', 3, '洞头县', NULL, NULL, NULL, NULL, 'false'),
(1085, 'mainland', 1080, ',1051,1080,1085,', 3, '永嘉县', NULL, NULL, NULL, NULL, 'false'),
(1086, 'mainland', 1080, ',1051,1080,1086,', 3, '平阳县', NULL, NULL, NULL, NULL, 'false'),
(1087, 'mainland', 1080, ',1051,1080,1087,', 3, '苍南县', NULL, NULL, NULL, NULL, 'false'),
(1088, 'mainland', 1080, ',1051,1080,1088,', 3, '文成县', NULL, NULL, NULL, NULL, 'false'),
(1089, 'mainland', 1080, ',1051,1080,1089,', 3, '泰顺县', NULL, NULL, NULL, NULL, 'false'),
(1090, 'mainland', 1080, ',1051,1080,1090,', 3, '瑞安市', NULL, NULL, NULL, NULL, 'false'),
(1091, 'mainland', 1080, ',1051,1080,1091,', 3, '乐清市', NULL, NULL, NULL, NULL, 'false'),
(1092, 'mainland', 1080, ',1051,1080,1092,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1093, 'mainland', 1051, ',1051,1093,', 2, '嘉兴市', NULL, NULL, NULL, NULL, 'false'),
(1094, 'mainland', 1093, ',1051,1093,1094,', 3, '南湖区', NULL, NULL, NULL, NULL, 'false'),
(1095, 'mainland', 1093, ',1051,1093,1095,', 3, '秀洲区', NULL, NULL, NULL, NULL, 'false'),
(1096, 'mainland', 1093, ',1051,1093,1096,', 3, '嘉善县', NULL, NULL, NULL, NULL, 'false'),
(1097, 'mainland', 1093, ',1051,1093,1097,', 3, '海盐县', NULL, NULL, NULL, NULL, 'false'),
(1098, 'mainland', 1093, ',1051,1093,1098,', 3, '海宁市', NULL, NULL, NULL, NULL, 'false'),
(1099, 'mainland', 1093, ',1051,1093,1099,', 3, '平湖市', NULL, NULL, NULL, NULL, 'false'),
(1100, 'mainland', 1093, ',1051,1093,1100,', 3, '桐乡市', NULL, NULL, NULL, NULL, 'false'),
(1101, 'mainland', 1093, ',1051,1093,1101,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1102, 'mainland', 1051, ',1051,1102,', 2, '湖州市', NULL, NULL, NULL, NULL, 'false'),
(1103, 'mainland', 1102, ',1051,1102,1103,', 3, '吴兴区', NULL, NULL, NULL, NULL, 'false'),
(1104, 'mainland', 1102, ',1051,1102,1104,', 3, '南浔区', NULL, NULL, NULL, NULL, 'false'),
(1105, 'mainland', 1102, ',1051,1102,1105,', 3, '德清县', NULL, NULL, NULL, NULL, 'false'),
(1106, 'mainland', 1102, ',1051,1102,1106,', 3, '长兴县', NULL, NULL, NULL, NULL, 'false'),
(1107, 'mainland', 1102, ',1051,1102,1107,', 3, '安吉县', NULL, NULL, NULL, NULL, 'false'),
(1108, 'mainland', 1102, ',1051,1102,1108,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1109, 'mainland', 1051, ',1051,1109,', 2, '绍兴市', NULL, NULL, NULL, NULL, 'false'),
(1110, 'mainland', 1109, ',1051,1109,1110,', 3, '越城区', NULL, NULL, NULL, NULL, 'false'),
(1111, 'mainland', 1109, ',1051,1109,1111,', 3, '绍兴县', NULL, NULL, NULL, NULL, 'false'),
(1112, 'mainland', 1109, ',1051,1109,1112,', 3, '新昌县', NULL, NULL, NULL, NULL, 'false'),
(1113, 'mainland', 1109, ',1051,1109,1113,', 3, '诸暨市', NULL, NULL, NULL, NULL, 'false'),
(1114, 'mainland', 1109, ',1051,1109,1114,', 3, '上虞市', NULL, NULL, NULL, NULL, 'false'),
(1115, 'mainland', 1109, ',1051,1109,1115,', 3, '嵊州市', NULL, NULL, NULL, NULL, 'false'),
(1116, 'mainland', 1109, ',1051,1109,1116,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1117, 'mainland', 1051, ',1051,1117,', 2, '金华市', NULL, NULL, NULL, NULL, 'false'),
(1118, 'mainland', 1117, ',1051,1117,1118,', 3, '婺城区', NULL, NULL, NULL, NULL, 'false'),
(1119, 'mainland', 1117, ',1051,1117,1119,', 3, '金东区', NULL, NULL, NULL, NULL, 'false'),
(1120, 'mainland', 1117, ',1051,1117,1120,', 3, '武义县', NULL, NULL, NULL, NULL, 'false'),
(1121, 'mainland', 1117, ',1051,1117,1121,', 3, '浦江县', NULL, NULL, NULL, NULL, 'false'),
(1122, 'mainland', 1117, ',1051,1117,1122,', 3, '磐安县', NULL, NULL, NULL, NULL, 'false'),
(1123, 'mainland', 1117, ',1051,1117,1123,', 3, '兰溪市', NULL, NULL, NULL, NULL, 'false'),
(1124, 'mainland', 1117, ',1051,1117,1124,', 3, '义乌市', NULL, NULL, NULL, NULL, 'false'),
(1125, 'mainland', 1117, ',1051,1117,1125,', 3, '东阳市', NULL, NULL, NULL, NULL, 'false'),
(1126, 'mainland', 1117, ',1051,1117,1126,', 3, '永康市', NULL, NULL, NULL, NULL, 'false'),
(1127, 'mainland', 1117, ',1051,1117,1127,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1128, 'mainland', 1051, ',1051,1128,', 2, '衢州市', NULL, NULL, NULL, NULL, 'false');
INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(1129, 'mainland', 1128, ',1051,1128,1129,', 3, '柯城区', NULL, NULL, NULL, NULL, 'false'),
(1130, 'mainland', 1128, ',1051,1128,1130,', 3, '衢江区', NULL, NULL, NULL, NULL, 'false'),
(1131, 'mainland', 1128, ',1051,1128,1131,', 3, '常山县', NULL, NULL, NULL, NULL, 'false'),
(1132, 'mainland', 1128, ',1051,1128,1132,', 3, '开化县', NULL, NULL, NULL, NULL, 'false'),
(1133, 'mainland', 1128, ',1051,1128,1133,', 3, '龙游县', NULL, NULL, NULL, NULL, 'false'),
(1134, 'mainland', 1128, ',1051,1128,1134,', 3, '江山市', NULL, NULL, NULL, NULL, 'false'),
(1135, 'mainland', 1128, ',1051,1128,1135,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1136, 'mainland', 1051, ',1051,1136,', 2, '舟山市', NULL, NULL, NULL, NULL, 'false'),
(1137, 'mainland', 1136, ',1051,1136,1137,', 3, '定海区', NULL, NULL, NULL, NULL, 'false'),
(1138, 'mainland', 1136, ',1051,1136,1138,', 3, '普陀区', NULL, NULL, NULL, NULL, 'false'),
(1139, 'mainland', 1136, ',1051,1136,1139,', 3, '岱山县', NULL, NULL, NULL, NULL, 'false'),
(1140, 'mainland', 1136, ',1051,1136,1140,', 3, '嵊泗县', NULL, NULL, NULL, NULL, 'false'),
(1141, 'mainland', 1136, ',1051,1136,1141,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1142, 'mainland', 1051, ',1051,1142,', 2, '台州市', NULL, NULL, NULL, NULL, 'false'),
(1143, 'mainland', 1142, ',1051,1142,1143,', 3, '椒江区', NULL, NULL, NULL, NULL, 'false'),
(1144, 'mainland', 1142, ',1051,1142,1144,', 3, '黄岩区', NULL, NULL, NULL, NULL, 'false'),
(1145, 'mainland', 1142, ',1051,1142,1145,', 3, '路桥区', NULL, NULL, NULL, NULL, 'false'),
(1146, 'mainland', 1142, ',1051,1142,1146,', 3, '玉环县', NULL, NULL, NULL, NULL, 'false'),
(1147, 'mainland', 1142, ',1051,1142,1147,', 3, '三门县', NULL, NULL, NULL, NULL, 'false'),
(1148, 'mainland', 1142, ',1051,1142,1148,', 3, '天台县', NULL, NULL, NULL, NULL, 'false'),
(1149, 'mainland', 1142, ',1051,1142,1149,', 3, '仙居县', NULL, NULL, NULL, NULL, 'false'),
(1150, 'mainland', 1142, ',1051,1142,1150,', 3, '温岭市', NULL, NULL, NULL, NULL, 'false'),
(1151, 'mainland', 1142, ',1051,1142,1151,', 3, '临海市', NULL, NULL, NULL, NULL, 'false'),
(1152, 'mainland', 1142, ',1051,1142,1152,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1153, 'mainland', 1051, ',1051,1153,', 2, '丽水市', NULL, NULL, NULL, NULL, 'false'),
(1154, 'mainland', 1153, ',1051,1153,1154,', 3, '莲都区', NULL, NULL, NULL, NULL, 'false'),
(1155, 'mainland', 1153, ',1051,1153,1155,', 3, '青田县', NULL, NULL, NULL, NULL, 'false'),
(1156, 'mainland', 1153, ',1051,1153,1156,', 3, '缙云县', NULL, NULL, NULL, NULL, 'false'),
(1157, 'mainland', 1153, ',1051,1153,1157,', 3, '遂昌县', NULL, NULL, NULL, NULL, 'false'),
(1158, 'mainland', 1153, ',1051,1153,1158,', 3, '松阳县', NULL, NULL, NULL, NULL, 'false'),
(1159, 'mainland', 1153, ',1051,1153,1159,', 3, '云和县', NULL, NULL, NULL, NULL, 'false'),
(1160, 'mainland', 1153, ',1051,1153,1160,', 3, '庆元县', NULL, NULL, NULL, NULL, 'false'),
(1161, 'mainland', 1153, ',1051,1153,1161,', 3, '景宁畲族自治县', NULL, NULL, NULL, NULL, 'false'),
(1162, 'mainland', 1153, ',1051,1153,1162,', 3, '龙泉市', NULL, NULL, NULL, NULL, 'false'),
(1163, 'mainland', 1153, ',1051,1153,1163,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1164, 'mainland', NULL, ',1164,', 1, '安徽省', NULL, NULL, NULL, NULL, 'false'),
(1165, 'mainland', 1164, ',1164,1165,', 2, '合肥市', NULL, NULL, NULL, NULL, 'false'),
(1166, 'mainland', 1165, ',1164,1165,1166,', 3, '瑶海区', NULL, NULL, NULL, NULL, 'false'),
(1167, 'mainland', 1165, ',1164,1165,1167,', 3, '庐阳区', NULL, NULL, NULL, NULL, 'false'),
(1168, 'mainland', 1165, ',1164,1165,1168,', 3, '蜀山区', NULL, NULL, NULL, NULL, 'false'),
(1169, 'mainland', 1165, ',1164,1165,1169,', 3, '包河区', NULL, NULL, NULL, NULL, 'false'),
(1170, 'mainland', 1165, ',1164,1165,1170,', 3, '长丰县', NULL, NULL, NULL, NULL, 'false'),
(1171, 'mainland', 1165, ',1164,1165,1171,', 3, '肥东县', NULL, NULL, NULL, NULL, 'false'),
(1172, 'mainland', 1165, ',1164,1165,1172,', 3, '肥西县', NULL, NULL, NULL, NULL, 'false'),
(1173, 'mainland', 1165, ',1164,1165,1173,', 3, '高新区', NULL, NULL, NULL, NULL, 'false'),
(1174, 'mainland', 1165, ',1164,1165,1174,', 3, '中区', NULL, NULL, NULL, NULL, 'false'),
(1175, 'mainland', 1165, ',1164,1165,1175,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1176, 'mainland', 1165, ',1164,1165,1176,', 3, '巢湖市', NULL, NULL, NULL, NULL, 'false'),
(1177, 'mainland', 1165, ',1164,1165,1177,', 3, '居巢区', NULL, NULL, NULL, NULL, 'false'),
(1178, 'mainland', 1165, ',1164,1165,1178,', 3, '庐江县', NULL, NULL, NULL, NULL, 'false'),
(1179, 'mainland', 1164, ',1164,1179,', 2, '芜湖市', NULL, NULL, NULL, NULL, 'false'),
(1180, 'mainland', 1179, ',1164,1179,1180,', 3, '镜湖区', NULL, NULL, NULL, NULL, 'false'),
(1181, 'mainland', 1179, ',1164,1179,1181,', 3, '弋江区', NULL, NULL, NULL, NULL, 'false'),
(1182, 'mainland', 1179, ',1164,1179,1182,', 3, '鸠江区', NULL, NULL, NULL, NULL, 'false'),
(1183, 'mainland', 1179, ',1164,1179,1183,', 3, '三山区', NULL, NULL, NULL, NULL, 'false'),
(1184, 'mainland', 1179, ',1164,1179,1184,', 3, '芜湖县', NULL, NULL, NULL, NULL, 'false'),
(1185, 'mainland', 1179, ',1164,1179,1185,', 3, '繁昌县', NULL, NULL, NULL, NULL, 'false'),
(1186, 'mainland', 1179, ',1164,1179,1186,', 3, '南陵县', NULL, NULL, NULL, NULL, 'false'),
(1187, 'mainland', 1179, ',1164,1179,1187,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1188, 'mainland', 1179, ',1164,1179,1188,', 3, '无为县', NULL, NULL, NULL, NULL, 'false'),
(1189, 'mainland', 1164, ',1164,1189,', 2, '蚌埠市', NULL, NULL, NULL, NULL, 'false'),
(1190, 'mainland', 1189, ',1164,1189,1190,', 3, '龙子湖区', NULL, NULL, NULL, NULL, 'false'),
(1191, 'mainland', 1189, ',1164,1189,1191,', 3, '蚌山区', NULL, NULL, NULL, NULL, 'false'),
(1192, 'mainland', 1189, ',1164,1189,1192,', 3, '禹会区', NULL, NULL, NULL, NULL, 'false'),
(1193, 'mainland', 1189, ',1164,1189,1193,', 3, '淮上区', NULL, NULL, NULL, NULL, 'false'),
(1194, 'mainland', 1189, ',1164,1189,1194,', 3, '怀远县', NULL, NULL, NULL, NULL, 'false'),
(1195, 'mainland', 1189, ',1164,1189,1195,', 3, '五河县', NULL, NULL, NULL, NULL, 'false'),
(1196, 'mainland', 1189, ',1164,1189,1196,', 3, '固镇县', NULL, NULL, NULL, NULL, 'false'),
(1197, 'mainland', 1189, ',1164,1189,1197,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1198, 'mainland', 1164, ',1164,1198,', 2, '淮南市', NULL, NULL, NULL, NULL, 'false'),
(1199, 'mainland', 1198, ',1164,1198,1199,', 3, '大通区', NULL, NULL, NULL, NULL, 'false'),
(1200, 'mainland', 1198, ',1164,1198,1200,', 3, '田家庵区', NULL, NULL, NULL, NULL, 'false'),
(1201, 'mainland', 1198, ',1164,1198,1201,', 3, '谢家集区', NULL, NULL, NULL, NULL, 'false'),
(1202, 'mainland', 1198, ',1164,1198,1202,', 3, '八公山区', NULL, NULL, NULL, NULL, 'false'),
(1203, 'mainland', 1198, ',1164,1198,1203,', 3, '潘集区', NULL, NULL, NULL, NULL, 'false'),
(1204, 'mainland', 1198, ',1164,1198,1204,', 3, '凤台县', NULL, NULL, NULL, NULL, 'false'),
(1205, 'mainland', 1198, ',1164,1198,1205,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1206, 'mainland', 1164, ',1164,1206,', 2, '马鞍山市', NULL, NULL, NULL, NULL, 'false'),
(1207, 'mainland', 1206, ',1164,1206,1207,', 3, '金家庄区', NULL, NULL, NULL, NULL, 'false'),
(1208, 'mainland', 1206, ',1164,1206,1208,', 3, '花山区', NULL, NULL, NULL, NULL, 'false'),
(1209, 'mainland', 1206, ',1164,1206,1209,', 3, '雨山区', NULL, NULL, NULL, NULL, 'false'),
(1210, 'mainland', 1206, ',1164,1206,1210,', 3, '当涂县', NULL, NULL, NULL, NULL, 'false'),
(1211, 'mainland', 1206, ',1164,1206,1211,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1212, 'mainland', 1206, ',1164,1206,1212,', 3, '含山县', NULL, NULL, NULL, NULL, 'false'),
(1213, 'mainland', 1206, ',1164,1206,1213,', 3, '和县', NULL, NULL, NULL, NULL, 'false'),
(1214, 'mainland', 1164, ',1164,1214,', 2, '淮北市', NULL, NULL, NULL, NULL, 'false'),
(1215, 'mainland', 1214, ',1164,1214,1215,', 3, '杜集区', NULL, NULL, NULL, NULL, 'false'),
(1216, 'mainland', 1214, ',1164,1214,1216,', 3, '相山区', NULL, NULL, NULL, NULL, 'false'),
(1217, 'mainland', 1214, ',1164,1214,1217,', 3, '烈山区', NULL, NULL, NULL, NULL, 'false'),
(1218, 'mainland', 1214, ',1164,1214,1218,', 3, '濉溪县', NULL, NULL, NULL, NULL, 'false'),
(1219, 'mainland', 1214, ',1164,1214,1219,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1220, 'mainland', 1164, ',1164,1220,', 2, '铜陵市', NULL, NULL, NULL, NULL, 'false'),
(1221, 'mainland', 1220, ',1164,1220,1221,', 3, '铜官山区', NULL, NULL, NULL, NULL, 'false'),
(1222, 'mainland', 1220, ',1164,1220,1222,', 3, '狮子山区', NULL, NULL, NULL, NULL, 'false'),
(1223, 'mainland', 1220, ',1164,1220,1223,', 3, '郊区', NULL, NULL, NULL, NULL, 'false'),
(1224, 'mainland', 1220, ',1164,1220,1224,', 3, '铜陵县', NULL, NULL, NULL, NULL, 'false'),
(1225, 'mainland', 1220, ',1164,1220,1225,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1226, 'mainland', 1164, ',1164,1226,', 2, '安庆市', NULL, NULL, NULL, NULL, 'false'),
(1227, 'mainland', 1226, ',1164,1226,1227,', 3, '迎江区', NULL, NULL, NULL, NULL, 'false'),
(1228, 'mainland', 1226, ',1164,1226,1228,', 3, '大观区', NULL, NULL, NULL, NULL, 'false'),
(1229, 'mainland', 1226, ',1164,1226,1229,', 3, '宜秀区', NULL, NULL, NULL, NULL, 'false'),
(1230, 'mainland', 1226, ',1164,1226,1230,', 3, '怀宁县', NULL, NULL, NULL, NULL, 'false'),
(1231, 'mainland', 1226, ',1164,1226,1231,', 3, '枞阳县', NULL, NULL, NULL, NULL, 'false'),
(1232, 'mainland', 1226, ',1164,1226,1232,', 3, '潜山县', NULL, NULL, NULL, NULL, 'false'),
(1233, 'mainland', 1226, ',1164,1226,1233,', 3, '太湖县', NULL, NULL, NULL, NULL, 'false'),
(1234, 'mainland', 1226, ',1164,1226,1234,', 3, '宿松县', NULL, NULL, NULL, NULL, 'false'),
(1235, 'mainland', 1226, ',1164,1226,1235,', 3, '望江县', NULL, NULL, NULL, NULL, 'false'),
(1236, 'mainland', 1226, ',1164,1226,1236,', 3, '岳西县', NULL, NULL, NULL, NULL, 'false'),
(1237, 'mainland', 1226, ',1164,1226,1237,', 3, '桐城市', NULL, NULL, NULL, NULL, 'false'),
(1238, 'mainland', 1226, ',1164,1226,1238,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1239, 'mainland', 1164, ',1164,1239,', 2, '黄山市', NULL, NULL, NULL, NULL, 'false'),
(1240, 'mainland', 1239, ',1164,1239,1240,', 3, '屯溪区', NULL, NULL, NULL, NULL, 'false'),
(1241, 'mainland', 1239, ',1164,1239,1241,', 3, '黄山区', NULL, NULL, NULL, NULL, 'false'),
(1242, 'mainland', 1239, ',1164,1239,1242,', 3, '徽州区', NULL, NULL, NULL, NULL, 'false'),
(1243, 'mainland', 1239, ',1164,1239,1243,', 3, '歙县', NULL, NULL, NULL, NULL, 'false'),
(1244, 'mainland', 1239, ',1164,1239,1244,', 3, '休宁县', NULL, NULL, NULL, NULL, 'false'),
(1245, 'mainland', 1239, ',1164,1239,1245,', 3, '黟县', NULL, NULL, NULL, NULL, 'false'),
(1246, 'mainland', 1239, ',1164,1239,1246,', 3, '祁门县', NULL, NULL, NULL, NULL, 'false'),
(1247, 'mainland', 1239, ',1164,1239,1247,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1248, 'mainland', 1164, ',1164,1248,', 2, '滁州市', NULL, NULL, NULL, NULL, 'false'),
(1249, 'mainland', 1248, ',1164,1248,1249,', 3, '琅琊区', NULL, NULL, NULL, NULL, 'false'),
(1250, 'mainland', 1248, ',1164,1248,1250,', 3, '南谯区', NULL, NULL, NULL, NULL, 'false'),
(1251, 'mainland', 1248, ',1164,1248,1251,', 3, '来安县', NULL, NULL, NULL, NULL, 'false'),
(1252, 'mainland', 1248, ',1164,1248,1252,', 3, '全椒县', NULL, NULL, NULL, NULL, 'false'),
(1253, 'mainland', 1248, ',1164,1248,1253,', 3, '定远县', NULL, NULL, NULL, NULL, 'false'),
(1254, 'mainland', 1248, ',1164,1248,1254,', 3, '凤阳县', NULL, NULL, NULL, NULL, 'false'),
(1255, 'mainland', 1248, ',1164,1248,1255,', 3, '天长市', NULL, NULL, NULL, NULL, 'false'),
(1256, 'mainland', 1248, ',1164,1248,1256,', 3, '明光市', NULL, NULL, NULL, NULL, 'false'),
(1257, 'mainland', 1248, ',1164,1248,1257,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1258, 'mainland', 1164, ',1164,1258,', 2, '阜阳市', NULL, NULL, NULL, NULL, 'false'),
(1259, 'mainland', 1258, ',1164,1258,1259,', 3, '颍州区', NULL, NULL, NULL, NULL, 'false'),
(1260, 'mainland', 1258, ',1164,1258,1260,', 3, '颍东区', NULL, NULL, NULL, NULL, 'false'),
(1261, 'mainland', 1258, ',1164,1258,1261,', 3, '颍泉区', NULL, NULL, NULL, NULL, 'false'),
(1262, 'mainland', 1258, ',1164,1258,1262,', 3, '临泉县', NULL, NULL, NULL, NULL, 'false'),
(1263, 'mainland', 1258, ',1164,1258,1263,', 3, '太和县', NULL, NULL, NULL, NULL, 'false'),
(1264, 'mainland', 1258, ',1164,1258,1264,', 3, '阜南县', NULL, NULL, NULL, NULL, 'false'),
(1265, 'mainland', 1258, ',1164,1258,1265,', 3, '颍上县', NULL, NULL, NULL, NULL, 'false'),
(1266, 'mainland', 1258, ',1164,1258,1266,', 3, '界首市', NULL, NULL, NULL, NULL, 'false'),
(1267, 'mainland', 1258, ',1164,1258,1267,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1268, 'mainland', 1164, ',1164,1268,', 2, '宿州市', NULL, NULL, NULL, NULL, 'false'),
(1269, 'mainland', 1268, ',1164,1268,1269,', 3, '埇桥区', NULL, NULL, NULL, NULL, 'false'),
(1270, 'mainland', 1268, ',1164,1268,1270,', 3, '砀山县', NULL, NULL, NULL, NULL, 'false'),
(1271, 'mainland', 1268, ',1164,1268,1271,', 3, '萧县', NULL, NULL, NULL, NULL, 'false'),
(1272, 'mainland', 1268, ',1164,1268,1272,', 3, '灵璧县', NULL, NULL, NULL, NULL, 'false'),
(1273, 'mainland', 1268, ',1164,1268,1273,', 3, '泗县', NULL, NULL, NULL, NULL, 'false'),
(1274, 'mainland', 1268, ',1164,1268,1274,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1275, 'mainland', 1164, ',1164,1275,', 2, '六安市', NULL, NULL, NULL, NULL, 'false'),
(1276, 'mainland', 1275, ',1164,1275,1276,', 3, '金安区', NULL, NULL, NULL, NULL, 'false'),
(1277, 'mainland', 1275, ',1164,1275,1277,', 3, '裕安区', NULL, NULL, NULL, NULL, 'false'),
(1278, 'mainland', 1275, ',1164,1275,1278,', 3, '寿县', NULL, NULL, NULL, NULL, 'false'),
(1279, 'mainland', 1275, ',1164,1275,1279,', 3, '霍邱县', NULL, NULL, NULL, NULL, 'false'),
(1280, 'mainland', 1275, ',1164,1275,1280,', 3, '舒城县', NULL, NULL, NULL, NULL, 'false'),
(1281, 'mainland', 1275, ',1164,1275,1281,', 3, '金寨县', NULL, NULL, NULL, NULL, 'false'),
(1282, 'mainland', 1275, ',1164,1275,1282,', 3, '霍山县', NULL, NULL, NULL, NULL, 'false'),
(1283, 'mainland', 1275, ',1164,1275,1283,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1284, 'mainland', 1164, ',1164,1284,', 2, '亳州市', NULL, NULL, NULL, NULL, 'false'),
(1285, 'mainland', 1284, ',1164,1284,1285,', 3, '谯城区', NULL, NULL, NULL, NULL, 'false'),
(1286, 'mainland', 1284, ',1164,1284,1286,', 3, '涡阳县', NULL, NULL, NULL, NULL, 'false'),
(1287, 'mainland', 1284, ',1164,1284,1287,', 3, '蒙城县', NULL, NULL, NULL, NULL, 'false'),
(1288, 'mainland', 1284, ',1164,1284,1288,', 3, '利辛县', NULL, NULL, NULL, NULL, 'false'),
(1289, 'mainland', 1284, ',1164,1284,1289,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1290, 'mainland', 1164, ',1164,1290,', 2, '池州市', NULL, NULL, NULL, NULL, 'false'),
(1291, 'mainland', 1290, ',1164,1290,1291,', 3, '贵池区', NULL, NULL, NULL, NULL, 'false'),
(1292, 'mainland', 1290, ',1164,1290,1292,', 3, '东至县', NULL, NULL, NULL, NULL, 'false'),
(1293, 'mainland', 1290, ',1164,1290,1293,', 3, '石台县', NULL, NULL, NULL, NULL, 'false'),
(1294, 'mainland', 1290, ',1164,1290,1294,', 3, '青阳县', NULL, NULL, NULL, NULL, 'false'),
(1295, 'mainland', 1290, ',1164,1290,1295,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1296, 'mainland', 1164, ',1164,1296,', 2, '宣城市', NULL, NULL, NULL, NULL, 'false'),
(1297, 'mainland', 1296, ',1164,1296,1297,', 3, '宣州区', NULL, NULL, NULL, NULL, 'false'),
(1298, 'mainland', 1296, ',1164,1296,1298,', 3, '郎溪县', NULL, NULL, NULL, NULL, 'false'),
(1299, 'mainland', 1296, ',1164,1296,1299,', 3, '广德县', NULL, NULL, NULL, NULL, 'false'),
(1300, 'mainland', 1296, ',1164,1296,1300,', 3, '泾县', NULL, NULL, NULL, NULL, 'false'),
(1301, 'mainland', 1296, ',1164,1296,1301,', 3, '绩溪县', NULL, NULL, NULL, NULL, 'false'),
(1302, 'mainland', 1296, ',1164,1296,1302,', 3, '旌德县', NULL, NULL, NULL, NULL, 'false'),
(1303, 'mainland', 1296, ',1164,1296,1303,', 3, '宁国市', NULL, NULL, NULL, NULL, 'false'),
(1304, 'mainland', 1296, ',1164,1296,1304,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1305, 'mainland', NULL, ',1305,', 1, '福建省', NULL, NULL, NULL, NULL, 'false'),
(1306, 'mainland', 1305, ',1305,1306,', 2, '福州市', NULL, NULL, NULL, NULL, 'false'),
(1307, 'mainland', 1306, ',1305,1306,1307,', 3, '鼓楼区', NULL, NULL, NULL, NULL, 'false'),
(1308, 'mainland', 1306, ',1305,1306,1308,', 3, '台江区', NULL, NULL, NULL, NULL, 'false'),
(1309, 'mainland', 1306, ',1305,1306,1309,', 3, '仓山区', NULL, NULL, NULL, NULL, 'false'),
(1310, 'mainland', 1306, ',1305,1306,1310,', 3, '马尾区', NULL, NULL, NULL, NULL, 'false'),
(1311, 'mainland', 1306, ',1305,1306,1311,', 3, '晋安区', NULL, NULL, NULL, NULL, 'false'),
(1312, 'mainland', 1306, ',1305,1306,1312,', 3, '闽侯县', NULL, NULL, NULL, NULL, 'false'),
(1313, 'mainland', 1306, ',1305,1306,1313,', 3, '连江县', NULL, NULL, NULL, NULL, 'false'),
(1314, 'mainland', 1306, ',1305,1306,1314,', 3, '罗源县', NULL, NULL, NULL, NULL, 'false'),
(1315, 'mainland', 1306, ',1305,1306,1315,', 3, '闽清县', NULL, NULL, NULL, NULL, 'false'),
(1316, 'mainland', 1306, ',1305,1306,1316,', 3, '永泰县', NULL, NULL, NULL, NULL, 'false'),
(1317, 'mainland', 1306, ',1305,1306,1317,', 3, '平潭县', NULL, NULL, NULL, NULL, 'false'),
(1318, 'mainland', 1306, ',1305,1306,1318,', 3, '福清市', NULL, NULL, NULL, NULL, 'false'),
(1319, 'mainland', 1306, ',1305,1306,1319,', 3, '长乐市', NULL, NULL, NULL, NULL, 'false'),
(1320, 'mainland', 1306, ',1305,1306,1320,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1321, 'mainland', 1305, ',1305,1321,', 2, '厦门市', NULL, NULL, NULL, NULL, 'false'),
(1322, 'mainland', 1321, ',1305,1321,1322,', 3, '思明区', NULL, NULL, NULL, NULL, 'false'),
(1323, 'mainland', 1321, ',1305,1321,1323,', 3, '海沧区', NULL, NULL, NULL, NULL, 'false'),
(1324, 'mainland', 1321, ',1305,1321,1324,', 3, '湖里区', NULL, NULL, NULL, NULL, 'false'),
(1325, 'mainland', 1321, ',1305,1321,1325,', 3, '集美区', NULL, NULL, NULL, NULL, 'false'),
(1326, 'mainland', 1321, ',1305,1321,1326,', 3, '同安区', NULL, NULL, NULL, NULL, 'false'),
(1327, 'mainland', 1321, ',1305,1321,1327,', 3, '翔安区', NULL, NULL, NULL, NULL, 'false'),
(1328, 'mainland', 1321, ',1305,1321,1328,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1329, 'mainland', 1305, ',1305,1329,', 2, '莆田市', NULL, NULL, NULL, NULL, 'false'),
(1330, 'mainland', 1329, ',1305,1329,1330,', 3, '城厢区', NULL, NULL, NULL, NULL, 'false'),
(1331, 'mainland', 1329, ',1305,1329,1331,', 3, '涵江区', NULL, NULL, NULL, NULL, 'false'),
(1332, 'mainland', 1329, ',1305,1329,1332,', 3, '荔城区', NULL, NULL, NULL, NULL, 'false'),
(1333, 'mainland', 1329, ',1305,1329,1333,', 3, '秀屿区', NULL, NULL, NULL, NULL, 'false'),
(1334, 'mainland', 1329, ',1305,1329,1334,', 3, '仙游县', NULL, NULL, NULL, NULL, 'false'),
(1335, 'mainland', 1329, ',1305,1329,1335,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1336, 'mainland', 1305, ',1305,1336,', 2, '三明市', NULL, NULL, NULL, NULL, 'false'),
(1337, 'mainland', 1336, ',1305,1336,1337,', 3, '梅列区', NULL, NULL, NULL, NULL, 'false'),
(1338, 'mainland', 1336, ',1305,1336,1338,', 3, '三元区', NULL, NULL, NULL, NULL, 'false'),
(1339, 'mainland', 1336, ',1305,1336,1339,', 3, '明溪县', NULL, NULL, NULL, NULL, 'false'),
(1340, 'mainland', 1336, ',1305,1336,1340,', 3, '清流县', NULL, NULL, NULL, NULL, 'false'),
(1341, 'mainland', 1336, ',1305,1336,1341,', 3, '宁化县', NULL, NULL, NULL, NULL, 'false'),
(1342, 'mainland', 1336, ',1305,1336,1342,', 3, '大田县', NULL, NULL, NULL, NULL, 'false'),
(1343, 'mainland', 1336, ',1305,1336,1343,', 3, '尤溪县', NULL, NULL, NULL, NULL, 'false'),
(1344, 'mainland', 1336, ',1305,1336,1344,', 3, '沙县', NULL, NULL, NULL, NULL, 'false'),
(1345, 'mainland', 1336, ',1305,1336,1345,', 3, '将乐县', NULL, NULL, NULL, NULL, 'false'),
(1346, 'mainland', 1336, ',1305,1336,1346,', 3, '泰宁县', NULL, NULL, NULL, NULL, 'false'),
(1347, 'mainland', 1336, ',1305,1336,1347,', 3, '建宁县', NULL, NULL, NULL, NULL, 'false'),
(1348, 'mainland', 1336, ',1305,1336,1348,', 3, '永安市', NULL, NULL, NULL, NULL, 'false'),
(1349, 'mainland', 1336, ',1305,1336,1349,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1350, 'mainland', 1305, ',1305,1350,', 2, '泉州市', NULL, NULL, NULL, NULL, 'false'),
(1351, 'mainland', 1350, ',1305,1350,1351,', 3, '鲤城区', NULL, NULL, NULL, NULL, 'false'),
(1352, 'mainland', 1350, ',1305,1350,1352,', 3, '丰泽区', NULL, NULL, NULL, NULL, 'false'),
(1353, 'mainland', 1350, ',1305,1350,1353,', 3, '洛江区', NULL, NULL, NULL, NULL, 'false'),
(1354, 'mainland', 1350, ',1305,1350,1354,', 3, '泉港区', NULL, NULL, NULL, NULL, 'false'),
(1355, 'mainland', 1350, ',1305,1350,1355,', 3, '惠安县', NULL, NULL, NULL, NULL, 'false'),
(1356, 'mainland', 1350, ',1305,1350,1356,', 3, '安溪县', NULL, NULL, NULL, NULL, 'false'),
(1357, 'mainland', 1350, ',1305,1350,1357,', 3, '永春县', NULL, NULL, NULL, NULL, 'false'),
(1358, 'mainland', 1350, ',1305,1350,1358,', 3, '德化县', NULL, NULL, NULL, NULL, 'false'),
(1359, 'mainland', 1350, ',1305,1350,1359,', 3, '金门县', NULL, NULL, NULL, NULL, 'false'),
(1360, 'mainland', 1350, ',1305,1350,1360,', 3, '石狮市', NULL, NULL, NULL, NULL, 'false'),
(1361, 'mainland', 1350, ',1305,1350,1361,', 3, '晋江市', NULL, NULL, NULL, NULL, 'false'),
(1362, 'mainland', 1350, ',1305,1350,1362,', 3, '南安市', NULL, NULL, NULL, NULL, 'false'),
(1363, 'mainland', 1350, ',1305,1350,1363,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1364, 'mainland', 1305, ',1305,1364,', 2, '漳州市', NULL, NULL, NULL, NULL, 'false'),
(1365, 'mainland', 1364, ',1305,1364,1365,', 3, '芗城区', NULL, NULL, NULL, NULL, 'false'),
(1366, 'mainland', 1364, ',1305,1364,1366,', 3, '龙文区', NULL, NULL, NULL, NULL, 'false'),
(1367, 'mainland', 1364, ',1305,1364,1367,', 3, '云霄县', NULL, NULL, NULL, NULL, 'false'),
(1368, 'mainland', 1364, ',1305,1364,1368,', 3, '漳浦县', NULL, NULL, NULL, NULL, 'false'),
(1369, 'mainland', 1364, ',1305,1364,1369,', 3, '诏安县', NULL, NULL, NULL, NULL, 'false'),
(1370, 'mainland', 1364, ',1305,1364,1370,', 3, '长泰县', NULL, NULL, NULL, NULL, 'false'),
(1371, 'mainland', 1364, ',1305,1364,1371,', 3, '东山县', NULL, NULL, NULL, NULL, 'false'),
(1372, 'mainland', 1364, ',1305,1364,1372,', 3, '南靖县', NULL, NULL, NULL, NULL, 'false'),
(1373, 'mainland', 1364, ',1305,1364,1373,', 3, '平和县', NULL, NULL, NULL, NULL, 'false'),
(1374, 'mainland', 1364, ',1305,1364,1374,', 3, '华安县', NULL, NULL, NULL, NULL, 'false'),
(1375, 'mainland', 1364, ',1305,1364,1375,', 3, '龙海市', NULL, NULL, NULL, NULL, 'false'),
(1376, 'mainland', 1364, ',1305,1364,1376,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1377, 'mainland', 1305, ',1305,1377,', 2, '南平市', NULL, NULL, NULL, NULL, 'false'),
(1378, 'mainland', 1377, ',1305,1377,1378,', 3, '延平区', NULL, NULL, NULL, NULL, 'false'),
(1379, 'mainland', 1377, ',1305,1377,1379,', 3, '顺昌县', NULL, NULL, NULL, NULL, 'false'),
(1380, 'mainland', 1377, ',1305,1377,1380,', 3, '浦城县', NULL, NULL, NULL, NULL, 'false'),
(1381, 'mainland', 1377, ',1305,1377,1381,', 3, '光泽县', NULL, NULL, NULL, NULL, 'false'),
(1382, 'mainland', 1377, ',1305,1377,1382,', 3, '松溪县', NULL, NULL, NULL, NULL, 'false'),
(1383, 'mainland', 1377, ',1305,1377,1383,', 3, '政和县', NULL, NULL, NULL, NULL, 'false'),
(1384, 'mainland', 1377, ',1305,1377,1384,', 3, '邵武市', NULL, NULL, NULL, NULL, 'false'),
(1385, 'mainland', 1377, ',1305,1377,1385,', 3, '武夷山市', NULL, NULL, NULL, NULL, 'false'),
(1386, 'mainland', 1377, ',1305,1377,1386,', 3, '建瓯市', NULL, NULL, NULL, NULL, 'false'),
(1387, 'mainland', 1377, ',1305,1377,1387,', 3, '建阳市', NULL, NULL, NULL, NULL, 'false'),
(1388, 'mainland', 1377, ',1305,1377,1388,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1389, 'mainland', 1305, ',1305,1389,', 2, '龙岩市', NULL, NULL, NULL, NULL, 'false'),
(1390, 'mainland', 1389, ',1305,1389,1390,', 3, '新罗区', NULL, NULL, NULL, NULL, 'false'),
(1391, 'mainland', 1389, ',1305,1389,1391,', 3, '长汀县', NULL, NULL, NULL, NULL, 'false'),
(1392, 'mainland', 1389, ',1305,1389,1392,', 3, '永定县', NULL, NULL, NULL, NULL, 'false'),
(1393, 'mainland', 1389, ',1305,1389,1393,', 3, '上杭县', NULL, NULL, NULL, NULL, 'false'),
(1394, 'mainland', 1389, ',1305,1389,1394,', 3, '武平县', NULL, NULL, NULL, NULL, 'false'),
(1395, 'mainland', 1389, ',1305,1389,1395,', 3, '连城县', NULL, NULL, NULL, NULL, 'false'),
(1396, 'mainland', 1389, ',1305,1389,1396,', 3, '漳平市', NULL, NULL, NULL, NULL, 'false'),
(1397, 'mainland', 1389, ',1305,1389,1397,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1398, 'mainland', 1305, ',1305,1398,', 2, '宁德市', NULL, NULL, NULL, NULL, 'false'),
(1399, 'mainland', 1398, ',1305,1398,1399,', 3, '蕉城区', NULL, NULL, NULL, NULL, 'false'),
(1400, 'mainland', 1398, ',1305,1398,1400,', 3, '霞浦县', NULL, NULL, NULL, NULL, 'false'),
(1401, 'mainland', 1398, ',1305,1398,1401,', 3, '古田县', NULL, NULL, NULL, NULL, 'false'),
(1402, 'mainland', 1398, ',1305,1398,1402,', 3, '屏南县', NULL, NULL, NULL, NULL, 'false'),
(1403, 'mainland', 1398, ',1305,1398,1403,', 3, '寿宁县', NULL, NULL, NULL, NULL, 'false'),
(1404, 'mainland', 1398, ',1305,1398,1404,', 3, '周宁县', NULL, NULL, NULL, NULL, 'false'),
(1405, 'mainland', 1398, ',1305,1398,1405,', 3, '柘荣县', NULL, NULL, NULL, NULL, 'false'),
(1406, 'mainland', 1398, ',1305,1398,1406,', 3, '福安市', NULL, NULL, NULL, NULL, 'false'),
(1407, 'mainland', 1398, ',1305,1398,1407,', 3, '福鼎市', NULL, NULL, NULL, NULL, 'false'),
(1408, 'mainland', 1398, ',1305,1398,1408,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1409, 'mainland', NULL, ',1409,', 1, '江西省', NULL, NULL, NULL, NULL, 'false'),
(1410, 'mainland', 1409, ',1409,1410,', 2, '南昌市', NULL, NULL, NULL, NULL, 'false'),
(1411, 'mainland', 1410, ',1409,1410,1411,', 3, '东湖区', NULL, NULL, NULL, NULL, 'false'),
(1412, 'mainland', 1410, ',1409,1410,1412,', 3, '西湖区', NULL, NULL, NULL, NULL, 'false'),
(1413, 'mainland', 1410, ',1409,1410,1413,', 3, '青云谱区', NULL, NULL, NULL, NULL, 'false'),
(1414, 'mainland', 1410, ',1409,1410,1414,', 3, '湾里区', NULL, NULL, NULL, NULL, 'false'),
(1415, 'mainland', 1410, ',1409,1410,1415,', 3, '青山湖区', NULL, NULL, NULL, NULL, 'false'),
(1416, 'mainland', 1410, ',1409,1410,1416,', 3, '南昌县', NULL, NULL, NULL, NULL, 'false'),
(1417, 'mainland', 1410, ',1409,1410,1417,', 3, '新建县', NULL, NULL, NULL, NULL, 'false'),
(1418, 'mainland', 1410, ',1409,1410,1418,', 3, '安义县', NULL, NULL, NULL, NULL, 'false'),
(1419, 'mainland', 1410, ',1409,1410,1419,', 3, '进贤县', NULL, NULL, NULL, NULL, 'false'),
(1420, 'mainland', 1410, ',1409,1410,1420,', 3, '红谷滩新区', NULL, NULL, NULL, NULL, 'false'),
(1421, 'mainland', 1410, ',1409,1410,1421,', 3, '经济技术开发区', NULL, NULL, NULL, NULL, 'false'),
(1422, 'mainland', 1410, ',1409,1410,1422,', 3, '昌北区', NULL, NULL, NULL, NULL, 'false'),
(1423, 'mainland', 1410, ',1409,1410,1423,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1424, 'mainland', 1409, ',1409,1424,', 2, '景德镇市', NULL, NULL, NULL, NULL, 'false'),
(1425, 'mainland', 1424, ',1409,1424,1425,', 3, '昌江区', NULL, NULL, NULL, NULL, 'false'),
(1426, 'mainland', 1424, ',1409,1424,1426,', 3, '珠山区', NULL, NULL, NULL, NULL, 'false'),
(1427, 'mainland', 1424, ',1409,1424,1427,', 3, '浮梁县', NULL, NULL, NULL, NULL, 'false'),
(1428, 'mainland', 1424, ',1409,1424,1428,', 3, '乐平市', NULL, NULL, NULL, NULL, 'false'),
(1429, 'mainland', 1424, ',1409,1424,1429,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1430, 'mainland', 1409, ',1409,1430,', 2, '萍乡市', NULL, NULL, NULL, NULL, 'false'),
(1431, 'mainland', 1430, ',1409,1430,1431,', 3, '安源区', NULL, NULL, NULL, NULL, 'false'),
(1432, 'mainland', 1430, ',1409,1430,1432,', 3, '湘东区', NULL, NULL, NULL, NULL, 'false'),
(1433, 'mainland', 1430, ',1409,1430,1433,', 3, '莲花县', NULL, NULL, NULL, NULL, 'false'),
(1434, 'mainland', 1430, ',1409,1430,1434,', 3, '上栗县', NULL, NULL, NULL, NULL, 'false'),
(1435, 'mainland', 1430, ',1409,1430,1435,', 3, '芦溪县', NULL, NULL, NULL, NULL, 'false'),
(1436, 'mainland', 1430, ',1409,1430,1436,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1437, 'mainland', 1409, ',1409,1437,', 2, '九江市', NULL, NULL, NULL, NULL, 'false'),
(1438, 'mainland', 1437, ',1409,1437,1438,', 3, '庐山区', NULL, NULL, NULL, NULL, 'false'),
(1439, 'mainland', 1437, ',1409,1437,1439,', 3, '浔阳区', NULL, NULL, NULL, NULL, 'false'),
(1440, 'mainland', 1437, ',1409,1437,1440,', 3, '九江县', NULL, NULL, NULL, NULL, 'false'),
(1441, 'mainland', 1437, ',1409,1437,1441,', 3, '武宁县', NULL, NULL, NULL, NULL, 'false'),
(1442, 'mainland', 1437, ',1409,1437,1442,', 3, '修水县', NULL, NULL, NULL, NULL, 'false'),
(1443, 'mainland', 1437, ',1409,1437,1443,', 3, '永修县', NULL, NULL, NULL, NULL, 'false'),
(1444, 'mainland', 1437, ',1409,1437,1444,', 3, '德安县', NULL, NULL, NULL, NULL, 'false'),
(1445, 'mainland', 1437, ',1409,1437,1445,', 3, '星子县', NULL, NULL, NULL, NULL, 'false'),
(1446, 'mainland', 1437, ',1409,1437,1446,', 3, '都昌县', NULL, NULL, NULL, NULL, 'false'),
(1447, 'mainland', 1437, ',1409,1437,1447,', 3, '湖口县', NULL, NULL, NULL, NULL, 'false'),
(1448, 'mainland', 1437, ',1409,1437,1448,', 3, '彭泽县', NULL, NULL, NULL, NULL, 'false'),
(1449, 'mainland', 1437, ',1409,1437,1449,', 3, '瑞昌市', NULL, NULL, NULL, NULL, 'false'),
(1450, 'mainland', 1437, ',1409,1437,1450,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1451, 'mainland', 1409, ',1409,1451,', 2, '新余市', NULL, NULL, NULL, NULL, 'false'),
(1452, 'mainland', 1451, ',1409,1451,1452,', 3, '渝水区', NULL, NULL, NULL, NULL, 'false'),
(1453, 'mainland', 1451, ',1409,1451,1453,', 3, '分宜县', NULL, NULL, NULL, NULL, 'false'),
(1454, 'mainland', 1451, ',1409,1451,1454,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1455, 'mainland', 1409, ',1409,1455,', 2, '鹰潭市', NULL, NULL, NULL, NULL, 'false'),
(1456, 'mainland', 1455, ',1409,1455,1456,', 3, '月湖区', NULL, NULL, NULL, NULL, 'false'),
(1457, 'mainland', 1455, ',1409,1455,1457,', 3, '余江县', NULL, NULL, NULL, NULL, 'false'),
(1458, 'mainland', 1455, ',1409,1455,1458,', 3, '贵溪市', NULL, NULL, NULL, NULL, 'false'),
(1459, 'mainland', 1455, ',1409,1455,1459,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1460, 'mainland', 1409, ',1409,1460,', 2, '赣州市', NULL, NULL, NULL, NULL, 'false'),
(1461, 'mainland', 1460, ',1409,1460,1461,', 3, '章贡区', NULL, NULL, NULL, NULL, 'false'),
(1462, 'mainland', 1460, ',1409,1460,1462,', 3, '赣县', NULL, NULL, NULL, NULL, 'false'),
(1463, 'mainland', 1460, ',1409,1460,1463,', 3, '信丰县', NULL, NULL, NULL, NULL, 'false'),
(1464, 'mainland', 1460, ',1409,1460,1464,', 3, '大余县', NULL, NULL, NULL, NULL, 'false'),
(1465, 'mainland', 1460, ',1409,1460,1465,', 3, '上犹县', NULL, NULL, NULL, NULL, 'false'),
(1466, 'mainland', 1460, ',1409,1460,1466,', 3, '崇义县', NULL, NULL, NULL, NULL, 'false'),
(1467, 'mainland', 1460, ',1409,1460,1467,', 3, '安远县', NULL, NULL, NULL, NULL, 'false'),
(1468, 'mainland', 1460, ',1409,1460,1468,', 3, '龙南县', NULL, NULL, NULL, NULL, 'false'),
(1469, 'mainland', 1460, ',1409,1460,1469,', 3, '定南县', NULL, NULL, NULL, NULL, 'false'),
(1470, 'mainland', 1460, ',1409,1460,1470,', 3, '全南县', NULL, NULL, NULL, NULL, 'false'),
(1471, 'mainland', 1460, ',1409,1460,1471,', 3, '宁都县', NULL, NULL, NULL, NULL, 'false'),
(1472, 'mainland', 1460, ',1409,1460,1472,', 3, '于都县', NULL, NULL, NULL, NULL, 'false'),
(1473, 'mainland', 1460, ',1409,1460,1473,', 3, '兴国县', NULL, NULL, NULL, NULL, 'false'),
(1474, 'mainland', 1460, ',1409,1460,1474,', 3, '会昌县', NULL, NULL, NULL, NULL, 'false'),
(1475, 'mainland', 1460, ',1409,1460,1475,', 3, '寻乌县', NULL, NULL, NULL, NULL, 'false'),
(1476, 'mainland', 1460, ',1409,1460,1476,', 3, '石城县', NULL, NULL, NULL, NULL, 'false'),
(1477, 'mainland', 1460, ',1409,1460,1477,', 3, '黄金区', NULL, NULL, NULL, NULL, 'false'),
(1478, 'mainland', 1460, ',1409,1460,1478,', 3, '瑞金市', NULL, NULL, NULL, NULL, 'false'),
(1479, 'mainland', 1460, ',1409,1460,1479,', 3, '南康市', NULL, NULL, NULL, NULL, 'false'),
(1480, 'mainland', 1460, ',1409,1460,1480,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1481, 'mainland', 1409, ',1409,1481,', 2, '吉安市', NULL, NULL, NULL, NULL, 'false'),
(1482, 'mainland', 1481, ',1409,1481,1482,', 3, '吉州区', NULL, NULL, NULL, NULL, 'false'),
(1483, 'mainland', 1481, ',1409,1481,1483,', 3, '青原区', NULL, NULL, NULL, NULL, 'false'),
(1484, 'mainland', 1481, ',1409,1481,1484,', 3, '吉安县', NULL, NULL, NULL, NULL, 'false'),
(1485, 'mainland', 1481, ',1409,1481,1485,', 3, '吉水县', NULL, NULL, NULL, NULL, 'false'),
(1486, 'mainland', 1481, ',1409,1481,1486,', 3, '峡江县', NULL, NULL, NULL, NULL, 'false'),
(1487, 'mainland', 1481, ',1409,1481,1487,', 3, '新干县', NULL, NULL, NULL, NULL, 'false'),
(1488, 'mainland', 1481, ',1409,1481,1488,', 3, '永丰县', NULL, NULL, NULL, NULL, 'false'),
(1489, 'mainland', 1481, ',1409,1481,1489,', 3, '泰和县', NULL, NULL, NULL, NULL, 'false'),
(1490, 'mainland', 1481, ',1409,1481,1490,', 3, '遂川县', NULL, NULL, NULL, NULL, 'false'),
(1491, 'mainland', 1481, ',1409,1481,1491,', 3, '万安县', NULL, NULL, NULL, NULL, 'false'),
(1492, 'mainland', 1481, ',1409,1481,1492,', 3, '安福县', NULL, NULL, NULL, NULL, 'false'),
(1493, 'mainland', 1481, ',1409,1481,1493,', 3, '永新县', NULL, NULL, NULL, NULL, 'false'),
(1494, 'mainland', 1481, ',1409,1481,1494,', 3, '井冈山市', NULL, NULL, NULL, NULL, 'false'),
(1495, 'mainland', 1481, ',1409,1481,1495,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1496, 'mainland', 1409, ',1409,1496,', 2, '宜春市', NULL, NULL, NULL, NULL, 'false'),
(1497, 'mainland', 1496, ',1409,1496,1497,', 3, '袁州区', NULL, NULL, NULL, NULL, 'false'),
(1498, 'mainland', 1496, ',1409,1496,1498,', 3, '奉新县', NULL, NULL, NULL, NULL, 'false'),
(1499, 'mainland', 1496, ',1409,1496,1499,', 3, '万载县', NULL, NULL, NULL, NULL, 'false'),
(1500, 'mainland', 1496, ',1409,1496,1500,', 3, '上高县', NULL, NULL, NULL, NULL, 'false'),
(1501, 'mainland', 1496, ',1409,1496,1501,', 3, '宜丰县', NULL, NULL, NULL, NULL, 'false'),
(1502, 'mainland', 1496, ',1409,1496,1502,', 3, '靖安县', NULL, NULL, NULL, NULL, 'false'),
(1503, 'mainland', 1496, ',1409,1496,1503,', 3, '铜鼓县', NULL, NULL, NULL, NULL, 'false'),
(1504, 'mainland', 1496, ',1409,1496,1504,', 3, '丰城市', NULL, NULL, NULL, NULL, 'false'),
(1505, 'mainland', 1496, ',1409,1496,1505,', 3, '樟树市', NULL, NULL, NULL, NULL, 'false'),
(1506, 'mainland', 1496, ',1409,1496,1506,', 3, '高安市', NULL, NULL, NULL, NULL, 'false'),
(1507, 'mainland', 1496, ',1409,1496,1507,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1508, 'mainland', 1409, ',1409,1508,', 2, '抚州市', NULL, NULL, NULL, NULL, 'false'),
(1509, 'mainland', 1508, ',1409,1508,1509,', 3, '临川区', NULL, NULL, NULL, NULL, 'false'),
(1510, 'mainland', 1508, ',1409,1508,1510,', 3, '南城县', NULL, NULL, NULL, NULL, 'false'),
(1511, 'mainland', 1508, ',1409,1508,1511,', 3, '黎川县', NULL, NULL, NULL, NULL, 'false'),
(1512, 'mainland', 1508, ',1409,1508,1512,', 3, '南丰县', NULL, NULL, NULL, NULL, 'false'),
(1513, 'mainland', 1508, ',1409,1508,1513,', 3, '崇仁县', NULL, NULL, NULL, NULL, 'false'),
(1514, 'mainland', 1508, ',1409,1508,1514,', 3, '乐安县', NULL, NULL, NULL, NULL, 'false'),
(1515, 'mainland', 1508, ',1409,1508,1515,', 3, '宜黄县', NULL, NULL, NULL, NULL, 'false'),
(1516, 'mainland', 1508, ',1409,1508,1516,', 3, '金溪县', NULL, NULL, NULL, NULL, 'false'),
(1517, 'mainland', 1508, ',1409,1508,1517,', 3, '资溪县', NULL, NULL, NULL, NULL, 'false'),
(1518, 'mainland', 1508, ',1409,1508,1518,', 3, '东乡县', NULL, NULL, NULL, NULL, 'false'),
(1519, 'mainland', 1508, ',1409,1508,1519,', 3, '广昌县', NULL, NULL, NULL, NULL, 'false'),
(1520, 'mainland', 1508, ',1409,1508,1520,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1521, 'mainland', 1409, ',1409,1521,', 2, '上饶市', NULL, NULL, NULL, NULL, 'false'),
(1522, 'mainland', 1521, ',1409,1521,1522,', 3, '信州区', NULL, NULL, NULL, NULL, 'false'),
(1523, 'mainland', 1521, ',1409,1521,1523,', 3, '上饶县', NULL, NULL, NULL, NULL, 'false'),
(1524, 'mainland', 1521, ',1409,1521,1524,', 3, '广丰县', NULL, NULL, NULL, NULL, 'false'),
(1525, 'mainland', 1521, ',1409,1521,1525,', 3, '玉山县', NULL, NULL, NULL, NULL, 'false'),
(1526, 'mainland', 1521, ',1409,1521,1526,', 3, '铅山县', NULL, NULL, NULL, NULL, 'false'),
(1527, 'mainland', 1521, ',1409,1521,1527,', 3, '横峰县', NULL, NULL, NULL, NULL, 'false'),
(1528, 'mainland', 1521, ',1409,1521,1528,', 3, '弋阳县', NULL, NULL, NULL, NULL, 'false'),
(1529, 'mainland', 1521, ',1409,1521,1529,', 3, '余干县', NULL, NULL, NULL, NULL, 'false'),
(1530, 'mainland', 1521, ',1409,1521,1530,', 3, '鄱阳县', NULL, NULL, NULL, NULL, 'false'),
(1531, 'mainland', 1521, ',1409,1521,1531,', 3, '万年县', NULL, NULL, NULL, NULL, 'false'),
(1532, 'mainland', 1521, ',1409,1521,1532,', 3, '婺源县', NULL, NULL, NULL, NULL, 'false'),
(1533, 'mainland', 1521, ',1409,1521,1533,', 3, '德兴市', NULL, NULL, NULL, NULL, 'false'),
(1534, 'mainland', 1521, ',1409,1521,1534,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1535, 'mainland', NULL, ',1535,', 1, '山东省', NULL, NULL, NULL, NULL, 'false'),
(1536, 'mainland', 1535, ',1535,1536,', 2, '济南市', NULL, NULL, NULL, NULL, 'false'),
(1537, 'mainland', 1536, ',1535,1536,1537,', 3, '历下区', NULL, NULL, NULL, NULL, 'false'),
(1538, 'mainland', 1536, ',1535,1536,1538,', 3, '市中区', NULL, NULL, NULL, NULL, 'false'),
(1539, 'mainland', 1536, ',1535,1536,1539,', 3, '槐荫区', NULL, NULL, NULL, NULL, 'false'),
(1540, 'mainland', 1536, ',1535,1536,1540,', 3, '天桥区', NULL, NULL, NULL, NULL, 'false'),
(1541, 'mainland', 1536, ',1535,1536,1541,', 3, '历城区', NULL, NULL, NULL, NULL, 'false'),
(1542, 'mainland', 1536, ',1535,1536,1542,', 3, '长清区', NULL, NULL, NULL, NULL, 'false'),
(1543, 'mainland', 1536, ',1535,1536,1543,', 3, '平阴县', NULL, NULL, NULL, NULL, 'false'),
(1544, 'mainland', 1536, ',1535,1536,1544,', 3, '济阳县', NULL, NULL, NULL, NULL, 'false'),
(1545, 'mainland', 1536, ',1535,1536,1545,', 3, '商河县', NULL, NULL, NULL, NULL, 'false'),
(1546, 'mainland', 1536, ',1535,1536,1546,', 3, '章丘市', NULL, NULL, NULL, NULL, 'false'),
(1547, 'mainland', 1536, ',1535,1536,1547,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1548, 'mainland', 1535, ',1535,1548,', 2, '青岛市', NULL, NULL, NULL, NULL, 'false'),
(1549, 'mainland', 1548, ',1535,1548,1549,', 3, '市南区', NULL, NULL, NULL, NULL, 'false'),
(1550, 'mainland', 1548, ',1535,1548,1550,', 3, '市北区', NULL, NULL, NULL, NULL, 'false'),
(1551, 'mainland', 1548, ',1535,1548,1551,', 3, '四方区', NULL, NULL, NULL, NULL, 'false'),
(1552, 'mainland', 1548, ',1535,1548,1552,', 3, '黄岛区', NULL, NULL, NULL, NULL, 'false'),
(1553, 'mainland', 1548, ',1535,1548,1553,', 3, '崂山区', NULL, NULL, NULL, NULL, 'false'),
(1554, 'mainland', 1548, ',1535,1548,1554,', 3, '李沧区', NULL, NULL, NULL, NULL, 'false'),
(1555, 'mainland', 1548, ',1535,1548,1555,', 3, '城阳区', NULL, NULL, NULL, NULL, 'false'),
(1556, 'mainland', 1548, ',1535,1548,1556,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(1557, 'mainland', 1548, ',1535,1548,1557,', 3, '胶州市', NULL, NULL, NULL, NULL, 'false'),
(1558, 'mainland', 1548, ',1535,1548,1558,', 3, '即墨市', NULL, NULL, NULL, NULL, 'false'),
(1559, 'mainland', 1548, ',1535,1548,1559,', 3, '平度市', NULL, NULL, NULL, NULL, 'false'),
(1560, 'mainland', 1548, ',1535,1548,1560,', 3, '胶南市', NULL, NULL, NULL, NULL, 'false'),
(1561, 'mainland', 1548, ',1535,1548,1561,', 3, '莱西市', NULL, NULL, NULL, NULL, 'false'),
(1562, 'mainland', 1548, ',1535,1548,1562,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1563, 'mainland', 1535, ',1535,1563,', 2, '淄博市', NULL, NULL, NULL, NULL, 'false'),
(1564, 'mainland', 1563, ',1535,1563,1564,', 3, '淄川区', NULL, NULL, NULL, NULL, 'false'),
(1565, 'mainland', 1563, ',1535,1563,1565,', 3, '张店区', NULL, NULL, NULL, NULL, 'false'),
(1566, 'mainland', 1563, ',1535,1563,1566,', 3, '博山区', NULL, NULL, NULL, NULL, 'false'),
(1567, 'mainland', 1563, ',1535,1563,1567,', 3, '临淄区', NULL, NULL, NULL, NULL, 'false'),
(1568, 'mainland', 1563, ',1535,1563,1568,', 3, '周村区', NULL, NULL, NULL, NULL, 'false'),
(1569, 'mainland', 1563, ',1535,1563,1569,', 3, '桓台县', NULL, NULL, NULL, NULL, 'false'),
(1570, 'mainland', 1563, ',1535,1563,1570,', 3, '高青县', NULL, NULL, NULL, NULL, 'false'),
(1571, 'mainland', 1563, ',1535,1563,1571,', 3, '沂源县', NULL, NULL, NULL, NULL, 'false'),
(1572, 'mainland', 1563, ',1535,1563,1572,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1573, 'mainland', 1535, ',1535,1573,', 2, '枣庄市', NULL, NULL, NULL, NULL, 'false'),
(1574, 'mainland', 1573, ',1535,1573,1574,', 3, '市中区', NULL, NULL, NULL, NULL, 'false'),
(1575, 'mainland', 1573, ',1535,1573,1575,', 3, '薛城区', NULL, NULL, NULL, NULL, 'false'),
(1576, 'mainland', 1573, ',1535,1573,1576,', 3, '峄城区', NULL, NULL, NULL, NULL, 'false'),
(1577, 'mainland', 1573, ',1535,1573,1577,', 3, '台儿庄区', NULL, NULL, NULL, NULL, 'false'),
(1578, 'mainland', 1573, ',1535,1573,1578,', 3, '山亭区', NULL, NULL, NULL, NULL, 'false'),
(1579, 'mainland', 1573, ',1535,1573,1579,', 3, '滕州市', NULL, NULL, NULL, NULL, 'false'),
(1580, 'mainland', 1573, ',1535,1573,1580,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1581, 'mainland', 1535, ',1535,1581,', 2, '东营市', NULL, NULL, NULL, NULL, 'false'),
(1582, 'mainland', 1581, ',1535,1581,1582,', 3, '东营区', NULL, NULL, NULL, NULL, 'false'),
(1583, 'mainland', 1581, ',1535,1581,1583,', 3, '河口区', NULL, NULL, NULL, NULL, 'false'),
(1584, 'mainland', 1581, ',1535,1581,1584,', 3, '垦利县', NULL, NULL, NULL, NULL, 'false'),
(1585, 'mainland', 1581, ',1535,1581,1585,', 3, '利津县', NULL, NULL, NULL, NULL, 'false'),
(1586, 'mainland', 1581, ',1535,1581,1586,', 3, '广饶县', NULL, NULL, NULL, NULL, 'false'),
(1587, 'mainland', 1581, ',1535,1581,1587,', 3, '西城区', NULL, NULL, NULL, NULL, 'false'),
(1588, 'mainland', 1581, ',1535,1581,1588,', 3, '东城区', NULL, NULL, NULL, NULL, 'false'),
(1589, 'mainland', 1581, ',1535,1581,1589,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1590, 'mainland', 1535, ',1535,1590,', 2, '烟台市', NULL, NULL, NULL, NULL, 'false'),
(1591, 'mainland', 1590, ',1535,1590,1591,', 3, '芝罘区', NULL, NULL, NULL, NULL, 'false'),
(1592, 'mainland', 1590, ',1535,1590,1592,', 3, '福山区', NULL, NULL, NULL, NULL, 'false'),
(1593, 'mainland', 1590, ',1535,1590,1593,', 3, '牟平区', NULL, NULL, NULL, NULL, 'false'),
(1594, 'mainland', 1590, ',1535,1590,1594,', 3, '莱山区', NULL, NULL, NULL, NULL, 'false'),
(1595, 'mainland', 1590, ',1535,1590,1595,', 3, '长岛县', NULL, NULL, NULL, NULL, 'false'),
(1596, 'mainland', 1590, ',1535,1590,1596,', 3, '龙口市', NULL, NULL, NULL, NULL, 'false'),
(1597, 'mainland', 1590, ',1535,1590,1597,', 3, '莱阳市', NULL, NULL, NULL, NULL, 'false'),
(1598, 'mainland', 1590, ',1535,1590,1598,', 3, '莱州市', NULL, NULL, NULL, NULL, 'false'),
(1599, 'mainland', 1590, ',1535,1590,1599,', 3, '蓬莱市', NULL, NULL, NULL, NULL, 'false'),
(1600, 'mainland', 1590, ',1535,1590,1600,', 3, '招远市', NULL, NULL, NULL, NULL, 'false'),
(1601, 'mainland', 1590, ',1535,1590,1601,', 3, '栖霞市', NULL, NULL, NULL, NULL, 'false'),
(1602, 'mainland', 1590, ',1535,1590,1602,', 3, '海阳市', NULL, NULL, NULL, NULL, 'false'),
(1603, 'mainland', 1590, ',1535,1590,1603,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1604, 'mainland', 1535, ',1535,1604,', 2, '潍坊市', NULL, NULL, NULL, NULL, 'false'),
(1605, 'mainland', 1604, ',1535,1604,1605,', 3, '潍城区', NULL, NULL, NULL, NULL, 'false'),
(1606, 'mainland', 1604, ',1535,1604,1606,', 3, '寒亭区', NULL, NULL, NULL, NULL, 'false'),
(1607, 'mainland', 1604, ',1535,1604,1607,', 3, '坊子区', NULL, NULL, NULL, NULL, 'false'),
(1608, 'mainland', 1604, ',1535,1604,1608,', 3, '奎文区', NULL, NULL, NULL, NULL, 'false'),
(1609, 'mainland', 1604, ',1535,1604,1609,', 3, '临朐县', NULL, NULL, NULL, NULL, 'false'),
(1610, 'mainland', 1604, ',1535,1604,1610,', 3, '昌乐县', NULL, NULL, NULL, NULL, 'false'),
(1611, 'mainland', 1604, ',1535,1604,1611,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(1612, 'mainland', 1604, ',1535,1604,1612,', 3, '青州市', NULL, NULL, NULL, NULL, 'false'),
(1613, 'mainland', 1604, ',1535,1604,1613,', 3, '诸城市', NULL, NULL, NULL, NULL, 'false'),
(1614, 'mainland', 1604, ',1535,1604,1614,', 3, '寿光市', NULL, NULL, NULL, NULL, 'false'),
(1615, 'mainland', 1604, ',1535,1604,1615,', 3, '安丘市', NULL, NULL, NULL, NULL, 'false'),
(1616, 'mainland', 1604, ',1535,1604,1616,', 3, '高密市', NULL, NULL, NULL, NULL, 'false'),
(1617, 'mainland', 1604, ',1535,1604,1617,', 3, '昌邑市', NULL, NULL, NULL, NULL, 'false'),
(1618, 'mainland', 1604, ',1535,1604,1618,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1619, 'mainland', 1535, ',1535,1619,', 2, '济宁市', NULL, NULL, NULL, NULL, 'false'),
(1620, 'mainland', 1619, ',1535,1619,1620,', 3, '市中区', NULL, NULL, NULL, NULL, 'false'),
(1621, 'mainland', 1619, ',1535,1619,1621,', 3, '任城区', NULL, NULL, NULL, NULL, 'false'),
(1622, 'mainland', 1619, ',1535,1619,1622,', 3, '微山县', NULL, NULL, NULL, NULL, 'false'),
(1623, 'mainland', 1619, ',1535,1619,1623,', 3, '鱼台县', NULL, NULL, NULL, NULL, 'false'),
(1624, 'mainland', 1619, ',1535,1619,1624,', 3, '金乡县', NULL, NULL, NULL, NULL, 'false'),
(1625, 'mainland', 1619, ',1535,1619,1625,', 3, '嘉祥县', NULL, NULL, NULL, NULL, 'false'),
(1626, 'mainland', 1619, ',1535,1619,1626,', 3, '汶上县', NULL, NULL, NULL, NULL, 'false'),
(1627, 'mainland', 1619, ',1535,1619,1627,', 3, '泗水县', NULL, NULL, NULL, NULL, 'false'),
(1628, 'mainland', 1619, ',1535,1619,1628,', 3, '梁山县', NULL, NULL, NULL, NULL, 'false'),
(1629, 'mainland', 1619, ',1535,1619,1629,', 3, '曲阜市', NULL, NULL, NULL, NULL, 'false'),
(1630, 'mainland', 1619, ',1535,1619,1630,', 3, '兖州市', NULL, NULL, NULL, NULL, 'false'),
(1631, 'mainland', 1619, ',1535,1619,1631,', 3, '邹城市', NULL, NULL, NULL, NULL, 'false'),
(1632, 'mainland', 1619, ',1535,1619,1632,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1633, 'mainland', 1535, ',1535,1633,', 2, '泰安市', NULL, NULL, NULL, NULL, 'false'),
(1634, 'mainland', 1633, ',1535,1633,1634,', 3, '泰山区', NULL, NULL, NULL, NULL, 'false'),
(1635, 'mainland', 1633, ',1535,1633,1635,', 3, '岱岳区', NULL, NULL, NULL, NULL, 'false'),
(1636, 'mainland', 1633, ',1535,1633,1636,', 3, '宁阳县', NULL, NULL, NULL, NULL, 'false'),
(1637, 'mainland', 1633, ',1535,1633,1637,', 3, '东平县', NULL, NULL, NULL, NULL, 'false'),
(1638, 'mainland', 1633, ',1535,1633,1638,', 3, '新泰市', NULL, NULL, NULL, NULL, 'false'),
(1639, 'mainland', 1633, ',1535,1633,1639,', 3, '肥城市', NULL, NULL, NULL, NULL, 'false'),
(1640, 'mainland', 1633, ',1535,1633,1640,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1641, 'mainland', 1535, ',1535,1641,', 2, '威海市', NULL, NULL, NULL, NULL, 'false'),
(1642, 'mainland', 1641, ',1535,1641,1642,', 3, '环翠区', NULL, NULL, NULL, NULL, 'false'),
(1643, 'mainland', 1641, ',1535,1641,1643,', 3, '文登市', NULL, NULL, NULL, NULL, 'false'),
(1644, 'mainland', 1641, ',1535,1641,1644,', 3, '荣成市', NULL, NULL, NULL, NULL, 'false'),
(1645, 'mainland', 1641, ',1535,1641,1645,', 3, '乳山市', NULL, NULL, NULL, NULL, 'false'),
(1646, 'mainland', 1641, ',1535,1641,1646,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1647, 'mainland', 1535, ',1535,1647,', 2, '日照市', NULL, NULL, NULL, NULL, 'false'),
(1648, 'mainland', 1647, ',1535,1647,1648,', 3, '东港区', NULL, NULL, NULL, NULL, 'false'),
(1649, 'mainland', 1647, ',1535,1647,1649,', 3, '岚山区', NULL, NULL, NULL, NULL, 'false'),
(1650, 'mainland', 1647, ',1535,1647,1650,', 3, '五莲县', NULL, NULL, NULL, NULL, 'false'),
(1651, 'mainland', 1647, ',1535,1647,1651,', 3, '莒县', NULL, NULL, NULL, NULL, 'false'),
(1652, 'mainland', 1647, ',1535,1647,1652,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1653, 'mainland', 1535, ',1535,1653,', 2, '莱芜市', NULL, NULL, NULL, NULL, 'false'),
(1654, 'mainland', 1653, ',1535,1653,1654,', 3, '莱城区', NULL, NULL, NULL, NULL, 'false'),
(1655, 'mainland', 1653, ',1535,1653,1655,', 3, '钢城区', NULL, NULL, NULL, NULL, 'false'),
(1656, 'mainland', 1653, ',1535,1653,1656,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1657, 'mainland', 1535, ',1535,1657,', 2, '临沂市', NULL, NULL, NULL, NULL, 'false'),
(1658, 'mainland', 1657, ',1535,1657,1658,', 3, '兰山区', NULL, NULL, NULL, NULL, 'false'),
(1659, 'mainland', 1657, ',1535,1657,1659,', 3, '罗庄区', NULL, NULL, NULL, NULL, 'false'),
(1660, 'mainland', 1657, ',1535,1657,1660,', 3, '河东区', NULL, NULL, NULL, NULL, 'false'),
(1661, 'mainland', 1657, ',1535,1657,1661,', 3, '沂南县', NULL, NULL, NULL, NULL, 'false'),
(1662, 'mainland', 1657, ',1535,1657,1662,', 3, '郯城县', NULL, NULL, NULL, NULL, 'false'),
(1663, 'mainland', 1657, ',1535,1657,1663,', 3, '沂水县', NULL, NULL, NULL, NULL, 'false'),
(1664, 'mainland', 1657, ',1535,1657,1664,', 3, '苍山县', NULL, NULL, NULL, NULL, 'false'),
(1665, 'mainland', 1657, ',1535,1657,1665,', 3, '费县', NULL, NULL, NULL, NULL, 'false'),
(1666, 'mainland', 1657, ',1535,1657,1666,', 3, '平邑县', NULL, NULL, NULL, NULL, 'false');
INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(1667, 'mainland', 1657, ',1535,1657,1667,', 3, '莒南县', NULL, NULL, NULL, NULL, 'false'),
(1668, 'mainland', 1657, ',1535,1657,1668,', 3, '蒙阴县', NULL, NULL, NULL, NULL, 'false'),
(1669, 'mainland', 1657, ',1535,1657,1669,', 3, '临沭县', NULL, NULL, NULL, NULL, 'false'),
(1670, 'mainland', 1657, ',1535,1657,1670,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1671, 'mainland', 1535, ',1535,1671,', 2, '德州市', NULL, NULL, NULL, NULL, 'false'),
(1672, 'mainland', 1671, ',1535,1671,1672,', 3, '德城区', NULL, NULL, NULL, NULL, 'false'),
(1673, 'mainland', 1671, ',1535,1671,1673,', 3, '陵县', NULL, NULL, NULL, NULL, 'false'),
(1674, 'mainland', 1671, ',1535,1671,1674,', 3, '宁津县', NULL, NULL, NULL, NULL, 'false'),
(1675, 'mainland', 1671, ',1535,1671,1675,', 3, '庆云县', NULL, NULL, NULL, NULL, 'false'),
(1676, 'mainland', 1671, ',1535,1671,1676,', 3, '临邑县', NULL, NULL, NULL, NULL, 'false'),
(1677, 'mainland', 1671, ',1535,1671,1677,', 3, '齐河县', NULL, NULL, NULL, NULL, 'false'),
(1678, 'mainland', 1671, ',1535,1671,1678,', 3, '平原县', NULL, NULL, NULL, NULL, 'false'),
(1679, 'mainland', 1671, ',1535,1671,1679,', 3, '夏津县', NULL, NULL, NULL, NULL, 'false'),
(1680, 'mainland', 1671, ',1535,1671,1680,', 3, '武城县', NULL, NULL, NULL, NULL, 'false'),
(1681, 'mainland', 1671, ',1535,1671,1681,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(1682, 'mainland', 1671, ',1535,1671,1682,', 3, '乐陵市', NULL, NULL, NULL, NULL, 'false'),
(1683, 'mainland', 1671, ',1535,1671,1683,', 3, '禹城市', NULL, NULL, NULL, NULL, 'false'),
(1684, 'mainland', 1671, ',1535,1671,1684,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1685, 'mainland', 1535, ',1535,1685,', 2, '聊城市', NULL, NULL, NULL, NULL, 'false'),
(1686, 'mainland', 1685, ',1535,1685,1686,', 3, '东昌府区', NULL, NULL, NULL, NULL, 'false'),
(1687, 'mainland', 1685, ',1535,1685,1687,', 3, '阳谷县', NULL, NULL, NULL, NULL, 'false'),
(1688, 'mainland', 1685, ',1535,1685,1688,', 3, '莘县', NULL, NULL, NULL, NULL, 'false'),
(1689, 'mainland', 1685, ',1535,1685,1689,', 3, '茌平县', NULL, NULL, NULL, NULL, 'false'),
(1690, 'mainland', 1685, ',1535,1685,1690,', 3, '东阿县', NULL, NULL, NULL, NULL, 'false'),
(1691, 'mainland', 1685, ',1535,1685,1691,', 3, '冠县', NULL, NULL, NULL, NULL, 'false'),
(1692, 'mainland', 1685, ',1535,1685,1692,', 3, '高唐县', NULL, NULL, NULL, NULL, 'false'),
(1693, 'mainland', 1685, ',1535,1685,1693,', 3, '临清市', NULL, NULL, NULL, NULL, 'false'),
(1694, 'mainland', 1685, ',1535,1685,1694,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1695, 'mainland', 1535, ',1535,1695,', 2, '滨州市', NULL, NULL, NULL, NULL, 'false'),
(1696, 'mainland', 1695, ',1535,1695,1696,', 3, '滨城区', NULL, NULL, NULL, NULL, 'false'),
(1697, 'mainland', 1695, ',1535,1695,1697,', 3, '惠民县', NULL, NULL, NULL, NULL, 'false'),
(1698, 'mainland', 1695, ',1535,1695,1698,', 3, '阳信县', NULL, NULL, NULL, NULL, 'false'),
(1699, 'mainland', 1695, ',1535,1695,1699,', 3, '无棣县', NULL, NULL, NULL, NULL, 'false'),
(1700, 'mainland', 1695, ',1535,1695,1700,', 3, '沾化县', NULL, NULL, NULL, NULL, 'false'),
(1701, 'mainland', 1695, ',1535,1695,1701,', 3, '博兴县', NULL, NULL, NULL, NULL, 'false'),
(1702, 'mainland', 1695, ',1535,1695,1702,', 3, '邹平县', NULL, NULL, NULL, NULL, 'false'),
(1703, 'mainland', 1695, ',1535,1695,1703,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1704, 'mainland', 1535, ',1535,1704,', 2, '菏泽市', NULL, NULL, NULL, NULL, 'false'),
(1705, 'mainland', 1704, ',1535,1704,1705,', 3, '牡丹区', NULL, NULL, NULL, NULL, 'false'),
(1706, 'mainland', 1704, ',1535,1704,1706,', 3, '曹县', NULL, NULL, NULL, NULL, 'false'),
(1707, 'mainland', 1704, ',1535,1704,1707,', 3, '单县', NULL, NULL, NULL, NULL, 'false'),
(1708, 'mainland', 1704, ',1535,1704,1708,', 3, '成武县', NULL, NULL, NULL, NULL, 'false'),
(1709, 'mainland', 1704, ',1535,1704,1709,', 3, '巨野县', NULL, NULL, NULL, NULL, 'false'),
(1710, 'mainland', 1704, ',1535,1704,1710,', 3, '郓城县', NULL, NULL, NULL, NULL, 'false'),
(1711, 'mainland', 1704, ',1535,1704,1711,', 3, '鄄城县', NULL, NULL, NULL, NULL, 'false'),
(1712, 'mainland', 1704, ',1535,1704,1712,', 3, '定陶县', NULL, NULL, NULL, NULL, 'false'),
(1713, 'mainland', 1704, ',1535,1704,1713,', 3, '东明县', NULL, NULL, NULL, NULL, 'false'),
(1714, 'mainland', 1704, ',1535,1704,1714,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1715, 'mainland', NULL, ',1715,', 1, '河南省', NULL, NULL, NULL, NULL, 'false'),
(1716, 'mainland', 1715, ',1715,1716,', 2, '郑州市', NULL, NULL, NULL, NULL, 'false'),
(1717, 'mainland', 1716, ',1715,1716,1717,', 3, '中原区', NULL, NULL, NULL, NULL, 'false'),
(1718, 'mainland', 1716, ',1715,1716,1718,', 3, '二七区', NULL, NULL, NULL, NULL, 'false'),
(1719, 'mainland', 1716, ',1715,1716,1719,', 3, '管城回族区', NULL, NULL, NULL, NULL, 'false'),
(1720, 'mainland', 1716, ',1715,1716,1720,', 3, '金水区', NULL, NULL, NULL, NULL, 'false'),
(1721, 'mainland', 1716, ',1715,1716,1721,', 3, '上街区', NULL, NULL, NULL, NULL, 'false'),
(1722, 'mainland', 1716, ',1715,1716,1722,', 3, '惠济区', NULL, NULL, NULL, NULL, 'false'),
(1723, 'mainland', 1716, ',1715,1716,1723,', 3, '中牟县', NULL, NULL, NULL, NULL, 'false'),
(1724, 'mainland', 1716, ',1715,1716,1724,', 3, '巩义市', NULL, NULL, NULL, NULL, 'false'),
(1725, 'mainland', 1716, ',1715,1716,1725,', 3, '荥阳市', NULL, NULL, NULL, NULL, 'false'),
(1726, 'mainland', 1716, ',1715,1716,1726,', 3, '新密市', NULL, NULL, NULL, NULL, 'false'),
(1727, 'mainland', 1716, ',1715,1716,1727,', 3, '新郑市', NULL, NULL, NULL, NULL, 'false'),
(1728, 'mainland', 1716, ',1715,1716,1728,', 3, '登封市', NULL, NULL, NULL, NULL, 'false'),
(1729, 'mainland', 1716, ',1715,1716,1729,', 3, '郑东新区', NULL, NULL, NULL, NULL, 'false'),
(1730, 'mainland', 1716, ',1715,1716,1730,', 3, '高新区', NULL, NULL, NULL, NULL, 'false'),
(1731, 'mainland', 1716, ',1715,1716,1731,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1732, 'mainland', 1715, ',1715,1732,', 2, '开封市', NULL, NULL, NULL, NULL, 'false'),
(1733, 'mainland', 1732, ',1715,1732,1733,', 3, '龙亭区', NULL, NULL, NULL, NULL, 'false'),
(1734, 'mainland', 1732, ',1715,1732,1734,', 3, '顺河回族区', NULL, NULL, NULL, NULL, 'false'),
(1735, 'mainland', 1732, ',1715,1732,1735,', 3, '鼓楼区', NULL, NULL, NULL, NULL, 'false'),
(1736, 'mainland', 1732, ',1715,1732,1736,', 3, '禹王台区', NULL, NULL, NULL, NULL, 'false'),
(1737, 'mainland', 1732, ',1715,1732,1737,', 3, '金明区', NULL, NULL, NULL, NULL, 'false'),
(1738, 'mainland', 1732, ',1715,1732,1738,', 3, '杞县', NULL, NULL, NULL, NULL, 'false'),
(1739, 'mainland', 1732, ',1715,1732,1739,', 3, '通许县', NULL, NULL, NULL, NULL, 'false'),
(1740, 'mainland', 1732, ',1715,1732,1740,', 3, '尉氏县', NULL, NULL, NULL, NULL, 'false'),
(1741, 'mainland', 1732, ',1715,1732,1741,', 3, '开封县', NULL, NULL, NULL, NULL, 'false'),
(1742, 'mainland', 1732, ',1715,1732,1742,', 3, '兰考县', NULL, NULL, NULL, NULL, 'false'),
(1743, 'mainland', 1732, ',1715,1732,1743,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1744, 'mainland', 1715, ',1715,1744,', 2, '洛阳市', NULL, NULL, NULL, NULL, 'false'),
(1745, 'mainland', 1744, ',1715,1744,1745,', 3, '老城区', NULL, NULL, NULL, NULL, 'false'),
(1746, 'mainland', 1744, ',1715,1744,1746,', 3, '西工区', NULL, NULL, NULL, NULL, 'false'),
(1747, 'mainland', 1744, ',1715,1744,1747,', 3, '廛河回族区', NULL, NULL, NULL, NULL, 'false'),
(1748, 'mainland', 1744, ',1715,1744,1748,', 3, '涧西区', NULL, NULL, NULL, NULL, 'false'),
(1749, 'mainland', 1744, ',1715,1744,1749,', 3, '吉利区', NULL, NULL, NULL, NULL, 'false'),
(1750, 'mainland', 1744, ',1715,1744,1750,', 3, '洛龙区', NULL, NULL, NULL, NULL, 'false'),
(1751, 'mainland', 1744, ',1715,1744,1751,', 3, '孟津县', NULL, NULL, NULL, NULL, 'false'),
(1752, 'mainland', 1744, ',1715,1744,1752,', 3, '新安县', NULL, NULL, NULL, NULL, 'false'),
(1753, 'mainland', 1744, ',1715,1744,1753,', 3, '栾川县', NULL, NULL, NULL, NULL, 'false'),
(1754, 'mainland', 1744, ',1715,1744,1754,', 3, '嵩县', NULL, NULL, NULL, NULL, 'false'),
(1755, 'mainland', 1744, ',1715,1744,1755,', 3, '汝阳县', NULL, NULL, NULL, NULL, 'false'),
(1756, 'mainland', 1744, ',1715,1744,1756,', 3, '宜阳县', NULL, NULL, NULL, NULL, 'false'),
(1757, 'mainland', 1744, ',1715,1744,1757,', 3, '洛宁县', NULL, NULL, NULL, NULL, 'false'),
(1758, 'mainland', 1744, ',1715,1744,1758,', 3, '伊川县', NULL, NULL, NULL, NULL, 'false'),
(1759, 'mainland', 1744, ',1715,1744,1759,', 3, '偃师市', NULL, NULL, NULL, NULL, 'false'),
(1760, 'mainland', 1744, ',1715,1744,1760,', 3, '高新区', NULL, NULL, NULL, NULL, 'false'),
(1761, 'mainland', 1744, ',1715,1744,1761,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1762, 'mainland', 1715, ',1715,1762,', 2, '平顶山市', NULL, NULL, NULL, NULL, 'false'),
(1763, 'mainland', 1762, ',1715,1762,1763,', 3, '新华区', NULL, NULL, NULL, NULL, 'false'),
(1764, 'mainland', 1762, ',1715,1762,1764,', 3, '卫东区', NULL, NULL, NULL, NULL, 'false'),
(1765, 'mainland', 1762, ',1715,1762,1765,', 3, '石龙区', NULL, NULL, NULL, NULL, 'false'),
(1766, 'mainland', 1762, ',1715,1762,1766,', 3, '湛河区', NULL, NULL, NULL, NULL, 'false'),
(1767, 'mainland', 1762, ',1715,1762,1767,', 3, '宝丰县', NULL, NULL, NULL, NULL, 'false'),
(1768, 'mainland', 1762, ',1715,1762,1768,', 3, '叶县', NULL, NULL, NULL, NULL, 'false'),
(1769, 'mainland', 1762, ',1715,1762,1769,', 3, '鲁山县', NULL, NULL, NULL, NULL, 'false'),
(1770, 'mainland', 1762, ',1715,1762,1770,', 3, '郏县', NULL, NULL, NULL, NULL, 'false'),
(1771, 'mainland', 1762, ',1715,1762,1771,', 3, '舞钢市', NULL, NULL, NULL, NULL, 'false'),
(1772, 'mainland', 1762, ',1715,1762,1772,', 3, '汝州市', NULL, NULL, NULL, NULL, 'false'),
(1773, 'mainland', 1762, ',1715,1762,1773,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1774, 'mainland', 1715, ',1715,1774,', 2, '安阳市', NULL, NULL, NULL, NULL, 'false'),
(1775, 'mainland', 1774, ',1715,1774,1775,', 3, '文峰区', NULL, NULL, NULL, NULL, 'false'),
(1776, 'mainland', 1774, ',1715,1774,1776,', 3, '北关区', NULL, NULL, NULL, NULL, 'false'),
(1777, 'mainland', 1774, ',1715,1774,1777,', 3, '殷都区', NULL, NULL, NULL, NULL, 'false'),
(1778, 'mainland', 1774, ',1715,1774,1778,', 3, '龙安区', NULL, NULL, NULL, NULL, 'false'),
(1779, 'mainland', 1774, ',1715,1774,1779,', 3, '安阳县', NULL, NULL, NULL, NULL, 'false'),
(1780, 'mainland', 1774, ',1715,1774,1780,', 3, '汤阴县', NULL, NULL, NULL, NULL, 'false'),
(1781, 'mainland', 1774, ',1715,1774,1781,', 3, '滑县', NULL, NULL, NULL, NULL, 'false'),
(1782, 'mainland', 1774, ',1715,1774,1782,', 3, '内黄县', NULL, NULL, NULL, NULL, 'false'),
(1783, 'mainland', 1774, ',1715,1774,1783,', 3, '林州市', NULL, NULL, NULL, NULL, 'false'),
(1784, 'mainland', 1774, ',1715,1774,1784,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1785, 'mainland', 1715, ',1715,1785,', 2, '鹤壁市', NULL, NULL, NULL, NULL, 'false'),
(1786, 'mainland', 1785, ',1715,1785,1786,', 3, '鹤山区', NULL, NULL, NULL, NULL, 'false'),
(1787, 'mainland', 1785, ',1715,1785,1787,', 3, '山城区', NULL, NULL, NULL, NULL, 'false'),
(1788, 'mainland', 1785, ',1715,1785,1788,', 3, '淇滨区', NULL, NULL, NULL, NULL, 'false'),
(1789, 'mainland', 1785, ',1715,1785,1789,', 3, '浚县', NULL, NULL, NULL, NULL, 'false'),
(1790, 'mainland', 1785, ',1715,1785,1790,', 3, '淇县', NULL, NULL, NULL, NULL, 'false'),
(1791, 'mainland', 1785, ',1715,1785,1791,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1792, 'mainland', 1715, ',1715,1792,', 2, '新乡市', NULL, NULL, NULL, NULL, 'false'),
(1793, 'mainland', 1792, ',1715,1792,1793,', 3, '红旗区', NULL, NULL, NULL, NULL, 'false'),
(1794, 'mainland', 1792, ',1715,1792,1794,', 3, '卫滨区', NULL, NULL, NULL, NULL, 'false'),
(1795, 'mainland', 1792, ',1715,1792,1795,', 3, '凤泉区', NULL, NULL, NULL, NULL, 'false'),
(1796, 'mainland', 1792, ',1715,1792,1796,', 3, '牧野区', NULL, NULL, NULL, NULL, 'false'),
(1797, 'mainland', 1792, ',1715,1792,1797,', 3, '新乡县', NULL, NULL, NULL, NULL, 'false'),
(1798, 'mainland', 1792, ',1715,1792,1798,', 3, '获嘉县', NULL, NULL, NULL, NULL, 'false'),
(1799, 'mainland', 1792, ',1715,1792,1799,', 3, '原阳县', NULL, NULL, NULL, NULL, 'false'),
(1800, 'mainland', 1792, ',1715,1792,1800,', 3, '延津县', NULL, NULL, NULL, NULL, 'false'),
(1801, 'mainland', 1792, ',1715,1792,1801,', 3, '封丘县', NULL, NULL, NULL, NULL, 'false'),
(1802, 'mainland', 1792, ',1715,1792,1802,', 3, '长垣县', NULL, NULL, NULL, NULL, 'false'),
(1803, 'mainland', 1792, ',1715,1792,1803,', 3, '卫辉市', NULL, NULL, NULL, NULL, 'false'),
(1804, 'mainland', 1792, ',1715,1792,1804,', 3, '辉县市', NULL, NULL, NULL, NULL, 'false'),
(1805, 'mainland', 1792, ',1715,1792,1805,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1806, 'mainland', 1715, ',1715,1806,', 2, '焦作市', NULL, NULL, NULL, NULL, 'false'),
(1807, 'mainland', 1806, ',1715,1806,1807,', 3, '解放区', NULL, NULL, NULL, NULL, 'false'),
(1808, 'mainland', 1806, ',1715,1806,1808,', 3, '中站区', NULL, NULL, NULL, NULL, 'false'),
(1809, 'mainland', 1806, ',1715,1806,1809,', 3, '马村区', NULL, NULL, NULL, NULL, 'false'),
(1810, 'mainland', 1806, ',1715,1806,1810,', 3, '山阳区', NULL, NULL, NULL, NULL, 'false'),
(1811, 'mainland', 1806, ',1715,1806,1811,', 3, '修武县', NULL, NULL, NULL, NULL, 'false'),
(1812, 'mainland', 1806, ',1715,1806,1812,', 3, '博爱县', NULL, NULL, NULL, NULL, 'false'),
(1813, 'mainland', 1806, ',1715,1806,1813,', 3, '武陟县', NULL, NULL, NULL, NULL, 'false'),
(1814, 'mainland', 1806, ',1715,1806,1814,', 3, '温县', NULL, NULL, NULL, NULL, 'false'),
(1815, 'mainland', 1806, ',1715,1806,1815,', 3, '沁阳市', NULL, NULL, NULL, NULL, 'false'),
(1816, 'mainland', 1806, ',1715,1806,1816,', 3, '孟州市', NULL, NULL, NULL, NULL, 'false'),
(1817, 'mainland', 1806, ',1715,1806,1817,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1818, 'mainland', 1715, ',1715,1818,', 2, '济源市', NULL, NULL, NULL, NULL, 'false'),
(1819, 'mainland', 1715, ',1715,1819,', 2, '濮阳市', NULL, NULL, NULL, NULL, 'false'),
(1820, 'mainland', 1819, ',1715,1819,1820,', 3, '华龙区', NULL, NULL, NULL, NULL, 'false'),
(1821, 'mainland', 1819, ',1715,1819,1821,', 3, '清丰县', NULL, NULL, NULL, NULL, 'false'),
(1822, 'mainland', 1819, ',1715,1819,1822,', 3, '南乐县', NULL, NULL, NULL, NULL, 'false'),
(1823, 'mainland', 1819, ',1715,1819,1823,', 3, '范县', NULL, NULL, NULL, NULL, 'false'),
(1824, 'mainland', 1819, ',1715,1819,1824,', 3, '台前县', NULL, NULL, NULL, NULL, 'false'),
(1825, 'mainland', 1819, ',1715,1819,1825,', 3, '濮阳县', NULL, NULL, NULL, NULL, 'false'),
(1826, 'mainland', 1819, ',1715,1819,1826,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1827, 'mainland', 1715, ',1715,1827,', 2, '许昌市', NULL, NULL, NULL, NULL, 'false'),
(1828, 'mainland', 1827, ',1715,1827,1828,', 3, '魏都区', NULL, NULL, NULL, NULL, 'false'),
(1829, 'mainland', 1827, ',1715,1827,1829,', 3, '许昌县', NULL, NULL, NULL, NULL, 'false'),
(1830, 'mainland', 1827, ',1715,1827,1830,', 3, '鄢陵县', NULL, NULL, NULL, NULL, 'false'),
(1831, 'mainland', 1827, ',1715,1827,1831,', 3, '襄城县', NULL, NULL, NULL, NULL, 'false'),
(1832, 'mainland', 1827, ',1715,1827,1832,', 3, '禹州市', NULL, NULL, NULL, NULL, 'false'),
(1833, 'mainland', 1827, ',1715,1827,1833,', 3, '长葛市', NULL, NULL, NULL, NULL, 'false'),
(1834, 'mainland', 1827, ',1715,1827,1834,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1835, 'mainland', 1715, ',1715,1835,', 2, '漯河市', NULL, NULL, NULL, NULL, 'false'),
(1836, 'mainland', 1835, ',1715,1835,1836,', 3, '源汇区', NULL, NULL, NULL, NULL, 'false'),
(1837, 'mainland', 1835, ',1715,1835,1837,', 3, '郾城区', NULL, NULL, NULL, NULL, 'false'),
(1838, 'mainland', 1835, ',1715,1835,1838,', 3, '召陵区', NULL, NULL, NULL, NULL, 'false'),
(1839, 'mainland', 1835, ',1715,1835,1839,', 3, '舞阳县', NULL, NULL, NULL, NULL, 'false'),
(1840, 'mainland', 1835, ',1715,1835,1840,', 3, '临颍县', NULL, NULL, NULL, NULL, 'false'),
(1841, 'mainland', 1835, ',1715,1835,1841,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1842, 'mainland', 1715, ',1715,1842,', 2, '三门峡市', NULL, NULL, NULL, NULL, 'false'),
(1843, 'mainland', 1842, ',1715,1842,1843,', 3, '湖滨区', NULL, NULL, NULL, NULL, 'false'),
(1844, 'mainland', 1842, ',1715,1842,1844,', 3, '渑池县', NULL, NULL, NULL, NULL, 'false'),
(1845, 'mainland', 1842, ',1715,1842,1845,', 3, '陕县', NULL, NULL, NULL, NULL, 'false'),
(1846, 'mainland', 1842, ',1715,1842,1846,', 3, '卢氏县', NULL, NULL, NULL, NULL, 'false'),
(1847, 'mainland', 1842, ',1715,1842,1847,', 3, '义马市', NULL, NULL, NULL, NULL, 'false'),
(1848, 'mainland', 1842, ',1715,1842,1848,', 3, '灵宝市', NULL, NULL, NULL, NULL, 'false'),
(1849, 'mainland', 1842, ',1715,1842,1849,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1850, 'mainland', 1715, ',1715,1850,', 2, '南阳市', NULL, NULL, NULL, NULL, 'false'),
(1851, 'mainland', 1850, ',1715,1850,1851,', 3, '宛城区', NULL, NULL, NULL, NULL, 'false'),
(1852, 'mainland', 1850, ',1715,1850,1852,', 3, '卧龙区', NULL, NULL, NULL, NULL, 'false'),
(1853, 'mainland', 1850, ',1715,1850,1853,', 3, '南召县', NULL, NULL, NULL, NULL, 'false'),
(1854, 'mainland', 1850, ',1715,1850,1854,', 3, '方城县', NULL, NULL, NULL, NULL, 'false'),
(1855, 'mainland', 1850, ',1715,1850,1855,', 3, '西峡县', NULL, NULL, NULL, NULL, 'false'),
(1856, 'mainland', 1850, ',1715,1850,1856,', 3, '镇平县', NULL, NULL, NULL, NULL, 'false'),
(1857, 'mainland', 1850, ',1715,1850,1857,', 3, '内乡县', NULL, NULL, NULL, NULL, 'false'),
(1858, 'mainland', 1850, ',1715,1850,1858,', 3, '淅川县', NULL, NULL, NULL, NULL, 'false'),
(1859, 'mainland', 1850, ',1715,1850,1859,', 3, '社旗县', NULL, NULL, NULL, NULL, 'false'),
(1860, 'mainland', 1850, ',1715,1850,1860,', 3, '唐河县', NULL, NULL, NULL, NULL, 'false'),
(1861, 'mainland', 1850, ',1715,1850,1861,', 3, '新野县', NULL, NULL, NULL, NULL, 'false'),
(1862, 'mainland', 1850, ',1715,1850,1862,', 3, '桐柏县', NULL, NULL, NULL, NULL, 'false'),
(1863, 'mainland', 1850, ',1715,1850,1863,', 3, '邓州市', NULL, NULL, NULL, NULL, 'false'),
(1864, 'mainland', 1850, ',1715,1850,1864,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1865, 'mainland', 1715, ',1715,1865,', 2, '商丘市', NULL, NULL, NULL, NULL, 'false'),
(1866, 'mainland', 1865, ',1715,1865,1866,', 3, '梁园区', NULL, NULL, NULL, NULL, 'false'),
(1867, 'mainland', 1865, ',1715,1865,1867,', 3, '睢阳区', NULL, NULL, NULL, NULL, 'false'),
(1868, 'mainland', 1865, ',1715,1865,1868,', 3, '民权县', NULL, NULL, NULL, NULL, 'false'),
(1869, 'mainland', 1865, ',1715,1865,1869,', 3, '睢县', NULL, NULL, NULL, NULL, 'false'),
(1870, 'mainland', 1865, ',1715,1865,1870,', 3, '宁陵县', NULL, NULL, NULL, NULL, 'false'),
(1871, 'mainland', 1865, ',1715,1865,1871,', 3, '柘城县', NULL, NULL, NULL, NULL, 'false'),
(1872, 'mainland', 1865, ',1715,1865,1872,', 3, '虞城县', NULL, NULL, NULL, NULL, 'false'),
(1873, 'mainland', 1865, ',1715,1865,1873,', 3, '夏邑县', NULL, NULL, NULL, NULL, 'false'),
(1874, 'mainland', 1865, ',1715,1865,1874,', 3, '永城市', NULL, NULL, NULL, NULL, 'false'),
(1875, 'mainland', 1865, ',1715,1865,1875,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1876, 'mainland', 1715, ',1715,1876,', 2, '信阳市', NULL, NULL, NULL, NULL, 'false'),
(1877, 'mainland', 1876, ',1715,1876,1877,', 3, '浉河区', NULL, NULL, NULL, NULL, 'false'),
(1878, 'mainland', 1876, ',1715,1876,1878,', 3, '平桥区', NULL, NULL, NULL, NULL, 'false'),
(1879, 'mainland', 1876, ',1715,1876,1879,', 3, '罗山县', NULL, NULL, NULL, NULL, 'false'),
(1880, 'mainland', 1876, ',1715,1876,1880,', 3, '光山县', NULL, NULL, NULL, NULL, 'false'),
(1881, 'mainland', 1876, ',1715,1876,1881,', 3, '新县', NULL, NULL, NULL, NULL, 'false'),
(1882, 'mainland', 1876, ',1715,1876,1882,', 3, '商城县', NULL, NULL, NULL, NULL, 'false'),
(1883, 'mainland', 1876, ',1715,1876,1883,', 3, '固始县', NULL, NULL, NULL, NULL, 'false'),
(1884, 'mainland', 1876, ',1715,1876,1884,', 3, '潢川县', NULL, NULL, NULL, NULL, 'false'),
(1885, 'mainland', 1876, ',1715,1876,1885,', 3, '淮滨县', NULL, NULL, NULL, NULL, 'false'),
(1886, 'mainland', 1876, ',1715,1876,1886,', 3, '息县', NULL, NULL, NULL, NULL, 'false'),
(1887, 'mainland', 1876, ',1715,1876,1887,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1888, 'mainland', 1715, ',1715,1888,', 2, '周口市', NULL, NULL, NULL, NULL, 'false'),
(1889, 'mainland', 1888, ',1715,1888,1889,', 3, '川汇区', NULL, NULL, NULL, NULL, 'false'),
(1890, 'mainland', 1888, ',1715,1888,1890,', 3, '扶沟县', NULL, NULL, NULL, NULL, 'false'),
(1891, 'mainland', 1888, ',1715,1888,1891,', 3, '西华县', NULL, NULL, NULL, NULL, 'false'),
(1892, 'mainland', 1888, ',1715,1888,1892,', 3, '商水县', NULL, NULL, NULL, NULL, 'false'),
(1893, 'mainland', 1888, ',1715,1888,1893,', 3, '沈丘县', NULL, NULL, NULL, NULL, 'false'),
(1894, 'mainland', 1888, ',1715,1888,1894,', 3, '郸城县', NULL, NULL, NULL, NULL, 'false'),
(1895, 'mainland', 1888, ',1715,1888,1895,', 3, '淮阳县', NULL, NULL, NULL, NULL, 'false'),
(1896, 'mainland', 1888, ',1715,1888,1896,', 3, '太康县', NULL, NULL, NULL, NULL, 'false'),
(1897, 'mainland', 1888, ',1715,1888,1897,', 3, '鹿邑县', NULL, NULL, NULL, NULL, 'false'),
(1898, 'mainland', 1888, ',1715,1888,1898,', 3, '项城市', NULL, NULL, NULL, NULL, 'false'),
(1899, 'mainland', 1888, ',1715,1888,1899,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1900, 'mainland', 1715, ',1715,1900,', 2, '驻马店市', NULL, NULL, NULL, NULL, 'false'),
(1901, 'mainland', 1900, ',1715,1900,1901,', 3, '驿城区', NULL, NULL, NULL, NULL, 'false'),
(1902, 'mainland', 1900, ',1715,1900,1902,', 3, '西平县', NULL, NULL, NULL, NULL, 'false'),
(1903, 'mainland', 1900, ',1715,1900,1903,', 3, '上蔡县', NULL, NULL, NULL, NULL, 'false'),
(1904, 'mainland', 1900, ',1715,1900,1904,', 3, '平舆县', NULL, NULL, NULL, NULL, 'false'),
(1905, 'mainland', 1900, ',1715,1900,1905,', 3, '正阳县', NULL, NULL, NULL, NULL, 'false'),
(1906, 'mainland', 1900, ',1715,1900,1906,', 3, '确山县', NULL, NULL, NULL, NULL, 'false'),
(1907, 'mainland', 1900, ',1715,1900,1907,', 3, '泌阳县', NULL, NULL, NULL, NULL, 'false'),
(1908, 'mainland', 1900, ',1715,1900,1908,', 3, '汝南县', NULL, NULL, NULL, NULL, 'false'),
(1909, 'mainland', 1900, ',1715,1900,1909,', 3, '遂平县', NULL, NULL, NULL, NULL, 'false'),
(1910, 'mainland', 1900, ',1715,1900,1910,', 3, '新蔡县', NULL, NULL, NULL, NULL, 'false'),
(1911, 'mainland', 1900, ',1715,1900,1911,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1912, 'mainland', NULL, ',1912,', 1, '湖北省', NULL, NULL, NULL, NULL, 'false'),
(1913, 'mainland', 1912, ',1912,1913,', 2, '武汉市', NULL, NULL, NULL, NULL, 'false'),
(1914, 'mainland', 1913, ',1912,1913,1914,', 3, '江岸区', NULL, NULL, NULL, NULL, 'false'),
(1915, 'mainland', 1913, ',1912,1913,1915,', 3, '江汉区', NULL, NULL, NULL, NULL, 'false'),
(1916, 'mainland', 1913, ',1912,1913,1916,', 3, '硚口区', NULL, NULL, NULL, NULL, 'false'),
(1917, 'mainland', 1913, ',1912,1913,1917,', 3, '汉阳区', NULL, NULL, NULL, NULL, 'false'),
(1918, 'mainland', 1913, ',1912,1913,1918,', 3, '武昌区', NULL, NULL, NULL, NULL, 'false'),
(1919, 'mainland', 1913, ',1912,1913,1919,', 3, '青山区', NULL, NULL, NULL, NULL, 'false'),
(1920, 'mainland', 1913, ',1912,1913,1920,', 3, '洪山区', NULL, NULL, NULL, NULL, 'false'),
(1921, 'mainland', 1913, ',1912,1913,1921,', 3, '东西湖区', NULL, NULL, NULL, NULL, 'false'),
(1922, 'mainland', 1913, ',1912,1913,1922,', 3, '汉南区', NULL, NULL, NULL, NULL, 'false'),
(1923, 'mainland', 1913, ',1912,1913,1923,', 3, '蔡甸区', NULL, NULL, NULL, NULL, 'false'),
(1924, 'mainland', 1913, ',1912,1913,1924,', 3, '江夏区', NULL, NULL, NULL, NULL, 'false'),
(1925, 'mainland', 1913, ',1912,1913,1925,', 3, '黄陂区', NULL, NULL, NULL, NULL, 'false'),
(1926, 'mainland', 1913, ',1912,1913,1926,', 3, '新洲区', NULL, NULL, NULL, NULL, 'false'),
(1927, 'mainland', 1913, ',1912,1913,1927,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1928, 'mainland', 1912, ',1912,1928,', 2, '黄石市', NULL, NULL, NULL, NULL, 'false'),
(1929, 'mainland', 1928, ',1912,1928,1929,', 3, '黄石港区', NULL, NULL, NULL, NULL, 'false'),
(1930, 'mainland', 1928, ',1912,1928,1930,', 3, '西塞山区', NULL, NULL, NULL, NULL, 'false'),
(1931, 'mainland', 1928, ',1912,1928,1931,', 3, '下陆区', NULL, NULL, NULL, NULL, 'false'),
(1932, 'mainland', 1928, ',1912,1928,1932,', 3, '铁山区', NULL, NULL, NULL, NULL, 'false'),
(1933, 'mainland', 1928, ',1912,1928,1933,', 3, '阳新县', NULL, NULL, NULL, NULL, 'false'),
(1934, 'mainland', 1928, ',1912,1928,1934,', 3, '大冶市', NULL, NULL, NULL, NULL, 'false'),
(1935, 'mainland', 1928, ',1912,1928,1935,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1936, 'mainland', 1912, ',1912,1936,', 2, '十堰市', NULL, NULL, NULL, NULL, 'false'),
(1937, 'mainland', 1936, ',1912,1936,1937,', 3, '茅箭区', NULL, NULL, NULL, NULL, 'false'),
(1938, 'mainland', 1936, ',1912,1936,1938,', 3, '张湾区', NULL, NULL, NULL, NULL, 'false'),
(1939, 'mainland', 1936, ',1912,1936,1939,', 3, '郧县', NULL, NULL, NULL, NULL, 'false'),
(1940, 'mainland', 1936, ',1912,1936,1940,', 3, '郧西县', NULL, NULL, NULL, NULL, 'false'),
(1941, 'mainland', 1936, ',1912,1936,1941,', 3, '竹山县', NULL, NULL, NULL, NULL, 'false'),
(1942, 'mainland', 1936, ',1912,1936,1942,', 3, '竹溪县', NULL, NULL, NULL, NULL, 'false'),
(1943, 'mainland', 1936, ',1912,1936,1943,', 3, '房县', NULL, NULL, NULL, NULL, 'false'),
(1944, 'mainland', 1936, ',1912,1936,1944,', 3, '丹江口市', NULL, NULL, NULL, NULL, 'false'),
(1945, 'mainland', 1936, ',1912,1936,1945,', 3, '城区', NULL, NULL, NULL, NULL, 'false'),
(1946, 'mainland', 1936, ',1912,1936,1946,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1947, 'mainland', 1912, ',1912,1947,', 2, '宜昌市', NULL, NULL, NULL, NULL, 'false'),
(1948, 'mainland', 1947, ',1912,1947,1948,', 3, '西陵区', NULL, NULL, NULL, NULL, 'false'),
(1949, 'mainland', 1947, ',1912,1947,1949,', 3, '伍家岗区', NULL, NULL, NULL, NULL, 'false'),
(1950, 'mainland', 1947, ',1912,1947,1950,', 3, '点军区', NULL, NULL, NULL, NULL, 'false'),
(1951, 'mainland', 1947, ',1912,1947,1951,', 3, '猇亭区', NULL, NULL, NULL, NULL, 'false'),
(1952, 'mainland', 1947, ',1912,1947,1952,', 3, '夷陵区', NULL, NULL, NULL, NULL, 'false'),
(1953, 'mainland', 1947, ',1912,1947,1953,', 3, '远安县', NULL, NULL, NULL, NULL, 'false'),
(1954, 'mainland', 1947, ',1912,1947,1954,', 3, '兴山县', NULL, NULL, NULL, NULL, 'false'),
(1955, 'mainland', 1947, ',1912,1947,1955,', 3, '秭归县', NULL, NULL, NULL, NULL, 'false'),
(1956, 'mainland', 1947, ',1912,1947,1956,', 3, '长阳土家族自治县', NULL, NULL, NULL, NULL, 'false'),
(1957, 'mainland', 1947, ',1912,1947,1957,', 3, '五峰土家族自治县', NULL, NULL, NULL, NULL, 'false'),
(1958, 'mainland', 1947, ',1912,1947,1958,', 3, '葛洲坝区', NULL, NULL, NULL, NULL, 'false'),
(1959, 'mainland', 1947, ',1912,1947,1959,', 3, '开发区', NULL, NULL, NULL, NULL, 'false'),
(1960, 'mainland', 1947, ',1912,1947,1960,', 3, '宜都市', NULL, NULL, NULL, NULL, 'false'),
(1961, 'mainland', 1947, ',1912,1947,1961,', 3, '当阳市', NULL, NULL, NULL, NULL, 'false'),
(1962, 'mainland', 1947, ',1912,1947,1962,', 3, '枝江市', NULL, NULL, NULL, NULL, 'false'),
(1963, 'mainland', 1947, ',1912,1947,1963,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1964, 'mainland', 1912, ',1912,1964,', 2, '襄阳市', NULL, NULL, NULL, NULL, 'false'),
(1965, 'mainland', 1964, ',1912,1964,1965,', 3, '襄城区', NULL, NULL, NULL, NULL, 'false'),
(1966, 'mainland', 1964, ',1912,1964,1966,', 3, '樊城区', NULL, NULL, NULL, NULL, 'false'),
(1967, 'mainland', 1964, ',1912,1964,1967,', 3, '襄州区', NULL, NULL, NULL, NULL, 'false'),
(1968, 'mainland', 1964, ',1912,1964,1968,', 3, '南漳县', NULL, NULL, NULL, NULL, 'false'),
(1969, 'mainland', 1964, ',1912,1964,1969,', 3, '谷城县', NULL, NULL, NULL, NULL, 'false'),
(1970, 'mainland', 1964, ',1912,1964,1970,', 3, '保康县', NULL, NULL, NULL, NULL, 'false'),
(1971, 'mainland', 1964, ',1912,1964,1971,', 3, '老河口市', NULL, NULL, NULL, NULL, 'false'),
(1972, 'mainland', 1964, ',1912,1964,1972,', 3, '枣阳市', NULL, NULL, NULL, NULL, 'false'),
(1973, 'mainland', 1964, ',1912,1964,1973,', 3, '宜城市', NULL, NULL, NULL, NULL, 'false'),
(1974, 'mainland', 1964, ',1912,1964,1974,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1975, 'mainland', 1912, ',1912,1975,', 2, '鄂州市', NULL, NULL, NULL, NULL, 'false'),
(1976, 'mainland', 1975, ',1912,1975,1976,', 3, '梁子湖区', NULL, NULL, NULL, NULL, 'false'),
(1977, 'mainland', 1975, ',1912,1975,1977,', 3, '华容区', NULL, NULL, NULL, NULL, 'false'),
(1978, 'mainland', 1975, ',1912,1975,1978,', 3, '鄂城区', NULL, NULL, NULL, NULL, 'false'),
(1979, 'mainland', 1975, ',1912,1975,1979,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1980, 'mainland', 1912, ',1912,1980,', 2, '荆门市', NULL, NULL, NULL, NULL, 'false'),
(1981, 'mainland', 1980, ',1912,1980,1981,', 3, '东宝区', NULL, NULL, NULL, NULL, 'false'),
(1982, 'mainland', 1980, ',1912,1980,1982,', 3, '掇刀区', NULL, NULL, NULL, NULL, 'false'),
(1983, 'mainland', 1980, ',1912,1980,1983,', 3, '京山县', NULL, NULL, NULL, NULL, 'false'),
(1984, 'mainland', 1980, ',1912,1980,1984,', 3, '沙洋县', NULL, NULL, NULL, NULL, 'false'),
(1985, 'mainland', 1980, ',1912,1980,1985,', 3, '钟祥市', NULL, NULL, NULL, NULL, 'false'),
(1986, 'mainland', 1980, ',1912,1980,1986,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1987, 'mainland', 1912, ',1912,1987,', 2, '孝感市', NULL, NULL, NULL, NULL, 'false'),
(1988, 'mainland', 1987, ',1912,1987,1988,', 3, '孝南区', NULL, NULL, NULL, NULL, 'false'),
(1989, 'mainland', 1987, ',1912,1987,1989,', 3, '孝昌县', NULL, NULL, NULL, NULL, 'false'),
(1990, 'mainland', 1987, ',1912,1987,1990,', 3, '大悟县', NULL, NULL, NULL, NULL, 'false'),
(1991, 'mainland', 1987, ',1912,1987,1991,', 3, '云梦县', NULL, NULL, NULL, NULL, 'false'),
(1992, 'mainland', 1987, ',1912,1987,1992,', 3, '应城市', NULL, NULL, NULL, NULL, 'false'),
(1993, 'mainland', 1987, ',1912,1987,1993,', 3, '安陆市', NULL, NULL, NULL, NULL, 'false'),
(1994, 'mainland', 1987, ',1912,1987,1994,', 3, '汉川市', NULL, NULL, NULL, NULL, 'false'),
(1995, 'mainland', 1987, ',1912,1987,1995,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(1996, 'mainland', 1912, ',1912,1996,', 2, '荆州市', NULL, NULL, NULL, NULL, 'false'),
(1997, 'mainland', 1996, ',1912,1996,1997,', 3, '沙市区', NULL, NULL, NULL, NULL, 'false'),
(1998, 'mainland', 1996, ',1912,1996,1998,', 3, '荆州区', NULL, NULL, NULL, NULL, 'false'),
(1999, 'mainland', 1996, ',1912,1996,1999,', 3, '公安县', NULL, NULL, NULL, NULL, 'false'),
(2000, 'mainland', 1996, ',1912,1996,2000,', 3, '监利县', NULL, NULL, NULL, NULL, 'false'),
(2001, 'mainland', 1996, ',1912,1996,2001,', 3, '江陵县', NULL, NULL, NULL, NULL, 'false'),
(2002, 'mainland', 1996, ',1912,1996,2002,', 3, '石首市', NULL, NULL, NULL, NULL, 'false'),
(2003, 'mainland', 1996, ',1912,1996,2003,', 3, '洪湖市', NULL, NULL, NULL, NULL, 'false'),
(2004, 'mainland', 1996, ',1912,1996,2004,', 3, '松滋市', NULL, NULL, NULL, NULL, 'false'),
(2005, 'mainland', 1996, ',1912,1996,2005,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2006, 'mainland', 1912, ',1912,2006,', 2, '黄冈市', NULL, NULL, NULL, NULL, 'false'),
(2007, 'mainland', 2006, ',1912,2006,2007,', 3, '黄州区', NULL, NULL, NULL, NULL, 'false'),
(2008, 'mainland', 2006, ',1912,2006,2008,', 3, '团风县', NULL, NULL, NULL, NULL, 'false'),
(2009, 'mainland', 2006, ',1912,2006,2009,', 3, '红安县', NULL, NULL, NULL, NULL, 'false'),
(2010, 'mainland', 2006, ',1912,2006,2010,', 3, '罗田县', NULL, NULL, NULL, NULL, 'false'),
(2011, 'mainland', 2006, ',1912,2006,2011,', 3, '英山县', NULL, NULL, NULL, NULL, 'false'),
(2012, 'mainland', 2006, ',1912,2006,2012,', 3, '浠水县', NULL, NULL, NULL, NULL, 'false'),
(2013, 'mainland', 2006, ',1912,2006,2013,', 3, '蕲春县', NULL, NULL, NULL, NULL, 'false'),
(2014, 'mainland', 2006, ',1912,2006,2014,', 3, '黄梅县', NULL, NULL, NULL, NULL, 'false'),
(2015, 'mainland', 2006, ',1912,2006,2015,', 3, '麻城市', NULL, NULL, NULL, NULL, 'false'),
(2016, 'mainland', 2006, ',1912,2006,2016,', 3, '武穴市', NULL, NULL, NULL, NULL, 'false'),
(2017, 'mainland', 2006, ',1912,2006,2017,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2018, 'mainland', 1912, ',1912,2018,', 2, '咸宁市', NULL, NULL, NULL, NULL, 'false'),
(2019, 'mainland', 2018, ',1912,2018,2019,', 3, '咸安区', NULL, NULL, NULL, NULL, 'false'),
(2020, 'mainland', 2018, ',1912,2018,2020,', 3, '嘉鱼县', NULL, NULL, NULL, NULL, 'false'),
(2021, 'mainland', 2018, ',1912,2018,2021,', 3, '通城县', NULL, NULL, NULL, NULL, 'false'),
(2022, 'mainland', 2018, ',1912,2018,2022,', 3, '崇阳县', NULL, NULL, NULL, NULL, 'false'),
(2023, 'mainland', 2018, ',1912,2018,2023,', 3, '通山县', NULL, NULL, NULL, NULL, 'false'),
(2024, 'mainland', 2018, ',1912,2018,2024,', 3, '赤壁市', NULL, NULL, NULL, NULL, 'false'),
(2025, 'mainland', 2018, ',1912,2018,2025,', 3, '温泉城区', NULL, NULL, NULL, NULL, 'false'),
(2026, 'mainland', 2018, ',1912,2018,2026,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2027, 'mainland', 1912, ',1912,2027,', 2, '随州市', NULL, NULL, NULL, NULL, 'false'),
(2028, 'mainland', 2027, ',1912,2027,2028,', 3, '曾都区', NULL, NULL, NULL, NULL, 'false'),
(2029, 'mainland', 2027, ',1912,2027,2029,', 3, '随县', NULL, NULL, NULL, NULL, 'false'),
(2030, 'mainland', 2027, ',1912,2027,2030,', 3, '广水市', NULL, NULL, NULL, NULL, 'false'),
(2031, 'mainland', 2027, ',1912,2027,2031,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2032, 'mainland', 1912, ',1912,2032,', 2, '恩施土家族苗族自治州', NULL, NULL, NULL, NULL, 'false'),
(2033, 'mainland', 2032, ',1912,2032,2033,', 3, '恩施市', NULL, NULL, NULL, NULL, 'false'),
(2034, 'mainland', 2032, ',1912,2032,2034,', 3, '利川市', NULL, NULL, NULL, NULL, 'false'),
(2035, 'mainland', 2032, ',1912,2032,2035,', 3, '建始县', NULL, NULL, NULL, NULL, 'false'),
(2036, 'mainland', 2032, ',1912,2032,2036,', 3, '巴东县', NULL, NULL, NULL, NULL, 'false'),
(2037, 'mainland', 2032, ',1912,2032,2037,', 3, '宣恩县', NULL, NULL, NULL, NULL, 'false'),
(2038, 'mainland', 2032, ',1912,2032,2038,', 3, '咸丰县', NULL, NULL, NULL, NULL, 'false'),
(2039, 'mainland', 2032, ',1912,2032,2039,', 3, '来凤县', NULL, NULL, NULL, NULL, 'false'),
(2040, 'mainland', 2032, ',1912,2032,2040,', 3, '鹤峰县', NULL, NULL, NULL, NULL, 'false'),
(2041, 'mainland', 2032, ',1912,2032,2041,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2042, 'mainland', 1912, ',1912,2042,', 2, '仙桃市', NULL, NULL, NULL, NULL, 'false'),
(2043, 'mainland', 1912, ',1912,2043,', 2, '潜江市', NULL, NULL, NULL, NULL, 'false'),
(2044, 'mainland', 1912, ',1912,2044,', 2, '天门市', NULL, NULL, NULL, NULL, 'false'),
(2045, 'mainland', 1912, ',1912,2045,', 2, '神农架林区', NULL, NULL, NULL, NULL, 'false'),
(2046, 'mainland', NULL, ',2046,', 1, '湖南省', NULL, NULL, NULL, NULL, 'false'),
(2047, 'mainland', 2046, ',2046,2047,', 2, '长沙市', NULL, NULL, NULL, NULL, 'false'),
(2048, 'mainland', 2047, ',2046,2047,2048,', 3, '芙蓉区', NULL, NULL, NULL, NULL, 'false'),
(2049, 'mainland', 2047, ',2046,2047,2049,', 3, '天心区', NULL, NULL, NULL, NULL, 'false'),
(2050, 'mainland', 2047, ',2046,2047,2050,', 3, '岳麓区', NULL, NULL, NULL, NULL, 'false'),
(2051, 'mainland', 2047, ',2046,2047,2051,', 3, '开福区', NULL, NULL, NULL, NULL, 'false'),
(2052, 'mainland', 2047, ',2046,2047,2052,', 3, '雨花区', NULL, NULL, NULL, NULL, 'false'),
(2053, 'mainland', 2047, ',2046,2047,2053,', 3, '长沙县', NULL, NULL, NULL, NULL, 'false'),
(2054, 'mainland', 2047, ',2046,2047,2054,', 3, '望城县', NULL, NULL, NULL, NULL, 'false'),
(2055, 'mainland', 2047, ',2046,2047,2055,', 3, '宁乡县', NULL, NULL, NULL, NULL, 'false'),
(2056, 'mainland', 2047, ',2046,2047,2056,', 3, '浏阳市', NULL, NULL, NULL, NULL, 'false'),
(2057, 'mainland', 2047, ',2046,2047,2057,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2058, 'mainland', 2046, ',2046,2058,', 2, '株洲市', NULL, NULL, NULL, NULL, 'false'),
(2059, 'mainland', 2058, ',2046,2058,2059,', 3, '荷塘区', NULL, NULL, NULL, NULL, 'false'),
(2060, 'mainland', 2058, ',2046,2058,2060,', 3, '芦淞区', NULL, NULL, NULL, NULL, 'false'),
(2061, 'mainland', 2058, ',2046,2058,2061,', 3, '石峰区', NULL, NULL, NULL, NULL, 'false'),
(2062, 'mainland', 2058, ',2046,2058,2062,', 3, '天元区', NULL, NULL, NULL, NULL, 'false'),
(2063, 'mainland', 2058, ',2046,2058,2063,', 3, '株洲县', NULL, NULL, NULL, NULL, 'false'),
(2064, 'mainland', 2058, ',2046,2058,2064,', 3, '攸县', NULL, NULL, NULL, NULL, 'false'),
(2065, 'mainland', 2058, ',2046,2058,2065,', 3, '茶陵县', NULL, NULL, NULL, NULL, 'false'),
(2066, 'mainland', 2058, ',2046,2058,2066,', 3, '炎陵县', NULL, NULL, NULL, NULL, 'false'),
(2067, 'mainland', 2058, ',2046,2058,2067,', 3, '醴陵市', NULL, NULL, NULL, NULL, 'false'),
(2068, 'mainland', 2058, ',2046,2058,2068,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2069, 'mainland', 2046, ',2046,2069,', 2, '湘潭市', NULL, NULL, NULL, NULL, 'false'),
(2070, 'mainland', 2069, ',2046,2069,2070,', 3, '雨湖区', NULL, NULL, NULL, NULL, 'false'),
(2071, 'mainland', 2069, ',2046,2069,2071,', 3, '岳塘区', NULL, NULL, NULL, NULL, 'false'),
(2072, 'mainland', 2069, ',2046,2069,2072,', 3, '湘潭县', NULL, NULL, NULL, NULL, 'false'),
(2073, 'mainland', 2069, ',2046,2069,2073,', 3, '湘乡市', NULL, NULL, NULL, NULL, 'false'),
(2074, 'mainland', 2069, ',2046,2069,2074,', 3, '韶山市', NULL, NULL, NULL, NULL, 'false'),
(2075, 'mainland', 2069, ',2046,2069,2075,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2076, 'mainland', 2046, ',2046,2076,', 2, '衡阳市', NULL, NULL, NULL, NULL, 'false'),
(2077, 'mainland', 2076, ',2046,2076,2077,', 3, '珠晖区', NULL, NULL, NULL, NULL, 'false'),
(2078, 'mainland', 2076, ',2046,2076,2078,', 3, '雁峰区', NULL, NULL, NULL, NULL, 'false'),
(2079, 'mainland', 2076, ',2046,2076,2079,', 3, '石鼓区', NULL, NULL, NULL, NULL, 'false'),
(2080, 'mainland', 2076, ',2046,2076,2080,', 3, '蒸湘区', NULL, NULL, NULL, NULL, 'false'),
(2081, 'mainland', 2076, ',2046,2076,2081,', 3, '南岳区', NULL, NULL, NULL, NULL, 'false'),
(2082, 'mainland', 2076, ',2046,2076,2082,', 3, '衡阳县', NULL, NULL, NULL, NULL, 'false'),
(2083, 'mainland', 2076, ',2046,2076,2083,', 3, '衡南县', NULL, NULL, NULL, NULL, 'false'),
(2084, 'mainland', 2076, ',2046,2076,2084,', 3, '衡山县', NULL, NULL, NULL, NULL, 'false'),
(2085, 'mainland', 2076, ',2046,2076,2085,', 3, '衡东县', NULL, NULL, NULL, NULL, 'false'),
(2086, 'mainland', 2076, ',2046,2076,2086,', 3, '祁东县', NULL, NULL, NULL, NULL, 'false'),
(2087, 'mainland', 2076, ',2046,2076,2087,', 3, '耒阳市', NULL, NULL, NULL, NULL, 'false'),
(2088, 'mainland', 2076, ',2046,2076,2088,', 3, '常宁市', NULL, NULL, NULL, NULL, 'false'),
(2089, 'mainland', 2076, ',2046,2076,2089,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2090, 'mainland', 2046, ',2046,2090,', 2, '邵阳市', NULL, NULL, NULL, NULL, 'false'),
(2091, 'mainland', 2090, ',2046,2090,2091,', 3, '双清区', NULL, NULL, NULL, NULL, 'false'),
(2092, 'mainland', 2090, ',2046,2090,2092,', 3, '大祥区', NULL, NULL, NULL, NULL, 'false'),
(2093, 'mainland', 2090, ',2046,2090,2093,', 3, '北塔区', NULL, NULL, NULL, NULL, 'false'),
(2094, 'mainland', 2090, ',2046,2090,2094,', 3, '邵东县', NULL, NULL, NULL, NULL, 'false'),
(2095, 'mainland', 2090, ',2046,2090,2095,', 3, '新邵县', NULL, NULL, NULL, NULL, 'false'),
(2096, 'mainland', 2090, ',2046,2090,2096,', 3, '邵阳县', NULL, NULL, NULL, NULL, 'false'),
(2097, 'mainland', 2090, ',2046,2090,2097,', 3, '隆回县', NULL, NULL, NULL, NULL, 'false'),
(2098, 'mainland', 2090, ',2046,2090,2098,', 3, '洞口县', NULL, NULL, NULL, NULL, 'false'),
(2099, 'mainland', 2090, ',2046,2090,2099,', 3, '绥宁县', NULL, NULL, NULL, NULL, 'false'),
(2100, 'mainland', 2090, ',2046,2090,2100,', 3, '新宁县', NULL, NULL, NULL, NULL, 'false'),
(2101, 'mainland', 2090, ',2046,2090,2101,', 3, '城步苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2102, 'mainland', 2090, ',2046,2090,2102,', 3, '武冈市', NULL, NULL, NULL, NULL, 'false'),
(2103, 'mainland', 2090, ',2046,2090,2103,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2104, 'mainland', 2046, ',2046,2104,', 2, '岳阳市', NULL, NULL, NULL, NULL, 'false'),
(2105, 'mainland', 2104, ',2046,2104,2105,', 3, '岳阳楼区', NULL, NULL, NULL, NULL, 'false'),
(2106, 'mainland', 2104, ',2046,2104,2106,', 3, '云溪区', NULL, NULL, NULL, NULL, 'false'),
(2107, 'mainland', 2104, ',2046,2104,2107,', 3, '君山区', NULL, NULL, NULL, NULL, 'false'),
(2108, 'mainland', 2104, ',2046,2104,2108,', 3, '岳阳县', NULL, NULL, NULL, NULL, 'false'),
(2109, 'mainland', 2104, ',2046,2104,2109,', 3, '华容县', NULL, NULL, NULL, NULL, 'false'),
(2110, 'mainland', 2104, ',2046,2104,2110,', 3, '湘阴县', NULL, NULL, NULL, NULL, 'false'),
(2111, 'mainland', 2104, ',2046,2104,2111,', 3, '平江县', NULL, NULL, NULL, NULL, 'false'),
(2112, 'mainland', 2104, ',2046,2104,2112,', 3, '汨罗市', NULL, NULL, NULL, NULL, 'false'),
(2113, 'mainland', 2104, ',2046,2104,2113,', 3, '临湘市', NULL, NULL, NULL, NULL, 'false'),
(2114, 'mainland', 2104, ',2046,2104,2114,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2115, 'mainland', 2046, ',2046,2115,', 2, '常德市', NULL, NULL, NULL, NULL, 'false'),
(2116, 'mainland', 2115, ',2046,2115,2116,', 3, '武陵区', NULL, NULL, NULL, NULL, 'false'),
(2117, 'mainland', 2115, ',2046,2115,2117,', 3, '鼎城区', NULL, NULL, NULL, NULL, 'false'),
(2118, 'mainland', 2115, ',2046,2115,2118,', 3, '安乡县', NULL, NULL, NULL, NULL, 'false'),
(2119, 'mainland', 2115, ',2046,2115,2119,', 3, '汉寿县', NULL, NULL, NULL, NULL, 'false'),
(2120, 'mainland', 2115, ',2046,2115,2120,', 3, '澧县', NULL, NULL, NULL, NULL, 'false'),
(2121, 'mainland', 2115, ',2046,2115,2121,', 3, '临澧县', NULL, NULL, NULL, NULL, 'false'),
(2122, 'mainland', 2115, ',2046,2115,2122,', 3, '桃源县', NULL, NULL, NULL, NULL, 'false'),
(2123, 'mainland', 2115, ',2046,2115,2123,', 3, '石门县', NULL, NULL, NULL, NULL, 'false'),
(2124, 'mainland', 2115, ',2046,2115,2124,', 3, '津市市', NULL, NULL, NULL, NULL, 'false'),
(2125, 'mainland', 2115, ',2046,2115,2125,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2126, 'mainland', 2046, ',2046,2126,', 2, '张家界市', NULL, NULL, NULL, NULL, 'false'),
(2127, 'mainland', 2126, ',2046,2126,2127,', 3, '永定区', NULL, NULL, NULL, NULL, 'false'),
(2128, 'mainland', 2126, ',2046,2126,2128,', 3, '武陵源区', NULL, NULL, NULL, NULL, 'false'),
(2129, 'mainland', 2126, ',2046,2126,2129,', 3, '慈利县', NULL, NULL, NULL, NULL, 'false'),
(2130, 'mainland', 2126, ',2046,2126,2130,', 3, '桑植县', NULL, NULL, NULL, NULL, 'false'),
(2131, 'mainland', 2126, ',2046,2126,2131,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2132, 'mainland', 2046, ',2046,2132,', 2, '益阳市', NULL, NULL, NULL, NULL, 'false'),
(2133, 'mainland', 2132, ',2046,2132,2133,', 3, '资阳区', NULL, NULL, NULL, NULL, 'false'),
(2134, 'mainland', 2132, ',2046,2132,2134,', 3, '赫山区', NULL, NULL, NULL, NULL, 'false'),
(2135, 'mainland', 2132, ',2046,2132,2135,', 3, '南县', NULL, NULL, NULL, NULL, 'false'),
(2136, 'mainland', 2132, ',2046,2132,2136,', 3, '桃江县', NULL, NULL, NULL, NULL, 'false'),
(2137, 'mainland', 2132, ',2046,2132,2137,', 3, '安化县', NULL, NULL, NULL, NULL, 'false'),
(2138, 'mainland', 2132, ',2046,2132,2138,', 3, '沅江市', NULL, NULL, NULL, NULL, 'false'),
(2139, 'mainland', 2132, ',2046,2132,2139,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2140, 'mainland', 2046, ',2046,2140,', 2, '郴州市', NULL, NULL, NULL, NULL, 'false'),
(2141, 'mainland', 2140, ',2046,2140,2141,', 3, '北湖区', NULL, NULL, NULL, NULL, 'false'),
(2142, 'mainland', 2140, ',2046,2140,2142,', 3, '苏仙区', NULL, NULL, NULL, NULL, 'false'),
(2143, 'mainland', 2140, ',2046,2140,2143,', 3, '桂阳县', NULL, NULL, NULL, NULL, 'false'),
(2144, 'mainland', 2140, ',2046,2140,2144,', 3, '宜章县', NULL, NULL, NULL, NULL, 'false'),
(2145, 'mainland', 2140, ',2046,2140,2145,', 3, '永兴县', NULL, NULL, NULL, NULL, 'false'),
(2146, 'mainland', 2140, ',2046,2140,2146,', 3, '嘉禾县', NULL, NULL, NULL, NULL, 'false'),
(2147, 'mainland', 2140, ',2046,2140,2147,', 3, '临武县', NULL, NULL, NULL, NULL, 'false'),
(2148, 'mainland', 2140, ',2046,2140,2148,', 3, '汝城县', NULL, NULL, NULL, NULL, 'false'),
(2149, 'mainland', 2140, ',2046,2140,2149,', 3, '桂东县', NULL, NULL, NULL, NULL, 'false'),
(2150, 'mainland', 2140, ',2046,2140,2150,', 3, '安仁县', NULL, NULL, NULL, NULL, 'false'),
(2151, 'mainland', 2140, ',2046,2140,2151,', 3, '资兴市', NULL, NULL, NULL, NULL, 'false'),
(2152, 'mainland', 2140, ',2046,2140,2152,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2153, 'mainland', 2046, ',2046,2153,', 2, '永州市', NULL, NULL, NULL, NULL, 'false'),
(2154, 'mainland', 2153, ',2046,2153,2154,', 3, '零陵区', NULL, NULL, NULL, NULL, 'false'),
(2155, 'mainland', 2153, ',2046,2153,2155,', 3, '冷水滩区', NULL, NULL, NULL, NULL, 'false'),
(2156, 'mainland', 2153, ',2046,2153,2156,', 3, '祁阳县', NULL, NULL, NULL, NULL, 'false'),
(2157, 'mainland', 2153, ',2046,2153,2157,', 3, '东安县', NULL, NULL, NULL, NULL, 'false'),
(2158, 'mainland', 2153, ',2046,2153,2158,', 3, '双牌县', NULL, NULL, NULL, NULL, 'false'),
(2159, 'mainland', 2153, ',2046,2153,2159,', 3, '道县', NULL, NULL, NULL, NULL, 'false'),
(2160, 'mainland', 2153, ',2046,2153,2160,', 3, '江永县', NULL, NULL, NULL, NULL, 'false'),
(2161, 'mainland', 2153, ',2046,2153,2161,', 3, '宁远县', NULL, NULL, NULL, NULL, 'false'),
(2162, 'mainland', 2153, ',2046,2153,2162,', 3, '蓝山县', NULL, NULL, NULL, NULL, 'false'),
(2163, 'mainland', 2153, ',2046,2153,2163,', 3, '新田县', NULL, NULL, NULL, NULL, 'false'),
(2164, 'mainland', 2153, ',2046,2153,2164,', 3, '江华瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2165, 'mainland', 2153, ',2046,2153,2165,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2166, 'mainland', 2046, ',2046,2166,', 2, '怀化市', NULL, NULL, NULL, NULL, 'false'),
(2167, 'mainland', 2166, ',2046,2166,2167,', 3, '鹤城区', NULL, NULL, NULL, NULL, 'false'),
(2168, 'mainland', 2166, ',2046,2166,2168,', 3, '中方县', NULL, NULL, NULL, NULL, 'false'),
(2169, 'mainland', 2166, ',2046,2166,2169,', 3, '沅陵县', NULL, NULL, NULL, NULL, 'false'),
(2170, 'mainland', 2166, ',2046,2166,2170,', 3, '辰溪县', NULL, NULL, NULL, NULL, 'false'),
(2171, 'mainland', 2166, ',2046,2166,2171,', 3, '溆浦县', NULL, NULL, NULL, NULL, 'false'),
(2172, 'mainland', 2166, ',2046,2166,2172,', 3, '会同县', NULL, NULL, NULL, NULL, 'false'),
(2173, 'mainland', 2166, ',2046,2166,2173,', 3, '麻阳苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2174, 'mainland', 2166, ',2046,2166,2174,', 3, '新晃侗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2175, 'mainland', 2166, ',2046,2166,2175,', 3, '芷江侗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2176, 'mainland', 2166, ',2046,2166,2176,', 3, '靖州苗族侗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2177, 'mainland', 2166, ',2046,2166,2177,', 3, '通道侗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2178, 'mainland', 2166, ',2046,2166,2178,', 3, '洪江市', NULL, NULL, NULL, NULL, 'false'),
(2179, 'mainland', 2166, ',2046,2166,2179,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2180, 'mainland', 2046, ',2046,2180,', 2, '娄底市', NULL, NULL, NULL, NULL, 'false'),
(2181, 'mainland', 2180, ',2046,2180,2181,', 3, '娄星区', NULL, NULL, NULL, NULL, 'false'),
(2182, 'mainland', 2180, ',2046,2180,2182,', 3, '双峰县', NULL, NULL, NULL, NULL, 'false'),
(2183, 'mainland', 2180, ',2046,2180,2183,', 3, '新化县', NULL, NULL, NULL, NULL, 'false'),
(2184, 'mainland', 2180, ',2046,2180,2184,', 3, '冷水江市', NULL, NULL, NULL, NULL, 'false'),
(2185, 'mainland', 2180, ',2046,2180,2185,', 3, '涟源市', NULL, NULL, NULL, NULL, 'false'),
(2186, 'mainland', 2180, ',2046,2180,2186,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2187, 'mainland', 2046, ',2046,2187,', 2, '湘西土家族苗族自治州', NULL, NULL, NULL, NULL, 'false'),
(2188, 'mainland', 2187, ',2046,2187,2188,', 3, '吉首市', NULL, NULL, NULL, NULL, 'false'),
(2189, 'mainland', 2187, ',2046,2187,2189,', 3, '泸溪县', NULL, NULL, NULL, NULL, 'false'),
(2190, 'mainland', 2187, ',2046,2187,2190,', 3, '凤凰县', NULL, NULL, NULL, NULL, 'false'),
(2191, 'mainland', 2187, ',2046,2187,2191,', 3, '花垣县', NULL, NULL, NULL, NULL, 'false'),
(2192, 'mainland', 2187, ',2046,2187,2192,', 3, '保靖县', NULL, NULL, NULL, NULL, 'false'),
(2193, 'mainland', 2187, ',2046,2187,2193,', 3, '古丈县', NULL, NULL, NULL, NULL, 'false'),
(2194, 'mainland', 2187, ',2046,2187,2194,', 3, '永顺县', NULL, NULL, NULL, NULL, 'false'),
(2195, 'mainland', 2187, ',2046,2187,2195,', 3, '龙山县', NULL, NULL, NULL, NULL, 'false'),
(2196, 'mainland', 2187, ',2046,2187,2196,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2197, 'mainland', NULL, ',2197,', 1, '广东省', NULL, NULL, NULL, NULL, 'false'),
(2198, 'mainland', 2197, ',2197,2198,', 2, '广州市', NULL, NULL, NULL, NULL, 'false'),
(2199, 'mainland', 2198, ',2197,2198,2199,', 3, '荔湾区', NULL, NULL, NULL, NULL, 'false'),
(2200, 'mainland', 2198, ',2197,2198,2200,', 3, '越秀区', NULL, NULL, NULL, NULL, 'false'),
(2201, 'mainland', 2198, ',2197,2198,2201,', 3, '海珠区', NULL, NULL, NULL, NULL, 'false'),
(2202, 'mainland', 2198, ',2197,2198,2202,', 3, '天河区', NULL, NULL, NULL, NULL, 'false'),
(2203, 'mainland', 2198, ',2197,2198,2203,', 3, '白云区', NULL, NULL, NULL, NULL, 'false');
INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(2204, 'mainland', 2198, ',2197,2198,2204,', 3, '黄埔区', NULL, NULL, NULL, NULL, 'false'),
(2205, 'mainland', 2198, ',2197,2198,2205,', 3, '番禺区', NULL, NULL, NULL, NULL, 'false'),
(2206, 'mainland', 2198, ',2197,2198,2206,', 3, '花都区', NULL, NULL, NULL, NULL, 'false'),
(2207, 'mainland', 2198, ',2197,2198,2207,', 3, '南沙区', NULL, NULL, NULL, NULL, 'false'),
(2208, 'mainland', 2198, ',2197,2198,2208,', 3, '萝岗区', NULL, NULL, NULL, NULL, 'false'),
(2209, 'mainland', 2198, ',2197,2198,2209,', 3, '增城市', NULL, NULL, NULL, NULL, 'false'),
(2210, 'mainland', 2198, ',2197,2198,2210,', 3, '从化市', NULL, NULL, NULL, NULL, 'false'),
(2211, 'mainland', 2198, ',2197,2198,2211,', 3, '东山区', NULL, NULL, NULL, NULL, 'false'),
(2212, 'mainland', 2198, ',2197,2198,2212,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2213, 'mainland', 2197, ',2197,2213,', 2, '韶关市', NULL, NULL, NULL, NULL, 'false'),
(2214, 'mainland', 2213, ',2197,2213,2214,', 3, '武江区', NULL, NULL, NULL, NULL, 'false'),
(2215, 'mainland', 2213, ',2197,2213,2215,', 3, '浈江区', NULL, NULL, NULL, NULL, 'false'),
(2216, 'mainland', 2213, ',2197,2213,2216,', 3, '曲江区', NULL, NULL, NULL, NULL, 'false'),
(2217, 'mainland', 2213, ',2197,2213,2217,', 3, '始兴县', NULL, NULL, NULL, NULL, 'false'),
(2218, 'mainland', 2213, ',2197,2213,2218,', 3, '仁化县', NULL, NULL, NULL, NULL, 'false'),
(2219, 'mainland', 2213, ',2197,2213,2219,', 3, '翁源县', NULL, NULL, NULL, NULL, 'false'),
(2220, 'mainland', 2213, ',2197,2213,2220,', 3, '乳源瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2221, 'mainland', 2213, ',2197,2213,2221,', 3, '新丰县', NULL, NULL, NULL, NULL, 'false'),
(2222, 'mainland', 2213, ',2197,2213,2222,', 3, '乐昌市', NULL, NULL, NULL, NULL, 'false'),
(2223, 'mainland', 2213, ',2197,2213,2223,', 3, '南雄市', NULL, NULL, NULL, NULL, 'false'),
(2224, 'mainland', 2213, ',2197,2213,2224,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2225, 'mainland', 2197, ',2197,2225,', 2, '深圳市', NULL, NULL, NULL, NULL, 'false'),
(2226, 'mainland', 2225, ',2197,2225,2226,', 3, '罗湖区', NULL, NULL, NULL, NULL, 'false'),
(2227, 'mainland', 2225, ',2197,2225,2227,', 3, '福田区', NULL, NULL, NULL, NULL, 'false'),
(2228, 'mainland', 2225, ',2197,2225,2228,', 3, '南山区', NULL, NULL, NULL, NULL, 'false'),
(2229, 'mainland', 2225, ',2197,2225,2229,', 3, '宝安区', NULL, NULL, NULL, NULL, 'false'),
(2230, 'mainland', 2225, ',2197,2225,2230,', 3, '龙岗区', NULL, NULL, NULL, NULL, 'false'),
(2231, 'mainland', 2225, ',2197,2225,2231,', 3, '盐田区', NULL, NULL, NULL, NULL, 'false'),
(2232, 'mainland', 2225, ',2197,2225,2232,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2233, 'mainland', 2197, ',2197,2233,', 2, '珠海市', NULL, NULL, NULL, NULL, 'false'),
(2234, 'mainland', 2233, ',2197,2233,2234,', 3, '香洲区', NULL, NULL, NULL, NULL, 'false'),
(2235, 'mainland', 2233, ',2197,2233,2235,', 3, '斗门区', NULL, NULL, NULL, NULL, 'false'),
(2236, 'mainland', 2233, ',2197,2233,2236,', 3, '金湾区', NULL, NULL, NULL, NULL, 'false'),
(2237, 'mainland', 2233, ',2197,2233,2237,', 3, '金唐区', NULL, NULL, NULL, NULL, 'false'),
(2238, 'mainland', 2233, ',2197,2233,2238,', 3, '南湾区', NULL, NULL, NULL, NULL, 'false'),
(2239, 'mainland', 2233, ',2197,2233,2239,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2240, 'mainland', 2197, ',2197,2240,', 2, '汕头市', NULL, NULL, NULL, NULL, 'false'),
(2241, 'mainland', 2240, ',2197,2240,2241,', 3, '龙湖区', NULL, NULL, NULL, NULL, 'false'),
(2242, 'mainland', 2240, ',2197,2240,2242,', 3, '金平区', NULL, NULL, NULL, NULL, 'false'),
(2243, 'mainland', 2240, ',2197,2240,2243,', 3, '濠江区', NULL, NULL, NULL, NULL, 'false'),
(2244, 'mainland', 2240, ',2197,2240,2244,', 3, '潮阳区', NULL, NULL, NULL, NULL, 'false'),
(2245, 'mainland', 2240, ',2197,2240,2245,', 3, '潮南区', NULL, NULL, NULL, NULL, 'false'),
(2246, 'mainland', 2240, ',2197,2240,2246,', 3, '澄海区', NULL, NULL, NULL, NULL, 'false'),
(2247, 'mainland', 2240, ',2197,2240,2247,', 3, '南澳县', NULL, NULL, NULL, NULL, 'false'),
(2248, 'mainland', 2240, ',2197,2240,2248,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2249, 'mainland', 2197, ',2197,2249,', 2, '佛山市', NULL, NULL, NULL, NULL, 'false'),
(2250, 'mainland', 2249, ',2197,2249,2250,', 3, '禅城区', NULL, NULL, NULL, NULL, 'false'),
(2251, 'mainland', 2249, ',2197,2249,2251,', 3, '南海区', NULL, NULL, NULL, NULL, 'false'),
(2252, 'mainland', 2249, ',2197,2249,2252,', 3, '顺德区', NULL, NULL, NULL, NULL, 'false'),
(2253, 'mainland', 2249, ',2197,2249,2253,', 3, '三水区', NULL, NULL, NULL, NULL, 'false'),
(2254, 'mainland', 2249, ',2197,2249,2254,', 3, '高明区', NULL, NULL, NULL, NULL, 'false'),
(2255, 'mainland', 2249, ',2197,2249,2255,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2256, 'mainland', 2197, ',2197,2256,', 2, '江门市', NULL, NULL, NULL, NULL, 'false'),
(2257, 'mainland', 2256, ',2197,2256,2257,', 3, '蓬江区', NULL, NULL, NULL, NULL, 'false'),
(2258, 'mainland', 2256, ',2197,2256,2258,', 3, '江海区', NULL, NULL, NULL, NULL, 'false'),
(2259, 'mainland', 2256, ',2197,2256,2259,', 3, '新会区', NULL, NULL, NULL, NULL, 'false'),
(2260, 'mainland', 2256, ',2197,2256,2260,', 3, '台山市', NULL, NULL, NULL, NULL, 'false'),
(2261, 'mainland', 2256, ',2197,2256,2261,', 3, '开平市', NULL, NULL, NULL, NULL, 'false'),
(2262, 'mainland', 2256, ',2197,2256,2262,', 3, '鹤山市', NULL, NULL, NULL, NULL, 'false'),
(2263, 'mainland', 2256, ',2197,2256,2263,', 3, '恩平市', NULL, NULL, NULL, NULL, 'false'),
(2264, 'mainland', 2256, ',2197,2256,2264,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2265, 'mainland', 2197, ',2197,2265,', 2, '湛江市', NULL, NULL, NULL, NULL, 'false'),
(2266, 'mainland', 2265, ',2197,2265,2266,', 3, '赤坎区', NULL, NULL, NULL, NULL, 'false'),
(2267, 'mainland', 2265, ',2197,2265,2267,', 3, '霞山区', NULL, NULL, NULL, NULL, 'false'),
(2268, 'mainland', 2265, ',2197,2265,2268,', 3, '坡头区', NULL, NULL, NULL, NULL, 'false'),
(2269, 'mainland', 2265, ',2197,2265,2269,', 3, '麻章区', NULL, NULL, NULL, NULL, 'false'),
(2270, 'mainland', 2265, ',2197,2265,2270,', 3, '遂溪县', NULL, NULL, NULL, NULL, 'false'),
(2271, 'mainland', 2265, ',2197,2265,2271,', 3, '徐闻县', NULL, NULL, NULL, NULL, 'false'),
(2272, 'mainland', 2265, ',2197,2265,2272,', 3, '廉江市', NULL, NULL, NULL, NULL, 'false'),
(2273, 'mainland', 2265, ',2197,2265,2273,', 3, '雷州市', NULL, NULL, NULL, NULL, 'false'),
(2274, 'mainland', 2265, ',2197,2265,2274,', 3, '吴川市', NULL, NULL, NULL, NULL, 'false'),
(2275, 'mainland', 2265, ',2197,2265,2275,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2276, 'mainland', 2197, ',2197,2276,', 2, '茂名市', NULL, NULL, NULL, NULL, 'false'),
(2277, 'mainland', 2276, ',2197,2276,2277,', 3, '茂南区', NULL, NULL, NULL, NULL, 'false'),
(2278, 'mainland', 2276, ',2197,2276,2278,', 3, '茂港区', NULL, NULL, NULL, NULL, 'false'),
(2279, 'mainland', 2276, ',2197,2276,2279,', 3, '电白县', NULL, NULL, NULL, NULL, 'false'),
(2280, 'mainland', 2276, ',2197,2276,2280,', 3, '高州市', NULL, NULL, NULL, NULL, 'false'),
(2281, 'mainland', 2276, ',2197,2276,2281,', 3, '化州市', NULL, NULL, NULL, NULL, 'false'),
(2282, 'mainland', 2276, ',2197,2276,2282,', 3, '信宜市', NULL, NULL, NULL, NULL, 'false'),
(2283, 'mainland', 2276, ',2197,2276,2283,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2284, 'mainland', 2197, ',2197,2284,', 2, '肇庆市', NULL, NULL, NULL, NULL, 'false'),
(2285, 'mainland', 2284, ',2197,2284,2285,', 3, '端州区', NULL, NULL, NULL, NULL, 'false'),
(2286, 'mainland', 2284, ',2197,2284,2286,', 3, '鼎湖区', NULL, NULL, NULL, NULL, 'false'),
(2287, 'mainland', 2284, ',2197,2284,2287,', 3, '广宁县', NULL, NULL, NULL, NULL, 'false'),
(2288, 'mainland', 2284, ',2197,2284,2288,', 3, '怀集县', NULL, NULL, NULL, NULL, 'false'),
(2289, 'mainland', 2284, ',2197,2284,2289,', 3, '封开县', NULL, NULL, NULL, NULL, 'false'),
(2290, 'mainland', 2284, ',2197,2284,2290,', 3, '德庆县', NULL, NULL, NULL, NULL, 'false'),
(2291, 'mainland', 2284, ',2197,2284,2291,', 3, '高要市', NULL, NULL, NULL, NULL, 'false'),
(2292, 'mainland', 2284, ',2197,2284,2292,', 3, '四会市', NULL, NULL, NULL, NULL, 'false'),
(2293, 'mainland', 2284, ',2197,2284,2293,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2294, 'mainland', 2197, ',2197,2294,', 2, '惠州市', NULL, NULL, NULL, NULL, 'false'),
(2295, 'mainland', 2294, ',2197,2294,2295,', 3, '惠城区', NULL, NULL, NULL, NULL, 'false'),
(2296, 'mainland', 2294, ',2197,2294,2296,', 3, '惠阳区', NULL, NULL, NULL, NULL, 'false'),
(2297, 'mainland', 2294, ',2197,2294,2297,', 3, '博罗县', NULL, NULL, NULL, NULL, 'false'),
(2298, 'mainland', 2294, ',2197,2294,2298,', 3, '惠东县', NULL, NULL, NULL, NULL, 'false'),
(2299, 'mainland', 2294, ',2197,2294,2299,', 3, '龙门县', NULL, NULL, NULL, NULL, 'false'),
(2300, 'mainland', 2294, ',2197,2294,2300,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2301, 'mainland', 2197, ',2197,2301,', 2, '梅州市', NULL, NULL, NULL, NULL, 'false'),
(2302, 'mainland', 2301, ',2197,2301,2302,', 3, '梅江区', NULL, NULL, NULL, NULL, 'false'),
(2303, 'mainland', 2301, ',2197,2301,2303,', 3, '梅县', NULL, NULL, NULL, NULL, 'false'),
(2304, 'mainland', 2301, ',2197,2301,2304,', 3, '大埔县', NULL, NULL, NULL, NULL, 'false'),
(2305, 'mainland', 2301, ',2197,2301,2305,', 3, '丰顺县', NULL, NULL, NULL, NULL, 'false'),
(2306, 'mainland', 2301, ',2197,2301,2306,', 3, '五华县', NULL, NULL, NULL, NULL, 'false'),
(2307, 'mainland', 2301, ',2197,2301,2307,', 3, '平远县', NULL, NULL, NULL, NULL, 'false'),
(2308, 'mainland', 2301, ',2197,2301,2308,', 3, '蕉岭县', NULL, NULL, NULL, NULL, 'false'),
(2309, 'mainland', 2301, ',2197,2301,2309,', 3, '兴宁市', NULL, NULL, NULL, NULL, 'false'),
(2310, 'mainland', 2301, ',2197,2301,2310,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2311, 'mainland', 2197, ',2197,2311,', 2, '汕尾市', NULL, NULL, NULL, NULL, 'false'),
(2312, 'mainland', 2311, ',2197,2311,2312,', 3, '城区', NULL, NULL, NULL, NULL, 'false'),
(2313, 'mainland', 2311, ',2197,2311,2313,', 3, '海丰县', NULL, NULL, NULL, NULL, 'false'),
(2314, 'mainland', 2311, ',2197,2311,2314,', 3, '陆河县', NULL, NULL, NULL, NULL, 'false'),
(2315, 'mainland', 2311, ',2197,2311,2315,', 3, '陆丰市', NULL, NULL, NULL, NULL, 'false'),
(2316, 'mainland', 2311, ',2197,2311,2316,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2317, 'mainland', 2197, ',2197,2317,', 2, '河源市', NULL, NULL, NULL, NULL, 'false'),
(2318, 'mainland', 2317, ',2197,2317,2318,', 3, '源城区', NULL, NULL, NULL, NULL, 'false'),
(2319, 'mainland', 2317, ',2197,2317,2319,', 3, '紫金县', NULL, NULL, NULL, NULL, 'false'),
(2320, 'mainland', 2317, ',2197,2317,2320,', 3, '龙川县', NULL, NULL, NULL, NULL, 'false'),
(2321, 'mainland', 2317, ',2197,2317,2321,', 3, '连平县', NULL, NULL, NULL, NULL, 'false'),
(2322, 'mainland', 2317, ',2197,2317,2322,', 3, '和平县', NULL, NULL, NULL, NULL, 'false'),
(2323, 'mainland', 2317, ',2197,2317,2323,', 3, '东源县', NULL, NULL, NULL, NULL, 'false'),
(2324, 'mainland', 2317, ',2197,2317,2324,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2325, 'mainland', 2197, ',2197,2325,', 2, '阳江市', NULL, NULL, NULL, NULL, 'false'),
(2326, 'mainland', 2325, ',2197,2325,2326,', 3, '江城区', NULL, NULL, NULL, NULL, 'false'),
(2327, 'mainland', 2325, ',2197,2325,2327,', 3, '阳西县', NULL, NULL, NULL, NULL, 'false'),
(2328, 'mainland', 2325, ',2197,2325,2328,', 3, '阳东县', NULL, NULL, NULL, NULL, 'false'),
(2329, 'mainland', 2325, ',2197,2325,2329,', 3, '阳春市', NULL, NULL, NULL, NULL, 'false'),
(2330, 'mainland', 2325, ',2197,2325,2330,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2331, 'mainland', 2197, ',2197,2331,', 2, '清远市', NULL, NULL, NULL, NULL, 'false'),
(2332, 'mainland', 2331, ',2197,2331,2332,', 3, '清城区', NULL, NULL, NULL, NULL, 'false'),
(2333, 'mainland', 2331, ',2197,2331,2333,', 3, '佛冈县', NULL, NULL, NULL, NULL, 'false'),
(2334, 'mainland', 2331, ',2197,2331,2334,', 3, '阳山县', NULL, NULL, NULL, NULL, 'false'),
(2335, 'mainland', 2331, ',2197,2331,2335,', 3, '连山壮族瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2336, 'mainland', 2331, ',2197,2331,2336,', 3, '连南瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2337, 'mainland', 2331, ',2197,2331,2337,', 3, '清新县', NULL, NULL, NULL, NULL, 'false'),
(2338, 'mainland', 2331, ',2197,2331,2338,', 3, '英德市', NULL, NULL, NULL, NULL, 'false'),
(2339, 'mainland', 2331, ',2197,2331,2339,', 3, '连州市', NULL, NULL, NULL, NULL, 'false'),
(2340, 'mainland', 2331, ',2197,2331,2340,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2341, 'mainland', 2197, ',2197,2341,', 2, '东莞市', NULL, NULL, NULL, NULL, 'false'),
(2342, 'mainland', 2197, ',2197,2342,', 2, '中山市', NULL, NULL, NULL, NULL, 'false'),
(2343, 'mainland', 2197, ',2197,2343,', 2, '潮州市', NULL, NULL, NULL, NULL, 'false'),
(2344, 'mainland', 2343, ',2197,2343,2344,', 3, '湘桥区', NULL, NULL, NULL, NULL, 'false'),
(2345, 'mainland', 2343, ',2197,2343,2345,', 3, '潮安县', NULL, NULL, NULL, NULL, 'false'),
(2346, 'mainland', 2343, ',2197,2343,2346,', 3, '饶平县', NULL, NULL, NULL, NULL, 'false'),
(2347, 'mainland', 2343, ',2197,2343,2347,', 3, '枫溪区', NULL, NULL, NULL, NULL, 'false'),
(2348, 'mainland', 2343, ',2197,2343,2348,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2349, 'mainland', 2197, ',2197,2349,', 2, '揭阳市', NULL, NULL, NULL, NULL, 'false'),
(2350, 'mainland', 2349, ',2197,2349,2350,', 3, '榕城区', NULL, NULL, NULL, NULL, 'false'),
(2351, 'mainland', 2349, ',2197,2349,2351,', 3, '揭东县', NULL, NULL, NULL, NULL, 'false'),
(2352, 'mainland', 2349, ',2197,2349,2352,', 3, '揭西县', NULL, NULL, NULL, NULL, 'false'),
(2353, 'mainland', 2349, ',2197,2349,2353,', 3, '惠来县', NULL, NULL, NULL, NULL, 'false'),
(2354, 'mainland', 2349, ',2197,2349,2354,', 3, '普宁市', NULL, NULL, NULL, NULL, 'false'),
(2355, 'mainland', 2349, ',2197,2349,2355,', 3, '东山区', NULL, NULL, NULL, NULL, 'false'),
(2356, 'mainland', 2349, ',2197,2349,2356,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2357, 'mainland', 2197, ',2197,2357,', 2, '云浮市', NULL, NULL, NULL, NULL, 'false'),
(2358, 'mainland', 2357, ',2197,2357,2358,', 3, '云城区', NULL, NULL, NULL, NULL, 'false'),
(2359, 'mainland', 2357, ',2197,2357,2359,', 3, '新兴县', NULL, NULL, NULL, NULL, 'false'),
(2360, 'mainland', 2357, ',2197,2357,2360,', 3, '郁南县', NULL, NULL, NULL, NULL, 'false'),
(2361, 'mainland', 2357, ',2197,2357,2361,', 3, '云安县', NULL, NULL, NULL, NULL, 'false'),
(2362, 'mainland', 2357, ',2197,2357,2362,', 3, '罗定市', NULL, NULL, NULL, NULL, 'false'),
(2363, 'mainland', 2357, ',2197,2357,2363,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2364, 'mainland', NULL, ',2364,', 1, '广西壮族自治区', NULL, NULL, NULL, NULL, 'false'),
(2365, 'mainland', 2364, ',2364,2365,', 2, '南宁市', NULL, NULL, NULL, NULL, 'false'),
(2366, 'mainland', 2365, ',2364,2365,2366,', 3, '兴宁区', NULL, NULL, NULL, NULL, 'false'),
(2367, 'mainland', 2365, ',2364,2365,2367,', 3, '青秀区', NULL, NULL, NULL, NULL, 'false'),
(2368, 'mainland', 2365, ',2364,2365,2368,', 3, '江南区', NULL, NULL, NULL, NULL, 'false'),
(2369, 'mainland', 2365, ',2364,2365,2369,', 3, '西乡塘区', NULL, NULL, NULL, NULL, 'false'),
(2370, 'mainland', 2365, ',2364,2365,2370,', 3, '良庆区', NULL, NULL, NULL, NULL, 'false'),
(2371, 'mainland', 2365, ',2364,2365,2371,', 3, '邕宁区', NULL, NULL, NULL, NULL, 'false'),
(2372, 'mainland', 2365, ',2364,2365,2372,', 3, '武鸣县', NULL, NULL, NULL, NULL, 'false'),
(2373, 'mainland', 2365, ',2364,2365,2373,', 3, '隆安县', NULL, NULL, NULL, NULL, 'false'),
(2374, 'mainland', 2365, ',2364,2365,2374,', 3, '马山县', NULL, NULL, NULL, NULL, 'false'),
(2375, 'mainland', 2365, ',2364,2365,2375,', 3, '上林县', NULL, NULL, NULL, NULL, 'false'),
(2376, 'mainland', 2365, ',2364,2365,2376,', 3, '宾阳县', NULL, NULL, NULL, NULL, 'false'),
(2377, 'mainland', 2365, ',2364,2365,2377,', 3, '横县', NULL, NULL, NULL, NULL, 'false'),
(2378, 'mainland', 2365, ',2364,2365,2378,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2379, 'mainland', 2364, ',2364,2379,', 2, '柳州市', NULL, NULL, NULL, NULL, 'false'),
(2380, 'mainland', 2379, ',2364,2379,2380,', 3, '城中区', NULL, NULL, NULL, NULL, 'false'),
(2381, 'mainland', 2379, ',2364,2379,2381,', 3, '鱼峰区', NULL, NULL, NULL, NULL, 'false'),
(2382, 'mainland', 2379, ',2364,2379,2382,', 3, '柳南区', NULL, NULL, NULL, NULL, 'false'),
(2383, 'mainland', 2379, ',2364,2379,2383,', 3, '柳北区', NULL, NULL, NULL, NULL, 'false'),
(2384, 'mainland', 2379, ',2364,2379,2384,', 3, '柳江县', NULL, NULL, NULL, NULL, 'false'),
(2385, 'mainland', 2379, ',2364,2379,2385,', 3, '柳城县', NULL, NULL, NULL, NULL, 'false'),
(2386, 'mainland', 2379, ',2364,2379,2386,', 3, '鹿寨县', NULL, NULL, NULL, NULL, 'false'),
(2387, 'mainland', 2379, ',2364,2379,2387,', 3, '融安县', NULL, NULL, NULL, NULL, 'false'),
(2388, 'mainland', 2379, ',2364,2379,2388,', 3, '融水苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2389, 'mainland', 2379, ',2364,2379,2389,', 3, '三江侗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2390, 'mainland', 2379, ',2364,2379,2390,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2391, 'mainland', 2364, ',2364,2391,', 2, '桂林市', NULL, NULL, NULL, NULL, 'false'),
(2392, 'mainland', 2391, ',2364,2391,2392,', 3, '秀峰区', NULL, NULL, NULL, NULL, 'false'),
(2393, 'mainland', 2391, ',2364,2391,2393,', 3, '叠彩区', NULL, NULL, NULL, NULL, 'false'),
(2394, 'mainland', 2391, ',2364,2391,2394,', 3, '象山区', NULL, NULL, NULL, NULL, 'false'),
(2395, 'mainland', 2391, ',2364,2391,2395,', 3, '七星区', NULL, NULL, NULL, NULL, 'false'),
(2396, 'mainland', 2391, ',2364,2391,2396,', 3, '雁山区', NULL, NULL, NULL, NULL, 'false'),
(2397, 'mainland', 2391, ',2364,2391,2397,', 3, '阳朔县', NULL, NULL, NULL, NULL, 'false'),
(2398, 'mainland', 2391, ',2364,2391,2398,', 3, '临桂县', NULL, NULL, NULL, NULL, 'false'),
(2399, 'mainland', 2391, ',2364,2391,2399,', 3, '灵川县', NULL, NULL, NULL, NULL, 'false'),
(2400, 'mainland', 2391, ',2364,2391,2400,', 3, '全州县', NULL, NULL, NULL, NULL, 'false'),
(2401, 'mainland', 2391, ',2364,2391,2401,', 3, '兴安县', NULL, NULL, NULL, NULL, 'false'),
(2402, 'mainland', 2391, ',2364,2391,2402,', 3, '永福县', NULL, NULL, NULL, NULL, 'false'),
(2403, 'mainland', 2391, ',2364,2391,2403,', 3, '灌阳县', NULL, NULL, NULL, NULL, 'false'),
(2404, 'mainland', 2391, ',2364,2391,2404,', 3, '龙胜各族自治县', NULL, NULL, NULL, NULL, 'false'),
(2405, 'mainland', 2391, ',2364,2391,2405,', 3, '资源县', NULL, NULL, NULL, NULL, 'false'),
(2406, 'mainland', 2391, ',2364,2391,2406,', 3, '平乐县', NULL, NULL, NULL, NULL, 'false'),
(2407, 'mainland', 2391, ',2364,2391,2407,', 3, '荔浦县', NULL, NULL, NULL, NULL, 'false'),
(2408, 'mainland', 2391, ',2364,2391,2408,', 3, '恭城瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2409, 'mainland', 2391, ',2364,2391,2409,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2410, 'mainland', 2364, ',2364,2410,', 2, '梧州市', NULL, NULL, NULL, NULL, 'false'),
(2411, 'mainland', 2410, ',2364,2410,2411,', 3, '万秀区', NULL, NULL, NULL, NULL, 'false'),
(2412, 'mainland', 2410, ',2364,2410,2412,', 3, '蝶山区', NULL, NULL, NULL, NULL, 'false'),
(2413, 'mainland', 2410, ',2364,2410,2413,', 3, '长洲区', NULL, NULL, NULL, NULL, 'false'),
(2414, 'mainland', 2410, ',2364,2410,2414,', 3, '苍梧县', NULL, NULL, NULL, NULL, 'false'),
(2415, 'mainland', 2410, ',2364,2410,2415,', 3, '藤县', NULL, NULL, NULL, NULL, 'false'),
(2416, 'mainland', 2410, ',2364,2410,2416,', 3, '蒙山县', NULL, NULL, NULL, NULL, 'false'),
(2417, 'mainland', 2410, ',2364,2410,2417,', 3, '岑溪市', NULL, NULL, NULL, NULL, 'false'),
(2418, 'mainland', 2410, ',2364,2410,2418,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2419, 'mainland', 2364, ',2364,2419,', 2, '北海市', NULL, NULL, NULL, NULL, 'false'),
(2420, 'mainland', 2419, ',2364,2419,2420,', 3, '海城区', NULL, NULL, NULL, NULL, 'false'),
(2421, 'mainland', 2419, ',2364,2419,2421,', 3, '银海区', NULL, NULL, NULL, NULL, 'false'),
(2422, 'mainland', 2419, ',2364,2419,2422,', 3, '铁山港区', NULL, NULL, NULL, NULL, 'false'),
(2423, 'mainland', 2419, ',2364,2419,2423,', 3, '合浦县', NULL, NULL, NULL, NULL, 'false'),
(2424, 'mainland', 2419, ',2364,2419,2424,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2425, 'mainland', 2364, ',2364,2425,', 2, '防城港市', NULL, NULL, NULL, NULL, 'false'),
(2426, 'mainland', 2425, ',2364,2425,2426,', 3, '港口区', NULL, NULL, NULL, NULL, 'false'),
(2427, 'mainland', 2425, ',2364,2425,2427,', 3, '防城区', NULL, NULL, NULL, NULL, 'false'),
(2428, 'mainland', 2425, ',2364,2425,2428,', 3, '上思县', NULL, NULL, NULL, NULL, 'false'),
(2429, 'mainland', 2425, ',2364,2425,2429,', 3, '东兴市', NULL, NULL, NULL, NULL, 'false'),
(2430, 'mainland', 2425, ',2364,2425,2430,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2431, 'mainland', 2364, ',2364,2431,', 2, '钦州市', NULL, NULL, NULL, NULL, 'false'),
(2432, 'mainland', 2431, ',2364,2431,2432,', 3, '钦南区', NULL, NULL, NULL, NULL, 'false'),
(2433, 'mainland', 2431, ',2364,2431,2433,', 3, '钦北区', NULL, NULL, NULL, NULL, 'false'),
(2434, 'mainland', 2431, ',2364,2431,2434,', 3, '灵山县', NULL, NULL, NULL, NULL, 'false'),
(2435, 'mainland', 2431, ',2364,2431,2435,', 3, '浦北县', NULL, NULL, NULL, NULL, 'false'),
(2436, 'mainland', 2431, ',2364,2431,2436,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2437, 'mainland', 2364, ',2364,2437,', 2, '贵港市', NULL, NULL, NULL, NULL, 'false'),
(2438, 'mainland', 2437, ',2364,2437,2438,', 3, '港北区', NULL, NULL, NULL, NULL, 'false'),
(2439, 'mainland', 2437, ',2364,2437,2439,', 3, '港南区', NULL, NULL, NULL, NULL, 'false'),
(2440, 'mainland', 2437, ',2364,2437,2440,', 3, '覃塘区', NULL, NULL, NULL, NULL, 'false'),
(2441, 'mainland', 2437, ',2364,2437,2441,', 3, '平南县', NULL, NULL, NULL, NULL, 'false'),
(2442, 'mainland', 2437, ',2364,2437,2442,', 3, '桂平市', NULL, NULL, NULL, NULL, 'false'),
(2443, 'mainland', 2437, ',2364,2437,2443,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2444, 'mainland', 2364, ',2364,2444,', 2, '玉林市', NULL, NULL, NULL, NULL, 'false'),
(2445, 'mainland', 2444, ',2364,2444,2445,', 3, '玉州区', NULL, NULL, NULL, NULL, 'false'),
(2446, 'mainland', 2444, ',2364,2444,2446,', 3, '容县', NULL, NULL, NULL, NULL, 'false'),
(2447, 'mainland', 2444, ',2364,2444,2447,', 3, '陆川县', NULL, NULL, NULL, NULL, 'false'),
(2448, 'mainland', 2444, ',2364,2444,2448,', 3, '博白县', NULL, NULL, NULL, NULL, 'false'),
(2449, 'mainland', 2444, ',2364,2444,2449,', 3, '兴业县', NULL, NULL, NULL, NULL, 'false'),
(2450, 'mainland', 2444, ',2364,2444,2450,', 3, '北流市', NULL, NULL, NULL, NULL, 'false'),
(2451, 'mainland', 2444, ',2364,2444,2451,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2452, 'mainland', 2364, ',2364,2452,', 2, '百色市', NULL, NULL, NULL, NULL, 'false'),
(2453, 'mainland', 2452, ',2364,2452,2453,', 3, '右江区', NULL, NULL, NULL, NULL, 'false'),
(2454, 'mainland', 2452, ',2364,2452,2454,', 3, '田阳县', NULL, NULL, NULL, NULL, 'false'),
(2455, 'mainland', 2452, ',2364,2452,2455,', 3, '田东县', NULL, NULL, NULL, NULL, 'false'),
(2456, 'mainland', 2452, ',2364,2452,2456,', 3, '平果县', NULL, NULL, NULL, NULL, 'false'),
(2457, 'mainland', 2452, ',2364,2452,2457,', 3, '德保县', NULL, NULL, NULL, NULL, 'false'),
(2458, 'mainland', 2452, ',2364,2452,2458,', 3, '靖西县', NULL, NULL, NULL, NULL, 'false'),
(2459, 'mainland', 2452, ',2364,2452,2459,', 3, '那坡县', NULL, NULL, NULL, NULL, 'false'),
(2460, 'mainland', 2452, ',2364,2452,2460,', 3, '凌云县', NULL, NULL, NULL, NULL, 'false'),
(2461, 'mainland', 2452, ',2364,2452,2461,', 3, '乐业县', NULL, NULL, NULL, NULL, 'false'),
(2462, 'mainland', 2452, ',2364,2452,2462,', 3, '田林县', NULL, NULL, NULL, NULL, 'false'),
(2463, 'mainland', 2452, ',2364,2452,2463,', 3, '西林县', NULL, NULL, NULL, NULL, 'false'),
(2464, 'mainland', 2452, ',2364,2452,2464,', 3, '隆林各族自治县', NULL, NULL, NULL, NULL, 'false'),
(2465, 'mainland', 2452, ',2364,2452,2465,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2466, 'mainland', 2364, ',2364,2466,', 2, '贺州市', NULL, NULL, NULL, NULL, 'false'),
(2467, 'mainland', 2466, ',2364,2466,2467,', 3, '八步区', NULL, NULL, NULL, NULL, 'false'),
(2468, 'mainland', 2466, ',2364,2466,2468,', 3, '昭平县', NULL, NULL, NULL, NULL, 'false'),
(2469, 'mainland', 2466, ',2364,2466,2469,', 3, '钟山县', NULL, NULL, NULL, NULL, 'false'),
(2470, 'mainland', 2466, ',2364,2466,2470,', 3, '富川瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2471, 'mainland', 2466, ',2364,2466,2471,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2472, 'mainland', 2364, ',2364,2472,', 2, '河池市', NULL, NULL, NULL, NULL, 'false'),
(2473, 'mainland', 2472, ',2364,2472,2473,', 3, '金城江区', NULL, NULL, NULL, NULL, 'false'),
(2474, 'mainland', 2472, ',2364,2472,2474,', 3, '南丹县', NULL, NULL, NULL, NULL, 'false'),
(2475, 'mainland', 2472, ',2364,2472,2475,', 3, '天峨县', NULL, NULL, NULL, NULL, 'false'),
(2476, 'mainland', 2472, ',2364,2472,2476,', 3, '凤山县', NULL, NULL, NULL, NULL, 'false'),
(2477, 'mainland', 2472, ',2364,2472,2477,', 3, '东兰县', NULL, NULL, NULL, NULL, 'false'),
(2478, 'mainland', 2472, ',2364,2472,2478,', 3, '罗城仫佬族自治县', NULL, NULL, NULL, NULL, 'false'),
(2479, 'mainland', 2472, ',2364,2472,2479,', 3, '环江毛南族自治县', NULL, NULL, NULL, NULL, 'false'),
(2480, 'mainland', 2472, ',2364,2472,2480,', 3, '巴马瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2481, 'mainland', 2472, ',2364,2472,2481,', 3, '都安瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2482, 'mainland', 2472, ',2364,2472,2482,', 3, '大化瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2483, 'mainland', 2472, ',2364,2472,2483,', 3, '宜州市', NULL, NULL, NULL, NULL, 'false'),
(2484, 'mainland', 2472, ',2364,2472,2484,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2485, 'mainland', 2364, ',2364,2485,', 2, '来宾市', NULL, NULL, NULL, NULL, 'false'),
(2486, 'mainland', 2485, ',2364,2485,2486,', 3, '兴宾区', NULL, NULL, NULL, NULL, 'false'),
(2487, 'mainland', 2485, ',2364,2485,2487,', 3, '忻城县', NULL, NULL, NULL, NULL, 'false'),
(2488, 'mainland', 2485, ',2364,2485,2488,', 3, '象州县', NULL, NULL, NULL, NULL, 'false'),
(2489, 'mainland', 2485, ',2364,2485,2489,', 3, '武宣县', NULL, NULL, NULL, NULL, 'false'),
(2490, 'mainland', 2485, ',2364,2485,2490,', 3, '金秀瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(2491, 'mainland', 2485, ',2364,2485,2491,', 3, '合山市', NULL, NULL, NULL, NULL, 'false'),
(2492, 'mainland', 2485, ',2364,2485,2492,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2493, 'mainland', 2364, ',2364,2493,', 2, '崇左市', NULL, NULL, NULL, NULL, 'false'),
(2494, 'mainland', 2493, ',2364,2493,2494,', 3, '江州区', NULL, NULL, NULL, NULL, 'false'),
(2495, 'mainland', 2493, ',2364,2493,2495,', 3, '扶绥县', NULL, NULL, NULL, NULL, 'false'),
(2496, 'mainland', 2493, ',2364,2493,2496,', 3, '宁明县', NULL, NULL, NULL, NULL, 'false'),
(2497, 'mainland', 2493, ',2364,2493,2497,', 3, '龙州县', NULL, NULL, NULL, NULL, 'false'),
(2498, 'mainland', 2493, ',2364,2493,2498,', 3, '大新县', NULL, NULL, NULL, NULL, 'false'),
(2499, 'mainland', 2493, ',2364,2493,2499,', 3, '天等县', NULL, NULL, NULL, NULL, 'false'),
(2500, 'mainland', 2493, ',2364,2493,2500,', 3, '凭祥市', NULL, NULL, NULL, NULL, 'false'),
(2501, 'mainland', 2493, ',2364,2493,2501,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2502, 'mainland', NULL, ',2502,', 1, '海南省', NULL, NULL, NULL, NULL, 'false'),
(2503, 'mainland', 2502, ',2502,2503,', 2, '海口市', NULL, NULL, NULL, NULL, 'false'),
(2504, 'mainland', 2503, ',2502,2503,2504,', 3, '秀英区', NULL, NULL, NULL, NULL, 'false'),
(2505, 'mainland', 2503, ',2502,2503,2505,', 3, '龙华区', NULL, NULL, NULL, NULL, 'false'),
(2506, 'mainland', 2503, ',2502,2503,2506,', 3, '琼山区', NULL, NULL, NULL, NULL, 'false'),
(2507, 'mainland', 2503, ',2502,2503,2507,', 3, '美兰区', NULL, NULL, NULL, NULL, 'false'),
(2508, 'mainland', 2503, ',2502,2503,2508,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2509, 'mainland', 2502, ',2502,2509,', 2, '三亚市', NULL, NULL, NULL, NULL, 'false'),
(2510, 'mainland', 2502, ',2502,2510,', 2, '五指山市', NULL, NULL, NULL, NULL, 'false'),
(2511, 'mainland', 2502, ',2502,2511,', 2, '琼海市', NULL, NULL, NULL, NULL, 'false'),
(2512, 'mainland', 2502, ',2502,2512,', 2, '儋州市', NULL, NULL, NULL, NULL, 'false'),
(2513, 'mainland', 2502, ',2502,2513,', 2, '文昌市', NULL, NULL, NULL, NULL, 'false'),
(2514, 'mainland', 2502, ',2502,2514,', 2, '万宁市', NULL, NULL, NULL, NULL, 'false'),
(2515, 'mainland', 2502, ',2502,2515,', 2, '东方市', NULL, NULL, NULL, NULL, 'false'),
(2516, 'mainland', 2502, ',2502,2516,', 2, '定安县', NULL, NULL, NULL, NULL, 'false'),
(2517, 'mainland', 2502, ',2502,2517,', 2, '屯昌县', NULL, NULL, NULL, NULL, 'false'),
(2518, 'mainland', 2502, ',2502,2518,', 2, '澄迈县', NULL, NULL, NULL, NULL, 'false'),
(2519, 'mainland', 2502, ',2502,2519,', 2, '临高县', NULL, NULL, NULL, NULL, 'false'),
(2520, 'mainland', 2502, ',2502,2520,', 2, '白沙黎族自治县', NULL, NULL, NULL, NULL, 'false'),
(2521, 'mainland', 2502, ',2502,2521,', 2, '昌江黎族自治县', NULL, NULL, NULL, NULL, 'false'),
(2522, 'mainland', 2502, ',2502,2522,', 2, '乐东黎族自治县', NULL, NULL, NULL, NULL, 'false'),
(2523, 'mainland', 2502, ',2502,2523,', 2, '陵水黎族自治县', NULL, NULL, NULL, NULL, 'false'),
(2524, 'mainland', 2502, ',2502,2524,', 2, '保亭黎族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2525, 'mainland', 2502, ',2502,2525,', 2, '琼中黎族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2526, 'mainland', 2502, ',2502,2526,', 2, '西沙群岛', NULL, NULL, NULL, NULL, 'false'),
(2527, 'mainland', 2502, ',2502,2527,', 2, '南沙群岛', NULL, NULL, NULL, NULL, 'false'),
(2528, 'mainland', 2502, ',2502,2528,', 2, '中沙群岛的岛礁及其海域', NULL, NULL, NULL, NULL, 'false'),
(2529, 'mainland', NULL, ',2529,', 1, '重庆', NULL, NULL, NULL, NULL, 'false'),
(2530, 'mainland', 2529, ',2529,2530,', 2, '重庆市', NULL, NULL, NULL, NULL, 'false'),
(2531, 'mainland', 2530, ',2529,2530,2531,', 3, '万州区', NULL, NULL, NULL, NULL, 'false'),
(2532, 'mainland', 2530, ',2529,2530,2532,', 3, '涪陵区', NULL, NULL, NULL, NULL, 'false'),
(2533, 'mainland', 2530, ',2529,2530,2533,', 3, '渝中区', NULL, NULL, NULL, NULL, 'false'),
(2534, 'mainland', 2530, ',2529,2530,2534,', 3, '大渡口区', NULL, NULL, NULL, NULL, 'false'),
(2535, 'mainland', 2530, ',2529,2530,2535,', 3, '江北区', NULL, NULL, NULL, NULL, 'false'),
(2536, 'mainland', 2530, ',2529,2530,2536,', 3, '沙坪坝区', NULL, NULL, NULL, NULL, 'false'),
(2537, 'mainland', 2530, ',2529,2530,2537,', 3, '九龙坡区', NULL, NULL, NULL, NULL, 'false'),
(2538, 'mainland', 2530, ',2529,2530,2538,', 3, '南岸区', NULL, NULL, NULL, NULL, 'false'),
(2539, 'mainland', 2530, ',2529,2530,2539,', 3, '北碚区', NULL, NULL, NULL, NULL, 'false'),
(2540, 'mainland', 2530, ',2529,2530,2540,', 3, '万盛区', NULL, NULL, NULL, NULL, 'false'),
(2541, 'mainland', 2530, ',2529,2530,2541,', 3, '双桥区', NULL, NULL, NULL, NULL, 'false'),
(2542, 'mainland', 2530, ',2529,2530,2542,', 3, '渝北区', NULL, NULL, NULL, NULL, 'false'),
(2543, 'mainland', 2530, ',2529,2530,2543,', 3, '巴南区', NULL, NULL, NULL, NULL, 'false'),
(2544, 'mainland', 2530, ',2529,2530,2544,', 3, '黔江区', NULL, NULL, NULL, NULL, 'false'),
(2545, 'mainland', 2530, ',2529,2530,2545,', 3, '长寿区', NULL, NULL, NULL, NULL, 'false'),
(2546, 'mainland', 2530, ',2529,2530,2546,', 3, '綦江县', NULL, NULL, NULL, NULL, 'false'),
(2547, 'mainland', 2530, ',2529,2530,2547,', 3, '潼南县', NULL, NULL, NULL, NULL, 'false'),
(2548, 'mainland', 2530, ',2529,2530,2548,', 3, '铜梁县', NULL, NULL, NULL, NULL, 'false'),
(2549, 'mainland', 2530, ',2529,2530,2549,', 3, '大足县', NULL, NULL, NULL, NULL, 'false'),
(2550, 'mainland', 2530, ',2529,2530,2550,', 3, '荣昌县', NULL, NULL, NULL, NULL, 'false'),
(2551, 'mainland', 2530, ',2529,2530,2551,', 3, '璧山县', NULL, NULL, NULL, NULL, 'false'),
(2552, 'mainland', 2530, ',2529,2530,2552,', 3, '梁平县', NULL, NULL, NULL, NULL, 'false'),
(2553, 'mainland', 2530, ',2529,2530,2553,', 3, '城口县', NULL, NULL, NULL, NULL, 'false'),
(2554, 'mainland', 2530, ',2529,2530,2554,', 3, '丰都县', NULL, NULL, NULL, NULL, 'false'),
(2555, 'mainland', 2530, ',2529,2530,2555,', 3, '垫江县', NULL, NULL, NULL, NULL, 'false'),
(2556, 'mainland', 2530, ',2529,2530,2556,', 3, '武隆县', NULL, NULL, NULL, NULL, 'false'),
(2557, 'mainland', 2530, ',2529,2530,2557,', 3, '忠县', NULL, NULL, NULL, NULL, 'false'),
(2558, 'mainland', 2530, ',2529,2530,2558,', 3, '开县', NULL, NULL, NULL, NULL, 'false'),
(2559, 'mainland', 2530, ',2529,2530,2559,', 3, '云阳县', NULL, NULL, NULL, NULL, 'false'),
(2560, 'mainland', 2530, ',2529,2530,2560,', 3, '奉节县', NULL, NULL, NULL, NULL, 'false'),
(2561, 'mainland', 2530, ',2529,2530,2561,', 3, '巫山县', NULL, NULL, NULL, NULL, 'false'),
(2562, 'mainland', 2530, ',2529,2530,2562,', 3, '巫溪县', NULL, NULL, NULL, NULL, 'false'),
(2563, 'mainland', 2530, ',2529,2530,2563,', 3, '石柱土家族自治县', NULL, NULL, NULL, NULL, 'false'),
(2564, 'mainland', 2530, ',2529,2530,2564,', 3, '秀山土家族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2565, 'mainland', 2530, ',2529,2530,2565,', 3, '酉阳土家族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2566, 'mainland', 2530, ',2529,2530,2566,', 3, '彭水苗族土家族自治县', NULL, NULL, NULL, NULL, 'false'),
(2567, 'mainland', 2530, ',2529,2530,2567,', 3, '江津区', NULL, NULL, NULL, NULL, 'false'),
(2568, 'mainland', 2530, ',2529,2530,2568,', 3, '合川区', NULL, NULL, NULL, NULL, 'false'),
(2569, 'mainland', 2530, ',2529,2530,2569,', 3, '永川区', NULL, NULL, NULL, NULL, 'false'),
(2570, 'mainland', 2530, ',2529,2530,2570,', 3, '南川区', NULL, NULL, NULL, NULL, 'false'),
(2571, 'mainland', 2530, ',2529,2530,2571,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2572, 'mainland', NULL, ',2572,', 1, '四川省', NULL, NULL, NULL, NULL, 'false'),
(2573, 'mainland', 2572, ',2572,2573,', 2, '成都市', NULL, NULL, NULL, NULL, 'false'),
(2574, 'mainland', 2573, ',2572,2573,2574,', 3, '锦江区', NULL, NULL, NULL, NULL, 'false'),
(2575, 'mainland', 2573, ',2572,2573,2575,', 3, '青羊区', NULL, NULL, NULL, NULL, 'false'),
(2576, 'mainland', 2573, ',2572,2573,2576,', 3, '金牛区', NULL, NULL, NULL, NULL, 'false'),
(2577, 'mainland', 2573, ',2572,2573,2577,', 3, '武侯区', NULL, NULL, NULL, NULL, 'false'),
(2578, 'mainland', 2573, ',2572,2573,2578,', 3, '成华区', NULL, NULL, NULL, NULL, 'false'),
(2579, 'mainland', 2573, ',2572,2573,2579,', 3, '龙泉驿区', NULL, NULL, NULL, NULL, 'false'),
(2580, 'mainland', 2573, ',2572,2573,2580,', 3, '青白江区', NULL, NULL, NULL, NULL, 'false'),
(2581, 'mainland', 2573, ',2572,2573,2581,', 3, '新都区', NULL, NULL, NULL, NULL, 'false'),
(2582, 'mainland', 2573, ',2572,2573,2582,', 3, '温江区', NULL, NULL, NULL, NULL, 'false'),
(2583, 'mainland', 2573, ',2572,2573,2583,', 3, '金堂县', NULL, NULL, NULL, NULL, 'false'),
(2584, 'mainland', 2573, ',2572,2573,2584,', 3, '双流县', NULL, NULL, NULL, NULL, 'false'),
(2585, 'mainland', 2573, ',2572,2573,2585,', 3, '郫县', NULL, NULL, NULL, NULL, 'false'),
(2586, 'mainland', 2573, ',2572,2573,2586,', 3, '大邑县', NULL, NULL, NULL, NULL, 'false'),
(2587, 'mainland', 2573, ',2572,2573,2587,', 3, '蒲江县', NULL, NULL, NULL, NULL, 'false'),
(2588, 'mainland', 2573, ',2572,2573,2588,', 3, '新津县', NULL, NULL, NULL, NULL, 'false'),
(2589, 'mainland', 2573, ',2572,2573,2589,', 3, '都江堰市', NULL, NULL, NULL, NULL, 'false'),
(2590, 'mainland', 2573, ',2572,2573,2590,', 3, '彭州市', NULL, NULL, NULL, NULL, 'false'),
(2591, 'mainland', 2573, ',2572,2573,2591,', 3, '邛崃市', NULL, NULL, NULL, NULL, 'false'),
(2592, 'mainland', 2573, ',2572,2573,2592,', 3, '崇州市', NULL, NULL, NULL, NULL, 'false'),
(2593, 'mainland', 2573, ',2572,2573,2593,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2594, 'mainland', 2572, ',2572,2594,', 2, '自贡市', NULL, NULL, NULL, NULL, 'false'),
(2595, 'mainland', 2594, ',2572,2594,2595,', 3, '自流井区', NULL, NULL, NULL, NULL, 'false'),
(2596, 'mainland', 2594, ',2572,2594,2596,', 3, '贡井区', NULL, NULL, NULL, NULL, 'false'),
(2597, 'mainland', 2594, ',2572,2594,2597,', 3, '大安区', NULL, NULL, NULL, NULL, 'false'),
(2598, 'mainland', 2594, ',2572,2594,2598,', 3, '沿滩区', NULL, NULL, NULL, NULL, 'false'),
(2599, 'mainland', 2594, ',2572,2594,2599,', 3, '荣县', NULL, NULL, NULL, NULL, 'false'),
(2600, 'mainland', 2594, ',2572,2594,2600,', 3, '富顺县', NULL, NULL, NULL, NULL, 'false'),
(2601, 'mainland', 2594, ',2572,2594,2601,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2602, 'mainland', 2572, ',2572,2602,', 2, '攀枝花市', NULL, NULL, NULL, NULL, 'false'),
(2603, 'mainland', 2602, ',2572,2602,2603,', 3, '东区', NULL, NULL, NULL, NULL, 'false'),
(2604, 'mainland', 2602, ',2572,2602,2604,', 3, '西区', NULL, NULL, NULL, NULL, 'false'),
(2605, 'mainland', 2602, ',2572,2602,2605,', 3, '仁和区', NULL, NULL, NULL, NULL, 'false'),
(2606, 'mainland', 2602, ',2572,2602,2606,', 3, '米易县', NULL, NULL, NULL, NULL, 'false'),
(2607, 'mainland', 2602, ',2572,2602,2607,', 3, '盐边县', NULL, NULL, NULL, NULL, 'false'),
(2608, 'mainland', 2602, ',2572,2602,2608,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2609, 'mainland', 2572, ',2572,2609,', 2, '泸州市', NULL, NULL, NULL, NULL, 'false'),
(2610, 'mainland', 2609, ',2572,2609,2610,', 3, '江阳区', NULL, NULL, NULL, NULL, 'false'),
(2611, 'mainland', 2609, ',2572,2609,2611,', 3, '纳溪区', NULL, NULL, NULL, NULL, 'false'),
(2612, 'mainland', 2609, ',2572,2609,2612,', 3, '龙马潭区', NULL, NULL, NULL, NULL, 'false'),
(2613, 'mainland', 2609, ',2572,2609,2613,', 3, '泸县', NULL, NULL, NULL, NULL, 'false'),
(2614, 'mainland', 2609, ',2572,2609,2614,', 3, '合江县', NULL, NULL, NULL, NULL, 'false'),
(2615, 'mainland', 2609, ',2572,2609,2615,', 3, '叙永县', NULL, NULL, NULL, NULL, 'false'),
(2616, 'mainland', 2609, ',2572,2609,2616,', 3, '古蔺县', NULL, NULL, NULL, NULL, 'false'),
(2617, 'mainland', 2609, ',2572,2609,2617,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2618, 'mainland', 2572, ',2572,2618,', 2, '德阳市', NULL, NULL, NULL, NULL, 'false'),
(2619, 'mainland', 2618, ',2572,2618,2619,', 3, '旌阳区', NULL, NULL, NULL, NULL, 'false'),
(2620, 'mainland', 2618, ',2572,2618,2620,', 3, '中江县', NULL, NULL, NULL, NULL, 'false'),
(2621, 'mainland', 2618, ',2572,2618,2621,', 3, '罗江县', NULL, NULL, NULL, NULL, 'false'),
(2622, 'mainland', 2618, ',2572,2618,2622,', 3, '广汉市', NULL, NULL, NULL, NULL, 'false'),
(2623, 'mainland', 2618, ',2572,2618,2623,', 3, '什邡市', NULL, NULL, NULL, NULL, 'false'),
(2624, 'mainland', 2618, ',2572,2618,2624,', 3, '绵竹市', NULL, NULL, NULL, NULL, 'false'),
(2625, 'mainland', 2618, ',2572,2618,2625,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2626, 'mainland', 2572, ',2572,2626,', 2, '绵阳市', NULL, NULL, NULL, NULL, 'false'),
(2627, 'mainland', 2626, ',2572,2626,2627,', 3, '涪城区', NULL, NULL, NULL, NULL, 'false'),
(2628, 'mainland', 2626, ',2572,2626,2628,', 3, '游仙区', NULL, NULL, NULL, NULL, 'false'),
(2629, 'mainland', 2626, ',2572,2626,2629,', 3, '三台县', NULL, NULL, NULL, NULL, 'false'),
(2630, 'mainland', 2626, ',2572,2626,2630,', 3, '盐亭县', NULL, NULL, NULL, NULL, 'false'),
(2631, 'mainland', 2626, ',2572,2626,2631,', 3, '安县', NULL, NULL, NULL, NULL, 'false'),
(2632, 'mainland', 2626, ',2572,2626,2632,', 3, '梓潼县', NULL, NULL, NULL, NULL, 'false'),
(2633, 'mainland', 2626, ',2572,2626,2633,', 3, '北川羌族自治县', NULL, NULL, NULL, NULL, 'false'),
(2634, 'mainland', 2626, ',2572,2626,2634,', 3, '平武县', NULL, NULL, NULL, NULL, 'false'),
(2635, 'mainland', 2626, ',2572,2626,2635,', 3, '高新区', NULL, NULL, NULL, NULL, 'false'),
(2636, 'mainland', 2626, ',2572,2626,2636,', 3, '江油市', NULL, NULL, NULL, NULL, 'false'),
(2637, 'mainland', 2626, ',2572,2626,2637,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2638, 'mainland', 2572, ',2572,2638,', 2, '广元市', NULL, NULL, NULL, NULL, 'false'),
(2639, 'mainland', 2638, ',2572,2638,2639,', 3, '利州区', NULL, NULL, NULL, NULL, 'false'),
(2640, 'mainland', 2638, ',2572,2638,2640,', 3, '元坝区', NULL, NULL, NULL, NULL, 'false'),
(2641, 'mainland', 2638, ',2572,2638,2641,', 3, '朝天区', NULL, NULL, NULL, NULL, 'false'),
(2642, 'mainland', 2638, ',2572,2638,2642,', 3, '旺苍县', NULL, NULL, NULL, NULL, 'false'),
(2643, 'mainland', 2638, ',2572,2638,2643,', 3, '青川县', NULL, NULL, NULL, NULL, 'false'),
(2644, 'mainland', 2638, ',2572,2638,2644,', 3, '剑阁县', NULL, NULL, NULL, NULL, 'false'),
(2645, 'mainland', 2638, ',2572,2638,2645,', 3, '苍溪县', NULL, NULL, NULL, NULL, 'false'),
(2646, 'mainland', 2638, ',2572,2638,2646,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2647, 'mainland', 2572, ',2572,2647,', 2, '遂宁市', NULL, NULL, NULL, NULL, 'false'),
(2648, 'mainland', 2647, ',2572,2647,2648,', 3, '船山区', NULL, NULL, NULL, NULL, 'false'),
(2649, 'mainland', 2647, ',2572,2647,2649,', 3, '安居区', NULL, NULL, NULL, NULL, 'false'),
(2650, 'mainland', 2647, ',2572,2647,2650,', 3, '蓬溪县', NULL, NULL, NULL, NULL, 'false'),
(2651, 'mainland', 2647, ',2572,2647,2651,', 3, '射洪县', NULL, NULL, NULL, NULL, 'false'),
(2652, 'mainland', 2647, ',2572,2647,2652,', 3, '大英县', NULL, NULL, NULL, NULL, 'false'),
(2653, 'mainland', 2647, ',2572,2647,2653,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2654, 'mainland', 2572, ',2572,2654,', 2, '内江市', NULL, NULL, NULL, NULL, 'false'),
(2655, 'mainland', 2654, ',2572,2654,2655,', 3, '市中区', NULL, NULL, NULL, NULL, 'false'),
(2656, 'mainland', 2654, ',2572,2654,2656,', 3, '东兴区', NULL, NULL, NULL, NULL, 'false'),
(2657, 'mainland', 2654, ',2572,2654,2657,', 3, '威远县', NULL, NULL, NULL, NULL, 'false'),
(2658, 'mainland', 2654, ',2572,2654,2658,', 3, '资中县', NULL, NULL, NULL, NULL, 'false'),
(2659, 'mainland', 2654, ',2572,2654,2659,', 3, '隆昌县', NULL, NULL, NULL, NULL, 'false'),
(2660, 'mainland', 2654, ',2572,2654,2660,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2661, 'mainland', 2572, ',2572,2661,', 2, '乐山市', NULL, NULL, NULL, NULL, 'false'),
(2662, 'mainland', 2661, ',2572,2661,2662,', 3, '市中区', NULL, NULL, NULL, NULL, 'false'),
(2663, 'mainland', 2661, ',2572,2661,2663,', 3, '沙湾区', NULL, NULL, NULL, NULL, 'false'),
(2664, 'mainland', 2661, ',2572,2661,2664,', 3, '五通桥区', NULL, NULL, NULL, NULL, 'false'),
(2665, 'mainland', 2661, ',2572,2661,2665,', 3, '金口河区', NULL, NULL, NULL, NULL, 'false'),
(2666, 'mainland', 2661, ',2572,2661,2666,', 3, '犍为县', NULL, NULL, NULL, NULL, 'false'),
(2667, 'mainland', 2661, ',2572,2661,2667,', 3, '井研县', NULL, NULL, NULL, NULL, 'false'),
(2668, 'mainland', 2661, ',2572,2661,2668,', 3, '夹江县', NULL, NULL, NULL, NULL, 'false'),
(2669, 'mainland', 2661, ',2572,2661,2669,', 3, '沐川县', NULL, NULL, NULL, NULL, 'false'),
(2670, 'mainland', 2661, ',2572,2661,2670,', 3, '峨边彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2671, 'mainland', 2661, ',2572,2661,2671,', 3, '马边彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2672, 'mainland', 2661, ',2572,2661,2672,', 3, '峨眉山市', NULL, NULL, NULL, NULL, 'false'),
(2673, 'mainland', 2661, ',2572,2661,2673,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2674, 'mainland', 2572, ',2572,2674,', 2, '南充市', NULL, NULL, NULL, NULL, 'false'),
(2675, 'mainland', 2674, ',2572,2674,2675,', 3, '顺庆区', NULL, NULL, NULL, NULL, 'false'),
(2676, 'mainland', 2674, ',2572,2674,2676,', 3, '高坪区', NULL, NULL, NULL, NULL, 'false'),
(2677, 'mainland', 2674, ',2572,2674,2677,', 3, '嘉陵区', NULL, NULL, NULL, NULL, 'false'),
(2678, 'mainland', 2674, ',2572,2674,2678,', 3, '南部县', NULL, NULL, NULL, NULL, 'false'),
(2679, 'mainland', 2674, ',2572,2674,2679,', 3, '营山县', NULL, NULL, NULL, NULL, 'false'),
(2680, 'mainland', 2674, ',2572,2674,2680,', 3, '蓬安县', NULL, NULL, NULL, NULL, 'false'),
(2681, 'mainland', 2674, ',2572,2674,2681,', 3, '仪陇县', NULL, NULL, NULL, NULL, 'false'),
(2682, 'mainland', 2674, ',2572,2674,2682,', 3, '西充县', NULL, NULL, NULL, NULL, 'false'),
(2683, 'mainland', 2674, ',2572,2674,2683,', 3, '阆中市', NULL, NULL, NULL, NULL, 'false'),
(2684, 'mainland', 2674, ',2572,2674,2684,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2685, 'mainland', 2572, ',2572,2685,', 2, '眉山市', NULL, NULL, NULL, NULL, 'false'),
(2686, 'mainland', 2685, ',2572,2685,2686,', 3, '东坡区', NULL, NULL, NULL, NULL, 'false'),
(2687, 'mainland', 2685, ',2572,2685,2687,', 3, '仁寿县', NULL, NULL, NULL, NULL, 'false'),
(2688, 'mainland', 2685, ',2572,2685,2688,', 3, '彭山县', NULL, NULL, NULL, NULL, 'false'),
(2689, 'mainland', 2685, ',2572,2685,2689,', 3, '洪雅县', NULL, NULL, NULL, NULL, 'false'),
(2690, 'mainland', 2685, ',2572,2685,2690,', 3, '丹棱县', NULL, NULL, NULL, NULL, 'false'),
(2691, 'mainland', 2685, ',2572,2685,2691,', 3, '青神县', NULL, NULL, NULL, NULL, 'false'),
(2692, 'mainland', 2685, ',2572,2685,2692,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2693, 'mainland', 2572, ',2572,2693,', 2, '宜宾市', NULL, NULL, NULL, NULL, 'false'),
(2694, 'mainland', 2693, ',2572,2693,2694,', 3, '翠屏区', NULL, NULL, NULL, NULL, 'false'),
(2695, 'mainland', 2693, ',2572,2693,2695,', 3, '宜宾县', NULL, NULL, NULL, NULL, 'false'),
(2696, 'mainland', 2693, ',2572,2693,2696,', 3, '南溪县', NULL, NULL, NULL, NULL, 'false'),
(2697, 'mainland', 2693, ',2572,2693,2697,', 3, '江安县', NULL, NULL, NULL, NULL, 'false'),
(2698, 'mainland', 2693, ',2572,2693,2698,', 3, '长宁县', NULL, NULL, NULL, NULL, 'false'),
(2699, 'mainland', 2693, ',2572,2693,2699,', 3, '高县', NULL, NULL, NULL, NULL, 'false'),
(2700, 'mainland', 2693, ',2572,2693,2700,', 3, '珙县', NULL, NULL, NULL, NULL, 'false'),
(2701, 'mainland', 2693, ',2572,2693,2701,', 3, '筠连县', NULL, NULL, NULL, NULL, 'false'),
(2702, 'mainland', 2693, ',2572,2693,2702,', 3, '兴文县', NULL, NULL, NULL, NULL, 'false'),
(2703, 'mainland', 2693, ',2572,2693,2703,', 3, '屏山县', NULL, NULL, NULL, NULL, 'false'),
(2704, 'mainland', 2693, ',2572,2693,2704,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2705, 'mainland', 2572, ',2572,2705,', 2, '广安市', NULL, NULL, NULL, NULL, 'false'),
(2706, 'mainland', 2705, ',2572,2705,2706,', 3, '广安区', NULL, NULL, NULL, NULL, 'false'),
(2707, 'mainland', 2705, ',2572,2705,2707,', 3, '岳池县', NULL, NULL, NULL, NULL, 'false'),
(2708, 'mainland', 2705, ',2572,2705,2708,', 3, '武胜县', NULL, NULL, NULL, NULL, 'false'),
(2709, 'mainland', 2705, ',2572,2705,2709,', 3, '邻水县', NULL, NULL, NULL, NULL, 'false'),
(2710, 'mainland', 2705, ',2572,2705,2710,', 3, '华蓥市', NULL, NULL, NULL, NULL, 'false'),
(2711, 'mainland', 2705, ',2572,2705,2711,', 3, '市辖区', NULL, NULL, NULL, NULL, 'false'),
(2712, 'mainland', 2705, ',2572,2705,2712,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2713, 'mainland', 2572, ',2572,2713,', 2, '达州市', NULL, NULL, NULL, NULL, 'false'),
(2714, 'mainland', 2713, ',2572,2713,2714,', 3, '通川区', NULL, NULL, NULL, NULL, 'false'),
(2715, 'mainland', 2713, ',2572,2713,2715,', 3, '达县', NULL, NULL, NULL, NULL, 'false'),
(2716, 'mainland', 2713, ',2572,2713,2716,', 3, '宣汉县', NULL, NULL, NULL, NULL, 'false'),
(2717, 'mainland', 2713, ',2572,2713,2717,', 3, '开江县', NULL, NULL, NULL, NULL, 'false'),
(2718, 'mainland', 2713, ',2572,2713,2718,', 3, '大竹县', NULL, NULL, NULL, NULL, 'false'),
(2719, 'mainland', 2713, ',2572,2713,2719,', 3, '渠县', NULL, NULL, NULL, NULL, 'false'),
(2720, 'mainland', 2713, ',2572,2713,2720,', 3, '万源市', NULL, NULL, NULL, NULL, 'false'),
(2721, 'mainland', 2713, ',2572,2713,2721,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2722, 'mainland', 2572, ',2572,2722,', 2, '雅安市', NULL, NULL, NULL, NULL, 'false'),
(2723, 'mainland', 2722, ',2572,2722,2723,', 3, '雨城区', NULL, NULL, NULL, NULL, 'false'),
(2724, 'mainland', 2722, ',2572,2722,2724,', 3, '名山县', NULL, NULL, NULL, NULL, 'false'),
(2725, 'mainland', 2722, ',2572,2722,2725,', 3, '荥经县', NULL, NULL, NULL, NULL, 'false'),
(2726, 'mainland', 2722, ',2572,2722,2726,', 3, '汉源县', NULL, NULL, NULL, NULL, 'false'),
(2727, 'mainland', 2722, ',2572,2722,2727,', 3, '石棉县', NULL, NULL, NULL, NULL, 'false'),
(2728, 'mainland', 2722, ',2572,2722,2728,', 3, '天全县', NULL, NULL, NULL, NULL, 'false'),
(2729, 'mainland', 2722, ',2572,2722,2729,', 3, '芦山县', NULL, NULL, NULL, NULL, 'false'),
(2730, 'mainland', 2722, ',2572,2722,2730,', 3, '宝兴县', NULL, NULL, NULL, NULL, 'false'),
(2731, 'mainland', 2722, ',2572,2722,2731,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2732, 'mainland', 2572, ',2572,2732,', 2, '巴中市', NULL, NULL, NULL, NULL, 'false'),
(2733, 'mainland', 2732, ',2572,2732,2733,', 3, '巴州区', NULL, NULL, NULL, NULL, 'false'),
(2734, 'mainland', 2732, ',2572,2732,2734,', 3, '通江县', NULL, NULL, NULL, NULL, 'false'),
(2735, 'mainland', 2732, ',2572,2732,2735,', 3, '南江县', NULL, NULL, NULL, NULL, 'false'),
(2736, 'mainland', 2732, ',2572,2732,2736,', 3, '平昌县', NULL, NULL, NULL, NULL, 'false'),
(2737, 'mainland', 2732, ',2572,2732,2737,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2738, 'mainland', 2572, ',2572,2738,', 2, '资阳市', NULL, NULL, NULL, NULL, 'false');
INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(2739, 'mainland', 2738, ',2572,2738,2739,', 3, '雁江区', NULL, NULL, NULL, NULL, 'false'),
(2740, 'mainland', 2738, ',2572,2738,2740,', 3, '安岳县', NULL, NULL, NULL, NULL, 'false'),
(2741, 'mainland', 2738, ',2572,2738,2741,', 3, '乐至县', NULL, NULL, NULL, NULL, 'false'),
(2742, 'mainland', 2738, ',2572,2738,2742,', 3, '简阳市', NULL, NULL, NULL, NULL, 'false'),
(2743, 'mainland', 2738, ',2572,2738,2743,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2744, 'mainland', 2572, ',2572,2744,', 2, '阿坝藏族羌族自治州', NULL, NULL, NULL, NULL, 'false'),
(2745, 'mainland', 2744, ',2572,2744,2745,', 3, '汶川县', NULL, NULL, NULL, NULL, 'false'),
(2746, 'mainland', 2744, ',2572,2744,2746,', 3, '理县', NULL, NULL, NULL, NULL, 'false'),
(2747, 'mainland', 2744, ',2572,2744,2747,', 3, '茂县', NULL, NULL, NULL, NULL, 'false'),
(2748, 'mainland', 2744, ',2572,2744,2748,', 3, '松潘县', NULL, NULL, NULL, NULL, 'false'),
(2749, 'mainland', 2744, ',2572,2744,2749,', 3, '九寨沟县', NULL, NULL, NULL, NULL, 'false'),
(2750, 'mainland', 2744, ',2572,2744,2750,', 3, '金川县', NULL, NULL, NULL, NULL, 'false'),
(2751, 'mainland', 2744, ',2572,2744,2751,', 3, '小金县', NULL, NULL, NULL, NULL, 'false'),
(2752, 'mainland', 2744, ',2572,2744,2752,', 3, '黑水县', NULL, NULL, NULL, NULL, 'false'),
(2753, 'mainland', 2744, ',2572,2744,2753,', 3, '马尔康县', NULL, NULL, NULL, NULL, 'false'),
(2754, 'mainland', 2744, ',2572,2744,2754,', 3, '壤塘县', NULL, NULL, NULL, NULL, 'false'),
(2755, 'mainland', 2744, ',2572,2744,2755,', 3, '阿坝县', NULL, NULL, NULL, NULL, 'false'),
(2756, 'mainland', 2744, ',2572,2744,2756,', 3, '若尔盖县', NULL, NULL, NULL, NULL, 'false'),
(2757, 'mainland', 2744, ',2572,2744,2757,', 3, '红原县', NULL, NULL, NULL, NULL, 'false'),
(2758, 'mainland', 2744, ',2572,2744,2758,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2759, 'mainland', 2572, ',2572,2759,', 2, '甘孜藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(2760, 'mainland', 2759, ',2572,2759,2760,', 3, '康定县', NULL, NULL, NULL, NULL, 'false'),
(2761, 'mainland', 2759, ',2572,2759,2761,', 3, '泸定县', NULL, NULL, NULL, NULL, 'false'),
(2762, 'mainland', 2759, ',2572,2759,2762,', 3, '丹巴县', NULL, NULL, NULL, NULL, 'false'),
(2763, 'mainland', 2759, ',2572,2759,2763,', 3, '九龙县', NULL, NULL, NULL, NULL, 'false'),
(2764, 'mainland', 2759, ',2572,2759,2764,', 3, '雅江县', NULL, NULL, NULL, NULL, 'false'),
(2765, 'mainland', 2759, ',2572,2759,2765,', 3, '道孚县', NULL, NULL, NULL, NULL, 'false'),
(2766, 'mainland', 2759, ',2572,2759,2766,', 3, '炉霍县', NULL, NULL, NULL, NULL, 'false'),
(2767, 'mainland', 2759, ',2572,2759,2767,', 3, '甘孜县', NULL, NULL, NULL, NULL, 'false'),
(2768, 'mainland', 2759, ',2572,2759,2768,', 3, '新龙县', NULL, NULL, NULL, NULL, 'false'),
(2769, 'mainland', 2759, ',2572,2759,2769,', 3, '德格县', NULL, NULL, NULL, NULL, 'false'),
(2770, 'mainland', 2759, ',2572,2759,2770,', 3, '白玉县', NULL, NULL, NULL, NULL, 'false'),
(2771, 'mainland', 2759, ',2572,2759,2771,', 3, '石渠县', NULL, NULL, NULL, NULL, 'false'),
(2772, 'mainland', 2759, ',2572,2759,2772,', 3, '色达县', NULL, NULL, NULL, NULL, 'false'),
(2773, 'mainland', 2759, ',2572,2759,2773,', 3, '理塘县', NULL, NULL, NULL, NULL, 'false'),
(2774, 'mainland', 2759, ',2572,2759,2774,', 3, '巴塘县', NULL, NULL, NULL, NULL, 'false'),
(2775, 'mainland', 2759, ',2572,2759,2775,', 3, '乡城县', NULL, NULL, NULL, NULL, 'false'),
(2776, 'mainland', 2759, ',2572,2759,2776,', 3, '稻城县', NULL, NULL, NULL, NULL, 'false'),
(2777, 'mainland', 2759, ',2572,2759,2777,', 3, '得荣县', NULL, NULL, NULL, NULL, 'false'),
(2778, 'mainland', 2759, ',2572,2759,2778,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2779, 'mainland', 2572, ',2572,2779,', 2, '凉山彝族自治州', NULL, NULL, NULL, NULL, 'false'),
(2780, 'mainland', 2779, ',2572,2779,2780,', 3, '西昌市', NULL, NULL, NULL, NULL, 'false'),
(2781, 'mainland', 2779, ',2572,2779,2781,', 3, '木里藏族自治县', NULL, NULL, NULL, NULL, 'false'),
(2782, 'mainland', 2779, ',2572,2779,2782,', 3, '盐源县', NULL, NULL, NULL, NULL, 'false'),
(2783, 'mainland', 2779, ',2572,2779,2783,', 3, '德昌县', NULL, NULL, NULL, NULL, 'false'),
(2784, 'mainland', 2779, ',2572,2779,2784,', 3, '会理县', NULL, NULL, NULL, NULL, 'false'),
(2785, 'mainland', 2779, ',2572,2779,2785,', 3, '会东县', NULL, NULL, NULL, NULL, 'false'),
(2786, 'mainland', 2779, ',2572,2779,2786,', 3, '宁南县', NULL, NULL, NULL, NULL, 'false'),
(2787, 'mainland', 2779, ',2572,2779,2787,', 3, '普格县', NULL, NULL, NULL, NULL, 'false'),
(2788, 'mainland', 2779, ',2572,2779,2788,', 3, '布拖县', NULL, NULL, NULL, NULL, 'false'),
(2789, 'mainland', 2779, ',2572,2779,2789,', 3, '金阳县', NULL, NULL, NULL, NULL, 'false'),
(2790, 'mainland', 2779, ',2572,2779,2790,', 3, '昭觉县', NULL, NULL, NULL, NULL, 'false'),
(2791, 'mainland', 2779, ',2572,2779,2791,', 3, '喜德县', NULL, NULL, NULL, NULL, 'false'),
(2792, 'mainland', 2779, ',2572,2779,2792,', 3, '冕宁县', NULL, NULL, NULL, NULL, 'false'),
(2793, 'mainland', 2779, ',2572,2779,2793,', 3, '越西县', NULL, NULL, NULL, NULL, 'false'),
(2794, 'mainland', 2779, ',2572,2779,2794,', 3, '甘洛县', NULL, NULL, NULL, NULL, 'false'),
(2795, 'mainland', 2779, ',2572,2779,2795,', 3, '美姑县', NULL, NULL, NULL, NULL, 'false'),
(2796, 'mainland', 2779, ',2572,2779,2796,', 3, '雷波县', NULL, NULL, NULL, NULL, 'false'),
(2797, 'mainland', 2779, ',2572,2779,2797,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2798, 'mainland', NULL, ',2798,', 1, '贵州省', NULL, NULL, NULL, NULL, 'false'),
(2799, 'mainland', 2798, ',2798,2799,', 2, '贵阳市', NULL, NULL, NULL, NULL, 'false'),
(2800, 'mainland', 2799, ',2798,2799,2800,', 3, '南明区', NULL, NULL, NULL, NULL, 'false'),
(2801, 'mainland', 2799, ',2798,2799,2801,', 3, '云岩区', NULL, NULL, NULL, NULL, 'false'),
(2802, 'mainland', 2799, ',2798,2799,2802,', 3, '花溪区', NULL, NULL, NULL, NULL, 'false'),
(2803, 'mainland', 2799, ',2798,2799,2803,', 3, '乌当区', NULL, NULL, NULL, NULL, 'false'),
(2804, 'mainland', 2799, ',2798,2799,2804,', 3, '白云区', NULL, NULL, NULL, NULL, 'false'),
(2805, 'mainland', 2799, ',2798,2799,2805,', 3, '小河区', NULL, NULL, NULL, NULL, 'false'),
(2806, 'mainland', 2799, ',2798,2799,2806,', 3, '开阳县', NULL, NULL, NULL, NULL, 'false'),
(2807, 'mainland', 2799, ',2798,2799,2807,', 3, '息烽县', NULL, NULL, NULL, NULL, 'false'),
(2808, 'mainland', 2799, ',2798,2799,2808,', 3, '修文县', NULL, NULL, NULL, NULL, 'false'),
(2809, 'mainland', 2799, ',2798,2799,2809,', 3, '金阳开发区', NULL, NULL, NULL, NULL, 'false'),
(2810, 'mainland', 2799, ',2798,2799,2810,', 3, '清镇市', NULL, NULL, NULL, NULL, 'false'),
(2811, 'mainland', 2799, ',2798,2799,2811,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2812, 'mainland', 2798, ',2798,2812,', 2, '六盘水市', NULL, NULL, NULL, NULL, 'false'),
(2813, 'mainland', 2812, ',2798,2812,2813,', 3, '钟山区', NULL, NULL, NULL, NULL, 'false'),
(2814, 'mainland', 2812, ',2798,2812,2814,', 3, '六枝特区', NULL, NULL, NULL, NULL, 'false'),
(2815, 'mainland', 2812, ',2798,2812,2815,', 3, '水城县', NULL, NULL, NULL, NULL, 'false'),
(2816, 'mainland', 2812, ',2798,2812,2816,', 3, '盘县', NULL, NULL, NULL, NULL, 'false'),
(2817, 'mainland', 2812, ',2798,2812,2817,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2818, 'mainland', 2798, ',2798,2818,', 2, '遵义市', NULL, NULL, NULL, NULL, 'false'),
(2819, 'mainland', 2818, ',2798,2818,2819,', 3, '红花岗区', NULL, NULL, NULL, NULL, 'false'),
(2820, 'mainland', 2818, ',2798,2818,2820,', 3, '汇川区', NULL, NULL, NULL, NULL, 'false'),
(2821, 'mainland', 2818, ',2798,2818,2821,', 3, '遵义县', NULL, NULL, NULL, NULL, 'false'),
(2822, 'mainland', 2818, ',2798,2818,2822,', 3, '桐梓县', NULL, NULL, NULL, NULL, 'false'),
(2823, 'mainland', 2818, ',2798,2818,2823,', 3, '绥阳县', NULL, NULL, NULL, NULL, 'false'),
(2824, 'mainland', 2818, ',2798,2818,2824,', 3, '正安县', NULL, NULL, NULL, NULL, 'false'),
(2825, 'mainland', 2818, ',2798,2818,2825,', 3, '道真仡佬族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2826, 'mainland', 2818, ',2798,2818,2826,', 3, '务川仡佬族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2827, 'mainland', 2818, ',2798,2818,2827,', 3, '凤冈县', NULL, NULL, NULL, NULL, 'false'),
(2828, 'mainland', 2818, ',2798,2818,2828,', 3, '湄潭县', NULL, NULL, NULL, NULL, 'false'),
(2829, 'mainland', 2818, ',2798,2818,2829,', 3, '余庆县', NULL, NULL, NULL, NULL, 'false'),
(2830, 'mainland', 2818, ',2798,2818,2830,', 3, '习水县', NULL, NULL, NULL, NULL, 'false'),
(2831, 'mainland', 2818, ',2798,2818,2831,', 3, '赤水市', NULL, NULL, NULL, NULL, 'false'),
(2832, 'mainland', 2818, ',2798,2818,2832,', 3, '仁怀市', NULL, NULL, NULL, NULL, 'false'),
(2833, 'mainland', 2818, ',2798,2818,2833,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2834, 'mainland', 2798, ',2798,2834,', 2, '安顺市', NULL, NULL, NULL, NULL, 'false'),
(2835, 'mainland', 2834, ',2798,2834,2835,', 3, '西秀区', NULL, NULL, NULL, NULL, 'false'),
(2836, 'mainland', 2834, ',2798,2834,2836,', 3, '平坝县', NULL, NULL, NULL, NULL, 'false'),
(2837, 'mainland', 2834, ',2798,2834,2837,', 3, '普定县', NULL, NULL, NULL, NULL, 'false'),
(2838, 'mainland', 2834, ',2798,2834,2838,', 3, '镇宁布依族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2839, 'mainland', 2834, ',2798,2834,2839,', 3, '关岭布依族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2840, 'mainland', 2834, ',2798,2834,2840,', 3, '紫云苗族布依族自治县', NULL, NULL, NULL, NULL, 'false'),
(2841, 'mainland', 2834, ',2798,2834,2841,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2842, 'mainland', 2798, ',2798,2842,', 2, '铜仁地区', NULL, NULL, NULL, NULL, 'false'),
(2843, 'mainland', 2842, ',2798,2842,2843,', 3, '铜仁市', NULL, NULL, NULL, NULL, 'false'),
(2844, 'mainland', 2842, ',2798,2842,2844,', 3, '江口县', NULL, NULL, NULL, NULL, 'false'),
(2845, 'mainland', 2842, ',2798,2842,2845,', 3, '玉屏侗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2846, 'mainland', 2842, ',2798,2842,2846,', 3, '石阡县', NULL, NULL, NULL, NULL, 'false'),
(2847, 'mainland', 2842, ',2798,2842,2847,', 3, '思南县', NULL, NULL, NULL, NULL, 'false'),
(2848, 'mainland', 2842, ',2798,2842,2848,', 3, '印江土家族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2849, 'mainland', 2842, ',2798,2842,2849,', 3, '德江县', NULL, NULL, NULL, NULL, 'false'),
(2850, 'mainland', 2842, ',2798,2842,2850,', 3, '沿河土家族自治县', NULL, NULL, NULL, NULL, 'false'),
(2851, 'mainland', 2842, ',2798,2842,2851,', 3, '松桃苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2852, 'mainland', 2842, ',2798,2842,2852,', 3, '万山特区', NULL, NULL, NULL, NULL, 'false'),
(2853, 'mainland', 2842, ',2798,2842,2853,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2854, 'mainland', 2798, ',2798,2854,', 2, '黔西南布依族苗族自治州', NULL, NULL, NULL, NULL, 'false'),
(2855, 'mainland', 2854, ',2798,2854,2855,', 3, '兴义市', NULL, NULL, NULL, NULL, 'false'),
(2856, 'mainland', 2854, ',2798,2854,2856,', 3, '兴仁县', NULL, NULL, NULL, NULL, 'false'),
(2857, 'mainland', 2854, ',2798,2854,2857,', 3, '普安县', NULL, NULL, NULL, NULL, 'false'),
(2858, 'mainland', 2854, ',2798,2854,2858,', 3, '晴隆县', NULL, NULL, NULL, NULL, 'false'),
(2859, 'mainland', 2854, ',2798,2854,2859,', 3, '贞丰县', NULL, NULL, NULL, NULL, 'false'),
(2860, 'mainland', 2854, ',2798,2854,2860,', 3, '望谟县', NULL, NULL, NULL, NULL, 'false'),
(2861, 'mainland', 2854, ',2798,2854,2861,', 3, '册亨县', NULL, NULL, NULL, NULL, 'false'),
(2862, 'mainland', 2854, ',2798,2854,2862,', 3, '安龙县', NULL, NULL, NULL, NULL, 'false'),
(2863, 'mainland', 2854, ',2798,2854,2863,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2864, 'mainland', 2798, ',2798,2864,', 2, '毕节地区', NULL, NULL, NULL, NULL, 'false'),
(2865, 'mainland', 2864, ',2798,2864,2865,', 3, '毕节市', NULL, NULL, NULL, NULL, 'false'),
(2866, 'mainland', 2864, ',2798,2864,2866,', 3, '大方县', NULL, NULL, NULL, NULL, 'false'),
(2867, 'mainland', 2864, ',2798,2864,2867,', 3, '黔西县', NULL, NULL, NULL, NULL, 'false'),
(2868, 'mainland', 2864, ',2798,2864,2868,', 3, '金沙县', NULL, NULL, NULL, NULL, 'false'),
(2869, 'mainland', 2864, ',2798,2864,2869,', 3, '织金县', NULL, NULL, NULL, NULL, 'false'),
(2870, 'mainland', 2864, ',2798,2864,2870,', 3, '纳雍县', NULL, NULL, NULL, NULL, 'false'),
(2871, 'mainland', 2864, ',2798,2864,2871,', 3, '威宁彝族回族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2872, 'mainland', 2864, ',2798,2864,2872,', 3, '赫章县', NULL, NULL, NULL, NULL, 'false'),
(2873, 'mainland', 2864, ',2798,2864,2873,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2874, 'mainland', 2798, ',2798,2874,', 2, '黔东南苗族侗族自治州', NULL, NULL, NULL, NULL, 'false'),
(2875, 'mainland', 2874, ',2798,2874,2875,', 3, '凯里市', NULL, NULL, NULL, NULL, 'false'),
(2876, 'mainland', 2874, ',2798,2874,2876,', 3, '黄平县', NULL, NULL, NULL, NULL, 'false'),
(2877, 'mainland', 2874, ',2798,2874,2877,', 3, '施秉县', NULL, NULL, NULL, NULL, 'false'),
(2878, 'mainland', 2874, ',2798,2874,2878,', 3, '三穗县', NULL, NULL, NULL, NULL, 'false'),
(2879, 'mainland', 2874, ',2798,2874,2879,', 3, '镇远县', NULL, NULL, NULL, NULL, 'false'),
(2880, 'mainland', 2874, ',2798,2874,2880,', 3, '岑巩县', NULL, NULL, NULL, NULL, 'false'),
(2881, 'mainland', 2874, ',2798,2874,2881,', 3, '天柱县', NULL, NULL, NULL, NULL, 'false'),
(2882, 'mainland', 2874, ',2798,2874,2882,', 3, '锦屏县', NULL, NULL, NULL, NULL, 'false'),
(2883, 'mainland', 2874, ',2798,2874,2883,', 3, '剑河县', NULL, NULL, NULL, NULL, 'false'),
(2884, 'mainland', 2874, ',2798,2874,2884,', 3, '台江县', NULL, NULL, NULL, NULL, 'false'),
(2885, 'mainland', 2874, ',2798,2874,2885,', 3, '黎平县', NULL, NULL, NULL, NULL, 'false'),
(2886, 'mainland', 2874, ',2798,2874,2886,', 3, '榕江县', NULL, NULL, NULL, NULL, 'false'),
(2887, 'mainland', 2874, ',2798,2874,2887,', 3, '从江县', NULL, NULL, NULL, NULL, 'false'),
(2888, 'mainland', 2874, ',2798,2874,2888,', 3, '雷山县', NULL, NULL, NULL, NULL, 'false'),
(2889, 'mainland', 2874, ',2798,2874,2889,', 3, '麻江县', NULL, NULL, NULL, NULL, 'false'),
(2890, 'mainland', 2874, ',2798,2874,2890,', 3, '丹寨县', NULL, NULL, NULL, NULL, 'false'),
(2891, 'mainland', 2874, ',2798,2874,2891,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2892, 'mainland', 2798, ',2798,2892,', 2, '黔南布依族苗族自治州', NULL, NULL, NULL, NULL, 'false'),
(2893, 'mainland', 2892, ',2798,2892,2893,', 3, '都匀市', NULL, NULL, NULL, NULL, 'false'),
(2894, 'mainland', 2892, ',2798,2892,2894,', 3, '福泉市', NULL, NULL, NULL, NULL, 'false'),
(2895, 'mainland', 2892, ',2798,2892,2895,', 3, '荔波县', NULL, NULL, NULL, NULL, 'false'),
(2896, 'mainland', 2892, ',2798,2892,2896,', 3, '贵定县', NULL, NULL, NULL, NULL, 'false'),
(2897, 'mainland', 2892, ',2798,2892,2897,', 3, '瓮安县', NULL, NULL, NULL, NULL, 'false'),
(2898, 'mainland', 2892, ',2798,2892,2898,', 3, '独山县', NULL, NULL, NULL, NULL, 'false'),
(2899, 'mainland', 2892, ',2798,2892,2899,', 3, '平塘县', NULL, NULL, NULL, NULL, 'false'),
(2900, 'mainland', 2892, ',2798,2892,2900,', 3, '罗甸县', NULL, NULL, NULL, NULL, 'false'),
(2901, 'mainland', 2892, ',2798,2892,2901,', 3, '长顺县', NULL, NULL, NULL, NULL, 'false'),
(2902, 'mainland', 2892, ',2798,2892,2902,', 3, '龙里县', NULL, NULL, NULL, NULL, 'false'),
(2903, 'mainland', 2892, ',2798,2892,2903,', 3, '惠水县', NULL, NULL, NULL, NULL, 'false'),
(2904, 'mainland', 2892, ',2798,2892,2904,', 3, '三都水族自治县', NULL, NULL, NULL, NULL, 'false'),
(2905, 'mainland', 2892, ',2798,2892,2905,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2906, 'mainland', NULL, ',2906,', 1, '云南省', NULL, NULL, NULL, NULL, 'false'),
(2907, 'mainland', 2906, ',2906,2907,', 2, '昆明市', NULL, NULL, NULL, NULL, 'false'),
(2908, 'mainland', 2907, ',2906,2907,2908,', 3, '五华区', NULL, NULL, NULL, NULL, 'false'),
(2909, 'mainland', 2907, ',2906,2907,2909,', 3, '盘龙区', NULL, NULL, NULL, NULL, 'false'),
(2910, 'mainland', 2907, ',2906,2907,2910,', 3, '官渡区', NULL, NULL, NULL, NULL, 'false'),
(2911, 'mainland', 2907, ',2906,2907,2911,', 3, '西山区', NULL, NULL, NULL, NULL, 'false'),
(2912, 'mainland', 2907, ',2906,2907,2912,', 3, '东川区', NULL, NULL, NULL, NULL, 'false'),
(2913, 'mainland', 2907, ',2906,2907,2913,', 3, '呈贡县', NULL, NULL, NULL, NULL, 'false'),
(2914, 'mainland', 2907, ',2906,2907,2914,', 3, '晋宁县', NULL, NULL, NULL, NULL, 'false'),
(2915, 'mainland', 2907, ',2906,2907,2915,', 3, '富民县', NULL, NULL, NULL, NULL, 'false'),
(2916, 'mainland', 2907, ',2906,2907,2916,', 3, '宜良县', NULL, NULL, NULL, NULL, 'false'),
(2917, 'mainland', 2907, ',2906,2907,2917,', 3, '石林彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2918, 'mainland', 2907, ',2906,2907,2918,', 3, '嵩明县', NULL, NULL, NULL, NULL, 'false'),
(2919, 'mainland', 2907, ',2906,2907,2919,', 3, '禄劝彝族苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(2920, 'mainland', 2907, ',2906,2907,2920,', 3, '寻甸回族彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2921, 'mainland', 2907, ',2906,2907,2921,', 3, '安宁市', NULL, NULL, NULL, NULL, 'false'),
(2922, 'mainland', 2907, ',2906,2907,2922,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2923, 'mainland', 2906, ',2906,2923,', 2, '曲靖市', NULL, NULL, NULL, NULL, 'false'),
(2924, 'mainland', 2923, ',2906,2923,2924,', 3, '麒麟区', NULL, NULL, NULL, NULL, 'false'),
(2925, 'mainland', 2923, ',2906,2923,2925,', 3, '马龙县', NULL, NULL, NULL, NULL, 'false'),
(2926, 'mainland', 2923, ',2906,2923,2926,', 3, '陆良县', NULL, NULL, NULL, NULL, 'false'),
(2927, 'mainland', 2923, ',2906,2923,2927,', 3, '师宗县', NULL, NULL, NULL, NULL, 'false'),
(2928, 'mainland', 2923, ',2906,2923,2928,', 3, '罗平县', NULL, NULL, NULL, NULL, 'false'),
(2929, 'mainland', 2923, ',2906,2923,2929,', 3, '富源县', NULL, NULL, NULL, NULL, 'false'),
(2930, 'mainland', 2923, ',2906,2923,2930,', 3, '会泽县', NULL, NULL, NULL, NULL, 'false'),
(2931, 'mainland', 2923, ',2906,2923,2931,', 3, '沾益县', NULL, NULL, NULL, NULL, 'false'),
(2932, 'mainland', 2923, ',2906,2923,2932,', 3, '宣威市', NULL, NULL, NULL, NULL, 'false'),
(2933, 'mainland', 2923, ',2906,2923,2933,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2934, 'mainland', 2906, ',2906,2934,', 2, '玉溪市', NULL, NULL, NULL, NULL, 'false'),
(2935, 'mainland', 2934, ',2906,2934,2935,', 3, '红塔区', NULL, NULL, NULL, NULL, 'false'),
(2936, 'mainland', 2934, ',2906,2934,2936,', 3, '江川县', NULL, NULL, NULL, NULL, 'false'),
(2937, 'mainland', 2934, ',2906,2934,2937,', 3, '澄江县', NULL, NULL, NULL, NULL, 'false'),
(2938, 'mainland', 2934, ',2906,2934,2938,', 3, '通海县', NULL, NULL, NULL, NULL, 'false'),
(2939, 'mainland', 2934, ',2906,2934,2939,', 3, '华宁县', NULL, NULL, NULL, NULL, 'false'),
(2940, 'mainland', 2934, ',2906,2934,2940,', 3, '易门县', NULL, NULL, NULL, NULL, 'false'),
(2941, 'mainland', 2934, ',2906,2934,2941,', 3, '峨山彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2942, 'mainland', 2934, ',2906,2934,2942,', 3, '新平彝族傣族自治县', NULL, NULL, NULL, NULL, 'false'),
(2943, 'mainland', 2934, ',2906,2934,2943,', 3, '元江哈尼族彝族傣族自治县', NULL, NULL, NULL, NULL, 'false'),
(2944, 'mainland', 2934, ',2906,2934,2944,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2945, 'mainland', 2906, ',2906,2945,', 2, '保山市', NULL, NULL, NULL, NULL, 'false'),
(2946, 'mainland', 2945, ',2906,2945,2946,', 3, '隆阳区', NULL, NULL, NULL, NULL, 'false'),
(2947, 'mainland', 2945, ',2906,2945,2947,', 3, '施甸县', NULL, NULL, NULL, NULL, 'false'),
(2948, 'mainland', 2945, ',2906,2945,2948,', 3, '腾冲县', NULL, NULL, NULL, NULL, 'false'),
(2949, 'mainland', 2945, ',2906,2945,2949,', 3, '龙陵县', NULL, NULL, NULL, NULL, 'false'),
(2950, 'mainland', 2945, ',2906,2945,2950,', 3, '昌宁县', NULL, NULL, NULL, NULL, 'false'),
(2951, 'mainland', 2945, ',2906,2945,2951,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2952, 'mainland', 2906, ',2906,2952,', 2, '昭通市', NULL, NULL, NULL, NULL, 'false'),
(2953, 'mainland', 2952, ',2906,2952,2953,', 3, '昭阳区', NULL, NULL, NULL, NULL, 'false'),
(2954, 'mainland', 2952, ',2906,2952,2954,', 3, '鲁甸县', NULL, NULL, NULL, NULL, 'false'),
(2955, 'mainland', 2952, ',2906,2952,2955,', 3, '巧家县', NULL, NULL, NULL, NULL, 'false'),
(2956, 'mainland', 2952, ',2906,2952,2956,', 3, '盐津县', NULL, NULL, NULL, NULL, 'false'),
(2957, 'mainland', 2952, ',2906,2952,2957,', 3, '大关县', NULL, NULL, NULL, NULL, 'false'),
(2958, 'mainland', 2952, ',2906,2952,2958,', 3, '永善县', NULL, NULL, NULL, NULL, 'false'),
(2959, 'mainland', 2952, ',2906,2952,2959,', 3, '绥江县', NULL, NULL, NULL, NULL, 'false'),
(2960, 'mainland', 2952, ',2906,2952,2960,', 3, '镇雄县', NULL, NULL, NULL, NULL, 'false'),
(2961, 'mainland', 2952, ',2906,2952,2961,', 3, '彝良县', NULL, NULL, NULL, NULL, 'false'),
(2962, 'mainland', 2952, ',2906,2952,2962,', 3, '威信县', NULL, NULL, NULL, NULL, 'false'),
(2963, 'mainland', 2952, ',2906,2952,2963,', 3, '水富县', NULL, NULL, NULL, NULL, 'false'),
(2964, 'mainland', 2952, ',2906,2952,2964,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2965, 'mainland', 2906, ',2906,2965,', 2, '丽江市', NULL, NULL, NULL, NULL, 'false'),
(2966, 'mainland', 2965, ',2906,2965,2966,', 3, '古城区', NULL, NULL, NULL, NULL, 'false'),
(2967, 'mainland', 2965, ',2906,2965,2967,', 3, '玉龙纳西族自治县', NULL, NULL, NULL, NULL, 'false'),
(2968, 'mainland', 2965, ',2906,2965,2968,', 3, '永胜县', NULL, NULL, NULL, NULL, 'false'),
(2969, 'mainland', 2965, ',2906,2965,2969,', 3, '华坪县', NULL, NULL, NULL, NULL, 'false'),
(2970, 'mainland', 2965, ',2906,2965,2970,', 3, '宁蒗彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2971, 'mainland', 2965, ',2906,2965,2971,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2972, 'mainland', 2906, ',2906,2972,', 2, '普洱市', NULL, NULL, NULL, NULL, 'false'),
(2973, 'mainland', 2972, ',2906,2972,2973,', 3, '思茅区', NULL, NULL, NULL, NULL, 'false'),
(2974, 'mainland', 2972, ',2906,2972,2974,', 3, '宁洱哈尼族彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2975, 'mainland', 2972, ',2906,2972,2975,', 3, '墨江哈尼族自治县', NULL, NULL, NULL, NULL, 'false'),
(2976, 'mainland', 2972, ',2906,2972,2976,', 3, '景东彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2977, 'mainland', 2972, ',2906,2972,2977,', 3, '景谷傣族彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2978, 'mainland', 2972, ',2906,2972,2978,', 3, '镇沅彝族哈尼族拉祜族自治县', NULL, NULL, NULL, NULL, 'false'),
(2979, 'mainland', 2972, ',2906,2972,2979,', 3, '江城哈尼族彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(2980, 'mainland', 2972, ',2906,2972,2980,', 3, '孟连傣族拉祜族佤族自治县', NULL, NULL, NULL, NULL, 'false'),
(2981, 'mainland', 2972, ',2906,2972,2981,', 3, '澜沧拉祜族自治县', NULL, NULL, NULL, NULL, 'false'),
(2982, 'mainland', 2972, ',2906,2972,2982,', 3, '西盟佤族自治县', NULL, NULL, NULL, NULL, 'false'),
(2983, 'mainland', 2972, ',2906,2972,2983,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2984, 'mainland', 2906, ',2906,2984,', 2, '临沧市', NULL, NULL, NULL, NULL, 'false'),
(2985, 'mainland', 2984, ',2906,2984,2985,', 3, '临翔区', NULL, NULL, NULL, NULL, 'false'),
(2986, 'mainland', 2984, ',2906,2984,2986,', 3, '凤庆县', NULL, NULL, NULL, NULL, 'false'),
(2987, 'mainland', 2984, ',2906,2984,2987,', 3, '云县', NULL, NULL, NULL, NULL, 'false'),
(2988, 'mainland', 2984, ',2906,2984,2988,', 3, '永德县', NULL, NULL, NULL, NULL, 'false'),
(2989, 'mainland', 2984, ',2906,2984,2989,', 3, '镇康县', NULL, NULL, NULL, NULL, 'false'),
(2990, 'mainland', 2984, ',2906,2984,2990,', 3, '双江拉祜族佤族布朗族傣族自治县', NULL, NULL, NULL, NULL, 'false'),
(2991, 'mainland', 2984, ',2906,2984,2991,', 3, '耿马傣族佤族自治县', NULL, NULL, NULL, NULL, 'false'),
(2992, 'mainland', 2984, ',2906,2984,2992,', 3, '沧源佤族自治县', NULL, NULL, NULL, NULL, 'false'),
(2993, 'mainland', 2984, ',2906,2984,2993,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(2994, 'mainland', 2906, ',2906,2994,', 2, '楚雄彝族自治州', NULL, NULL, NULL, NULL, 'false'),
(2995, 'mainland', 2994, ',2906,2994,2995,', 3, '楚雄市', NULL, NULL, NULL, NULL, 'false'),
(2996, 'mainland', 2994, ',2906,2994,2996,', 3, '双柏县', NULL, NULL, NULL, NULL, 'false'),
(2997, 'mainland', 2994, ',2906,2994,2997,', 3, '牟定县', NULL, NULL, NULL, NULL, 'false'),
(2998, 'mainland', 2994, ',2906,2994,2998,', 3, '南华县', NULL, NULL, NULL, NULL, 'false'),
(2999, 'mainland', 2994, ',2906,2994,2999,', 3, '姚安县', NULL, NULL, NULL, NULL, 'false'),
(3000, 'mainland', 2994, ',2906,2994,3000,', 3, '大姚县', NULL, NULL, NULL, NULL, 'false'),
(3001, 'mainland', 2994, ',2906,2994,3001,', 3, '永仁县', NULL, NULL, NULL, NULL, 'false'),
(3002, 'mainland', 2994, ',2906,2994,3002,', 3, '元谋县', NULL, NULL, NULL, NULL, 'false'),
(3003, 'mainland', 2994, ',2906,2994,3003,', 3, '武定县', NULL, NULL, NULL, NULL, 'false'),
(3004, 'mainland', 2994, ',2906,2994,3004,', 3, '禄丰县', NULL, NULL, NULL, NULL, 'false'),
(3005, 'mainland', 2994, ',2906,2994,3005,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3006, 'mainland', 2906, ',2906,3006,', 2, '红河哈尼族彝族自治州', NULL, NULL, NULL, NULL, 'false'),
(3007, 'mainland', 3006, ',2906,3006,3007,', 3, '个旧市', NULL, NULL, NULL, NULL, 'false'),
(3008, 'mainland', 3006, ',2906,3006,3008,', 3, '开远市', NULL, NULL, NULL, NULL, 'false'),
(3009, 'mainland', 3006, ',2906,3006,3009,', 3, '蒙自县', NULL, NULL, NULL, NULL, 'false'),
(3010, 'mainland', 3006, ',2906,3006,3010,', 3, '屏边苗族自治县', NULL, NULL, NULL, NULL, 'false'),
(3011, 'mainland', 3006, ',2906,3006,3011,', 3, '建水县', NULL, NULL, NULL, NULL, 'false'),
(3012, 'mainland', 3006, ',2906,3006,3012,', 3, '石屏县', NULL, NULL, NULL, NULL, 'false'),
(3013, 'mainland', 3006, ',2906,3006,3013,', 3, '弥勒县', NULL, NULL, NULL, NULL, 'false'),
(3014, 'mainland', 3006, ',2906,3006,3014,', 3, '泸西县', NULL, NULL, NULL, NULL, 'false'),
(3015, 'mainland', 3006, ',2906,3006,3015,', 3, '元阳县', NULL, NULL, NULL, NULL, 'false'),
(3016, 'mainland', 3006, ',2906,3006,3016,', 3, '红河县', NULL, NULL, NULL, NULL, 'false'),
(3017, 'mainland', 3006, ',2906,3006,3017,', 3, '金平苗族瑶族傣族自治县', NULL, NULL, NULL, NULL, 'false'),
(3018, 'mainland', 3006, ',2906,3006,3018,', 3, '绿春县', NULL, NULL, NULL, NULL, 'false'),
(3019, 'mainland', 3006, ',2906,3006,3019,', 3, '河口瑶族自治县', NULL, NULL, NULL, NULL, 'false'),
(3020, 'mainland', 3006, ',2906,3006,3020,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3021, 'mainland', 2906, ',2906,3021,', 2, '文山壮族苗族自治州', NULL, NULL, NULL, NULL, 'false'),
(3022, 'mainland', 3021, ',2906,3021,3022,', 3, '文山县', NULL, NULL, NULL, NULL, 'false'),
(3023, 'mainland', 3021, ',2906,3021,3023,', 3, '砚山县', NULL, NULL, NULL, NULL, 'false'),
(3024, 'mainland', 3021, ',2906,3021,3024,', 3, '西畴县', NULL, NULL, NULL, NULL, 'false'),
(3025, 'mainland', 3021, ',2906,3021,3025,', 3, '麻栗坡县', NULL, NULL, NULL, NULL, 'false'),
(3026, 'mainland', 3021, ',2906,3021,3026,', 3, '马关县', NULL, NULL, NULL, NULL, 'false'),
(3027, 'mainland', 3021, ',2906,3021,3027,', 3, '丘北县', NULL, NULL, NULL, NULL, 'false'),
(3028, 'mainland', 3021, ',2906,3021,3028,', 3, '广南县', NULL, NULL, NULL, NULL, 'false'),
(3029, 'mainland', 3021, ',2906,3021,3029,', 3, '富宁县', NULL, NULL, NULL, NULL, 'false'),
(3030, 'mainland', 3021, ',2906,3021,3030,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3031, 'mainland', 2906, ',2906,3031,', 2, '西双版纳傣族自治州', NULL, NULL, NULL, NULL, 'false'),
(3032, 'mainland', 3031, ',2906,3031,3032,', 3, '景洪市', NULL, NULL, NULL, NULL, 'false'),
(3033, 'mainland', 3031, ',2906,3031,3033,', 3, '勐海县', NULL, NULL, NULL, NULL, 'false'),
(3034, 'mainland', 3031, ',2906,3031,3034,', 3, '勐腊县', NULL, NULL, NULL, NULL, 'false'),
(3035, 'mainland', 3031, ',2906,3031,3035,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3036, 'mainland', 2906, ',2906,3036,', 2, '大理白族自治州', NULL, NULL, NULL, NULL, 'false'),
(3037, 'mainland', 3036, ',2906,3036,3037,', 3, '大理市', NULL, NULL, NULL, NULL, 'false'),
(3038, 'mainland', 3036, ',2906,3036,3038,', 3, '漾濞彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(3039, 'mainland', 3036, ',2906,3036,3039,', 3, '祥云县', NULL, NULL, NULL, NULL, 'false'),
(3040, 'mainland', 3036, ',2906,3036,3040,', 3, '宾川县', NULL, NULL, NULL, NULL, 'false'),
(3041, 'mainland', 3036, ',2906,3036,3041,', 3, '弥渡县', NULL, NULL, NULL, NULL, 'false'),
(3042, 'mainland', 3036, ',2906,3036,3042,', 3, '南涧彝族自治县', NULL, NULL, NULL, NULL, 'false'),
(3043, 'mainland', 3036, ',2906,3036,3043,', 3, '巍山彝族回族自治县', NULL, NULL, NULL, NULL, 'false'),
(3044, 'mainland', 3036, ',2906,3036,3044,', 3, '永平县', NULL, NULL, NULL, NULL, 'false'),
(3045, 'mainland', 3036, ',2906,3036,3045,', 3, '云龙县', NULL, NULL, NULL, NULL, 'false'),
(3046, 'mainland', 3036, ',2906,3036,3046,', 3, '洱源县', NULL, NULL, NULL, NULL, 'false'),
(3047, 'mainland', 3036, ',2906,3036,3047,', 3, '剑川县', NULL, NULL, NULL, NULL, 'false'),
(3048, 'mainland', 3036, ',2906,3036,3048,', 3, '鹤庆县', NULL, NULL, NULL, NULL, 'false'),
(3049, 'mainland', 3036, ',2906,3036,3049,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3050, 'mainland', 2906, ',2906,3050,', 2, '德宏傣族景颇族自治州', NULL, NULL, NULL, NULL, 'false'),
(3051, 'mainland', 3050, ',2906,3050,3051,', 3, '瑞丽市', NULL, NULL, NULL, NULL, 'false'),
(3052, 'mainland', 3050, ',2906,3050,3052,', 3, '潞西市', NULL, NULL, NULL, NULL, 'false'),
(3053, 'mainland', 3050, ',2906,3050,3053,', 3, '梁河县', NULL, NULL, NULL, NULL, 'false'),
(3054, 'mainland', 3050, ',2906,3050,3054,', 3, '盈江县', NULL, NULL, NULL, NULL, 'false'),
(3055, 'mainland', 3050, ',2906,3050,3055,', 3, '陇川县', NULL, NULL, NULL, NULL, 'false'),
(3056, 'mainland', 3050, ',2906,3050,3056,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3057, 'mainland', 2906, ',2906,3057,', 2, '怒江傈僳族自治州', NULL, NULL, NULL, NULL, 'false'),
(3058, 'mainland', 3057, ',2906,3057,3058,', 3, '泸水县', NULL, NULL, NULL, NULL, 'false'),
(3059, 'mainland', 3057, ',2906,3057,3059,', 3, '福贡县', NULL, NULL, NULL, NULL, 'false'),
(3060, 'mainland', 3057, ',2906,3057,3060,', 3, '贡山独龙族怒族自治县', NULL, NULL, NULL, NULL, 'false'),
(3061, 'mainland', 3057, ',2906,3057,3061,', 3, '兰坪白族普米族自治县', NULL, NULL, NULL, NULL, 'false'),
(3062, 'mainland', 3057, ',2906,3057,3062,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3063, 'mainland', 2906, ',2906,3063,', 2, '迪庆藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3064, 'mainland', 3063, ',2906,3063,3064,', 3, '香格里拉县', NULL, NULL, NULL, NULL, 'false'),
(3065, 'mainland', 3063, ',2906,3063,3065,', 3, '德钦县', NULL, NULL, NULL, NULL, 'false'),
(3066, 'mainland', 3063, ',2906,3063,3066,', 3, '维西傈僳族自治县', NULL, NULL, NULL, NULL, 'false'),
(3067, 'mainland', 3063, ',2906,3063,3067,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3068, 'mainland', NULL, ',3068,', 1, '西藏自治区', NULL, NULL, NULL, NULL, 'false'),
(3069, 'mainland', 3068, ',3068,3069,', 2, '拉萨市', NULL, NULL, NULL, NULL, 'false'),
(3070, 'mainland', 3069, ',3068,3069,3070,', 3, '城关区', NULL, NULL, NULL, NULL, 'false'),
(3071, 'mainland', 3069, ',3068,3069,3071,', 3, '林周县', NULL, NULL, NULL, NULL, 'false'),
(3072, 'mainland', 3069, ',3068,3069,3072,', 3, '当雄县', NULL, NULL, NULL, NULL, 'false'),
(3073, 'mainland', 3069, ',3068,3069,3073,', 3, '尼木县', NULL, NULL, NULL, NULL, 'false'),
(3074, 'mainland', 3069, ',3068,3069,3074,', 3, '曲水县', NULL, NULL, NULL, NULL, 'false'),
(3075, 'mainland', 3069, ',3068,3069,3075,', 3, '堆龙德庆县', NULL, NULL, NULL, NULL, 'false'),
(3076, 'mainland', 3069, ',3068,3069,3076,', 3, '达孜县', NULL, NULL, NULL, NULL, 'false'),
(3077, 'mainland', 3069, ',3068,3069,3077,', 3, '墨竹工卡县', NULL, NULL, NULL, NULL, 'false'),
(3078, 'mainland', 3069, ',3068,3069,3078,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3079, 'mainland', 3068, ',3068,3079,', 2, '昌都地区', NULL, NULL, NULL, NULL, 'false'),
(3080, 'mainland', 3079, ',3068,3079,3080,', 3, '昌都县', NULL, NULL, NULL, NULL, 'false'),
(3081, 'mainland', 3079, ',3068,3079,3081,', 3, '江达县', NULL, NULL, NULL, NULL, 'false'),
(3082, 'mainland', 3079, ',3068,3079,3082,', 3, '贡觉县', NULL, NULL, NULL, NULL, 'false'),
(3083, 'mainland', 3079, ',3068,3079,3083,', 3, '类乌齐县', NULL, NULL, NULL, NULL, 'false'),
(3084, 'mainland', 3079, ',3068,3079,3084,', 3, '丁青县', NULL, NULL, NULL, NULL, 'false'),
(3085, 'mainland', 3079, ',3068,3079,3085,', 3, '察雅县', NULL, NULL, NULL, NULL, 'false'),
(3086, 'mainland', 3079, ',3068,3079,3086,', 3, '八宿县', NULL, NULL, NULL, NULL, 'false'),
(3087, 'mainland', 3079, ',3068,3079,3087,', 3, '左贡县', NULL, NULL, NULL, NULL, 'false'),
(3088, 'mainland', 3079, ',3068,3079,3088,', 3, '芒康县', NULL, NULL, NULL, NULL, 'false'),
(3089, 'mainland', 3079, ',3068,3079,3089,', 3, '洛隆县', NULL, NULL, NULL, NULL, 'false'),
(3090, 'mainland', 3079, ',3068,3079,3090,', 3, '边坝县', NULL, NULL, NULL, NULL, 'false'),
(3091, 'mainland', 3079, ',3068,3079,3091,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3092, 'mainland', 3068, ',3068,3092,', 2, '山南地区', NULL, NULL, NULL, NULL, 'false'),
(3093, 'mainland', 3092, ',3068,3092,3093,', 3, '乃东县', NULL, NULL, NULL, NULL, 'false'),
(3094, 'mainland', 3092, ',3068,3092,3094,', 3, '扎囊县', NULL, NULL, NULL, NULL, 'false'),
(3095, 'mainland', 3092, ',3068,3092,3095,', 3, '贡嘎县', NULL, NULL, NULL, NULL, 'false'),
(3096, 'mainland', 3092, ',3068,3092,3096,', 3, '桑日县', NULL, NULL, NULL, NULL, 'false'),
(3097, 'mainland', 3092, ',3068,3092,3097,', 3, '琼结县', NULL, NULL, NULL, NULL, 'false'),
(3098, 'mainland', 3092, ',3068,3092,3098,', 3, '曲松县', NULL, NULL, NULL, NULL, 'false'),
(3099, 'mainland', 3092, ',3068,3092,3099,', 3, '措美县', NULL, NULL, NULL, NULL, 'false'),
(3100, 'mainland', 3092, ',3068,3092,3100,', 3, '洛扎县', NULL, NULL, NULL, NULL, 'false'),
(3101, 'mainland', 3092, ',3068,3092,3101,', 3, '加查县', NULL, NULL, NULL, NULL, 'false'),
(3102, 'mainland', 3092, ',3068,3092,3102,', 3, '隆子县', NULL, NULL, NULL, NULL, 'false'),
(3103, 'mainland', 3092, ',3068,3092,3103,', 3, '错那县', NULL, NULL, NULL, NULL, 'false'),
(3104, 'mainland', 3092, ',3068,3092,3104,', 3, '浪卡子县', NULL, NULL, NULL, NULL, 'false'),
(3105, 'mainland', 3092, ',3068,3092,3105,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3106, 'mainland', 3068, ',3068,3106,', 2, '日喀则地区', NULL, NULL, NULL, NULL, 'false'),
(3107, 'mainland', 3106, ',3068,3106,3107,', 3, '日喀则市', NULL, NULL, NULL, NULL, 'false'),
(3108, 'mainland', 3106, ',3068,3106,3108,', 3, '南木林县', NULL, NULL, NULL, NULL, 'false'),
(3109, 'mainland', 3106, ',3068,3106,3109,', 3, '江孜县', NULL, NULL, NULL, NULL, 'false'),
(3110, 'mainland', 3106, ',3068,3106,3110,', 3, '定日县', NULL, NULL, NULL, NULL, 'false'),
(3111, 'mainland', 3106, ',3068,3106,3111,', 3, '萨迦县', NULL, NULL, NULL, NULL, 'false'),
(3112, 'mainland', 3106, ',3068,3106,3112,', 3, '拉孜县', NULL, NULL, NULL, NULL, 'false'),
(3113, 'mainland', 3106, ',3068,3106,3113,', 3, '昂仁县', NULL, NULL, NULL, NULL, 'false'),
(3114, 'mainland', 3106, ',3068,3106,3114,', 3, '谢通门县', NULL, NULL, NULL, NULL, 'false'),
(3115, 'mainland', 3106, ',3068,3106,3115,', 3, '白朗县', NULL, NULL, NULL, NULL, 'false'),
(3116, 'mainland', 3106, ',3068,3106,3116,', 3, '仁布县', NULL, NULL, NULL, NULL, 'false'),
(3117, 'mainland', 3106, ',3068,3106,3117,', 3, '康马县', NULL, NULL, NULL, NULL, 'false'),
(3118, 'mainland', 3106, ',3068,3106,3118,', 3, '定结县', NULL, NULL, NULL, NULL, 'false'),
(3119, 'mainland', 3106, ',3068,3106,3119,', 3, '仲巴县', NULL, NULL, NULL, NULL, 'false'),
(3120, 'mainland', 3106, ',3068,3106,3120,', 3, '亚东县', NULL, NULL, NULL, NULL, 'false'),
(3121, 'mainland', 3106, ',3068,3106,3121,', 3, '吉隆县', NULL, NULL, NULL, NULL, 'false'),
(3122, 'mainland', 3106, ',3068,3106,3122,', 3, '聂拉木县', NULL, NULL, NULL, NULL, 'false'),
(3123, 'mainland', 3106, ',3068,3106,3123,', 3, '萨嘎县', NULL, NULL, NULL, NULL, 'false'),
(3124, 'mainland', 3106, ',3068,3106,3124,', 3, '岗巴县', NULL, NULL, NULL, NULL, 'false'),
(3125, 'mainland', 3106, ',3068,3106,3125,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3126, 'mainland', 3068, ',3068,3126,', 2, '那曲地区', NULL, NULL, NULL, NULL, 'false'),
(3127, 'mainland', 3126, ',3068,3126,3127,', 3, '那曲县', NULL, NULL, NULL, NULL, 'false'),
(3128, 'mainland', 3126, ',3068,3126,3128,', 3, '嘉黎县', NULL, NULL, NULL, NULL, 'false'),
(3129, 'mainland', 3126, ',3068,3126,3129,', 3, '比如县', NULL, NULL, NULL, NULL, 'false'),
(3130, 'mainland', 3126, ',3068,3126,3130,', 3, '聂荣县', NULL, NULL, NULL, NULL, 'false'),
(3131, 'mainland', 3126, ',3068,3126,3131,', 3, '安多县', NULL, NULL, NULL, NULL, 'false'),
(3132, 'mainland', 3126, ',3068,3126,3132,', 3, '申扎县', NULL, NULL, NULL, NULL, 'false'),
(3133, 'mainland', 3126, ',3068,3126,3133,', 3, '索县', NULL, NULL, NULL, NULL, 'false'),
(3134, 'mainland', 3126, ',3068,3126,3134,', 3, '班戈县', NULL, NULL, NULL, NULL, 'false'),
(3135, 'mainland', 3126, ',3068,3126,3135,', 3, '巴青县', NULL, NULL, NULL, NULL, 'false'),
(3136, 'mainland', 3126, ',3068,3126,3136,', 3, '尼玛县', NULL, NULL, NULL, NULL, 'false'),
(3137, 'mainland', 3126, ',3068,3126,3137,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3138, 'mainland', 3068, ',3068,3138,', 2, '阿里地区', NULL, NULL, NULL, NULL, 'false'),
(3139, 'mainland', 3138, ',3068,3138,3139,', 3, '普兰县', NULL, NULL, NULL, NULL, 'false'),
(3140, 'mainland', 3138, ',3068,3138,3140,', 3, '札达县', NULL, NULL, NULL, NULL, 'false'),
(3141, 'mainland', 3138, ',3068,3138,3141,', 3, '噶尔县', NULL, NULL, NULL, NULL, 'false'),
(3142, 'mainland', 3138, ',3068,3138,3142,', 3, '日土县', NULL, NULL, NULL, NULL, 'false'),
(3143, 'mainland', 3138, ',3068,3138,3143,', 3, '革吉县', NULL, NULL, NULL, NULL, 'false'),
(3144, 'mainland', 3138, ',3068,3138,3144,', 3, '改则县', NULL, NULL, NULL, NULL, 'false'),
(3145, 'mainland', 3138, ',3068,3138,3145,', 3, '措勤县', NULL, NULL, NULL, NULL, 'false'),
(3146, 'mainland', 3138, ',3068,3138,3146,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3147, 'mainland', 3068, ',3068,3147,', 2, '林芝地区', NULL, NULL, NULL, NULL, 'false'),
(3148, 'mainland', 3147, ',3068,3147,3148,', 3, '林芝县', NULL, NULL, NULL, NULL, 'false'),
(3149, 'mainland', 3147, ',3068,3147,3149,', 3, '工布江达县', NULL, NULL, NULL, NULL, 'false'),
(3150, 'mainland', 3147, ',3068,3147,3150,', 3, '米林县', NULL, NULL, NULL, NULL, 'false'),
(3151, 'mainland', 3147, ',3068,3147,3151,', 3, '墨脱县', NULL, NULL, NULL, NULL, 'false'),
(3152, 'mainland', 3147, ',3068,3147,3152,', 3, '波密县', NULL, NULL, NULL, NULL, 'false'),
(3153, 'mainland', 3147, ',3068,3147,3153,', 3, '察隅县', NULL, NULL, NULL, NULL, 'false'),
(3154, 'mainland', 3147, ',3068,3147,3154,', 3, '朗县', NULL, NULL, NULL, NULL, 'false'),
(3155, 'mainland', 3147, ',3068,3147,3155,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3156, 'mainland', NULL, ',3156,', 1, '陕西省', NULL, NULL, NULL, NULL, 'false'),
(3157, 'mainland', 3156, ',3156,3157,', 2, '西安市', NULL, NULL, NULL, NULL, 'false'),
(3158, 'mainland', 3157, ',3156,3157,3158,', 3, '新城区', NULL, NULL, NULL, NULL, 'false'),
(3159, 'mainland', 3157, ',3156,3157,3159,', 3, '碑林区', NULL, NULL, NULL, NULL, 'false'),
(3160, 'mainland', 3157, ',3156,3157,3160,', 3, '莲湖区', NULL, NULL, NULL, NULL, 'false'),
(3161, 'mainland', 3157, ',3156,3157,3161,', 3, '灞桥区', NULL, NULL, NULL, NULL, 'false'),
(3162, 'mainland', 3157, ',3156,3157,3162,', 3, '未央区', NULL, NULL, NULL, NULL, 'false'),
(3163, 'mainland', 3157, ',3156,3157,3163,', 3, '雁塔区', NULL, NULL, NULL, NULL, 'false'),
(3164, 'mainland', 3157, ',3156,3157,3164,', 3, '阎良区', NULL, NULL, NULL, NULL, 'false'),
(3165, 'mainland', 3157, ',3156,3157,3165,', 3, '临潼区', NULL, NULL, NULL, NULL, 'false'),
(3166, 'mainland', 3157, ',3156,3157,3166,', 3, '长安区', NULL, NULL, NULL, NULL, 'false'),
(3167, 'mainland', 3157, ',3156,3157,3167,', 3, '蓝田县', NULL, NULL, NULL, NULL, 'false'),
(3168, 'mainland', 3157, ',3156,3157,3168,', 3, '周至县', NULL, NULL, NULL, NULL, 'false'),
(3169, 'mainland', 3157, ',3156,3157,3169,', 3, '户县', NULL, NULL, NULL, NULL, 'false'),
(3170, 'mainland', 3157, ',3156,3157,3170,', 3, '高陵县', NULL, NULL, NULL, NULL, 'false'),
(3171, 'mainland', 3157, ',3156,3157,3171,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3172, 'mainland', 3156, ',3156,3172,', 2, '铜川市', NULL, NULL, NULL, NULL, 'false'),
(3173, 'mainland', 3172, ',3156,3172,3173,', 3, '王益区', NULL, NULL, NULL, NULL, 'false'),
(3174, 'mainland', 3172, ',3156,3172,3174,', 3, '印台区', NULL, NULL, NULL, NULL, 'false'),
(3175, 'mainland', 3172, ',3156,3172,3175,', 3, '耀州区', NULL, NULL, NULL, NULL, 'false'),
(3176, 'mainland', 3172, ',3156,3172,3176,', 3, '宜君县', NULL, NULL, NULL, NULL, 'false'),
(3177, 'mainland', 3172, ',3156,3172,3177,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3178, 'mainland', 3156, ',3156,3178,', 2, '宝鸡市', NULL, NULL, NULL, NULL, 'false'),
(3179, 'mainland', 3178, ',3156,3178,3179,', 3, '渭滨区', NULL, NULL, NULL, NULL, 'false'),
(3180, 'mainland', 3178, ',3156,3178,3180,', 3, '金台区', NULL, NULL, NULL, NULL, 'false'),
(3181, 'mainland', 3178, ',3156,3178,3181,', 3, '陈仓区', NULL, NULL, NULL, NULL, 'false'),
(3182, 'mainland', 3178, ',3156,3178,3182,', 3, '凤翔县', NULL, NULL, NULL, NULL, 'false'),
(3183, 'mainland', 3178, ',3156,3178,3183,', 3, '岐山县', NULL, NULL, NULL, NULL, 'false'),
(3184, 'mainland', 3178, ',3156,3178,3184,', 3, '扶风县', NULL, NULL, NULL, NULL, 'false'),
(3185, 'mainland', 3178, ',3156,3178,3185,', 3, '眉县', NULL, NULL, NULL, NULL, 'false'),
(3186, 'mainland', 3178, ',3156,3178,3186,', 3, '陇县', NULL, NULL, NULL, NULL, 'false'),
(3187, 'mainland', 3178, ',3156,3178,3187,', 3, '千阳县', NULL, NULL, NULL, NULL, 'false'),
(3188, 'mainland', 3178, ',3156,3178,3188,', 3, '麟游县', NULL, NULL, NULL, NULL, 'false'),
(3189, 'mainland', 3178, ',3156,3178,3189,', 3, '凤县', NULL, NULL, NULL, NULL, 'false'),
(3190, 'mainland', 3178, ',3156,3178,3190,', 3, '太白县', NULL, NULL, NULL, NULL, 'false'),
(3191, 'mainland', 3178, ',3156,3178,3191,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3192, 'mainland', 3156, ',3156,3192,', 2, '咸阳市', NULL, NULL, NULL, NULL, 'false'),
(3193, 'mainland', 3192, ',3156,3192,3193,', 3, '秦都区', NULL, NULL, NULL, NULL, 'false'),
(3194, 'mainland', 3192, ',3156,3192,3194,', 3, '杨凌区', NULL, NULL, NULL, NULL, 'false'),
(3195, 'mainland', 3192, ',3156,3192,3195,', 3, '渭城区', NULL, NULL, NULL, NULL, 'false'),
(3196, 'mainland', 3192, ',3156,3192,3196,', 3, '三原县', NULL, NULL, NULL, NULL, 'false'),
(3197, 'mainland', 3192, ',3156,3192,3197,', 3, '泾阳县', NULL, NULL, NULL, NULL, 'false'),
(3198, 'mainland', 3192, ',3156,3192,3198,', 3, '乾县', NULL, NULL, NULL, NULL, 'false'),
(3199, 'mainland', 3192, ',3156,3192,3199,', 3, '礼泉县', NULL, NULL, NULL, NULL, 'false'),
(3200, 'mainland', 3192, ',3156,3192,3200,', 3, '永寿县', NULL, NULL, NULL, NULL, 'false'),
(3201, 'mainland', 3192, ',3156,3192,3201,', 3, '彬县', NULL, NULL, NULL, NULL, 'false'),
(3202, 'mainland', 3192, ',3156,3192,3202,', 3, '长武县', NULL, NULL, NULL, NULL, 'false'),
(3203, 'mainland', 3192, ',3156,3192,3203,', 3, '旬邑县', NULL, NULL, NULL, NULL, 'false'),
(3204, 'mainland', 3192, ',3156,3192,3204,', 3, '淳化县', NULL, NULL, NULL, NULL, 'false'),
(3205, 'mainland', 3192, ',3156,3192,3205,', 3, '武功县', NULL, NULL, NULL, NULL, 'false'),
(3206, 'mainland', 3192, ',3156,3192,3206,', 3, '兴平市', NULL, NULL, NULL, NULL, 'false'),
(3207, 'mainland', 3192, ',3156,3192,3207,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3208, 'mainland', 3156, ',3156,3208,', 2, '渭南市', NULL, NULL, NULL, NULL, 'false'),
(3209, 'mainland', 3208, ',3156,3208,3209,', 3, '临渭区', NULL, NULL, NULL, NULL, 'false'),
(3210, 'mainland', 3208, ',3156,3208,3210,', 3, '华县', NULL, NULL, NULL, NULL, 'false'),
(3211, 'mainland', 3208, ',3156,3208,3211,', 3, '潼关县', NULL, NULL, NULL, NULL, 'false'),
(3212, 'mainland', 3208, ',3156,3208,3212,', 3, '大荔县', NULL, NULL, NULL, NULL, 'false'),
(3213, 'mainland', 3208, ',3156,3208,3213,', 3, '合阳县', NULL, NULL, NULL, NULL, 'false'),
(3214, 'mainland', 3208, ',3156,3208,3214,', 3, '澄城县', NULL, NULL, NULL, NULL, 'false'),
(3215, 'mainland', 3208, ',3156,3208,3215,', 3, '蒲城县', NULL, NULL, NULL, NULL, 'false'),
(3216, 'mainland', 3208, ',3156,3208,3216,', 3, '白水县', NULL, NULL, NULL, NULL, 'false'),
(3217, 'mainland', 3208, ',3156,3208,3217,', 3, '富平县', NULL, NULL, NULL, NULL, 'false'),
(3218, 'mainland', 3208, ',3156,3208,3218,', 3, '韩城市', NULL, NULL, NULL, NULL, 'false'),
(3219, 'mainland', 3208, ',3156,3208,3219,', 3, '华阴市', NULL, NULL, NULL, NULL, 'false'),
(3220, 'mainland', 3208, ',3156,3208,3220,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3221, 'mainland', 3156, ',3156,3221,', 2, '延安市', NULL, NULL, NULL, NULL, 'false'),
(3222, 'mainland', 3221, ',3156,3221,3222,', 3, '宝塔区', NULL, NULL, NULL, NULL, 'false'),
(3223, 'mainland', 3221, ',3156,3221,3223,', 3, '延长县', NULL, NULL, NULL, NULL, 'false'),
(3224, 'mainland', 3221, ',3156,3221,3224,', 3, '延川县', NULL, NULL, NULL, NULL, 'false'),
(3225, 'mainland', 3221, ',3156,3221,3225,', 3, '子长县', NULL, NULL, NULL, NULL, 'false'),
(3226, 'mainland', 3221, ',3156,3221,3226,', 3, '安塞县', NULL, NULL, NULL, NULL, 'false'),
(3227, 'mainland', 3221, ',3156,3221,3227,', 3, '志丹县', NULL, NULL, NULL, NULL, 'false'),
(3228, 'mainland', 3221, ',3156,3221,3228,', 3, '吴起县', NULL, NULL, NULL, NULL, 'false'),
(3229, 'mainland', 3221, ',3156,3221,3229,', 3, '甘泉县', NULL, NULL, NULL, NULL, 'false'),
(3230, 'mainland', 3221, ',3156,3221,3230,', 3, '富县', NULL, NULL, NULL, NULL, 'false'),
(3231, 'mainland', 3221, ',3156,3221,3231,', 3, '洛川县', NULL, NULL, NULL, NULL, 'false'),
(3232, 'mainland', 3221, ',3156,3221,3232,', 3, '宜川县', NULL, NULL, NULL, NULL, 'false'),
(3233, 'mainland', 3221, ',3156,3221,3233,', 3, '黄龙县', NULL, NULL, NULL, NULL, 'false'),
(3234, 'mainland', 3221, ',3156,3221,3234,', 3, '黄陵县', NULL, NULL, NULL, NULL, 'false'),
(3235, 'mainland', 3221, ',3156,3221,3235,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3236, 'mainland', 3156, ',3156,3236,', 2, '汉中市', NULL, NULL, NULL, NULL, 'false'),
(3237, 'mainland', 3236, ',3156,3236,3237,', 3, '汉台区', NULL, NULL, NULL, NULL, 'false'),
(3238, 'mainland', 3236, ',3156,3236,3238,', 3, '南郑县', NULL, NULL, NULL, NULL, 'false'),
(3239, 'mainland', 3236, ',3156,3236,3239,', 3, '城固县', NULL, NULL, NULL, NULL, 'false'),
(3240, 'mainland', 3236, ',3156,3236,3240,', 3, '洋县', NULL, NULL, NULL, NULL, 'false'),
(3241, 'mainland', 3236, ',3156,3236,3241,', 3, '西乡县', NULL, NULL, NULL, NULL, 'false'),
(3242, 'mainland', 3236, ',3156,3236,3242,', 3, '勉县', NULL, NULL, NULL, NULL, 'false'),
(3243, 'mainland', 3236, ',3156,3236,3243,', 3, '宁强县', NULL, NULL, NULL, NULL, 'false'),
(3244, 'mainland', 3236, ',3156,3236,3244,', 3, '略阳县', NULL, NULL, NULL, NULL, 'false'),
(3245, 'mainland', 3236, ',3156,3236,3245,', 3, '镇巴县', NULL, NULL, NULL, NULL, 'false'),
(3246, 'mainland', 3236, ',3156,3236,3246,', 3, '留坝县', NULL, NULL, NULL, NULL, 'false'),
(3247, 'mainland', 3236, ',3156,3236,3247,', 3, '佛坪县', NULL, NULL, NULL, NULL, 'false'),
(3248, 'mainland', 3236, ',3156,3236,3248,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3249, 'mainland', 3156, ',3156,3249,', 2, '榆林市', NULL, NULL, NULL, NULL, 'false'),
(3250, 'mainland', 3249, ',3156,3249,3250,', 3, '榆阳区', NULL, NULL, NULL, NULL, 'false'),
(3251, 'mainland', 3249, ',3156,3249,3251,', 3, '神木县', NULL, NULL, NULL, NULL, 'false'),
(3252, 'mainland', 3249, ',3156,3249,3252,', 3, '府谷县', NULL, NULL, NULL, NULL, 'false'),
(3253, 'mainland', 3249, ',3156,3249,3253,', 3, '横山县', NULL, NULL, NULL, NULL, 'false'),
(3254, 'mainland', 3249, ',3156,3249,3254,', 3, '靖边县', NULL, NULL, NULL, NULL, 'false'),
(3255, 'mainland', 3249, ',3156,3249,3255,', 3, '定边县', NULL, NULL, NULL, NULL, 'false'),
(3256, 'mainland', 3249, ',3156,3249,3256,', 3, '绥德县', NULL, NULL, NULL, NULL, 'false'),
(3257, 'mainland', 3249, ',3156,3249,3257,', 3, '米脂县', NULL, NULL, NULL, NULL, 'false'),
(3258, 'mainland', 3249, ',3156,3249,3258,', 3, '佳县', NULL, NULL, NULL, NULL, 'false'),
(3259, 'mainland', 3249, ',3156,3249,3259,', 3, '吴堡县', NULL, NULL, NULL, NULL, 'false'),
(3260, 'mainland', 3249, ',3156,3249,3260,', 3, '清涧县', NULL, NULL, NULL, NULL, 'false'),
(3261, 'mainland', 3249, ',3156,3249,3261,', 3, '子洲县', NULL, NULL, NULL, NULL, 'false'),
(3262, 'mainland', 3249, ',3156,3249,3262,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3263, 'mainland', 3156, ',3156,3263,', 2, '安康市', NULL, NULL, NULL, NULL, 'false'),
(3264, 'mainland', 3263, ',3156,3263,3264,', 3, '汉滨区', NULL, NULL, NULL, NULL, 'false'),
(3265, 'mainland', 3263, ',3156,3263,3265,', 3, '汉阴县', NULL, NULL, NULL, NULL, 'false');
INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`, `region_path`, `region_grade`, `local_name`, `en_name`, `p_1`, `p_2`, `ordernum`, `disabled`) VALUES
(3266, 'mainland', 3263, ',3156,3263,3266,', 3, '石泉县', NULL, NULL, NULL, NULL, 'false'),
(3267, 'mainland', 3263, ',3156,3263,3267,', 3, '宁陕县', NULL, NULL, NULL, NULL, 'false'),
(3268, 'mainland', 3263, ',3156,3263,3268,', 3, '紫阳县', NULL, NULL, NULL, NULL, 'false'),
(3269, 'mainland', 3263, ',3156,3263,3269,', 3, '岚皋县', NULL, NULL, NULL, NULL, 'false'),
(3270, 'mainland', 3263, ',3156,3263,3270,', 3, '平利县', NULL, NULL, NULL, NULL, 'false'),
(3271, 'mainland', 3263, ',3156,3263,3271,', 3, '镇坪县', NULL, NULL, NULL, NULL, 'false'),
(3272, 'mainland', 3263, ',3156,3263,3272,', 3, '旬阳县', NULL, NULL, NULL, NULL, 'false'),
(3273, 'mainland', 3263, ',3156,3263,3273,', 3, '白河县', NULL, NULL, NULL, NULL, 'false'),
(3274, 'mainland', 3263, ',3156,3263,3274,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3275, 'mainland', 3156, ',3156,3275,', 2, '商洛市', NULL, NULL, NULL, NULL, 'false'),
(3276, 'mainland', 3275, ',3156,3275,3276,', 3, '商州区', NULL, NULL, NULL, NULL, 'false'),
(3277, 'mainland', 3275, ',3156,3275,3277,', 3, '洛南县', NULL, NULL, NULL, NULL, 'false'),
(3278, 'mainland', 3275, ',3156,3275,3278,', 3, '丹凤县', NULL, NULL, NULL, NULL, 'false'),
(3279, 'mainland', 3275, ',3156,3275,3279,', 3, '商南县', NULL, NULL, NULL, NULL, 'false'),
(3280, 'mainland', 3275, ',3156,3275,3280,', 3, '山阳县', NULL, NULL, NULL, NULL, 'false'),
(3281, 'mainland', 3275, ',3156,3275,3281,', 3, '镇安县', NULL, NULL, NULL, NULL, 'false'),
(3282, 'mainland', 3275, ',3156,3275,3282,', 3, '柞水县', NULL, NULL, NULL, NULL, 'false'),
(3283, 'mainland', 3275, ',3156,3275,3283,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3284, 'mainland', NULL, ',3284,', 1, '甘肃省', NULL, NULL, NULL, NULL, 'false'),
(3285, 'mainland', 3284, ',3284,3285,', 2, '兰州市', NULL, NULL, NULL, NULL, 'false'),
(3286, 'mainland', 3285, ',3284,3285,3286,', 3, '城关区', NULL, NULL, NULL, NULL, 'false'),
(3287, 'mainland', 3285, ',3284,3285,3287,', 3, '七里河区', NULL, NULL, NULL, NULL, 'false'),
(3288, 'mainland', 3285, ',3284,3285,3288,', 3, '西固区', NULL, NULL, NULL, NULL, 'false'),
(3289, 'mainland', 3285, ',3284,3285,3289,', 3, '安宁区', NULL, NULL, NULL, NULL, 'false'),
(3290, 'mainland', 3285, ',3284,3285,3290,', 3, '红古区', NULL, NULL, NULL, NULL, 'false'),
(3291, 'mainland', 3285, ',3284,3285,3291,', 3, '永登县', NULL, NULL, NULL, NULL, 'false'),
(3292, 'mainland', 3285, ',3284,3285,3292,', 3, '皋兰县', NULL, NULL, NULL, NULL, 'false'),
(3293, 'mainland', 3285, ',3284,3285,3293,', 3, '榆中县', NULL, NULL, NULL, NULL, 'false'),
(3294, 'mainland', 3285, ',3284,3285,3294,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3295, 'mainland', 3284, ',3284,3295,', 2, '嘉峪关市', NULL, NULL, NULL, NULL, 'false'),
(3296, 'mainland', 3284, ',3284,3296,', 2, '金昌市', NULL, NULL, NULL, NULL, 'false'),
(3297, 'mainland', 3296, ',3284,3296,3297,', 3, '金川区', NULL, NULL, NULL, NULL, 'false'),
(3298, 'mainland', 3296, ',3284,3296,3298,', 3, '永昌县', NULL, NULL, NULL, NULL, 'false'),
(3299, 'mainland', 3296, ',3284,3296,3299,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3300, 'mainland', 3284, ',3284,3300,', 2, '白银市', NULL, NULL, NULL, NULL, 'false'),
(3301, 'mainland', 3300, ',3284,3300,3301,', 3, '白银区', NULL, NULL, NULL, NULL, 'false'),
(3302, 'mainland', 3300, ',3284,3300,3302,', 3, '平川区', NULL, NULL, NULL, NULL, 'false'),
(3303, 'mainland', 3300, ',3284,3300,3303,', 3, '靖远县', NULL, NULL, NULL, NULL, 'false'),
(3304, 'mainland', 3300, ',3284,3300,3304,', 3, '会宁县', NULL, NULL, NULL, NULL, 'false'),
(3305, 'mainland', 3300, ',3284,3300,3305,', 3, '景泰县', NULL, NULL, NULL, NULL, 'false'),
(3306, 'mainland', 3300, ',3284,3300,3306,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3307, 'mainland', 3284, ',3284,3307,', 2, '天水市', NULL, NULL, NULL, NULL, 'false'),
(3308, 'mainland', 3307, ',3284,3307,3308,', 3, '秦州区', NULL, NULL, NULL, NULL, 'false'),
(3309, 'mainland', 3307, ',3284,3307,3309,', 3, '麦积区', NULL, NULL, NULL, NULL, 'false'),
(3310, 'mainland', 3307, ',3284,3307,3310,', 3, '清水县', NULL, NULL, NULL, NULL, 'false'),
(3311, 'mainland', 3307, ',3284,3307,3311,', 3, '秦安县', NULL, NULL, NULL, NULL, 'false'),
(3312, 'mainland', 3307, ',3284,3307,3312,', 3, '甘谷县', NULL, NULL, NULL, NULL, 'false'),
(3313, 'mainland', 3307, ',3284,3307,3313,', 3, '武山县', NULL, NULL, NULL, NULL, 'false'),
(3314, 'mainland', 3307, ',3284,3307,3314,', 3, '张家川回族自治县', NULL, NULL, NULL, NULL, 'false'),
(3315, 'mainland', 3307, ',3284,3307,3315,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3316, 'mainland', 3284, ',3284,3316,', 2, '武威市', NULL, NULL, NULL, NULL, 'false'),
(3317, 'mainland', 3316, ',3284,3316,3317,', 3, '凉州区', NULL, NULL, NULL, NULL, 'false'),
(3318, 'mainland', 3316, ',3284,3316,3318,', 3, '民勤县', NULL, NULL, NULL, NULL, 'false'),
(3319, 'mainland', 3316, ',3284,3316,3319,', 3, '古浪县', NULL, NULL, NULL, NULL, 'false'),
(3320, 'mainland', 3316, ',3284,3316,3320,', 3, '天祝藏族自治县', NULL, NULL, NULL, NULL, 'false'),
(3321, 'mainland', 3316, ',3284,3316,3321,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3322, 'mainland', 3284, ',3284,3322,', 2, '张掖市', NULL, NULL, NULL, NULL, 'false'),
(3323, 'mainland', 3322, ',3284,3322,3323,', 3, '甘州区', NULL, NULL, NULL, NULL, 'false'),
(3324, 'mainland', 3322, ',3284,3322,3324,', 3, '肃南裕固族自治县', NULL, NULL, NULL, NULL, 'false'),
(3325, 'mainland', 3322, ',3284,3322,3325,', 3, '民乐县', NULL, NULL, NULL, NULL, 'false'),
(3326, 'mainland', 3322, ',3284,3322,3326,', 3, '临泽县', NULL, NULL, NULL, NULL, 'false'),
(3327, 'mainland', 3322, ',3284,3322,3327,', 3, '高台县', NULL, NULL, NULL, NULL, 'false'),
(3328, 'mainland', 3322, ',3284,3322,3328,', 3, '山丹县', NULL, NULL, NULL, NULL, 'false'),
(3329, 'mainland', 3322, ',3284,3322,3329,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3330, 'mainland', 3284, ',3284,3330,', 2, '平凉市', NULL, NULL, NULL, NULL, 'false'),
(3331, 'mainland', 3330, ',3284,3330,3331,', 3, '崆峒区', NULL, NULL, NULL, NULL, 'false'),
(3332, 'mainland', 3330, ',3284,3330,3332,', 3, '泾川县', NULL, NULL, NULL, NULL, 'false'),
(3333, 'mainland', 3330, ',3284,3330,3333,', 3, '灵台县', NULL, NULL, NULL, NULL, 'false'),
(3334, 'mainland', 3330, ',3284,3330,3334,', 3, '崇信县', NULL, NULL, NULL, NULL, 'false'),
(3335, 'mainland', 3330, ',3284,3330,3335,', 3, '华亭县', NULL, NULL, NULL, NULL, 'false'),
(3336, 'mainland', 3330, ',3284,3330,3336,', 3, '庄浪县', NULL, NULL, NULL, NULL, 'false'),
(3337, 'mainland', 3330, ',3284,3330,3337,', 3, '静宁县', NULL, NULL, NULL, NULL, 'false'),
(3338, 'mainland', 3330, ',3284,3330,3338,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3339, 'mainland', 3284, ',3284,3339,', 2, '酒泉市', NULL, NULL, NULL, NULL, 'false'),
(3340, 'mainland', 3339, ',3284,3339,3340,', 3, '肃州区', NULL, NULL, NULL, NULL, 'false'),
(3341, 'mainland', 3339, ',3284,3339,3341,', 3, '金塔县', NULL, NULL, NULL, NULL, 'false'),
(3342, 'mainland', 3339, ',3284,3339,3342,', 3, '安西县', NULL, NULL, NULL, NULL, 'false'),
(3343, 'mainland', 3339, ',3284,3339,3343,', 3, '肃北蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(3344, 'mainland', 3339, ',3284,3339,3344,', 3, '阿克塞哈萨克族自治县', NULL, NULL, NULL, NULL, 'false'),
(3345, 'mainland', 3339, ',3284,3339,3345,', 3, '玉门市', NULL, NULL, NULL, NULL, 'false'),
(3346, 'mainland', 3339, ',3284,3339,3346,', 3, '敦煌市', NULL, NULL, NULL, NULL, 'false'),
(3347, 'mainland', 3339, ',3284,3339,3347,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3348, 'mainland', 3284, ',3284,3348,', 2, '庆阳市', NULL, NULL, NULL, NULL, 'false'),
(3349, 'mainland', 3348, ',3284,3348,3349,', 3, '西峰区', NULL, NULL, NULL, NULL, 'false'),
(3350, 'mainland', 3348, ',3284,3348,3350,', 3, '庆城县', NULL, NULL, NULL, NULL, 'false'),
(3351, 'mainland', 3348, ',3284,3348,3351,', 3, '环县', NULL, NULL, NULL, NULL, 'false'),
(3352, 'mainland', 3348, ',3284,3348,3352,', 3, '华池县', NULL, NULL, NULL, NULL, 'false'),
(3353, 'mainland', 3348, ',3284,3348,3353,', 3, '合水县', NULL, NULL, NULL, NULL, 'false'),
(3354, 'mainland', 3348, ',3284,3348,3354,', 3, '正宁县', NULL, NULL, NULL, NULL, 'false'),
(3355, 'mainland', 3348, ',3284,3348,3355,', 3, '宁县', NULL, NULL, NULL, NULL, 'false'),
(3356, 'mainland', 3348, ',3284,3348,3356,', 3, '镇原县', NULL, NULL, NULL, NULL, 'false'),
(3357, 'mainland', 3348, ',3284,3348,3357,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3358, 'mainland', 3284, ',3284,3358,', 2, '定西市', NULL, NULL, NULL, NULL, 'false'),
(3359, 'mainland', 3358, ',3284,3358,3359,', 3, '安定区', NULL, NULL, NULL, NULL, 'false'),
(3360, 'mainland', 3358, ',3284,3358,3360,', 3, '通渭县', NULL, NULL, NULL, NULL, 'false'),
(3361, 'mainland', 3358, ',3284,3358,3361,', 3, '陇西县', NULL, NULL, NULL, NULL, 'false'),
(3362, 'mainland', 3358, ',3284,3358,3362,', 3, '渭源县', NULL, NULL, NULL, NULL, 'false'),
(3363, 'mainland', 3358, ',3284,3358,3363,', 3, '临洮县', NULL, NULL, NULL, NULL, 'false'),
(3364, 'mainland', 3358, ',3284,3358,3364,', 3, '漳县', NULL, NULL, NULL, NULL, 'false'),
(3365, 'mainland', 3358, ',3284,3358,3365,', 3, '岷县', NULL, NULL, NULL, NULL, 'false'),
(3366, 'mainland', 3358, ',3284,3358,3366,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3367, 'mainland', 3284, ',3284,3367,', 2, '陇南市', NULL, NULL, NULL, NULL, 'false'),
(3368, 'mainland', 3367, ',3284,3367,3368,', 3, '武都区', NULL, NULL, NULL, NULL, 'false'),
(3369, 'mainland', 3367, ',3284,3367,3369,', 3, '成县', NULL, NULL, NULL, NULL, 'false'),
(3370, 'mainland', 3367, ',3284,3367,3370,', 3, '文县', NULL, NULL, NULL, NULL, 'false'),
(3371, 'mainland', 3367, ',3284,3367,3371,', 3, '宕昌县', NULL, NULL, NULL, NULL, 'false'),
(3372, 'mainland', 3367, ',3284,3367,3372,', 3, '康县', NULL, NULL, NULL, NULL, 'false'),
(3373, 'mainland', 3367, ',3284,3367,3373,', 3, '西和县', NULL, NULL, NULL, NULL, 'false'),
(3374, 'mainland', 3367, ',3284,3367,3374,', 3, '礼县', NULL, NULL, NULL, NULL, 'false'),
(3375, 'mainland', 3367, ',3284,3367,3375,', 3, '徽县', NULL, NULL, NULL, NULL, 'false'),
(3376, 'mainland', 3367, ',3284,3367,3376,', 3, '两当县', NULL, NULL, NULL, NULL, 'false'),
(3377, 'mainland', 3367, ',3284,3367,3377,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3378, 'mainland', 3284, ',3284,3378,', 2, '临夏回族自治州', NULL, NULL, NULL, NULL, 'false'),
(3379, 'mainland', 3378, ',3284,3378,3379,', 3, '临夏市', NULL, NULL, NULL, NULL, 'false'),
(3380, 'mainland', 3378, ',3284,3378,3380,', 3, '临夏县', NULL, NULL, NULL, NULL, 'false'),
(3381, 'mainland', 3378, ',3284,3378,3381,', 3, '康乐县', NULL, NULL, NULL, NULL, 'false'),
(3382, 'mainland', 3378, ',3284,3378,3382,', 3, '永靖县', NULL, NULL, NULL, NULL, 'false'),
(3383, 'mainland', 3378, ',3284,3378,3383,', 3, '广河县', NULL, NULL, NULL, NULL, 'false'),
(3384, 'mainland', 3378, ',3284,3378,3384,', 3, '和政县', NULL, NULL, NULL, NULL, 'false'),
(3385, 'mainland', 3378, ',3284,3378,3385,', 3, '东乡族自治县', NULL, NULL, NULL, NULL, 'false'),
(3386, 'mainland', 3378, ',3284,3378,3386,', 3, '积石山保安族东乡族撒拉族自治县', NULL, NULL, NULL, NULL, 'false'),
(3387, 'mainland', 3378, ',3284,3378,3387,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3388, 'mainland', 3284, ',3284,3388,', 2, '甘南藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3389, 'mainland', 3388, ',3284,3388,3389,', 3, '合作市', NULL, NULL, NULL, NULL, 'false'),
(3390, 'mainland', 3388, ',3284,3388,3390,', 3, '临潭县', NULL, NULL, NULL, NULL, 'false'),
(3391, 'mainland', 3388, ',3284,3388,3391,', 3, '卓尼县', NULL, NULL, NULL, NULL, 'false'),
(3392, 'mainland', 3388, ',3284,3388,3392,', 3, '舟曲县', NULL, NULL, NULL, NULL, 'false'),
(3393, 'mainland', 3388, ',3284,3388,3393,', 3, '迭部县', NULL, NULL, NULL, NULL, 'false'),
(3394, 'mainland', 3388, ',3284,3388,3394,', 3, '玛曲县', NULL, NULL, NULL, NULL, 'false'),
(3395, 'mainland', 3388, ',3284,3388,3395,', 3, '碌曲县', NULL, NULL, NULL, NULL, 'false'),
(3396, 'mainland', 3388, ',3284,3388,3396,', 3, '夏河县', NULL, NULL, NULL, NULL, 'false'),
(3397, 'mainland', 3388, ',3284,3388,3397,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3398, 'mainland', NULL, ',3398,', 1, '青海省', NULL, NULL, NULL, NULL, 'false'),
(3399, 'mainland', 3398, ',3398,3399,', 2, '西宁市', NULL, NULL, NULL, NULL, 'false'),
(3400, 'mainland', 3399, ',3398,3399,3400,', 3, '城东区', NULL, NULL, NULL, NULL, 'false'),
(3401, 'mainland', 3399, ',3398,3399,3401,', 3, '城中区', NULL, NULL, NULL, NULL, 'false'),
(3402, 'mainland', 3399, ',3398,3399,3402,', 3, '城西区', NULL, NULL, NULL, NULL, 'false'),
(3403, 'mainland', 3399, ',3398,3399,3403,', 3, '城北区', NULL, NULL, NULL, NULL, 'false'),
(3404, 'mainland', 3399, ',3398,3399,3404,', 3, '大通回族土族自治县', NULL, NULL, NULL, NULL, 'false'),
(3405, 'mainland', 3399, ',3398,3399,3405,', 3, '湟中县', NULL, NULL, NULL, NULL, 'false'),
(3406, 'mainland', 3399, ',3398,3399,3406,', 3, '湟源县', NULL, NULL, NULL, NULL, 'false'),
(3407, 'mainland', 3399, ',3398,3399,3407,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3408, 'mainland', 3398, ',3398,3408,', 2, '海东地区', NULL, NULL, NULL, NULL, 'false'),
(3409, 'mainland', 3408, ',3398,3408,3409,', 3, '平安县', NULL, NULL, NULL, NULL, 'false'),
(3410, 'mainland', 3408, ',3398,3408,3410,', 3, '民和回族土族自治县', NULL, NULL, NULL, NULL, 'false'),
(3411, 'mainland', 3408, ',3398,3408,3411,', 3, '乐都县', NULL, NULL, NULL, NULL, 'false'),
(3412, 'mainland', 3408, ',3398,3408,3412,', 3, '互助土族自治县', NULL, NULL, NULL, NULL, 'false'),
(3413, 'mainland', 3408, ',3398,3408,3413,', 3, '化隆回族自治县', NULL, NULL, NULL, NULL, 'false'),
(3414, 'mainland', 3408, ',3398,3408,3414,', 3, '循化撒拉族自治县', NULL, NULL, NULL, NULL, 'false'),
(3415, 'mainland', 3408, ',3398,3408,3415,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3416, 'mainland', 3398, ',3398,3416,', 2, '海北藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3417, 'mainland', 3416, ',3398,3416,3417,', 3, '门源回族自治县', NULL, NULL, NULL, NULL, 'false'),
(3418, 'mainland', 3416, ',3398,3416,3418,', 3, '祁连县', NULL, NULL, NULL, NULL, 'false'),
(3419, 'mainland', 3416, ',3398,3416,3419,', 3, '海晏县', NULL, NULL, NULL, NULL, 'false'),
(3420, 'mainland', 3416, ',3398,3416,3420,', 3, '刚察县', NULL, NULL, NULL, NULL, 'false'),
(3421, 'mainland', 3416, ',3398,3416,3421,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3422, 'mainland', 3398, ',3398,3422,', 2, '黄南藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3423, 'mainland', 3422, ',3398,3422,3423,', 3, '同仁县', NULL, NULL, NULL, NULL, 'false'),
(3424, 'mainland', 3422, ',3398,3422,3424,', 3, '尖扎县', NULL, NULL, NULL, NULL, 'false'),
(3425, 'mainland', 3422, ',3398,3422,3425,', 3, '泽库县', NULL, NULL, NULL, NULL, 'false'),
(3426, 'mainland', 3422, ',3398,3422,3426,', 3, '河南蒙古族自治县', NULL, NULL, NULL, NULL, 'false'),
(3427, 'mainland', 3422, ',3398,3422,3427,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3428, 'mainland', 3398, ',3398,3428,', 2, '海南藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3429, 'mainland', 3428, ',3398,3428,3429,', 3, '共和县', NULL, NULL, NULL, NULL, 'false'),
(3430, 'mainland', 3428, ',3398,3428,3430,', 3, '同德县', NULL, NULL, NULL, NULL, 'false'),
(3431, 'mainland', 3428, ',3398,3428,3431,', 3, '贵德县', NULL, NULL, NULL, NULL, 'false'),
(3432, 'mainland', 3428, ',3398,3428,3432,', 3, '兴海县', NULL, NULL, NULL, NULL, 'false'),
(3433, 'mainland', 3428, ',3398,3428,3433,', 3, '贵南县', NULL, NULL, NULL, NULL, 'false'),
(3434, 'mainland', 3428, ',3398,3428,3434,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3435, 'mainland', 3398, ',3398,3435,', 2, '果洛藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3436, 'mainland', 3435, ',3398,3435,3436,', 3, '玛沁县', NULL, NULL, NULL, NULL, 'false'),
(3437, 'mainland', 3435, ',3398,3435,3437,', 3, '班玛县', NULL, NULL, NULL, NULL, 'false'),
(3438, 'mainland', 3435, ',3398,3435,3438,', 3, '甘德县', NULL, NULL, NULL, NULL, 'false'),
(3439, 'mainland', 3435, ',3398,3435,3439,', 3, '达日县', NULL, NULL, NULL, NULL, 'false'),
(3440, 'mainland', 3435, ',3398,3435,3440,', 3, '久治县', NULL, NULL, NULL, NULL, 'false'),
(3441, 'mainland', 3435, ',3398,3435,3441,', 3, '玛多县', NULL, NULL, NULL, NULL, 'false'),
(3442, 'mainland', 3435, ',3398,3435,3442,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3443, 'mainland', 3398, ',3398,3443,', 2, '玉树藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3444, 'mainland', 3443, ',3398,3443,3444,', 3, '玉树县', NULL, NULL, NULL, NULL, 'false'),
(3445, 'mainland', 3443, ',3398,3443,3445,', 3, '杂多县', NULL, NULL, NULL, NULL, 'false'),
(3446, 'mainland', 3443, ',3398,3443,3446,', 3, '称多县', NULL, NULL, NULL, NULL, 'false'),
(3447, 'mainland', 3443, ',3398,3443,3447,', 3, '治多县', NULL, NULL, NULL, NULL, 'false'),
(3448, 'mainland', 3443, ',3398,3443,3448,', 3, '囊谦县', NULL, NULL, NULL, NULL, 'false'),
(3449, 'mainland', 3443, ',3398,3443,3449,', 3, '曲麻莱县', NULL, NULL, NULL, NULL, 'false'),
(3450, 'mainland', 3443, ',3398,3443,3450,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3451, 'mainland', 3398, ',3398,3451,', 2, '海西蒙古族藏族自治州', NULL, NULL, NULL, NULL, 'false'),
(3452, 'mainland', 3451, ',3398,3451,3452,', 3, '格尔木市', NULL, NULL, NULL, NULL, 'false'),
(3453, 'mainland', 3451, ',3398,3451,3453,', 3, '德令哈市', NULL, NULL, NULL, NULL, 'false'),
(3454, 'mainland', 3451, ',3398,3451,3454,', 3, '乌兰县', NULL, NULL, NULL, NULL, 'false'),
(3455, 'mainland', 3451, ',3398,3451,3455,', 3, '都兰县', NULL, NULL, NULL, NULL, 'false'),
(3456, 'mainland', 3451, ',3398,3451,3456,', 3, '天峻县', NULL, NULL, NULL, NULL, 'false'),
(3457, 'mainland', 3451, ',3398,3451,3457,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3458, 'mainland', NULL, ',3458,', 1, '宁夏回族自治区', NULL, NULL, NULL, NULL, 'false'),
(3459, 'mainland', 3458, ',3458,3459,', 2, '银川市', NULL, NULL, NULL, NULL, 'false'),
(3460, 'mainland', 3459, ',3458,3459,3460,', 3, '兴庆区', NULL, NULL, NULL, NULL, 'false'),
(3461, 'mainland', 3459, ',3458,3459,3461,', 3, '西夏区', NULL, NULL, NULL, NULL, 'false'),
(3462, 'mainland', 3459, ',3458,3459,3462,', 3, '金凤区', NULL, NULL, NULL, NULL, 'false'),
(3463, 'mainland', 3459, ',3458,3459,3463,', 3, '永宁县', NULL, NULL, NULL, NULL, 'false'),
(3464, 'mainland', 3459, ',3458,3459,3464,', 3, '贺兰县', NULL, NULL, NULL, NULL, 'false'),
(3465, 'mainland', 3459, ',3458,3459,3465,', 3, '灵武市', NULL, NULL, NULL, NULL, 'false'),
(3466, 'mainland', 3459, ',3458,3459,3466,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3467, 'mainland', 3458, ',3458,3467,', 2, '石嘴山市', NULL, NULL, NULL, NULL, 'false'),
(3468, 'mainland', 3467, ',3458,3467,3468,', 3, '大武口区', NULL, NULL, NULL, NULL, 'false'),
(3469, 'mainland', 3467, ',3458,3467,3469,', 3, '惠农区', NULL, NULL, NULL, NULL, 'false'),
(3470, 'mainland', 3467, ',3458,3467,3470,', 3, '平罗县', NULL, NULL, NULL, NULL, 'false'),
(3471, 'mainland', 3467, ',3458,3467,3471,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3472, 'mainland', 3458, ',3458,3472,', 2, '吴忠市', NULL, NULL, NULL, NULL, 'false'),
(3473, 'mainland', 3472, ',3458,3472,3473,', 3, '利通区', NULL, NULL, NULL, NULL, 'false'),
(3474, 'mainland', 3472, ',3458,3472,3474,', 3, '红寺堡区', NULL, NULL, NULL, NULL, 'false'),
(3475, 'mainland', 3472, ',3458,3472,3475,', 3, '盐池县', NULL, NULL, NULL, NULL, 'false'),
(3476, 'mainland', 3472, ',3458,3472,3476,', 3, '同心县', NULL, NULL, NULL, NULL, 'false'),
(3477, 'mainland', 3472, ',3458,3472,3477,', 3, '青铜峡市', NULL, NULL, NULL, NULL, 'false'),
(3478, 'mainland', 3472, ',3458,3472,3478,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3479, 'mainland', 3458, ',3458,3479,', 2, '固原市', NULL, NULL, NULL, NULL, 'false'),
(3480, 'mainland', 3479, ',3458,3479,3480,', 3, '原州区', NULL, NULL, NULL, NULL, 'false'),
(3481, 'mainland', 3479, ',3458,3479,3481,', 3, '西吉县', NULL, NULL, NULL, NULL, 'false'),
(3482, 'mainland', 3479, ',3458,3479,3482,', 3, '隆德县', NULL, NULL, NULL, NULL, 'false'),
(3483, 'mainland', 3479, ',3458,3479,3483,', 3, '泾源县', NULL, NULL, NULL, NULL, 'false'),
(3484, 'mainland', 3479, ',3458,3479,3484,', 3, '彭阳县', NULL, NULL, NULL, NULL, 'false'),
(3485, 'mainland', 3479, ',3458,3479,3485,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3486, 'mainland', 3458, ',3458,3486,', 2, '中卫市', NULL, NULL, NULL, NULL, 'false'),
(3487, 'mainland', 3486, ',3458,3486,3487,', 3, '沙坡头区', NULL, NULL, NULL, NULL, 'false'),
(3488, 'mainland', 3486, ',3458,3486,3488,', 3, '中宁县', NULL, NULL, NULL, NULL, 'false'),
(3489, 'mainland', 3486, ',3458,3486,3489,', 3, '海原县', NULL, NULL, NULL, NULL, 'false'),
(3490, 'mainland', 3486, ',3458,3486,3490,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3491, 'mainland', NULL, ',3491,', 1, '新疆维吾尔自治区', NULL, NULL, NULL, NULL, 'false'),
(3492, 'mainland', 3491, ',3491,3492,', 2, '乌鲁木齐市', NULL, NULL, NULL, NULL, 'false'),
(3493, 'mainland', 3492, ',3491,3492,3493,', 3, '天山区', NULL, NULL, NULL, NULL, 'false'),
(3494, 'mainland', 3492, ',3491,3492,3494,', 3, '沙依巴克区', NULL, NULL, NULL, NULL, 'false'),
(3495, 'mainland', 3492, ',3491,3492,3495,', 3, '新市区', NULL, NULL, NULL, NULL, 'false'),
(3496, 'mainland', 3492, ',3491,3492,3496,', 3, '水磨沟区', NULL, NULL, NULL, NULL, 'false'),
(3497, 'mainland', 3492, ',3491,3492,3497,', 3, '头屯河区', NULL, NULL, NULL, NULL, 'false'),
(3498, 'mainland', 3492, ',3491,3492,3498,', 3, '达坂城区', NULL, NULL, NULL, NULL, 'false'),
(3499, 'mainland', 3492, ',3491,3492,3499,', 3, '东山区', NULL, NULL, NULL, NULL, 'false'),
(3500, 'mainland', 3492, ',3491,3492,3500,', 3, '米东区', NULL, NULL, NULL, NULL, 'false'),
(3501, 'mainland', 3492, ',3491,3492,3501,', 3, '乌鲁木齐县', NULL, NULL, NULL, NULL, 'false'),
(3502, 'mainland', 3492, ',3491,3492,3502,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3503, 'mainland', 3491, ',3491,3503,', 2, '克拉玛依市', NULL, NULL, NULL, NULL, 'false'),
(3504, 'mainland', 3503, ',3491,3503,3504,', 3, '独山子区', NULL, NULL, NULL, NULL, 'false'),
(3505, 'mainland', 3503, ',3491,3503,3505,', 3, '克拉玛依区', NULL, NULL, NULL, NULL, 'false'),
(3506, 'mainland', 3503, ',3491,3503,3506,', 3, '白碱滩区', NULL, NULL, NULL, NULL, 'false'),
(3507, 'mainland', 3503, ',3491,3503,3507,', 3, '乌尔禾区', NULL, NULL, NULL, NULL, 'false'),
(3508, 'mainland', 3503, ',3491,3503,3508,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3509, 'mainland', 3491, ',3491,3509,', 2, '吐鲁番地区', NULL, NULL, NULL, NULL, 'false'),
(3510, 'mainland', 3509, ',3491,3509,3510,', 3, '吐鲁番市', NULL, NULL, NULL, NULL, 'false'),
(3511, 'mainland', 3509, ',3491,3509,3511,', 3, '鄯善县', NULL, NULL, NULL, NULL, 'false'),
(3512, 'mainland', 3509, ',3491,3509,3512,', 3, '托克逊县', NULL, NULL, NULL, NULL, 'false'),
(3513, 'mainland', 3509, ',3491,3509,3513,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3514, 'mainland', 3491, ',3491,3514,', 2, '哈密地区', NULL, NULL, NULL, NULL, 'false'),
(3515, 'mainland', 3514, ',3491,3514,3515,', 3, '哈密市', NULL, NULL, NULL, NULL, 'false'),
(3516, 'mainland', 3514, ',3491,3514,3516,', 3, '巴里坤哈萨克自治县', NULL, NULL, NULL, NULL, 'false'),
(3517, 'mainland', 3514, ',3491,3514,3517,', 3, '伊吾县', NULL, NULL, NULL, NULL, 'false'),
(3518, 'mainland', 3514, ',3491,3514,3518,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3519, 'mainland', 3491, ',3491,3519,', 2, '昌吉回族自治州', NULL, NULL, NULL, NULL, 'false'),
(3520, 'mainland', 3519, ',3491,3519,3520,', 3, '昌吉市', NULL, NULL, NULL, NULL, 'false'),
(3521, 'mainland', 3519, ',3491,3519,3521,', 3, '阜康市', NULL, NULL, NULL, NULL, 'false'),
(3522, 'mainland', 3519, ',3491,3519,3522,', 3, '米泉市', NULL, NULL, NULL, NULL, 'false'),
(3523, 'mainland', 3519, ',3491,3519,3523,', 3, '呼图壁县', NULL, NULL, NULL, NULL, 'false'),
(3524, 'mainland', 3519, ',3491,3519,3524,', 3, '玛纳斯县', NULL, NULL, NULL, NULL, 'false'),
(3525, 'mainland', 3519, ',3491,3519,3525,', 3, '奇台县', NULL, NULL, NULL, NULL, 'false'),
(3526, 'mainland', 3519, ',3491,3519,3526,', 3, '吉木萨尔县', NULL, NULL, NULL, NULL, 'false'),
(3527, 'mainland', 3519, ',3491,3519,3527,', 3, '木垒哈萨克自治县', NULL, NULL, NULL, NULL, 'false'),
(3528, 'mainland', 3519, ',3491,3519,3528,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3529, 'mainland', 3491, ',3491,3529,', 2, '博尔塔拉蒙古自治州', NULL, NULL, NULL, NULL, 'false'),
(3530, 'mainland', 3529, ',3491,3529,3530,', 3, '博乐市', NULL, NULL, NULL, NULL, 'false'),
(3531, 'mainland', 3529, ',3491,3529,3531,', 3, '精河县', NULL, NULL, NULL, NULL, 'false'),
(3532, 'mainland', 3529, ',3491,3529,3532,', 3, '温泉县', NULL, NULL, NULL, NULL, 'false'),
(3533, 'mainland', 3529, ',3491,3529,3533,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3534, 'mainland', 3491, ',3491,3534,', 2, '巴音郭楞蒙古自治州', NULL, NULL, NULL, NULL, 'false'),
(3535, 'mainland', 3534, ',3491,3534,3535,', 3, '库尔勒市', NULL, NULL, NULL, NULL, 'false'),
(3536, 'mainland', 3534, ',3491,3534,3536,', 3, '轮台县', NULL, NULL, NULL, NULL, 'false'),
(3537, 'mainland', 3534, ',3491,3534,3537,', 3, '尉犁县', NULL, NULL, NULL, NULL, 'false'),
(3538, 'mainland', 3534, ',3491,3534,3538,', 3, '若羌县', NULL, NULL, NULL, NULL, 'false'),
(3539, 'mainland', 3534, ',3491,3534,3539,', 3, '且末县', NULL, NULL, NULL, NULL, 'false'),
(3540, 'mainland', 3534, ',3491,3534,3540,', 3, '焉耆回族自治县', NULL, NULL, NULL, NULL, 'false'),
(3541, 'mainland', 3534, ',3491,3534,3541,', 3, '和静县', NULL, NULL, NULL, NULL, 'false'),
(3542, 'mainland', 3534, ',3491,3534,3542,', 3, '和硕县', NULL, NULL, NULL, NULL, 'false'),
(3543, 'mainland', 3534, ',3491,3534,3543,', 3, '博湖县', NULL, NULL, NULL, NULL, 'false'),
(3544, 'mainland', 3534, ',3491,3534,3544,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3545, 'mainland', 3491, ',3491,3545,', 2, '阿克苏地区', NULL, NULL, NULL, NULL, 'false'),
(3546, 'mainland', 3545, ',3491,3545,3546,', 3, '阿克苏市', NULL, NULL, NULL, NULL, 'false'),
(3547, 'mainland', 3545, ',3491,3545,3547,', 3, '温宿县', NULL, NULL, NULL, NULL, 'false'),
(3548, 'mainland', 3545, ',3491,3545,3548,', 3, '库车县', NULL, NULL, NULL, NULL, 'false'),
(3549, 'mainland', 3545, ',3491,3545,3549,', 3, '沙雅县', NULL, NULL, NULL, NULL, 'false'),
(3550, 'mainland', 3545, ',3491,3545,3550,', 3, '新和县', NULL, NULL, NULL, NULL, 'false'),
(3551, 'mainland', 3545, ',3491,3545,3551,', 3, '拜城县', NULL, NULL, NULL, NULL, 'false'),
(3552, 'mainland', 3545, ',3491,3545,3552,', 3, '乌什县', NULL, NULL, NULL, NULL, 'false'),
(3553, 'mainland', 3545, ',3491,3545,3553,', 3, '阿瓦提县', NULL, NULL, NULL, NULL, 'false'),
(3554, 'mainland', 3545, ',3491,3545,3554,', 3, '柯坪县', NULL, NULL, NULL, NULL, 'false'),
(3555, 'mainland', 3545, ',3491,3545,3555,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3556, 'mainland', 3491, ',3491,3556,', 2, '克孜勒苏柯尔克孜自治州', NULL, NULL, NULL, NULL, 'false'),
(3557, 'mainland', 3556, ',3491,3556,3557,', 3, '阿图什市', NULL, NULL, NULL, NULL, 'false'),
(3558, 'mainland', 3556, ',3491,3556,3558,', 3, '阿克陶县', NULL, NULL, NULL, NULL, 'false'),
(3559, 'mainland', 3556, ',3491,3556,3559,', 3, '阿合奇县', NULL, NULL, NULL, NULL, 'false'),
(3560, 'mainland', 3556, ',3491,3556,3560,', 3, '乌恰县', NULL, NULL, NULL, NULL, 'false'),
(3561, 'mainland', 3556, ',3491,3556,3561,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3562, 'mainland', 3491, ',3491,3562,', 2, '喀什地区', NULL, NULL, NULL, NULL, 'false'),
(3563, 'mainland', 3562, ',3491,3562,3563,', 3, '喀什市', NULL, NULL, NULL, NULL, 'false'),
(3564, 'mainland', 3562, ',3491,3562,3564,', 3, '疏附县', NULL, NULL, NULL, NULL, 'false'),
(3565, 'mainland', 3562, ',3491,3562,3565,', 3, '疏勒县', NULL, NULL, NULL, NULL, 'false'),
(3566, 'mainland', 3562, ',3491,3562,3566,', 3, '英吉沙县', NULL, NULL, NULL, NULL, 'false'),
(3567, 'mainland', 3562, ',3491,3562,3567,', 3, '泽普县', NULL, NULL, NULL, NULL, 'false'),
(3568, 'mainland', 3562, ',3491,3562,3568,', 3, '莎车县', NULL, NULL, NULL, NULL, 'false'),
(3569, 'mainland', 3562, ',3491,3562,3569,', 3, '叶城县', NULL, NULL, NULL, NULL, 'false'),
(3570, 'mainland', 3562, ',3491,3562,3570,', 3, '麦盖提县', NULL, NULL, NULL, NULL, 'false'),
(3571, 'mainland', 3562, ',3491,3562,3571,', 3, '岳普湖县', NULL, NULL, NULL, NULL, 'false'),
(3572, 'mainland', 3562, ',3491,3562,3572,', 3, '伽师县', NULL, NULL, NULL, NULL, 'false'),
(3573, 'mainland', 3562, ',3491,3562,3573,', 3, '巴楚县', NULL, NULL, NULL, NULL, 'false'),
(3574, 'mainland', 3562, ',3491,3562,3574,', 3, '塔什库尔干塔吉克自治县', NULL, NULL, NULL, NULL, 'false'),
(3575, 'mainland', 3562, ',3491,3562,3575,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3576, 'mainland', 3491, ',3491,3576,', 2, '和田地区', NULL, NULL, NULL, NULL, 'false'),
(3577, 'mainland', 3576, ',3491,3576,3577,', 3, '和田市', NULL, NULL, NULL, NULL, 'false'),
(3578, 'mainland', 3576, ',3491,3576,3578,', 3, '和田县', NULL, NULL, NULL, NULL, 'false'),
(3579, 'mainland', 3576, ',3491,3576,3579,', 3, '墨玉县', NULL, NULL, NULL, NULL, 'false'),
(3580, 'mainland', 3576, ',3491,3576,3580,', 3, '皮山县', NULL, NULL, NULL, NULL, 'false'),
(3581, 'mainland', 3576, ',3491,3576,3581,', 3, '洛浦县', NULL, NULL, NULL, NULL, 'false'),
(3582, 'mainland', 3576, ',3491,3576,3582,', 3, '策勒县', NULL, NULL, NULL, NULL, 'false'),
(3583, 'mainland', 3576, ',3491,3576,3583,', 3, '于田县', NULL, NULL, NULL, NULL, 'false'),
(3584, 'mainland', 3576, ',3491,3576,3584,', 3, '民丰县', NULL, NULL, NULL, NULL, 'false'),
(3585, 'mainland', 3576, ',3491,3576,3585,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3586, 'mainland', 3491, ',3491,3586,', 2, '伊犁哈萨克自治州', NULL, NULL, NULL, NULL, 'false'),
(3587, 'mainland', 3586, ',3491,3586,3587,', 3, '伊宁市', NULL, NULL, NULL, NULL, 'false'),
(3588, 'mainland', 3586, ',3491,3586,3588,', 3, '奎屯市', NULL, NULL, NULL, NULL, 'false'),
(3589, 'mainland', 3586, ',3491,3586,3589,', 3, '伊宁县', NULL, NULL, NULL, NULL, 'false'),
(3590, 'mainland', 3586, ',3491,3586,3590,', 3, '察布查尔锡伯自治县', NULL, NULL, NULL, NULL, 'false'),
(3591, 'mainland', 3586, ',3491,3586,3591,', 3, '霍城县', NULL, NULL, NULL, NULL, 'false'),
(3592, 'mainland', 3586, ',3491,3586,3592,', 3, '巩留县', NULL, NULL, NULL, NULL, 'false'),
(3593, 'mainland', 3586, ',3491,3586,3593,', 3, '新源县', NULL, NULL, NULL, NULL, 'false'),
(3594, 'mainland', 3586, ',3491,3586,3594,', 3, '昭苏县', NULL, NULL, NULL, NULL, 'false'),
(3595, 'mainland', 3586, ',3491,3586,3595,', 3, '特克斯县', NULL, NULL, NULL, NULL, 'false'),
(3596, 'mainland', 3586, ',3491,3586,3596,', 3, '尼勒克县', NULL, NULL, NULL, NULL, 'false'),
(3597, 'mainland', 3586, ',3491,3586,3597,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3598, 'mainland', 3491, ',3491,3598,', 2, '塔城地区', NULL, NULL, NULL, NULL, 'false'),
(3599, 'mainland', 3598, ',3491,3598,3599,', 3, '塔城市', NULL, NULL, NULL, NULL, 'false'),
(3600, 'mainland', 3598, ',3491,3598,3600,', 3, '乌苏市', NULL, NULL, NULL, NULL, 'false'),
(3601, 'mainland', 3598, ',3491,3598,3601,', 3, '额敏县', NULL, NULL, NULL, NULL, 'false'),
(3602, 'mainland', 3598, ',3491,3598,3602,', 3, '沙湾县', NULL, NULL, NULL, NULL, 'false'),
(3603, 'mainland', 3598, ',3491,3598,3603,', 3, '托里县', NULL, NULL, NULL, NULL, 'false'),
(3604, 'mainland', 3598, ',3491,3598,3604,', 3, '裕民县', NULL, NULL, NULL, NULL, 'false'),
(3605, 'mainland', 3598, ',3491,3598,3605,', 3, '和布克赛尔蒙古自治县', NULL, NULL, NULL, NULL, 'false'),
(3606, 'mainland', 3598, ',3491,3598,3606,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3607, 'mainland', 3491, ',3491,3607,', 2, '阿勒泰地区', NULL, NULL, NULL, NULL, 'false'),
(3608, 'mainland', 3607, ',3491,3607,3608,', 3, '阿勒泰市', NULL, NULL, NULL, NULL, 'false'),
(3609, 'mainland', 3607, ',3491,3607,3609,', 3, '布尔津县', NULL, NULL, NULL, NULL, 'false'),
(3610, 'mainland', 3607, ',3491,3607,3610,', 3, '富蕴县', NULL, NULL, NULL, NULL, 'false'),
(3611, 'mainland', 3607, ',3491,3607,3611,', 3, '福海县', NULL, NULL, NULL, NULL, 'false'),
(3612, 'mainland', 3607, ',3491,3607,3612,', 3, '哈巴河县', NULL, NULL, NULL, NULL, 'false'),
(3613, 'mainland', 3607, ',3491,3607,3613,', 3, '青河县', NULL, NULL, NULL, NULL, 'false'),
(3614, 'mainland', 3607, ',3491,3607,3614,', 3, '吉木乃县', NULL, NULL, NULL, NULL, 'false'),
(3615, 'mainland', 3607, ',3491,3607,3615,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3616, 'mainland', 3491, ',3491,3616,', 2, '石河子市', NULL, NULL, NULL, NULL, 'false'),
(3617, 'mainland', 3491, ',3491,3617,', 2, '阿拉尔市', NULL, NULL, NULL, NULL, 'false'),
(3618, 'mainland', 3491, ',3491,3618,', 2, '图木舒克市', NULL, NULL, NULL, NULL, 'false'),
(3619, 'mainland', 3491, ',3491,3619,', 2, '五家渠市', NULL, NULL, NULL, NULL, 'false'),
(3620, 'mainland', NULL, ',3620,', 1, '台湾省', NULL, NULL, NULL, NULL, 'false'),
(3621, 'mainland', 3620, ',3620,3621,', 2, '台北市', NULL, NULL, NULL, NULL, 'false'),
(3622, 'mainland', 3621, ',3620,3621,3622,', 3, '中正区', NULL, NULL, NULL, NULL, 'false'),
(3623, 'mainland', 3621, ',3620,3621,3623,', 3, '大同区', NULL, NULL, NULL, NULL, 'false'),
(3624, 'mainland', 3621, ',3620,3621,3624,', 3, '中山区', NULL, NULL, NULL, NULL, 'false'),
(3625, 'mainland', 3621, ',3620,3621,3625,', 3, '松山区', NULL, NULL, NULL, NULL, 'false'),
(3626, 'mainland', 3621, ',3620,3621,3626,', 3, '大安区', NULL, NULL, NULL, NULL, 'false'),
(3627, 'mainland', 3621, ',3620,3621,3627,', 3, '万华区', NULL, NULL, NULL, NULL, 'false'),
(3628, 'mainland', 3621, ',3620,3621,3628,', 3, '信义区', NULL, NULL, NULL, NULL, 'false'),
(3629, 'mainland', 3621, ',3620,3621,3629,', 3, '士林区', NULL, NULL, NULL, NULL, 'false'),
(3630, 'mainland', 3621, ',3620,3621,3630,', 3, '北投区', NULL, NULL, NULL, NULL, 'false'),
(3631, 'mainland', 3621, ',3620,3621,3631,', 3, '内湖区', NULL, NULL, NULL, NULL, 'false'),
(3632, 'mainland', 3621, ',3620,3621,3632,', 3, '南港区', NULL, NULL, NULL, NULL, 'false'),
(3633, 'mainland', 3621, ',3620,3621,3633,', 3, '文山区', NULL, NULL, NULL, NULL, 'false'),
(3634, 'mainland', 3621, ',3620,3621,3634,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3635, 'mainland', 3620, ',3620,3635,', 2, '高雄市', NULL, NULL, NULL, NULL, 'false'),
(3636, 'mainland', 3635, ',3620,3635,3636,', 3, '新兴区', NULL, NULL, NULL, NULL, 'false'),
(3637, 'mainland', 3635, ',3620,3635,3637,', 3, '前金区', NULL, NULL, NULL, NULL, 'false'),
(3638, 'mainland', 3635, ',3620,3635,3638,', 3, '芩雅区', NULL, NULL, NULL, NULL, 'false'),
(3639, 'mainland', 3635, ',3620,3635,3639,', 3, '盐埕区', NULL, NULL, NULL, NULL, 'false'),
(3640, 'mainland', 3635, ',3620,3635,3640,', 3, '鼓山区', NULL, NULL, NULL, NULL, 'false'),
(3641, 'mainland', 3635, ',3620,3635,3641,', 3, '旗津区', NULL, NULL, NULL, NULL, 'false'),
(3642, 'mainland', 3635, ',3620,3635,3642,', 3, '前镇区', NULL, NULL, NULL, NULL, 'false'),
(3643, 'mainland', 3635, ',3620,3635,3643,', 3, '三民区', NULL, NULL, NULL, NULL, 'false'),
(3644, 'mainland', 3635, ',3620,3635,3644,', 3, '左营区', NULL, NULL, NULL, NULL, 'false'),
(3645, 'mainland', 3635, ',3620,3635,3645,', 3, '楠梓区', NULL, NULL, NULL, NULL, 'false'),
(3646, 'mainland', 3635, ',3620,3635,3646,', 3, '小港区', NULL, NULL, NULL, NULL, 'false'),
(3647, 'mainland', 3635, ',3620,3635,3647,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3648, 'mainland', 3620, ',3620,3648,', 2, '台南市', NULL, NULL, NULL, NULL, 'false'),
(3649, 'mainland', 3648, ',3620,3648,3649,', 3, '中西区', NULL, NULL, NULL, NULL, 'false'),
(3650, 'mainland', 3648, ',3620,3648,3650,', 3, '东区', NULL, NULL, NULL, NULL, 'false'),
(3651, 'mainland', 3648, ',3620,3648,3651,', 3, '南区', NULL, NULL, NULL, NULL, 'false'),
(3652, 'mainland', 3648, ',3620,3648,3652,', 3, '北区', NULL, NULL, NULL, NULL, 'false'),
(3653, 'mainland', 3648, ',3620,3648,3653,', 3, '安平区', NULL, NULL, NULL, NULL, 'false'),
(3654, 'mainland', 3648, ',3620,3648,3654,', 3, '安南区', NULL, NULL, NULL, NULL, 'false'),
(3655, 'mainland', 3648, ',3620,3648,3655,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3656, 'mainland', 3620, ',3620,3656,', 2, '台中市', NULL, NULL, NULL, NULL, 'false'),
(3657, 'mainland', 3656, ',3620,3656,3657,', 3, '中区', NULL, NULL, NULL, NULL, 'false'),
(3658, 'mainland', 3656, ',3620,3656,3658,', 3, '东区', NULL, NULL, NULL, NULL, 'false'),
(3659, 'mainland', 3656, ',3620,3656,3659,', 3, '南区', NULL, NULL, NULL, NULL, 'false'),
(3660, 'mainland', 3656, ',3620,3656,3660,', 3, '西区', NULL, NULL, NULL, NULL, 'false'),
(3661, 'mainland', 3656, ',3620,3656,3661,', 3, '北区', NULL, NULL, NULL, NULL, 'false'),
(3662, 'mainland', 3656, ',3620,3656,3662,', 3, '北屯区', NULL, NULL, NULL, NULL, 'false'),
(3663, 'mainland', 3656, ',3620,3656,3663,', 3, '西屯区', NULL, NULL, NULL, NULL, 'false'),
(3664, 'mainland', 3656, ',3620,3656,3664,', 3, '南屯区', NULL, NULL, NULL, NULL, 'false'),
(3665, 'mainland', 3656, ',3620,3656,3665,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3666, 'mainland', 3620, ',3620,3666,', 2, '金门县', NULL, NULL, NULL, NULL, 'false'),
(3667, 'mainland', 3620, ',3620,3667,', 2, '南投县', NULL, NULL, NULL, NULL, 'false'),
(3668, 'mainland', 3620, ',3620,3668,', 2, '基隆市', NULL, NULL, NULL, NULL, 'false'),
(3669, 'mainland', 3668, ',3620,3668,3669,', 3, '仁爱区', NULL, NULL, NULL, NULL, 'false'),
(3670, 'mainland', 3668, ',3620,3668,3670,', 3, '信义区', NULL, NULL, NULL, NULL, 'false'),
(3671, 'mainland', 3668, ',3620,3668,3671,', 3, '中正区', NULL, NULL, NULL, NULL, 'false'),
(3672, 'mainland', 3668, ',3620,3668,3672,', 3, '中山区', NULL, NULL, NULL, NULL, 'false'),
(3673, 'mainland', 3668, ',3620,3668,3673,', 3, '安乐区', NULL, NULL, NULL, NULL, 'false'),
(3674, 'mainland', 3668, ',3620,3668,3674,', 3, '暖暖区', NULL, NULL, NULL, NULL, 'false'),
(3675, 'mainland', 3668, ',3620,3668,3675,', 3, '七堵区', NULL, NULL, NULL, NULL, 'false'),
(3676, 'mainland', 3668, ',3620,3668,3676,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3677, 'mainland', 3620, ',3620,3677,', 2, '新竹市', NULL, NULL, NULL, NULL, 'false'),
(3678, 'mainland', 3677, ',3620,3677,3678,', 3, '东区', NULL, NULL, NULL, NULL, 'false'),
(3679, 'mainland', 3677, ',3620,3677,3679,', 3, '北区', NULL, NULL, NULL, NULL, 'false'),
(3680, 'mainland', 3677, ',3620,3677,3680,', 3, '香山区', NULL, NULL, NULL, NULL, 'false'),
(3681, 'mainland', 3677, ',3620,3677,3681,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3682, 'mainland', 3620, ',3620,3682,', 2, '嘉义市', NULL, NULL, NULL, NULL, 'false'),
(3683, 'mainland', 3682, ',3620,3682,3683,', 3, '东区', NULL, NULL, NULL, NULL, 'false'),
(3684, 'mainland', 3682, ',3620,3682,3684,', 3, '西区', NULL, NULL, NULL, NULL, 'false'),
(3685, 'mainland', 3682, ',3620,3682,3685,', 3, '其它区', NULL, NULL, NULL, NULL, 'false'),
(3686, 'mainland', 3620, ',3620,3686,', 2, '新北市', NULL, NULL, NULL, NULL, 'false'),
(3687, 'mainland', 3620, ',3620,3687,', 2, '宜兰县', NULL, NULL, NULL, NULL, 'false'),
(3688, 'mainland', 3620, ',3620,3688,', 2, '新竹县', NULL, NULL, NULL, NULL, 'false'),
(3689, 'mainland', 3620, ',3620,3689,', 2, '桃园县', NULL, NULL, NULL, NULL, 'false'),
(3690, 'mainland', 3620, ',3620,3690,', 2, '苗栗县', NULL, NULL, NULL, NULL, 'false'),
(3691, 'mainland', 3620, ',3620,3691,', 2, '彰化县', NULL, NULL, NULL, NULL, 'false'),
(3692, 'mainland', 3620, ',3620,3692,', 2, '嘉义县', NULL, NULL, NULL, NULL, 'false'),
(3693, 'mainland', 3620, ',3620,3693,', 2, '云林县', NULL, NULL, NULL, NULL, 'false'),
(3694, 'mainland', 3620, ',3620,3694,', 2, '屏东县', NULL, NULL, NULL, NULL, 'false'),
(3695, 'mainland', 3620, ',3620,3695,', 2, '台东县', NULL, NULL, NULL, NULL, 'false'),
(3696, 'mainland', 3620, ',3620,3696,', 2, '花莲县', NULL, NULL, NULL, NULL, 'false'),
(3697, 'mainland', 3620, ',3620,3697,', 2, '澎湖县', NULL, NULL, NULL, NULL, 'false'),
(3698, 'mainland', NULL, ',3698,', 1, '香港特别行政区', NULL, NULL, NULL, NULL, 'false'),
(3699, 'mainland', 3698, ',3698,3699,', 2, '香港岛', NULL, NULL, NULL, NULL, 'false'),
(3700, 'mainland', 3699, ',3698,3699,3700,', 3, '中西区', NULL, NULL, NULL, NULL, 'false'),
(3701, 'mainland', 3699, ',3698,3699,3701,', 3, '湾仔', NULL, NULL, NULL, NULL, 'false'),
(3702, 'mainland', 3699, ',3698,3699,3702,', 3, '东区', NULL, NULL, NULL, NULL, 'false'),
(3703, 'mainland', 3699, ',3698,3699,3703,', 3, '南区', NULL, NULL, NULL, NULL, 'false'),
(3704, 'mainland', 3698, ',3698,3704,', 2, '九龙', NULL, NULL, NULL, NULL, 'false'),
(3705, 'mainland', 3704, ',3698,3704,3705,', 3, '九龙城区', NULL, NULL, NULL, NULL, 'false'),
(3706, 'mainland', 3704, ',3698,3704,3706,', 3, '油尖旺区', NULL, NULL, NULL, NULL, 'false'),
(3707, 'mainland', 3704, ',3698,3704,3707,', 3, '深水埗区', NULL, NULL, NULL, NULL, 'false'),
(3708, 'mainland', 3704, ',3698,3704,3708,', 3, '黄大仙区', NULL, NULL, NULL, NULL, 'false'),
(3709, 'mainland', 3704, ',3698,3704,3709,', 3, '观塘区', NULL, NULL, NULL, NULL, 'false'),
(3710, 'mainland', 3698, ',3698,3710,', 2, '新界', NULL, NULL, NULL, NULL, 'false'),
(3711, 'mainland', 3710, ',3698,3710,3711,', 3, '北区', NULL, NULL, NULL, NULL, 'false'),
(3712, 'mainland', 3710, ',3698,3710,3712,', 3, '大埔区', NULL, NULL, NULL, NULL, 'false'),
(3713, 'mainland', 3710, ',3698,3710,3713,', 3, '沙田区', NULL, NULL, NULL, NULL, 'false'),
(3714, 'mainland', 3710, ',3698,3710,3714,', 3, '西贡区', NULL, NULL, NULL, NULL, 'false'),
(3715, 'mainland', 3710, ',3698,3710,3715,', 3, '元朗区', NULL, NULL, NULL, NULL, 'false'),
(3716, 'mainland', 3710, ',3698,3710,3716,', 3, '屯门区', NULL, NULL, NULL, NULL, 'false'),
(3717, 'mainland', 3710, ',3698,3710,3717,', 3, '荃湾区', NULL, NULL, NULL, NULL, 'false'),
(3718, 'mainland', 3710, ',3698,3710,3718,', 3, '葵青区', NULL, NULL, NULL, NULL, 'false'),
(3719, 'mainland', 3710, ',3698,3710,3719,', 3, '离岛区', NULL, NULL, NULL, NULL, 'false'),
(3720, 'mainland', NULL, ',3720,', 1, '澳门特别行政区', NULL, NULL, NULL, NULL, 'false'),
(3721, 'mainland', 3720, ',3720,3721,', 2, '澳门半岛', NULL, NULL, NULL, NULL, 'false'),
(3722, 'mainland', 3720, ',3720,3722,', 2, '离岛', NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_return_product`
--

DROP TABLE IF EXISTS `sdb_return_product`;
CREATE TABLE IF NOT EXISTS `sdb_return_product` (
  `order_id` bigint(20) unsigned NOT NULL default '0',
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `return_id` bigint(20) unsigned NOT NULL auto_increment,
  `title` varchar(200) NOT NULL default '',
  `content` longtext,
  `status` enum('1','2','3','4','5') NOT NULL default '1',
  `image_file` varchar(255) NOT NULL default '',
  `product_data` longtext,
  `comment` longtext,
  `add_time` int(10) unsigned NOT NULL default '0',
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_return_product`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_sell_logs`
--

DROP TABLE IF EXISTS `sdb_sell_logs`;
CREATE TABLE IF NOT EXISTS `sdb_sell_logs` (
  `log_id` mediumint(8) NOT NULL auto_increment,
  `member_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(50) default '',
  `price` decimal(20,3) default '0.000',
  `product_id` mediumint(8) NOT NULL default '0',
  `goods_id` mediumint(8) unsigned NOT NULL default '0',
  `product_name` varchar(200) default '',
  `pdt_desc` varchar(200) default '',
  `number` mediumint(8) unsigned default '0',
  `createtime` int(10) unsigned default NULL,
  PRIMARY KEY  (`log_id`),
  KEY `idx_goods_id` (`member_id`,`product_id`,`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sdb_sell_logs`
--

INSERT INTO `sdb_sell_logs` (`log_id`, `member_id`, `name`, `price`, `product_id`, `goods_id`, `product_name`, `pdt_desc`, `number`, `createtime`) VALUES
(1, 1, 'demo', 99.000, 259, 75, '多彩人生多彩裤', '浅蓝色、XL', 1, 1236837075),
(2, 1, 'demo', 188.000, 250, 74, '花色高邦运动鞋', '深蓝色、38', 1, 1236837075);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_sendbox`
--

DROP TABLE IF EXISTS `sdb_sendbox`;
CREATE TABLE IF NOT EXISTS `sdb_sendbox` (
  `out_id` int(11) NOT NULL auto_increment,
  `tmpl_name` varchar(50) default NULL,
  `sender` varchar(50) NOT NULL default '',
  `creattime` int(10) unsigned NOT NULL default '0',
  `target` longtext,
  `sendcount` mediumint(8) unsigned default NULL,
  `content` varchar(200) default NULL,
  `subject` varchar(100) default NULL,
  PRIMARY KEY  (`out_id`),
  KEY `ind_sender` (`sender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_sendbox`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_seo`
--

DROP TABLE IF EXISTS `sdb_seo`;
CREATE TABLE IF NOT EXISTS `sdb_seo` (
  `seo_id` mediumint(8) unsigned NOT NULL auto_increment,
  `source_id` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `store_key` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`seo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=577 ;

--
-- 转存表中的数据 `sdb_seo`
--

INSERT INTO `sdb_seo` (`seo_id`, `source_id`, `type`, `store_key`, `value`) VALUES
(1, '75', '''goods''', 'keywords', ''),
(2, '75', '''goods''', 'descript', ''),
(3, '75', '''goods''', 'title', ''),
(4, '74', '''goods''', 'keywords', ''),
(5, '74', '''goods''', 'descript', ''),
(6, '74', '''goods''', 'title', ''),
(7, '73', '''goods''', 'keywords', ''),
(8, '73', '''goods''', 'descript', ''),
(9, '73', '''goods''', 'title', ''),
(10, '72', '''goods''', 'keywords', ''),
(11, '72', '''goods''', 'descript', ''),
(12, '72', '''goods''', 'title', ''),
(13, '71', '''goods''', 'keywords', ''),
(14, '71', '''goods''', 'descript', ''),
(15, '71', '''goods''', 'title', ''),
(16, '70', '''goods''', 'keywords', ''),
(17, '70', '''goods''', 'descript', ''),
(18, '70', '''goods''', 'title', ''),
(19, '69', '''goods''', 'keywords', ''),
(20, '69', '''goods''', 'descript', ''),
(21, '69', '''goods''', 'title', ''),
(22, '68', '''goods''', 'keywords', ''),
(23, '68', '''goods''', 'descript', ''),
(24, '68', '''goods''', 'title', ''),
(25, '67', '''goods''', 'keywords', ''),
(26, '67', '''goods''', 'descript', ''),
(27, '67', '''goods''', 'title', ''),
(28, '66', '''goods''', 'keywords', ''),
(29, '66', '''goods''', 'descript', ''),
(30, '66', '''goods''', 'title', ''),
(31, '65', '''goods''', 'keywords', ''),
(32, '65', '''goods''', 'descript', ''),
(33, '65', '''goods''', 'title', ''),
(34, '64', '''goods''', 'keywords', ''),
(35, '64', '''goods''', 'descript', ''),
(36, '64', '''goods''', 'title', ''),
(37, '63', '''goods''', 'keywords', ''),
(38, '63', '''goods''', 'descript', ''),
(39, '63', '''goods''', 'title', ''),
(40, '62', '''goods''', 'keywords', ''),
(41, '62', '''goods''', 'descript', ''),
(42, '62', '''goods''', 'title', ''),
(43, '61', '''goods''', 'keywords', ''),
(44, '61', '''goods''', 'descript', ''),
(45, '61', '''goods''', 'title', ''),
(46, '12', '''goods_cat''', 'keywords', ''),
(47, '12', '''goods_cat''', 'descript', ''),
(48, '12', '''goods_cat''', 'title', ''),
(49, '13', '''goods_cat''', 'keywords', ''),
(50, '13', '''goods_cat''', 'descript', ''),
(51, '13', '''goods_cat''', 'title', ''),
(52, '14', '''goods_cat''', 'keywords', ''),
(53, '14', '''goods_cat''', 'descript', ''),
(54, '14', '''goods_cat''', 'title', ''),
(55, '15', '''goods_cat''', 'keywords', ''),
(56, '15', '''goods_cat''', 'descript', ''),
(57, '15', '''goods_cat''', 'title', ''),
(58, '16', '''goods_cat''', 'keywords', ''),
(59, '16', '''goods_cat''', 'descript', ''),
(60, '16', '''goods_cat''', 'title', ''),
(61, '17', '''goods_cat''', 'keywords', ''),
(62, '17', '''goods_cat''', 'descript', ''),
(63, '17', '''goods_cat''', 'title', ''),
(64, '18', '''goods_cat''', 'keywords', ''),
(65, '18', '''goods_cat''', 'descript', ''),
(66, '18', '''goods_cat''', 'title', ''),
(67, '19', '''goods_cat''', 'keywords', ''),
(68, '19', '''goods_cat''', 'descript', ''),
(69, '19', '''goods_cat''', 'title', ''),
(70, '20', '''goods_cat''', 'keywords', ''),
(71, '20', '''goods_cat''', 'descript', ''),
(72, '20', '''goods_cat''', 'title', ''),
(73, '21', '''goods_cat''', 'keywords', ''),
(74, '21', '''goods_cat''', 'descript', ''),
(75, '21', '''goods_cat''', 'title', ''),
(76, '22', '''goods_cat''', 'keywords', ''),
(77, '22', '''goods_cat''', 'descript', ''),
(78, '22', '''goods_cat''', 'title', ''),
(79, '23', '''goods_cat''', 'keywords', ''),
(80, '23', '''goods_cat''', 'descript', ''),
(81, '23', '''goods_cat''', 'title', ''),
(82, '24', '''goods_cat''', 'keywords', ''),
(83, '24', '''goods_cat''', 'descript', ''),
(84, '24', '''goods_cat''', 'title', ''),
(85, '25', '''goods_cat''', 'keywords', ''),
(86, '25', '''goods_cat''', 'descript', ''),
(87, '25', '''goods_cat''', 'title', ''),
(88, '26', '''goods_cat''', 'keywords', ''),
(89, '26', '''goods_cat''', 'descript', ''),
(90, '26', '''goods_cat''', 'title', ''),
(91, '27', '''goods_cat''', 'keywords', ''),
(92, '27', '''goods_cat''', 'descript', ''),
(93, '27', '''goods_cat''', 'title', ''),
(94, '28', '''goods_cat''', 'keywords', ''),
(95, '28', '''goods_cat''', 'descript', ''),
(96, '28', '''goods_cat''', 'title', ''),
(97, '29', '''goods_cat''', 'keywords', ''),
(98, '29', '''goods_cat''', 'descript', ''),
(99, '29', '''goods_cat''', 'title', ''),
(100, '30', '''goods_cat''', 'keywords', ''),
(101, '30', '''goods_cat''', 'descript', ''),
(102, '30', '''goods_cat''', 'title', ''),
(103, '31', '''goods_cat''', 'keywords', ''),
(104, '31', '''goods_cat''', 'descript', ''),
(105, '31', '''goods_cat''', 'title', ''),
(106, '32', '''goods_cat''', 'keywords', ''),
(107, '32', '''goods_cat''', 'descript', ''),
(108, '32', '''goods_cat''', 'title', ''),
(109, '33', '''goods_cat''', 'keywords', ''),
(110, '33', '''goods_cat''', 'descript', ''),
(111, '33', '''goods_cat''', 'title', ''),
(112, '34', '''goods_cat''', 'keywords', ''),
(113, '34', '''goods_cat''', 'descript', ''),
(114, '34', '''goods_cat''', 'title', ''),
(115, '35', '''goods_cat''', 'keywords', ''),
(116, '35', '''goods_cat''', 'descript', ''),
(117, '35', '''goods_cat''', 'title', ''),
(118, '36', '''goods_cat''', 'keywords', ''),
(119, '36', '''goods_cat''', 'descript', ''),
(120, '36', '''goods_cat''', 'title', ''),
(121, '37', '''goods_cat''', 'keywords', ''),
(122, '37', '''goods_cat''', 'descript', ''),
(123, '37', '''goods_cat''', 'title', ''),
(124, '38', '''goods_cat''', 'keywords', ''),
(125, '38', '''goods_cat''', 'descript', ''),
(126, '38', '''goods_cat''', 'title', ''),
(127, '39', '''goods_cat''', 'keywords', ''),
(128, '39', '''goods_cat''', 'descript', ''),
(129, '39', '''goods_cat''', 'title', ''),
(130, '40', '''goods_cat''', 'keywords', ''),
(131, '40', '''goods_cat''', 'descript', ''),
(132, '40', '''goods_cat''', 'title', ''),
(133, '41', '''goods_cat''', 'keywords', ''),
(134, '41', '''goods_cat''', 'descript', ''),
(135, '41', '''goods_cat''', 'title', ''),
(136, '42', '''goods_cat''', 'keywords', ''),
(137, '42', '''goods_cat''', 'descript', ''),
(138, '42', '''goods_cat''', 'title', ''),
(139, '43', '''goods_cat''', 'keywords', ''),
(140, '43', '''goods_cat''', 'descript', ''),
(141, '43', '''goods_cat''', 'title', ''),
(142, '44', '''goods_cat''', 'keywords', ''),
(143, '44', '''goods_cat''', 'descript', ''),
(144, '44', '''goods_cat''', 'title', ''),
(145, '45', '''goods_cat''', 'keywords', ''),
(146, '45', '''goods_cat''', 'descript', ''),
(147, '45', '''goods_cat''', 'title', ''),
(148, '46', '''goods_cat''', 'keywords', ''),
(149, '46', '''goods_cat''', 'descript', ''),
(150, '46', '''goods_cat''', 'title', ''),
(151, '78', '''goods''', 'keywords', ''),
(152, '78', '''goods''', 'descript', ''),
(153, '78', '''goods''', 'title', ''),
(154, '79', '''goods''', 'keywords', ''),
(155, '79', '''goods''', 'descript', ''),
(156, '79', '''goods''', 'title', ''),
(157, '80', '''goods''', 'keywords', ''),
(158, '80', '''goods''', 'descript', ''),
(159, '80', '''goods''', 'title', ''),
(160, '81', '''goods''', 'keywords', ''),
(161, '81', '''goods''', 'descript', ''),
(162, '81', '''goods''', 'title', ''),
(163, '82', '''goods''', 'keywords', ''),
(164, '82', '''goods''', 'descript', ''),
(165, '82', '''goods''', 'title', ''),
(166, '82', '''goods''', 'keywords', ''),
(167, '82', '''goods''', 'descript', ''),
(168, '82', '''goods''', 'title', ''),
(169, '83', '''goods''', 'keywords', ''),
(170, '83', '''goods''', 'descript', ''),
(171, '83', '''goods''', 'title', ''),
(172, '83', '''goods''', 'keywords', ''),
(173, '83', '''goods''', 'descript', ''),
(174, '83', '''goods''', 'title', ''),
(175, '84', '''goods''', 'keywords', ''),
(176, '84', '''goods''', 'descript', ''),
(177, '84', '''goods''', 'title', ''),
(178, '85', '''goods''', 'keywords', ''),
(179, '85', '''goods''', 'descript', ''),
(180, '85', '''goods''', 'title', ''),
(181, '86', '''goods''', 'keywords', ''),
(182, '86', '''goods''', 'descript', ''),
(183, '86', '''goods''', 'title', ''),
(184, '87', '''goods''', 'keywords', ''),
(185, '87', '''goods''', 'descript', ''),
(186, '87', '''goods''', 'title', ''),
(187, '88', '''goods''', 'keywords', ''),
(188, '88', '''goods''', 'descript', ''),
(189, '88', '''goods''', 'title', ''),
(190, '89', '''goods''', 'keywords', ''),
(191, '89', '''goods''', 'descript', ''),
(192, '89', '''goods''', 'title', ''),
(193, '90', '''goods''', 'keywords', ''),
(194, '90', '''goods''', 'descript', ''),
(195, '90', '''goods''', 'title', ''),
(196, '91', '''goods''', 'keywords', ''),
(197, '91', '''goods''', 'descript', ''),
(198, '91', '''goods''', 'title', ''),
(199, '92', '''goods''', 'keywords', ''),
(200, '92', '''goods''', 'descript', ''),
(201, '92', '''goods''', 'title', ''),
(202, '81', '''goods''', 'keywords', ''),
(203, '81', '''goods''', 'descript', ''),
(204, '81', '''goods''', 'title', ''),
(205, '93', '''goods''', 'keywords', ''),
(206, '93', '''goods''', 'descript', ''),
(207, '93', '''goods''', 'title', ''),
(208, '94', '''goods''', 'keywords', ''),
(209, '94', '''goods''', 'descript', ''),
(210, '94', '''goods''', 'title', ''),
(211, '95', '''goods''', 'keywords', ''),
(212, '95', '''goods''', 'descript', ''),
(213, '95', '''goods''', 'title', ''),
(214, '96', '''goods''', 'keywords', ''),
(215, '96', '''goods''', 'descript', ''),
(216, '96', '''goods''', 'title', ''),
(217, '97', '''goods''', 'keywords', ''),
(218, '97', '''goods''', 'descript', ''),
(219, '97', '''goods''', 'title', ''),
(220, '98', '''goods''', 'keywords', ''),
(221, '98', '''goods''', 'descript', ''),
(222, '98', '''goods''', 'title', ''),
(223, '98', '''goods''', 'keywords', ''),
(224, '98', '''goods''', 'descript', ''),
(225, '98', '''goods''', 'title', ''),
(226, '27', '''goods_cat''', 'keywords', ''),
(227, '27', '''goods_cat''', 'descript', ''),
(228, '27', '''goods_cat''', 'title', ''),
(229, '99', '''goods''', 'keywords', ''),
(230, '99', '''goods''', 'descript', ''),
(231, '99', '''goods''', 'title', ''),
(232, '100', '''goods''', 'keywords', ''),
(233, '100', '''goods''', 'descript', ''),
(234, '100', '''goods''', 'title', ''),
(235, '100', '''goods''', 'keywords', ''),
(236, '100', '''goods''', 'descript', ''),
(237, '100', '''goods''', 'title', ''),
(238, '47', '''goods_cat''', 'keywords', ''),
(239, '47', '''goods_cat''', 'descript', ''),
(240, '47', '''goods_cat''', 'title', ''),
(241, '48', '''goods_cat''', 'keywords', ''),
(242, '48', '''goods_cat''', 'descript', ''),
(243, '48', '''goods_cat''', 'title', ''),
(244, '49', '''goods_cat''', 'keywords', ''),
(245, '49', '''goods_cat''', 'descript', ''),
(246, '49', '''goods_cat''', 'title', ''),
(247, '50', '''goods_cat''', 'keywords', ''),
(248, '50', '''goods_cat''', 'descript', ''),
(249, '50', '''goods_cat''', 'title', ''),
(250, '51', '''goods_cat''', 'keywords', ''),
(251, '51', '''goods_cat''', 'descript', ''),
(252, '51', '''goods_cat''', 'title', ''),
(253, '52', '''goods_cat''', 'keywords', ''),
(254, '52', '''goods_cat''', 'descript', ''),
(255, '52', '''goods_cat''', 'title', ''),
(256, '53', '''goods_cat''', 'keywords', ''),
(257, '53', '''goods_cat''', 'descript', ''),
(258, '53', '''goods_cat''', 'title', ''),
(259, '54', '''goods_cat''', 'keywords', ''),
(260, '54', '''goods_cat''', 'descript', ''),
(261, '54', '''goods_cat''', 'title', ''),
(262, '55', '''goods_cat''', 'keywords', ''),
(263, '55', '''goods_cat''', 'descript', ''),
(264, '55', '''goods_cat''', 'title', ''),
(265, '56', '''goods_cat''', 'keywords', ''),
(266, '56', '''goods_cat''', 'descript', ''),
(267, '56', '''goods_cat''', 'title', ''),
(268, '57', '''goods_cat''', 'keywords', ''),
(269, '57', '''goods_cat''', 'descript', ''),
(270, '57', '''goods_cat''', 'title', ''),
(271, '101', '''goods''', 'keywords', ''),
(272, '101', '''goods''', 'descript', ''),
(273, '101', '''goods''', 'title', ''),
(274, '102', '''goods''', 'keywords', ''),
(275, '102', '''goods''', 'descript', ''),
(276, '102', '''goods''', 'title', ''),
(277, '42', '''goods_cat''', 'keywords', ''),
(278, '42', '''goods_cat''', 'descript', ''),
(279, '42', '''goods_cat''', 'title', ''),
(280, '41', '''goods_cat''', 'keywords', ''),
(281, '41', '''goods_cat''', 'descript', ''),
(282, '41', '''goods_cat''', 'title', ''),
(283, '23', '''goods_cat''', 'keywords', ''),
(284, '23', '''goods_cat''', 'descript', ''),
(285, '23', '''goods_cat''', 'title', ''),
(286, '24', '''goods_cat''', 'keywords', ''),
(287, '24', '''goods_cat''', 'descript', ''),
(288, '24', '''goods_cat''', 'title', ''),
(289, '29', '''goods_cat''', 'keywords', ''),
(290, '29', '''goods_cat''', 'descript', ''),
(291, '29', '''goods_cat''', 'title', ''),
(292, '30', '''goods_cat''', 'keywords', ''),
(293, '30', '''goods_cat''', 'descript', ''),
(294, '30', '''goods_cat''', 'title', ''),
(295, '31', '''goods_cat''', 'keywords', ''),
(296, '31', '''goods_cat''', 'descript', ''),
(297, '31', '''goods_cat''', 'title', ''),
(298, '32', '''goods_cat''', 'keywords', ''),
(299, '32', '''goods_cat''', 'descript', ''),
(300, '32', '''goods_cat''', 'title', ''),
(301, '25', '''goods_cat''', 'keywords', ''),
(302, '25', '''goods_cat''', 'descript', ''),
(303, '25', '''goods_cat''', 'title', ''),
(304, '33', '''goods_cat''', 'keywords', ''),
(305, '33', '''goods_cat''', 'descript', ''),
(306, '33', '''goods_cat''', 'title', ''),
(307, '58', '''goods_cat''', 'keywords', ''),
(308, '58', '''goods_cat''', 'descript', ''),
(309, '58', '''goods_cat''', 'title', ''),
(310, '34', '''goods_cat''', 'keywords', ''),
(311, '34', '''goods_cat''', 'descript', ''),
(312, '34', '''goods_cat''', 'title', ''),
(313, '59', '''goods_cat''', 'keywords', ''),
(314, '59', '''goods_cat''', 'descript', ''),
(315, '59', '''goods_cat''', 'title', ''),
(316, '35', '''goods_cat''', 'keywords', ''),
(317, '35', '''goods_cat''', 'descript', ''),
(318, '35', '''goods_cat''', 'title', ''),
(319, '26', '''goods_cat''', 'keywords', ''),
(320, '26', '''goods_cat''', 'descript', ''),
(321, '26', '''goods_cat''', 'title', ''),
(322, '36', '''goods_cat''', 'keywords', ''),
(323, '36', '''goods_cat''', 'descript', ''),
(324, '36', '''goods_cat''', 'title', ''),
(325, '37', '''goods_cat''', 'keywords', ''),
(326, '37', '''goods_cat''', 'descript', ''),
(327, '37', '''goods_cat''', 'title', ''),
(328, '38', '''goods_cat''', 'keywords', ''),
(329, '38', '''goods_cat''', 'descript', ''),
(330, '38', '''goods_cat''', 'title', ''),
(331, '39', '''goods_cat''', 'keywords', ''),
(332, '39', '''goods_cat''', 'descript', ''),
(333, '39', '''goods_cat''', 'title', ''),
(334, '40', '''goods_cat''', 'keywords', ''),
(335, '40', '''goods_cat''', 'descript', ''),
(336, '40', '''goods_cat''', 'title', ''),
(337, '27', '''goods_cat''', 'keywords', ''),
(338, '27', '''goods_cat''', 'descript', ''),
(339, '27', '''goods_cat''', 'title', ''),
(340, '103', '''goods''', 'keywords', ''),
(341, '103', '''goods''', 'descript', ''),
(342, '103', '''goods''', 'title', ''),
(343, '104', '''goods''', 'keywords', ''),
(344, '104', '''goods''', 'descript', ''),
(345, '104', '''goods''', 'title', ''),
(346, '105', '''goods''', 'keywords', ''),
(347, '105', '''goods''', 'descript', ''),
(348, '105', '''goods''', 'title', ''),
(349, '106', '''goods''', 'keywords', ''),
(350, '106', '''goods''', 'descript', ''),
(351, '106', '''goods''', 'title', ''),
(352, '107', '''goods''', 'keywords', ''),
(353, '107', '''goods''', 'descript', ''),
(354, '107', '''goods''', 'title', ''),
(355, '18', '''brand''', 'keywords', ''),
(356, '18', '''brand''', 'descript', ''),
(357, '18', '''brand''', 'title', ''),
(358, '19', '''brand''', 'keywords', ''),
(359, '19', '''brand''', 'descript', ''),
(360, '19', '''brand''', 'title', ''),
(361, '78', '''goods''', 'keywords', ''),
(362, '78', '''goods''', 'descript', ''),
(363, '78', '''goods''', 'title', ''),
(364, '79', '''goods''', 'keywords', ''),
(365, '79', '''goods''', 'descript', ''),
(366, '79', '''goods''', 'title', ''),
(367, '79', '''goods''', 'keywords', ''),
(368, '79', '''goods''', 'descript', ''),
(369, '79', '''goods''', 'title', ''),
(370, '20', '''brand''', 'keywords', ''),
(371, '20', '''brand''', 'descript', ''),
(372, '20', '''brand''', 'title', ''),
(373, '80', '''goods''', 'keywords', ''),
(374, '80', '''goods''', 'descript', ''),
(375, '80', '''goods''', 'title', ''),
(376, '19', '''brand''', 'keywords', ''),
(377, '19', '''brand''', 'descript', ''),
(378, '19', '''brand''', 'title', ''),
(379, '21', '''brand''', 'keywords', ''),
(380, '21', '''brand''', 'descript', ''),
(381, '21', '''brand''', 'title', ''),
(382, '85', '''goods''', 'keywords', ''),
(383, '85', '''goods''', 'descript', ''),
(384, '85', '''goods''', 'title', ''),
(385, '22', '''brand''', 'keywords', ''),
(386, '22', '''brand''', 'descript', ''),
(387, '22', '''brand''', 'title', ''),
(388, '90', '''goods''', 'keywords', ''),
(389, '90', '''goods''', 'descript', ''),
(390, '90', '''goods''', 'title', ''),
(391, '23', '''brand''', 'keywords', ''),
(392, '23', '''brand''', 'descript', ''),
(393, '23', '''brand''', 'title', ''),
(394, '91', '''goods''', 'keywords', ''),
(395, '91', '''goods''', 'descript', ''),
(396, '91', '''goods''', 'title', ''),
(397, '24', '''brand''', 'keywords', ''),
(398, '24', '''brand''', 'descript', ''),
(399, '24', '''brand''', 'title', ''),
(400, '101', '''goods''', 'keywords', ''),
(401, '101', '''goods''', 'descript', ''),
(402, '101', '''goods''', 'title', ''),
(403, '105', '''goods''', 'keywords', ''),
(404, '105', '''goods''', 'descript', ''),
(405, '105', '''goods''', 'title', ''),
(406, '25', '''brand''', 'keywords', ''),
(407, '25', '''brand''', 'descript', ''),
(408, '25', '''brand''', 'title', ''),
(409, '106', '''goods''', 'keywords', ''),
(410, '106', '''goods''', 'descript', ''),
(411, '106', '''goods''', 'title', ''),
(412, '60', '''goods_cat''', 'keywords', ''),
(413, '60', '''goods_cat''', 'descript', ''),
(414, '60', '''goods_cat''', 'title', ''),
(415, '61', '''goods_cat''', 'keywords', ''),
(416, '61', '''goods_cat''', 'descript', ''),
(417, '61', '''goods_cat''', 'title', ''),
(418, '62', '''goods_cat''', 'keywords', ''),
(419, '62', '''goods_cat''', 'descript', ''),
(420, '62', '''goods_cat''', 'title', ''),
(421, '63', '''goods_cat''', 'keywords', ''),
(422, '63', '''goods_cat''', 'descript', ''),
(423, '63', '''goods_cat''', 'title', ''),
(424, '64', '''goods_cat''', 'keywords', ''),
(425, '64', '''goods_cat''', 'descript', ''),
(426, '64', '''goods_cat''', 'title', ''),
(427, '65', '''goods_cat''', 'keywords', ''),
(428, '65', '''goods_cat''', 'descript', ''),
(429, '65', '''goods_cat''', 'title', ''),
(430, '66', '''goods_cat''', 'keywords', ''),
(431, '66', '''goods_cat''', 'descript', ''),
(432, '66', '''goods_cat''', 'title', ''),
(433, '67', '''goods_cat''', 'keywords', ''),
(434, '67', '''goods_cat''', 'descript', ''),
(435, '67', '''goods_cat''', 'title', ''),
(436, '68', '''goods_cat''', 'keywords', ''),
(437, '68', '''goods_cat''', 'descript', ''),
(438, '68', '''goods_cat''', 'title', ''),
(439, '69', '''goods_cat''', 'keywords', ''),
(440, '69', '''goods_cat''', 'descript', ''),
(441, '69', '''goods_cat''', 'title', ''),
(442, '70', '''goods_cat''', 'keywords', ''),
(443, '70', '''goods_cat''', 'descript', ''),
(444, '70', '''goods_cat''', 'title', ''),
(445, '71', '''goods_cat''', 'keywords', ''),
(446, '71', '''goods_cat''', 'descript', ''),
(447, '71', '''goods_cat''', 'title', ''),
(448, '72', '''goods_cat''', 'keywords', ''),
(449, '72', '''goods_cat''', 'descript', ''),
(450, '72', '''goods_cat''', 'title', ''),
(451, '73', '''goods_cat''', 'keywords', ''),
(452, '73', '''goods_cat''', 'descript', ''),
(453, '73', '''goods_cat''', 'title', ''),
(454, '74', '''goods_cat''', 'keywords', ''),
(455, '74', '''goods_cat''', 'descript', ''),
(456, '74', '''goods_cat''', 'title', ''),
(457, '75', '''goods_cat''', 'keywords', ''),
(458, '75', '''goods_cat''', 'descript', ''),
(459, '75', '''goods_cat''', 'title', ''),
(460, '76', '''goods_cat''', 'keywords', ''),
(461, '76', '''goods_cat''', 'descript', ''),
(462, '76', '''goods_cat''', 'title', ''),
(463, '77', '''goods_cat''', 'keywords', ''),
(464, '77', '''goods_cat''', 'descript', ''),
(465, '77', '''goods_cat''', 'title', ''),
(466, '78', '''goods_cat''', 'keywords', ''),
(467, '78', '''goods_cat''', 'descript', ''),
(468, '78', '''goods_cat''', 'title', ''),
(469, '79', '''goods_cat''', 'keywords', ''),
(470, '79', '''goods_cat''', 'descript', ''),
(471, '79', '''goods_cat''', 'title', ''),
(472, '80', '''goods_cat''', 'keywords', ''),
(473, '80', '''goods_cat''', 'descript', ''),
(474, '80', '''goods_cat''', 'title', ''),
(475, '81', '''goods_cat''', 'keywords', ''),
(476, '81', '''goods_cat''', 'descript', ''),
(477, '81', '''goods_cat''', 'title', ''),
(478, '82', '''goods_cat''', 'keywords', ''),
(479, '82', '''goods_cat''', 'descript', ''),
(480, '82', '''goods_cat''', 'title', ''),
(481, '83', '''goods_cat''', 'keywords', ''),
(482, '83', '''goods_cat''', 'descript', ''),
(483, '83', '''goods_cat''', 'title', ''),
(484, '84', '''goods_cat''', 'keywords', ''),
(485, '84', '''goods_cat''', 'descript', ''),
(486, '84', '''goods_cat''', 'title', ''),
(487, '85', '''goods_cat''', 'keywords', ''),
(488, '85', '''goods_cat''', 'descript', ''),
(489, '85', '''goods_cat''', 'title', ''),
(490, '86', '''goods_cat''', 'keywords', ''),
(491, '86', '''goods_cat''', 'descript', ''),
(492, '86', '''goods_cat''', 'title', ''),
(493, '87', '''goods_cat''', 'keywords', ''),
(494, '87', '''goods_cat''', 'descript', ''),
(495, '87', '''goods_cat''', 'title', ''),
(496, '88', '''goods_cat''', 'keywords', ''),
(497, '88', '''goods_cat''', 'descript', ''),
(498, '88', '''goods_cat''', 'title', ''),
(499, '89', '''goods_cat''', 'keywords', ''),
(500, '89', '''goods_cat''', 'descript', ''),
(501, '89', '''goods_cat''', 'title', ''),
(502, '90', '''goods_cat''', 'keywords', ''),
(503, '90', '''goods_cat''', 'descript', ''),
(504, '90', '''goods_cat''', 'title', ''),
(505, '91', '''goods_cat''', 'keywords', ''),
(506, '91', '''goods_cat''', 'descript', ''),
(507, '91', '''goods_cat''', 'title', ''),
(508, '92', '''goods_cat''', 'keywords', ''),
(509, '92', '''goods_cat''', 'descript', ''),
(510, '92', '''goods_cat''', 'title', ''),
(511, '93', '''goods_cat''', 'keywords', ''),
(512, '93', '''goods_cat''', 'descript', ''),
(513, '93', '''goods_cat''', 'title', ''),
(514, '94', '''goods_cat''', 'keywords', ''),
(515, '94', '''goods_cat''', 'descript', ''),
(516, '94', '''goods_cat''', 'title', ''),
(517, '95', '''goods_cat''', 'keywords', ''),
(518, '95', '''goods_cat''', 'descript', ''),
(519, '95', '''goods_cat''', 'title', ''),
(520, '96', '''goods_cat''', 'keywords', ''),
(521, '96', '''goods_cat''', 'descript', ''),
(522, '96', '''goods_cat''', 'title', ''),
(523, '97', '''goods_cat''', 'keywords', ''),
(524, '97', '''goods_cat''', 'descript', ''),
(525, '97', '''goods_cat''', 'title', ''),
(526, '108', '''goods''', 'keywords', ''),
(527, '108', '''goods''', 'descript', ''),
(528, '108', '''goods''', 'title', ''),
(529, '109', '''goods''', 'keywords', ''),
(530, '109', '''goods''', 'descript', ''),
(531, '109', '''goods''', 'title', ''),
(532, '110', '''goods''', 'keywords', ''),
(533, '110', '''goods''', 'descript', ''),
(534, '110', '''goods''', 'title', ''),
(535, '111', '''goods''', 'keywords', ''),
(536, '111', '''goods''', 'descript', ''),
(537, '111', '''goods''', 'title', ''),
(538, '110', '''goods''', 'keywords', ''),
(539, '110', '''goods''', 'descript', ''),
(540, '110', '''goods''', 'title', ''),
(541, '112', '''goods''', 'keywords', ''),
(542, '112', '''goods''', 'descript', ''),
(543, '112', '''goods''', 'title', ''),
(544, '26', '''brand''', 'keywords', ''),
(545, '26', '''brand''', 'descript', ''),
(546, '26', '''brand''', 'title', ''),
(547, '27', '''brand''', 'keywords', ''),
(548, '27', '''brand''', 'descript', ''),
(549, '27', '''brand''', 'title', ''),
(550, '28', '''brand''', 'keywords', ''),
(551, '28', '''brand''', 'descript', ''),
(552, '28', '''brand''', 'title', ''),
(553, '109', '''goods''', 'keywords', ''),
(554, '109', '''goods''', 'descript', ''),
(555, '109', '''goods''', 'title', ''),
(556, '108', '''goods''', 'keywords', ''),
(557, '108', '''goods''', 'descript', ''),
(558, '108', '''goods''', 'title', ''),
(559, '28', '''brand''', 'keywords', ''),
(560, '28', '''brand''', 'descript', ''),
(561, '28', '''brand''', 'title', ''),
(562, '110', '''goods''', 'keywords', ''),
(563, '110', '''goods''', 'descript', ''),
(564, '110', '''goods''', 'title', ''),
(565, '29', '''brand''', 'keywords', ''),
(566, '29', '''brand''', 'descript', ''),
(567, '29', '''brand''', 'title', ''),
(568, '112', '''goods''', 'keywords', ''),
(569, '112', '''goods''', 'descript', ''),
(570, '112', '''goods''', 'title', ''),
(571, '112', '''goods''', 'keywords', ''),
(572, '112', '''goods''', 'descript', ''),
(573, '112', '''goods''', 'title', ''),
(574, '101', '''goods''', 'keywords', ''),
(575, '101', '''goods''', 'descript', ''),
(576, '101', '''goods''', 'title', '');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_settings`
--

DROP TABLE IF EXISTS `sdb_settings`;
CREATE TABLE IF NOT EXISTS `sdb_settings` (
  `s_name` varchar(16) NOT NULL default '',
  `s_data` longtext,
  `s_time` int(10) unsigned NOT NULL default '0',
  `disabled` enum('true','false') default 'false',
  PRIMARY KEY  (`s_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_settings`
--

INSERT INTO `sdb_settings` (`s_name`, `s_data`, `s_time`, `disabled`) VALUES
('site', 'a:30:{s:8:"certtext";s:0:"";s:9:"tax_ratio";i:0;s:19:"reading_glass_width";s:3:"430";s:20:"reading_glass_height";s:3:"600";s:13:"reading_glass";i:0;s:19:"thumbnail_pic_width";s:3:"220";s:20:"thumbnail_pic_height";s:3:"220";s:13:"big_pic_width";s:3:"600";s:14:"big_pic_height";s:3:"600";s:15:"small_pic_width";s:3:"380";s:16:"small_pic_height";s:3:"380";s:25:"watermark.wm_small_enable";s:1:"0";s:23:"watermark.wm_big_enable";s:1:"0";s:11:"trigger_tax";b:1;s:13:"delivery_time";s:1:"2";s:7:"rsc_rpc";s:5:"false";s:15:"register_valide";s:4:"true";s:12:"login_valide";s:4:"true";s:12:"show_storage";s:5:"false";s:15:"show_mark_price";s:4:"true";s:11:"market_rate";s:3:"1.2";s:10:"buy.target";s:1:"3";s:13:"decimal_digit";s:1:"2";s:12:"decimal_type";s:1:"0";s:12:"level_switch";s:1:"0";s:10:"login_type";s:6:"dialog";s:12:"market_price";s:1:"1";s:10:"save_price";s:1:"1";s:27:"retail_member_price_display";s:1:"0";s:30:"wholesale_member_price_display";s:1:"0";}', 1392089082, 'false'),
('system', 'a:30:{s:9:"foot_edit";s:5:"<br/>";s:14:"event_listener";N;s:16:"output_modifiers";a:3:{s:19:"admin:default:index";a:1:{s:39:"commodity_radar:default_modifiers:index";s:39:"commodity_radar:default_modifiers:index";}s:25:"admin:goods/product:index";a:1:{s:46:"commodity_radar:default_modifiers:product_list";s:46:"commodity_radar:default_modifiers:product_list";}s:6:"shop:*";a:1:{s:28:"shopex_stat:modifiers:modify";s:28:"shopex_stat:modifiers:modify";}}s:16:"timezone.default";s:1:"8";s:11:"last_backup";i:1391849155;s:16:"ui.current_theme";s:7:"huancai";s:8:"location";s:8:"mainland";s:4:"sess";s:21:"0.01489500 1391849204";s:23:"admin_error_login_times";i:0;s:20:"custom_template_cart";s:9:"cart.html";s:23:"custom_template_default";s:12:"default.html";s:23:"custom_template_gallery";s:12:"gallery.html";s:20:"custom_template_gift";s:9:"gift.html";s:21:"custom_template_index";s:10:"index.html";s:22:"custom_template_member";s:11:"member.html";s:28:"custom_template_order_detail";s:17:"order_detail.html";s:27:"custom_template_order_index";s:16:"order_index.html";s:20:"custom_template_page";s:9:"page.html";s:24:"custom_template_passport";s:13:"passport.html";s:5:"guide";s:4:"true";s:22:"admin_error_login_time";i:1391911722;s:17:"watermark.lastcfg";i:1392089074;s:13:"crontab_queue";s:82:"a:1:{s:30:"trading/order:run_system_queue";s:30:"trading/order:run_system_queue";}";s:13:"goods.fastbuy";s:4:"true";s:16:"order_canceltime";s:2:"72";s:24:"money.operation.decimals";s:1:"2";s:24:"money.operation.carryset";s:1:"0";s:18:"category.showgoods";s:1:"0";s:23:"custom_template_product";s:12:"product.html";s:23:"custom_template_article";s:14:"article-1.html";}', 1392692826, 'false'),
('security', 'a:1:{s:13:"guest.enabled";b:1;}', 1392012511, 'false'),
('goodsprop', 'a:2:{s:14:"display.switch";b:1;s:16:"display.position";s:1:"1";}', 1392012511, 'false'),
('set', 'a:1:{s:8:"app.list";s:90:"a:2:{s:15:"commodity_radar";s:15:"commodity_radar";s:11:"shopex_stat";s:11:"shopex_stat";}";}', 1391849155, 'false'),
('enterprise', 'a:3:{s:6:"ent_id";s:13:"8813111137432";s:9:"ent_email";s:17:"xd1412@upin99.com";s:11:"oauth_token";s:24:"C0DKL3X0UYCJCDJC22SB13BF";}', 1391849205, 'false'),
('certificate', '', 1392692831, 'false'),
('selllog', 'a:3:{s:14:"display.switch";b:0;s:13:"display.limit";s:1:"3";s:15:"display.listnum";s:2:"10";}', 1392012511, 'false'),
('goodsbn', 'a:1:{s:14:"display.switch";b:1;}', 1392012511, 'false'),
('storeplace', 'a:1:{s:14:"display.switch";b:1;}', 1392012511, 'false'),
('gallery', 'a:3:{s:15:"display.listnum";s:2:"20";s:19:"display.grid.colnum";s:1:"4";s:12:"default_view";s:4:"grid";}', 1392012511, 'false'),
('spec', 'a:2:{s:11:"image.width";s:2:"30";s:12:"image.height";s:2:"30";}', 1392089082, 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_sfiles`
--

DROP TABLE IF EXISTS `sdb_sfiles`;
CREATE TABLE IF NOT EXISTS `sdb_sfiles` (
  `file_id` varchar(32) NOT NULL default '',
  `file_name` varchar(32) NOT NULL default '',
  `usedby` varchar(32) default NULL,
  `file_type` varchar(32) default NULL,
  `file_size` int(9) NOT NULL default '0',
  `cdate` int(10) unsigned NOT NULL default '0',
  `misc` varchar(255) default NULL,
  PRIMARY KEY  (`file_id`),
  KEY `ind_usedby` (`usedby`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_sfiles`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_sitemaps`
--

DROP TABLE IF EXISTS `sdb_sitemaps`;
CREATE TABLE IF NOT EXISTS `sdb_sitemaps` (
  `node_id` mediumint(8) unsigned NOT NULL auto_increment,
  `p_node_id` mediumint(8) unsigned NOT NULL default '0',
  `node_type` varchar(30) NOT NULL default '',
  `depth` tinyint(3) unsigned NOT NULL default '0',
  `path` varchar(200) default NULL,
  `title` varchar(100) NOT NULL default '',
  `action` varchar(255) NOT NULL default '',
  `manual` enum('0','1') NOT NULL default '1',
  `item_id` mediumint(8) unsigned default NULL,
  `p_order` mediumint(8) unsigned default NULL,
  `hidden` enum('true','false') NOT NULL default 'false',
  `child_count` mediumint(4) default NULL,
  PRIMARY KEY  (`node_id`),
  KEY `ind_hidden` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- 转存表中的数据 `sdb_sitemaps`
--

INSERT INTO `sdb_sitemaps` (`node_id`, `p_node_id`, `node_type`, `depth`, `path`, `title`, `action`, `manual`, `item_id`, `p_order`, `hidden`, `child_count`) VALUES
(1, 0, 'action', 0, NULL, '品牌专区', 'brand:showList', '0', NULL, 1, 'false', 0),
(2, 0, 'action', 0, NULL, '兑换赠品', 'gift:showList', '0', NULL, 1, 'false', 0),
(3, 0, 'action', 0, NULL, '捆绑促销', 'package:index', '0', NULL, 2, 'false', 0),
(4, 0, 'action', 0, NULL, '会员中心', 'member:index', '0', NULL, 3, 'false', 0),
(5, 0, 'action', 0, NULL, '购物车', 'cart:index', '0', NULL, 4, 'true', 0),
(6, 0, 'action', 0, NULL, '客户留言', 'message:index', '0', NULL, 5, 'false', 0),
(7, 0, 'action', 0, NULL, '友情链接', 'link:showList', '0', NULL, 6, 'false', 0),
(68, 0, 'page', 0, NULL, '帮助中心', 'page:helpcenter', '0', NULL, 7, 'false', 4),
(69, 68, 'page', 1, '68,', '新手上路', 'page:newguide', '0', NULL, 0, 'false', 5),
(70, 69, 'page', 2, '68,69,', '顾客必读', 'page:notice', '0', NULL, 0, 'false', 0),
(71, 69, 'page', 2, '68,69,', '会员等级折扣', 'page:memberrank', '0', NULL, 1, 'false', 0),
(72, 69, 'page', 2, '68,69,', '订单的几种状态', 'page:orderstatus', '0', NULL, 2, 'false', 0),
(73, 69, 'page', 2, '68,69,', '积分奖励计划', 'page:scoreplan', '0', NULL, 3, 'false', 0),
(74, 69, 'page', 2, '68,69,', '商品退货保障', 'page:returngood', '0', NULL, 4, 'false', 0),
(75, 68, 'page', 1, '68,', '购物指南', 'page:shoppingguide', '0', NULL, 1, 'false', 5),
(76, 75, 'page', 2, '68,75,', '非会员购物通道', 'page:nonmember', '0', NULL, 0, 'false', 0),
(77, 75, 'page', 2, '68,75,', '体贴的售后服务', 'page:service', '0', NULL, 1, 'false', 0),
(78, 75, 'page', 2, '68,75,', '网站使用条款', 'page:terms', '0', NULL, 2, 'false', 0),
(79, 75, 'page', 2, '68,75,', '网站免责声明', 'page:disclaimer', '0', NULL, 3, 'false', 0),
(80, 75, 'page', 2, '68,75,', '简单的购物流程', 'page:process', '0', NULL, 4, 'false', 0),
(81, 68, 'page', 1, '68,', '支付/配送方式', 'page:method', '0', NULL, 2, 'false', 5),
(82, 81, 'page', 2, '68,81,', '支付方式', 'page:payment', '0', NULL, 0, 'false', 0),
(83, 81, 'page', 2, '68,81,', '配送方式', 'page:shipping', '0', NULL, 1, 'false', 0),
(84, 81, 'page', 2, '68,81,', '订单何时出库？', 'page:orderinfo', '0', NULL, 2, 'false', 0),
(85, 81, 'page', 2, '68,81,', '网上支付小贴士', 'page:onlinepayment', '0', NULL, 3, 'false', 0),
(86, 81, 'page', 2, '68,81,', '关于送货和验货', 'page:shippinginfo', '0', NULL, 4, 'false', 0),
(87, 68, 'page', 1, '68,', '购物条款', 'page:shoppingrule', '0', NULL, 3, 'false', 2),
(88, 87, 'page', 2, '68,87,', '会员注册协议', 'page:license', '0', NULL, 0, 'false', 0),
(89, 87, 'page', 2, '68,87,', '隐私保护政策', 'page:privacy', '0', NULL, 1, 'false', 0),
(90, 0, 'page', 0, NULL, '公司简介', 'page:cominfo', '0', NULL, 8, 'true', 7),
(91, 90, 'page', 1, '90,', '关于我们', 'page:about', '0', NULL, 0, 'false', 0),
(92, 90, 'page', 1, '90,', '联系我们', 'page:contact', '0', NULL, 1, 'false', 0),
(93, 90, 'page', 1, '90,', '招聘信息', 'page:jobs', '0', NULL, 2, 'false', 0),
(100, 90, 'articles', 1, '90,', '最新公告', 'artlist:index', '0', 100, 3, 'false', 0),
(101, 90, 'articles', 1, '90,', '促销信息', 'artlist:index', '0', 101, 4, 'false', 0),
(102, 90, 'page', 1, '90,', '业务合作', 'page:business', '0', NULL, 5, 'false', 0),
(103, 90, 'action', 1, '90,', '站点地图', 'sitemaps:view', '0', NULL, 6, 'false', 0),
(112, 0, 'pageurl', 0, NULL, '首页', '?', '1', 0, 0, 'false', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_specification`
--

DROP TABLE IF EXISTS `sdb_specification`;
CREATE TABLE IF NOT EXISTS `sdb_specification` (
  `spec_id` mediumint(8) unsigned NOT NULL auto_increment,
  `spec_name` varchar(50) NOT NULL default '',
  `alias` varchar(255) default '',
  `spec_show_type` enum('select','flat') NOT NULL default 'flat',
  `spec_type` enum('text','image') NOT NULL default 'text',
  `spec_memo` varchar(50) NOT NULL default '',
  `p_order` mediumint(8) unsigned NOT NULL default '0',
  `disabled` enum('true','false') NOT NULL default 'false',
  `supplier_spec_id` mediumint(8) unsigned default NULL,
  `supplier_id` int(10) unsigned default NULL,
  `lastmodify` int(10) unsigned default NULL,
  PRIMARY KEY  (`spec_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `sdb_specification`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_spec_values`
--

DROP TABLE IF EXISTS `sdb_spec_values`;
CREATE TABLE IF NOT EXISTS `sdb_spec_values` (
  `spec_value_id` mediumint(8) unsigned NOT NULL auto_increment,
  `spec_id` mediumint(8) unsigned NOT NULL default '0',
  `spec_value` varchar(100) NOT NULL default '',
  `alias` varchar(255) default '',
  `spec_image` varchar(255) NOT NULL default '',
  `p_order` mediumint(8) unsigned NOT NULL default '50',
  `supplier_id` int(10) unsigned default NULL,
  `supplier_spec_value_id` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`spec_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- 转存表中的数据 `sdb_spec_values`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_status`
--

DROP TABLE IF EXISTS `sdb_status`;
CREATE TABLE IF NOT EXISTS `sdb_status` (
  `status_key` varchar(20) NOT NULL default '',
  `date_affect` date NOT NULL default '0000-00-00',
  `status_value` varchar(100) NOT NULL default '0',
  `last_update` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`status_key`,`date_affect`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_status`
--

INSERT INTO `sdb_status` (`status_key`, `date_affect`, `status_value`, `last_update`) VALUES
('CSM_LAST_PUSH', '0000-00-00', '1392692827', 1392692828),
('GOODS_ADD', '2014-02-14', '30', 1392347453),
('GOODS_ONLINE', '0000-00-00', '35', 1392692826),
('GOODS_HIDDEN', '0000-00-00', '0', 1392692826),
('GALERT', '0000-00-00', '0', 1392692826),
('GNOTIFY', '0000-00-00', '0', 1392692826),
('GDISCUSS', '0000-00-00', '0', 1392692826),
('GASK', '0000-00-00', '0', 1392692826),
('MESSAGES', '0000-00-00', '0', 1392692826),
('ORDER_NEW', '0000-00-00', '0', 1392692826),
('ORDER_TO_PAY', '0000-00-00', '0', 1392692826),
('ORDER_TO_DLY', '0000-00-00', '0', 1392692826),
('GOODS_ADD', '2014-02-17', '5', 1392604428);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_supplier`
--

DROP TABLE IF EXISTS `sdb_supplier`;
CREATE TABLE IF NOT EXISTS `sdb_supplier` (
  `sp_id` mediumint(8) unsigned NOT NULL auto_increment,
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `supplier_brief_name` varchar(30) default NULL,
  `status` tinyint(4) NOT NULL default '1',
  `supplier_pline` longtext,
  `sync_time` int(10) unsigned NOT NULL default '0',
  `domain` varchar(255) NOT NULL,
  `has_new` enum('true','false') NOT NULL default 'true',
  `has_cost_new` enum('true','false') NOT NULL default 'false',
  `sync_time_for_plat` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sp_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_supplier`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_supplier_pdtbn`
--

DROP TABLE IF EXISTS `sdb_supplier_pdtbn`;
CREATE TABLE IF NOT EXISTS `sdb_supplier_pdtbn` (
  `sp_id` mediumint(8) unsigned NOT NULL auto_increment,
  `local_bn` varchar(200) NOT NULL,
  `source_bn` varchar(200) NOT NULL,
  `default` enum('true','false') NOT NULL default 'true',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sp_id`,`local_bn`),
  KEY `sp_srcbn` (`source_bn`,`supplier_id`),
  KEY `sp_source_bn` (`source_bn`),
  KEY `sp_local_bn` (`local_bn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_supplier_pdtbn`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_sync_tmp`
--

DROP TABLE IF EXISTS `sdb_sync_tmp`;
CREATE TABLE IF NOT EXISTS `sdb_sync_tmp` (
  `tmp_id` int(10) unsigned NOT NULL auto_increment,
  `s_type` enum('goods_type','spec','brand','goods_cat') NOT NULL default 'goods_type',
  `ob_id` mediumint(8) unsigned NOT NULL default '0',
  `supplier_id` int(10) unsigned NOT NULL default '0',
  `s_data` longtext,
  PRIMARY KEY  (`tmp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `sdb_sync_tmp`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_systmpl`
--

DROP TABLE IF EXISTS `sdb_systmpl`;
CREATE TABLE IF NOT EXISTS `sdb_systmpl` (
  `tmpl_name` varchar(50) NOT NULL default '',
  `content` longtext,
  `edittime` int(10) unsigned NOT NULL default '0',
  `active` enum('true','false') NOT NULL default 'true',
  PRIMARY KEY  (`tmpl_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_systmpl`
--


-- --------------------------------------------------------

--
-- 表的结构 `sdb_tags`
--

DROP TABLE IF EXISTS `sdb_tags`;
CREATE TABLE IF NOT EXISTS `sdb_tags` (
  `tag_id` mediumint(8) unsigned NOT NULL auto_increment,
  `tag_name` varchar(20) NOT NULL default '',
  `is_system` enum('true','false') NOT NULL default 'false',
  `tag_type` varchar(20) NOT NULL default '',
  `rel_count` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`),
  KEY `ind_type` (`tag_type`),
  KEY `ind_name` (`tag_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `sdb_tags`
--

INSERT INTO `sdb_tags` (`tag_id`, `tag_name`, `is_system`, `tag_type`, `rel_count`) VALUES
(1, '最新商品', 'false', 'goods', 11),
(2, '热卖排行', 'false', 'goods', 1),
(3, '特价销售', 'false', 'goods', 13),
(4, '精品推荐', 'false', 'goods', 7),
(5, '流行时尚', 'false', 'goods', 5),
(6, '少女时装', 'false', 'goods', 10),
(7, '当季流行', 'false', 'goods', 8),
(8, '青春风潮', 'false', 'goods', 12),
(9, '白领', 'false', 'goods', 9);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_tag_rel`
--

DROP TABLE IF EXISTS `sdb_tag_rel`;
CREATE TABLE IF NOT EXISTS `sdb_tag_rel` (
  `tag_id` mediumint(8) unsigned NOT NULL default '0',
  `rel_id` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tag_id`,`rel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_tag_rel`
--

INSERT INTO `sdb_tag_rel` (`tag_id`, `rel_id`) VALUES
(1, 62),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 71),
(1, 72),
(1, 74),
(1, 75),
(2, 55),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(4, 6),
(4, 7),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 15),
(5, 63),
(5, 65),
(5, 66),
(5, 67),
(5, 68),
(6, 42),
(6, 43),
(6, 44),
(6, 45),
(6, 46),
(6, 56),
(6, 57),
(6, 58),
(6, 59),
(6, 60),
(7, 47),
(7, 48),
(7, 49),
(7, 50),
(7, 51),
(7, 52),
(7, 53),
(7, 54),
(8, 4),
(8, 5),
(8, 8),
(8, 14),
(8, 23),
(8, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(9, 3),
(9, 17),
(9, 18),
(9, 38),
(9, 39),
(9, 40),
(9, 41),
(9, 70),
(9, 73);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_template_relation`
--

DROP TABLE IF EXISTS `sdb_template_relation`;
CREATE TABLE IF NOT EXISTS `sdb_template_relation` (
  `template_relation_id` int(11) NOT NULL auto_increment,
  `source_type` varchar(20) NOT NULL default '',
  `source_id` int(11) NOT NULL default '0',
  `template_name` varchar(100) NOT NULL default '',
  `template_type` varchar(100) default NULL,
  PRIMARY KEY  (`template_relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `sdb_template_relation`
--

INSERT INTO `sdb_template_relation` (`template_relation_id`, `source_type`, `source_id`, `template_name`, `template_type`) VALUES
(1, 'cat', 27, '0', 'gallery'),
(2, 'cat', 27, '0', 'product'),
(3, 'cat', 42, '0', 'gallery'),
(4, 'cat', 42, '0', 'product'),
(5, 'cat', 41, '0', 'gallery'),
(6, 'cat', 41, '0', 'product'),
(7, 'cat', 23, '0', 'gallery'),
(8, 'cat', 23, '0', 'product'),
(9, 'cat', 24, '0', 'gallery'),
(10, 'cat', 24, '0', 'product'),
(11, 'cat', 29, '0', 'gallery'),
(12, 'cat', 29, '0', 'product'),
(13, 'cat', 30, '0', 'gallery'),
(14, 'cat', 30, '0', 'product'),
(15, 'cat', 31, '0', 'gallery'),
(16, 'cat', 31, '0', 'product'),
(17, 'cat', 32, '0', 'gallery'),
(18, 'cat', 32, '0', 'product'),
(19, 'cat', 25, '0', 'gallery'),
(20, 'cat', 25, '0', 'product'),
(21, 'cat', 33, '0', 'gallery'),
(22, 'cat', 33, '0', 'product'),
(23, 'cat', 34, '0', 'gallery'),
(24, 'cat', 34, '0', 'product'),
(25, 'cat', 35, '0', 'gallery'),
(26, 'cat', 35, '0', 'product'),
(27, 'cat', 26, '0', 'gallery'),
(28, 'cat', 26, '0', 'product'),
(29, 'cat', 36, '0', 'gallery'),
(30, 'cat', 36, '0', 'product'),
(31, 'cat', 37, '0', 'gallery'),
(32, 'cat', 37, '0', 'product'),
(33, 'cat', 38, '0', 'gallery'),
(34, 'cat', 38, '0', 'product'),
(35, 'cat', 39, '0', 'gallery'),
(36, 'cat', 39, '0', 'product'),
(37, 'cat', 40, '0', 'gallery'),
(38, 'cat', 40, '0', 'product'),
(39, 'brand', 18, '0', 'brand'),
(40, 'brand', 19, '0', 'brand'),
(41, 'brand', 20, '0', 'brand'),
(42, 'brand', 21, '0', 'brand'),
(43, 'brand', 22, '0', 'brand'),
(44, 'brand', 23, '0', 'brand'),
(45, 'brand', 24, '0', 'brand'),
(46, 'brand', 25, '0', 'brand'),
(47, 'brand', 26, '0', 'brand'),
(48, 'brand', 27, '0', 'brand'),
(49, 'brand', 28, '0', 'brand'),
(50, 'brand', 29, '0', 'brand');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_themes`
--

DROP TABLE IF EXISTS `sdb_themes`;
CREATE TABLE IF NOT EXISTS `sdb_themes` (
  `theme` varchar(50) NOT NULL default '',
  `name` varchar(50) default NULL,
  `stime` int(10) unsigned default NULL,
  `author` varchar(50) default NULL,
  `site` varchar(100) default NULL,
  `version` varchar(50) default NULL,
  `info` varchar(255) default NULL,
  `config` longtext,
  `update_url` varchar(100) default NULL,
  `template` varchar(255) default NULL,
  PRIMARY KEY  (`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_themes`
--

INSERT INTO `sdb_themes` (`theme`, `name`, `stime`, `author`, `site`, `version`, `info`, `config`, `update_url`, `template`) VALUES
('1354864820', '名鞋城', 1391849155, '视觉网络', 'http://www.webui.com.cn', 'ShopEx4.8', NULL, 'a:3:{s:6:"config";a:0:{}s:7:"borders";a:10:{i:0;a:2:{s:3:"key";s:6:"默认";s:3:"tpl";s:20:"borders/border1.html";}i:1;a:2:{s:3:"key";s:9:"粗边框";s:3:"tpl";s:20:"borders/border2.html";}i:2;a:2:{s:3:"key";s:15:"主区域头部";s:3:"tpl";s:20:"borders/border3.html";}i:3;a:2:{s:3:"key";s:9:"大列表";s:3:"tpl";s:20:"borders/border4.html";}i:4;a:2:{s:3:"key";s:12:"底部文章";s:3:"tpl";s:20:"borders/border5.html";}i:5;a:2:{s:3:"key";s:12:"帮助中心";s:3:"tpl";s:20:"borders/border6.html";}i:6;a:2:{s:3:"key";s:3:"一";s:3:"tpl";s:20:"borders/border7.html";}i:7;a:2:{s:3:"key";s:3:"二";s:3:"tpl";s:20:"borders/border8.html";}i:8;a:2:{s:3:"key";s:3:"三";s:3:"tpl";s:20:"borders/border9.html";}i:9;a:2:{s:3:"key";s:3:"四";s:3:"tpl";s:21:"borders/border10.html";}}s:5:"views";a:0:{}}', NULL, ''),
('huancai01', NULL, 1392015093, NULL, NULL, NULL, NULL, 'a:3:{s:6:"config";a:0:{}s:7:"borders";a:0:{}s:5:"views";a:0:{}}', NULL, ''),
('huancai', '幻彩优品', 1392015092, '优品诚', 'http://www.upin99.com', 'upin99.com', NULL, 'a:3:{s:6:"config";a:0:{}s:7:"borders";a:3:{i:0;a:2:{s:3:"key";s:12:"畅销排行";s:3:"tpl";s:20:"borders/border1.html";}i:1;a:2:{s:3:"key";s:6:"默认";s:3:"tpl";s:20:"borders/border2.html";}i:2;a:2:{s:3:"key";s:12:"边栏列表";s:3:"tpl";s:20:"borders/border3.html";}}s:5:"views";a:0:{}}', NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_tpl_source`
--

DROP TABLE IF EXISTS `sdb_tpl_source`;
CREATE TABLE IF NOT EXISTS `sdb_tpl_source` (
  `tpl_source_id` int(11) NOT NULL auto_increment,
  `tpl_type` varchar(50) NOT NULL default '',
  `tpl_name` varchar(100) NOT NULL default '',
  `tpl_file` varchar(100) NOT NULL default '',
  `tpl_theme` varchar(100) NOT NULL,
  PRIMARY KEY  (`tpl_source_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `sdb_tpl_source`
--

INSERT INTO `sdb_tpl_source` (`tpl_source_id`, `tpl_type`, `tpl_name`, `tpl_file`, `tpl_theme`) VALUES
(1, 'cart', 'cart.html', 'cart.html', 'huancai01'),
(2, 'default', 'default.html', 'default.html', 'huancai01'),
(3, 'gallery', 'gallery.html', 'gallery.html', 'huancai01'),
(4, 'gift', 'gift.html', 'gift.html', 'huancai01'),
(5, 'index', 'index.html', 'index.html', 'huancai01'),
(6, 'member', 'member.html', 'member.html', 'huancai01'),
(7, 'order_detail', 'order_detail.html', 'order_detail.html', 'huancai01'),
(8, 'order_index', 'order_index.html', 'order_index.html', 'huancai01'),
(9, 'page', 'page.html', 'page.html', 'huancai01'),
(10, 'passport', 'passport.html', 'passport.html', 'huancai01'),
(12, 'default', 'default.html', 'default.html', 'huancai'),
(13, 'gallery', 'gallery.html', 'gallery.html', 'huancai'),
(15, 'index', 'index.html', 'index.html', 'huancai'),
(28, 'page', 'page.html', 'page.html', 'huancai'),
(24, 'product', 'product.html', 'product.html', 'huancai');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_triggers`
--

DROP TABLE IF EXISTS `sdb_triggers`;
CREATE TABLE IF NOT EXISTS `sdb_triggers` (
  `trigger_id` int(11) NOT NULL auto_increment,
  `filter_str` varchar(255) NOT NULL default '',
  `action_str` varchar(255) NOT NULL default '',
  `trigger_event` varchar(100) NOT NULL default '',
  `trigger_memo` varchar(100) default NULL,
  `trigger_define` text NOT NULL,
  `trigger_order` tinyint(4) NOT NULL default '5',
  `active` enum('true','false') default 'false',
  `disabled` enum('true','false') NOT NULL default 'false',
  PRIMARY KEY  (`trigger_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sdb_triggers`
--

INSERT INTO `sdb_triggers` (`trigger_id`, `filter_str`, `action_str`, `trigger_event`, `trigger_memo`, `trigger_define`, `trigger_order`, `active`, `disabled`) VALUES
(1, '所有', '增加积分100', 'member/account:register', '注册会员即送100积分（可修改）', 'a:2:{s:11:"filter_mode";s:5:"every";s:7:"actions";a:1:{i:0;a:2:{s:3:"act";s:15:"member:addPoint";s:4:"args";s:3:"100";}}}', 5, 'false', 'false'),
(2, '所有', '送优惠券3', 'member/account:register', '注册会员即送10元优惠券（可修改）', 'a:2:{s:11:"filter_mode";s:5:"every";s:7:"actions";a:1:{i:0;a:2:{s:3:"act";s:17:"member:sendcoupon";s:4:"args";s:1:"3";}}}', 5, 'false', 'false'),
(3, '留言被回复是', '增加积分10', 'member/account:shopmessage', '会员留言被回复后即增加10积分（可修改）', 'a:3:{s:11:"filter_mode";s:3:"all";s:6:"filter";a:1:{i:0;a:3:{s:3:"key";s:17:"shopmessage_reply";s:4:"test";s:4:"true";s:3:"val";s:0:"";}}s:7:"actions";a:1:{i:0;a:2:{s:3:"act";s:15:"member:addPoint";s:4:"args";s:2:"10";}}}', 5, 'false', 'false'),
(4, '评论被审核是', '增加积分10', 'member/account:discuzz', '会员进行商品评论被审核后增加10积分（可修改）', 'a:3:{s:11:"filter_mode";s:3:"all";s:6:"filter";a:1:{i:0;a:3:{s:3:"key";s:13:"discuzz_check";s:4:"test";s:4:"true";s:3:"val";s:0:"";}}s:7:"actions";a:1:{i:0;a:2:{s:3:"act";s:15:"member:addPoint";s:4:"args";s:2:"10";}}}', 5, 'false', 'false');

-- --------------------------------------------------------

--
-- 表的结构 `sdb_type_brand`
--

DROP TABLE IF EXISTS `sdb_type_brand`;
CREATE TABLE IF NOT EXISTS `sdb_type_brand` (
  `type_id` int(10) NOT NULL default '0',
  `brand_id` mediumint(8) unsigned NOT NULL default '0',
  `brand_order` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`type_id`,`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sdb_type_brand`
--

INSERT INTO `sdb_type_brand` (`type_id`, `brand_id`, `brand_order`) VALUES
(7, 25, NULL),
(7, 24, NULL),
(7, 23, NULL),
(7, 22, NULL),
(7, 21, NULL),
(7, 20, NULL),
(7, 19, NULL),
(7, 18, NULL),
(7, 26, NULL),
(7, 27, NULL),
(7, 28, NULL),
(7, 29, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sdb_widgets_set`
--

DROP TABLE IF EXISTS `sdb_widgets_set`;
CREATE TABLE IF NOT EXISTS `sdb_widgets_set` (
  `widgets_id` int(11) NOT NULL auto_increment,
  `base_file` varchar(50) NOT NULL default '',
  `base_slot` tinyint(3) unsigned NOT NULL default '0',
  `base_id` varchar(20) default NULL,
  `widgets_type` varchar(20) NOT NULL default '',
  `widgets_order` tinyint(3) unsigned NOT NULL default '5',
  `title` varchar(100) default NULL,
  `domid` varchar(100) default NULL,
  `border` varchar(100) default NULL,
  `classname` varchar(100) default NULL,
  `tpl` varchar(100) default NULL,
  `params` longtext,
  `modified` int(10) unsigned default NULL,
  `vary` varchar(250) default NULL,
  PRIMARY KEY  (`widgets_id`),
  KEY `ind_wgbase` (`base_file`,`base_id`,`widgets_order`),
  KEY `ind_wginfo` (`base_file`,`base_slot`,`widgets_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=298 ;

--
-- 转存表中的数据 `sdb_widgets_set`
--

INSERT INTO `sdb_widgets_set` (`widgets_id`, `base_file`, `base_slot`, `base_id`, `widgets_type`, `widgets_order`, `title`, `domid`, `border`, `classname`, `tpl`, `params`, `modified`, `vary`) VALUES
(1, 'user:1354864820/block/footer.html', 0, 'foot_a', 'links', 32, '友情链接：', '', 'borders/border7.html', '', 'default.html', 'a:8:{s:5:"limit";s:2:"30";s:6:"colums";s:2:"10";s:10:"seperate_x";s:1:"5";s:10:"seperate_y";s:1:"5";s:5:"width";s:2:"88";s:6:"height";s:2:"31";s:9:"PictoFont";s:1:"5";s:9:"show_type";s:8:"showFont";}', NULL, NULL),
(2, 'user:1354864820/block/footer.html', 0, 'foot_f', 'treelist', 33, '', '', '__none__', '', 'default.html', 'a:2:{s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"90";}', NULL, NULL),
(3, 'user:1354864820/block/header.html', 0, 'top_a', 'topbar', 0, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(4, 'user:1354864820/block/header.html', 0, 'top_ab', 'cart', 1, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(5, 'user:1354864820/block/header.html', 1, 'top_ac', 'usercustom', 2, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:12:"400-800-9999";}', NULL, NULL),
(6, 'user:1354864820/block/header.html', 2, 'top_b', 'logo', 3, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(7, 'user:1354864820/block/header.html', 3, 'top_c', 'treelist', 4, '', '', '__none__', '', 'default.html', 'a:2:{s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"90";}', NULL, NULL),
(8, 'user:1354864820/block/header.html', 4, 'top_d', 'menu_lv1', 5, '', '', '__none__', '', 'default.html', 'a:2:{s:8:"max_leng";s:0:"";s:8:"showinfo";s:0:"";}', NULL, NULL),
(9, 'user:1354864820/block/header.html', 5, 'top_e', 'usercustom', 6, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:181:"热门关键词：<a href="#">耐克编织休闲鞋</a> <a href="#">詹姆斯战靴</a> <a href="#">耐克Nike空军系列</a> <a href="#">匡威板鞋</a> <a href="#">篮球鞋</a>";}', NULL, NULL),
(10, 'user:1354864820/block/header.html', 6, 'top_f', 'search', 7, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(11, 'user:1354864820/block/shop_list.html', 0, 'shop_list', 'ad', 11, '品牌专题', 'brand_list', 'borders/border3.html', '', 'default.html', 'a:1:{s:2:"ad";a:10:{s:13:"1273132449441";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132449441";s:4:"link";s:26:"%THEME%/images/brand_a.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132450305";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132450305";s:4:"link";s:26:"%THEME%/images/brand_b.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132450657";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132450657";s:4:"link";s:26:"%THEME%/images/brand_c.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132451049";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132451049";s:4:"link";s:26:"%THEME%/images/brand_d.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132451586";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132451586";s:4:"link";s:26:"%THEME%/images/brand_e.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132451913";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132451913";s:4:"link";s:26:"%THEME%/images/brand_f.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132452281";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132452281";s:4:"link";s:26:"%THEME%/images/brand_g.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132452641";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132452641";s:4:"link";s:26:"%THEME%/images/brand_h.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132453017";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132453017";s:4:"link";s:26:"%THEME%/images/brand_i.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1257068619204";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1257068619204";s:4:"link";s:26:"%THEME%/images/brand_p.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}}}', NULL, NULL),
(12, 'user:1354864820/block/shop_list.html', 0, 'shop_list', 'goodscat', 12, '', 'shop_list', 'borders/border6.html', '', 'default.html', 'a:9:{s:11:"page_devide";s:0:"";s:6:"devide";s:1:"3";s:22:"showCatChild_accordion";s:2:"on";s:23:"showCatgChild_accordion";s:3:"off";s:16:"showFx_accordion";s:3:"off";s:20:"fxDuration_accordion";s:3:"300";s:20:"showCatDepth_default";s:1:"3";s:22:"showCatDepth_accordion";s:1:"3";s:21:"showCatDepth_dropdown";s:1:"3";}', NULL, NULL),
(13, 'user:1354864820/block/shop_list.html', 0, 'shop_list', 'virtualcat', 13, '价格区间', 'rmb', 'borders/border2.html', '', 'default.html', 'a:12:{s:11:"page_devide";s:0:"";s:6:"devide";s:1:"2";s:22:"showCatChild_accordion";s:2:"on";s:23:"showCatgChild_accordion";s:3:"off";s:16:"showFx_accordion";s:3:"off";s:20:"fxDuration_accordion";s:3:"300";s:13:"virtualcat_id";s:0:"";s:18:"show_selected_node";s:2:"on";s:20:"showCatDepth_default";s:1:"2";s:22:"showCatDepth_accordion";s:1:"1";s:21:"showCatDepth_dropdown";s:1:"1";s:17:"showCatDepth_fold";s:1:"1";}', NULL, NULL),
(14, 'user:1354864820/block/time.html', 0, 'time', 'usercustom', 9, '', 'time', 'borders/border2.html', '', 'default.html', 'a:1:{s:10:"usercustom";s:31:"09:30 ~ 12:00<br/>11:30 ~ 19:30";}', NULL, NULL),
(15, 'user:1354864820/default.html', 0, 'main_a', 'hst', 11, '浏览记录', '', 'borders/border2.html', '', 'default.html', 'a:1:{s:3:"max";s:1:"3";}', NULL, NULL),
(16, 'user:1354864820/default.html', 0, 'main_b', 'nav', 12, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(17, 'user:1354864820/gallery-goodslist.html', 2, 'main_b', 'nav', 13, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(18, 'user:1354864820/gallery-goodslist.html', 1, 'top_b', 'ad_pic', 12, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:27:"%THEME%/images/list_pop.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(19, 'user:1354864820/gallery.html', 2, 'main_b', 'nav', 13, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(20, 'user:1354864820/gallery.html', 1, 'top_b', 'ad_pic', 12, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:27:"%THEME%/images/list_pop.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(21, 'user:1354864820/gift.html', 0, 'gift_a', 'gifttree', 8, '所有赠品', 'brand_list', 'borders/border3.html', '', 'default.html', 'a:2:{s:7:"showson";s:6:"enable";s:9:"maxlength";s:2:"30";}', NULL, NULL),
(22, 'user:1354864820/gift.html', 0, 'gift_a', 'hst', 9, '浏览记录', '', 'borders/border2.html', '', 'default.html', 'a:1:{s:3:"max";s:1:"3";}', NULL, NULL),
(23, 'user:1354864820/gift.html', 0, 'gift_b', 'nav', 10, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(24, 'user:1354864820/index.html', 3, 'hot_a', 'ad_pic', 18, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/tj_a.jpg";s:11:"ad_pic_link";s:16:"?product-75.html";}', NULL, NULL),
(25, 'user:1354864820/index.html', 4, 'hot_b', 'ad_pic', 19, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/tj_b.jpg";s:11:"ad_pic_link";s:16:"?product-75.html";}', NULL, NULL),
(26, 'user:1354864820/index.html', 5, 'hot_c', 'ad_pic', 20, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/tj_c.jpg";s:11:"ad_pic_link";s:16:"?product-75.html";}', NULL, NULL),
(27, 'user:1354864820/index.html', 6, 'hot_d', 'usercustom', 21, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:99:"<p><i>￥228</i></p>\n <p>新款男子校园文化鞋 网布透气板鞋 nike男板鞋 黑银蓝</p>";}', NULL, NULL),
(28, 'user:1354864820/index.html', 7, 'hot_e', 'usercustom', 22, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:98:"<p><i>￥228</i></p>\n<p>新款男子校园文化鞋 网布透气板鞋 nike男板鞋 黑银蓝</p>";}', NULL, NULL),
(29, 'user:1354864820/index.html', 8, 'hot_f', 'usercustom', 23, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:98:"<p><i>￥228</i></p>\n<p>新款男子校园文化鞋 网布透气板鞋 nike男板鞋 黑银蓝</p>";}', NULL, NULL),
(30, 'user:1354864820/index.html', 2, 'hot_title', 'usercustom', 17, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:12:"最新推荐";}', NULL, NULL),
(31, 'user:1354864820/index.html', 1, 'index_a', 'rankinglist', 14, '热卖排行', '', 'borders/border2.html', '', 'default.html', 'a:17:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:6:"filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:2:"10";s:10:"fontColor2";s:7:"default";s:7:"showing";s:1:"0";s:9:"fontColor";s:7:"default";s:7:"showPic";s:2:"on";s:9:"maxlength";s:2:"35";s:8:"showMore";s:2:"on";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:7:"ranking";s:9:"buy_count";s:10:"fontStyle2";s:1:"0";s:9:"fontStyle";s:1:"0";}', NULL, NULL),
(32, 'user:1354864820/index.html', 1, 'index_a', 'comment', 15, '客户评论', '', 'borders/border2.html', '', 'default.html', 'a:2:{s:5:"limit";s:1:"8";s:14:"content_length";s:3:"200";}', NULL, NULL),
(33, 'user:1354864820/index.html', 1, 'index_a', 'ad', 16, '', 'left_pop', 'borders/border6.html', '', 'default.html', 'a:1:{s:2:"ad";a:1:{s:13:"1273305261677";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273305261677";s:4:"link";s:28:"%THEME%/images/left_popb.jpg";s:6:"tolink";s:0:"";}}}', NULL, NULL),
(34, 'user:1354864820/index.html', 0, 'index_c', 'article', 10, '最新动态 News', 'r_news', 'borders/border2.html', '', 'default.html', 'a:20:{s:8:"onSelect";s:1:"0";s:7:"explain";a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}s:5:"limit";s:1:"4";s:10:"picaddress";s:0:"";s:6:"colums";s:1:"1";s:10:"max_length";s:2:"35";s:8:"showMore";s:2:"on";s:12:"showTitleImg";s:3:"off";s:11:"titleImgSrc";s:0:"";s:12:"titleImgHref";s:0:"";s:11:"titleImgAlt";s:0:"";s:9:"showTitle";s:3:"off";s:9:"titleDesc";s:0:"";s:8:"columNum";s:1:"1";s:12:"changeEffect";s:1:"1";s:3:"id1";s:3:"100";s:3:"id2";s:3:"100";s:3:"id3";s:3:"100";s:8:"smallPic";s:1:"6";s:16:"titleImgPosition";s:3:"top";}', NULL, NULL),
(35, 'user:1354864820/index.html', 9, 'index_d', 'ad_pic', 24, '', '', 'borders/border6.html', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:3:"760";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/gpop_a.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(36, 'user:1354864820/index.html', 9, 'index_d', 'goods', 25, '新款上市', '', 'borders/border4.html', '', 'default.html', 'a:56:{s:8:"onSelect";s:1:"0";s:7:"explain";a:5:{i:0;s:20:"NIKE 新款篮球鞋";i:1;s:17:"PUMA 时尚新款";i:2;s:20:"KAPPA 09秋装新款";i:3;s:0:"";i:4;s:0:"";}s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:7:"filter1";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter2";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=5&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter3";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=2&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter4";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter5";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:6:"column";s:1:"4";s:5:"limit";s:1:"8";s:8:"showMore";s:2:"on";s:12:"showGoodsImg";s:2:"on";s:10:"max_length";s:2:"35";s:13:"showGoodsName";s:2:"on";s:13:"showGoodsDesc";s:2:"on";s:17:"showGoodsMktPrice";s:2:"on";s:12:"mktPriceText";s:1:" ";s:11:"mktPriceSep";s:1:" ";s:6:"color1";s:7:"default";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:1:" ";s:8:"priceSep";s:1:" ";s:6:"color2";s:7:"default";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:6:"color3";s:7:"default";s:9:"showCount";s:3:"off";s:9:"countText";s:1:" ";s:8:"countSep";s:1:" ";s:6:"color5";s:7:"default";s:11:"showBuyArea";s:3:"off";s:13:"goodsImgWidth";s:3:"170";s:14:"goodsImgHeight";s:3:"170";s:8:"restrict";s:2:"on";s:12:"showTitleImg";s:3:"off";s:13:"showGoodsInfo";s:3:"off";s:11:"titleImgSrc";s:0:"";s:12:"titleImgHref";s:0:"";s:11:"titleImgAlt";s:0:"";s:9:"showTitle";s:3:"off";s:9:"titleDesc";s:0:"";s:8:"columNum";s:1:"1";s:12:"changeEffect";s:1:"1";s:6:"cat_id";a:5:{i:0;s:5:"_ANY_";i:1;s:1:"5";i:2;s:1:"2";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:8:"brand_id";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:3:"tag";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";s:16:"goodsImgPosition";s:3:"top";s:9:"mark_font";s:1:"0";s:11:"member_font";s:1:"0";s:9:"save_font";s:1:"0";s:10:"count_font";s:1:"0";s:16:"titleImgPosition";s:3:"top";}', NULL, NULL),
(37, 'user:1354864820/index.html', 9, 'index_d', 'ad_pic', 26, '', '', 'borders/border6.html', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:3:"760";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/gpop_d.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(38, 'user:1354864820/index.html', 9, 'index_d', 'goods', 27, '耐克新款', '', 'borders/border4.html', '', 'default.html', 'a:56:{s:8:"onSelect";s:1:"0";s:7:"explain";a:5:{i:0;s:15:"PUMA 3折专区";i:1;s:16:"UMBRO 4折专区";i:2;s:21:"CONVERSE 4.8折专区";i:3;s:0:"";i:4;s:0:"";}s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:7:"filter1";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=2&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter2";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=5&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter3";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=2&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter4";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter5";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:6:"column";s:1:"4";s:5:"limit";s:1:"8";s:8:"showMore";s:2:"on";s:12:"showGoodsImg";s:2:"on";s:10:"max_length";s:2:"35";s:13:"showGoodsName";s:2:"on";s:13:"showGoodsDesc";s:2:"on";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:6:"color1";s:7:"default";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:1:" ";s:8:"priceSep";s:1:" ";s:6:"color2";s:7:"default";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:6:"color3";s:7:"default";s:9:"showCount";s:2:"on";s:9:"countText";s:1:" ";s:8:"countSep";s:1:"%";s:6:"color5";s:7:"default";s:11:"showBuyArea";s:3:"off";s:13:"goodsImgWidth";s:3:"170";s:14:"goodsImgHeight";s:3:"170";s:8:"restrict";s:2:"on";s:12:"showTitleImg";s:3:"off";s:13:"showGoodsInfo";s:3:"off";s:11:"titleImgSrc";s:0:"";s:12:"titleImgHref";s:0:"";s:11:"titleImgAlt";s:0:"";s:9:"showTitle";s:3:"off";s:9:"titleDesc";s:0:"";s:8:"columNum";s:1:"1";s:12:"changeEffect";s:1:"1";s:6:"cat_id";a:5:{i:0;s:1:"2";i:1;s:1:"5";i:2;s:1:"2";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:8:"brand_id";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:3:"tag";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";s:16:"goodsImgPosition";s:3:"top";s:9:"mark_font";s:1:"0";s:11:"member_font";s:1:"0";s:9:"save_font";s:1:"0";s:10:"count_font";s:1:"0";s:16:"titleImgPosition";s:3:"top";}', NULL, NULL),
(39, 'user:1354864820/index.html', 9, 'index_d', 'ad_pic', 28, '', '', 'borders/border6.html', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:3:"760";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/gpop_c.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(40, 'user:1354864820/index.html', 9, 'index_d', 'goods', 29, '李宁新款', '', 'borders/border4.html', '', 'default.html', 'a:56:{s:8:"onSelect";s:1:"0";s:7:"explain";a:5:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:0:"";}s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:7:"filter1";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=8&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter2";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter3";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter4";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter5";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:6:"column";s:1:"4";s:5:"limit";s:1:"8";s:8:"showMore";s:2:"on";s:12:"showGoodsImg";s:2:"on";s:10:"max_length";s:2:"35";s:13:"showGoodsName";s:2:"on";s:13:"showGoodsDesc";s:2:"on";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:6:"color1";s:7:"default";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:1:" ";s:8:"priceSep";s:1:" ";s:6:"color2";s:7:"default";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:6:"color3";s:7:"default";s:9:"showCount";s:3:"off";s:9:"countText";s:6:"折扣";s:8:"countSep";s:1:"%";s:6:"color5";s:7:"default";s:11:"showBuyArea";s:3:"off";s:13:"goodsImgWidth";s:3:"170";s:14:"goodsImgHeight";s:3:"170";s:8:"restrict";s:2:"on";s:12:"showTitleImg";s:3:"off";s:13:"showGoodsInfo";s:3:"off";s:11:"titleImgSrc";s:0:"";s:12:"titleImgHref";s:0:"";s:11:"titleImgAlt";s:0:"";s:9:"showTitle";s:3:"off";s:9:"titleDesc";s:0:"";s:8:"columNum";s:1:"1";s:12:"changeEffect";s:1:"1";s:6:"cat_id";a:5:{i:0;s:1:"8";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:8:"brand_id";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:3:"tag";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";s:16:"goodsImgPosition";s:3:"top";s:9:"mark_font";s:1:"0";s:11:"member_font";s:1:"0";s:9:"save_font";s:1:"0";s:10:"count_font";s:1:"0";s:16:"titleImgPosition";s:3:"top";}', NULL, NULL),
(41, 'user:1354864820/index.html', 9, 'index_d', 'ad_pic', 30, '', '', 'borders/border6.html', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:3:"760";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/gpop_b.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(42, 'user:1354864820/index.html', 9, 'index_d', 'goods', 31, '匡威新款上架', '', 'borders/border4.html', '', 'default.html', 'a:56:{s:8:"onSelect";s:1:"0";s:7:"explain";a:5:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:0:"";}s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:7:"filter1";s:71:"pricefrom=&priceto=&searchname=&cat_id[]=2&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter2";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter3";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter4";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:7:"filter5";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:6:"column";s:1:"4";s:5:"limit";s:1:"8";s:8:"showMore";s:2:"on";s:12:"showGoodsImg";s:2:"on";s:10:"max_length";s:2:"35";s:13:"showGoodsName";s:2:"on";s:13:"showGoodsDesc";s:2:"on";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:6:"color1";s:7:"default";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:1:" ";s:8:"priceSep";s:1:" ";s:6:"color2";s:7:"default";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:6:"color3";s:7:"default";s:9:"showCount";s:3:"off";s:9:"countText";s:6:"折扣";s:8:"countSep";s:1:"%";s:6:"color5";s:7:"default";s:11:"showBuyArea";s:3:"off";s:13:"goodsImgWidth";s:3:"170";s:14:"goodsImgHeight";s:3:"170";s:8:"restrict";s:2:"on";s:12:"showTitleImg";s:3:"off";s:13:"showGoodsInfo";s:3:"off";s:11:"titleImgSrc";s:0:"";s:12:"titleImgHref";s:0:"";s:11:"titleImgAlt";s:0:"";s:9:"showTitle";s:3:"off";s:9:"titleDesc";s:0:"";s:8:"columNum";s:1:"1";s:12:"changeEffect";s:1:"1";s:6:"cat_id";a:5:{i:0;s:1:"2";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:8:"brand_id";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:3:"tag";a:5:{i:0;s:5:"_ANY_";i:1;s:5:"_ANY_";i:2;s:5:"_ANY_";i:3;s:5:"_ANY_";i:4;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";s:16:"goodsImgPosition";s:3:"top";s:9:"mark_font";s:1:"0";s:11:"member_font";s:1:"0";s:9:"save_font";s:1:"0";s:10:"count_font";s:1:"0";s:16:"titleImgPosition";s:3:"top";}', NULL, NULL),
(43, 'user:1354864820/index.html', 0, 'index_pop', 'ad_pic', 8, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/pop_a.gif";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(44, 'user:1354864820/page.html', 0, 'page_a', 'treelist', 8, '帮助中心', 'help_left', 'borders/border2.html', '', 'default.html', 'a:2:{s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"68";}', NULL, NULL),
(45, 'user:1354864820/page.html', 0, 'page_b', 'nav', 9, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(281, 'user:huancai/gallery.html', 2, 'l_pics2', 'ad_pic', 9, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/lpic2.jpg";s:11:"ad_pic_link";s:0:"";}', 1392190071, NULL),
(231, 'user:huancai/index.html', 4, 'tab_content1', 'upc_goods_show', 11, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"4";s:6:"column";s:1:"4";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"4";}', 1392632839, NULL),
(272, 'user:huancai/block/footer.html', 0, 'helps1', 'treelist', 46, '', '', '__none__', '', 'default.html', 'a:3:{s:8:"showroot";s:4:"true";s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"69";}', 1392632839, NULL),
(273, 'user:huancai/block/footer.html', 0, 'helps2', 'treelist', 47, '', '', '__none__', '', 'default.html', 'a:3:{s:8:"showroot";s:4:"true";s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"75";}', 1392632839, NULL),
(274, 'user:huancai/block/footer.html', 1, 'helps3', 'treelist', 48, '', '', '__none__', '', 'default.html', 'a:3:{s:8:"showroot";s:4:"true";s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"81";}', 1392632839, NULL),
(275, 'user:huancai/block/footer.html', 2, 'helps4', 'treelist', 49, '', '', '__none__', '', 'default.html', 'a:3:{s:8:"showroot";s:4:"true";s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"87";}', 1392632839, NULL),
(276, 'user:huancai/block/header.html', 1, 'search', 'upc_search', 2, '', '', '__none__', '', 'default.html', 'a:3:{s:6:"hotkey";s:12:"热门搜索";s:14:"top_link_title";a:7:{i:0;s:9:"巧克力";i:1;s:6:"麦片";i:2;s:6:"奶茶";i:3;s:6:"红酒";i:4;s:6:"年货";i:5;s:6:"德芙";i:6;s:9:"优品诚";}s:12:"top_link_url";a:7:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:0:"";i:5;s:0:"";i:6;s:0:"";}}', 1392632839, NULL),
(277, 'user:huancai/gallery.html', 0, 'l_hotsale', 'upc_goods_show', 6, '热销排行', '', 'borders/border3.html', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"1";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}', 1392190071, NULL),
(270, 'user:huancai/index.html', 37, 'ads_list2', 'ad_pic', 44, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/ads2.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(271, 'user:huancai/index.html', 38, 'ads_list3', 'ad_pic', 45, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/ads3.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(269, 'user:huancai/index.html', 36, 'ads_list1', 'ad_pic', 43, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/ads1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(268, 'user:huancai/index.html', 35, 'floor2_pds', 'upc_goods_show', 42, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"5";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"4";}', 1392632839, NULL),
(267, 'user:huancai/index.html', 34, 'floor2_brand8', 'ad_pic', 41, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand8.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(265, 'user:huancai/index.html', 32, 'floor2_brand6', 'ad_pic', 39, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand6.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(266, 'user:huancai/index.html', 33, 'floor2_brand7', 'ad_pic', 40, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand7.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(263, 'user:huancai/index.html', 30, 'floor2_brand4', 'ad_pic', 37, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand4.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(264, 'user:huancai/index.html', 31, 'floor2_brand5', 'ad_pic', 38, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand5.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(262, 'user:huancai/index.html', 22, 'floor2_pds1', 'upc_goods_show', 29, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"5";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"2";}', 1392632839, NULL),
(297, 'user:huancai/block/header.html', 0, 'logo', 'ad_pic', 1, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:23:"%THEME%/images/logo.jpg";s:11:"ad_pic_link";s:2:"./";}', 1392632839, NULL),
(259, 'user:huancai/block/shop_list.html', 0, 'shop_list', 'ad', 11, '品牌专题', 'brand_list', 'borders/border3.html', '', 'default.html', 'a:1:{s:2:"ad";a:10:{s:13:"1273132449441";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132449441";s:4:"link";s:26:"%THEME%/images/brand_a.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132450305";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132450305";s:4:"link";s:26:"%THEME%/images/brand_b.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132450657";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132450657";s:4:"link";s:26:"%THEME%/images/brand_c.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132451049";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132451049";s:4:"link";s:26:"%THEME%/images/brand_d.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132451586";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132451586";s:4:"link";s:26:"%THEME%/images/brand_e.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132451913";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132451913";s:4:"link";s:26:"%THEME%/images/brand_f.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132452281";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132452281";s:4:"link";s:26:"%THEME%/images/brand_g.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132452641";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132452641";s:4:"link";s:26:"%THEME%/images/brand_h.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1273132453017";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1273132453017";s:4:"link";s:26:"%THEME%/images/brand_i.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}s:13:"1257068619204";a:4:{s:4:"type";s:5:"image";s:1:"i";s:13:"1257068619204";s:4:"link";s:26:"%THEME%/images/brand_p.gif";s:6:"tolink";s:20:"?gallery-8-grid.html";}}}', NULL, NULL),
(260, 'user:huancai/index.html', 26, 'floor_focus', 'upc_slide', 33, '', '', '__none__', '', 'default.html', 'a:5:{s:5:"width";s:3:"584";s:6:"height";s:3:"289";s:12:"switcheffect";s:7:"scrollx";s:5:"flash";a:3:{i:0;a:3:{s:3:"pic";s:25:"%THEME%/images/focus2.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"0";}i:1;a:3:{s:3:"pic";s:25:"%THEME%/images/focus2.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"1";}i:2;a:3:{s:3:"pic";s:25:"%THEME%/images/focus2.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"2";}}s:8:"autoplay";s:4:"true";}', 1392632839, NULL),
(261, 'user:huancai/index.html', 25, 'hot_sale2', 'upc_goods_show', 32, '热销排行', '', 'borders/border1.html', '', 'ranklist.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"1";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"1";s:12:"gname_row_lh";s:2:"38";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}', 1392632839, NULL),
(257, 'user:huancai/block/header.html', 4, 'menu', 'menu_lv1', 5, '', '', '__none__', '', 'default.html', 'a:2:{s:8:"max_leng";s:0:"";s:8:"showinfo";s:0:"";}', 1392632839, NULL),
(256, 'user:huancai/block/footer.html', 3, 'bt_info', 'upc_usercustom', 50, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:167:"<a href="">关于我们</a>|<a href="">联系我们</a>|<a href="">人才招聘</a>|<a href="">广告服务</a>|<a href="">友情链接</a>|<a href="">销售联盟</a>";}', 1392632839, NULL),
(248, 'user:huancai/block/time.html', 0, 'time', 'usercustom', 9, '', 'time', 'borders/border2.html', '', 'default.html', 'a:1:{s:10:"usercustom";s:31:"09:30 ~ 12:00<br/>11:30 ~ 19:30";}', NULL, NULL),
(250, 'user:huancai/gallery-goodslist.html', 2, 'main_b', 'nav', 13, '', '', '__none__', '', 'default.html', 'a:0:{}', NULL, NULL),
(251, 'user:huancai/gallery-goodslist.html', 1, 'top_b', 'ad_pic', 12, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:27:"%THEME%/images/list_pop.jpg";s:11:"ad_pic_link";s:0:"";}', NULL, NULL),
(252, 'user:huancai/index.html', 0, 'focus_pic', 'upc_slide', 6, '', '', '__none__', '', 'default.html', 'a:5:{s:5:"width";s:3:"625";s:6:"height";s:3:"361";s:12:"switcheffect";s:7:"scrollx";s:5:"flash";a:3:{i:0;a:3:{s:3:"pic";s:24:"%THEME%/images/focus.jpg";s:3:"url";s:0:"";s:1:"i";s:1:"0";}i:1;a:3:{s:3:"pic";s:24:"%THEME%/images/focus.jpg";s:3:"url";s:0:"";s:1:"i";s:1:"1";}i:2;a:3:{s:3:"pic";s:24:"%THEME%/images/focus.jpg";s:3:"url";s:0:"";s:1:"i";s:1:"2";}}s:8:"autoplay";s:4:"true";}', 1392632839, NULL),
(253, 'user:huancai/block/header.html', 0, 'login', 'upc_login', 0, '', '', '__none__', '', 'default.html', 'a:1:{s:7:"welcome";s:27:"欢迎来到优品诚商城";}', 1392632839, NULL),
(232, 'user:huancai/index.html', 18, 'floor1_brand5', 'ad_pic', 25, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand5.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(233, 'user:huancai/index.html', 19, 'floor1_brand6', 'ad_pic', 26, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand6.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(234, 'user:huancai/index.html', 20, 'floor1_brand7', 'ad_pic', 27, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand7.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(235, 'user:huancai/index.html', 21, 'floor1_brand8', 'ad_pic', 28, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand8.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(236, 'user:huancai/index.html', 7, 'tab_content4', 'upc_goods_show', 14, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"4";s:6:"column";s:1:"4";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}', 1392632839, NULL),
(280, 'user:huancai/gallery.html', 1, 'l_pics1', 'ad_pic', 8, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/lpic1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392190071, NULL),
(279, 'user:huancai/gallery.html', 0, 'l_hst', 'upc_hst', 7, '浏览过的商品', '', 'borders/border3.html', '', 'default.html', 'a:1:{s:3:"max";s:1:"3";}', 1392190071, NULL),
(238, 'user:huancai/index.html', 6, 'tab_content3', 'upc_goods_show', 13, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"4";s:6:"column";s:1:"4";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"5";}', 1392632839, NULL),
(239, 'user:huancai/index.html', 10, 'fl1_title', 'ad_pic', 17, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:28:"%THEME%/images/fl1_title.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(240, 'user:huancai/index.html', 9, 'banner1', 'ad_pic', 16, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:26:"%THEME%/images/banner1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(241, 'user:huancai/index.html', 11, 'fl1_hts', 'upc_other_menu', 18, '', '', '__none__', '', 'default.html', 'a:2:{s:14:"top_link_title";a:4:{i:0;s:12:"特产年货";i:1;s:6:"薯片";i:2;s:6:"坚果";i:3;s:6:"饮料";}s:12:"top_link_url";a:4:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";}}', 1392632839, NULL),
(242, 'user:huancai/index.html', 8, 'tab_content5', 'upc_goods_show', 15, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"4";s:6:"column";s:1:"4";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"3";}', 1392632839, NULL),
(247, 'user:huancai/block/shop_list.html', 0, 'shop_list', 'virtualcat', 13, '价格区间', 'rmb', 'borders/border2.html', '', 'default.html', 'a:12:{s:11:"page_devide";s:0:"";s:6:"devide";s:1:"2";s:22:"showCatChild_accordion";s:2:"on";s:23:"showCatgChild_accordion";s:3:"off";s:16:"showFx_accordion";s:3:"off";s:20:"fxDuration_accordion";s:3:"300";s:13:"virtualcat_id";s:0:"";s:18:"show_selected_node";s:2:"on";s:20:"showCatDepth_default";s:1:"2";s:22:"showCatDepth_accordion";s:1:"1";s:21:"showCatDepth_dropdown";s:1:"1";s:17:"showCatDepth_fold";s:1:"1";}', NULL, NULL),
(292, 'user:huancai/page.html', 1, 'l_hotsale', 'upc_goods_show', 8, '热销排行', '', 'borders/border3.html', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"1";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}', 1392259993, NULL),
(290, 'user:huancai/page.html', 0, 'nav', 'nav', 6, '', '', '__none__', '', 'default.html', 'a:0:{}', 1392259993, '*'),
(291, 'user:huancai/page.html', 0, 'l_article', 'treelist', 7, '帮助中心', '', 'borders/border3.html', '', 'default.html', 'a:2:{s:7:"treenum";s:1:"3";s:11:"treelistnum";s:2:"68";}', 1392259993, 'path'),
(246, 'user:huancai/block/shop_list.html', 0, 'shop_list', 'goodscat', 12, '', 'shop_list', 'borders/border6.html', '', 'default.html', 'a:9:{s:11:"page_devide";s:0:"";s:6:"devide";s:1:"3";s:22:"showCatChild_accordion";s:2:"on";s:23:"showCatgChild_accordion";s:3:"off";s:16:"showFx_accordion";s:3:"off";s:20:"fxDuration_accordion";s:3:"300";s:20:"showCatDepth_default";s:1:"3";s:22:"showCatDepth_accordion";s:1:"3";s:21:"showCatDepth_dropdown";s:1:"3";}', NULL, NULL),
(227, 'user:huancai/index.html', 1, 'weixin_title', 'upc_usercustom', 8, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:28:"官方微信 扫描得大奖";}', 1392632839, NULL),
(228, 'user:huancai/index.html', 2, 'weixin_pic', 'ad_pic', 9, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/weixin.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(229, 'user:huancai/index.html', 3, 'weixin_words', 'upc_usercustom', 10, '', '', '__none__', '', 'default.html', 'a:1:{s:10:"usercustom";s:54:"微信扫描二维码，更多电商资源轻松获取";}', 1392632839, NULL),
(230, 'user:huancai/index.html', 0, 's_focuspic', 'upc_slide', 7, '', '', '__none__', '', 'default.html', 'a:5:{s:5:"width";s:3:"200";s:6:"height";s:3:"224";s:12:"switcheffect";s:7:"scrollx";s:5:"flash";a:3:{i:0;a:3:{s:3:"pic";s:29:"%THEME%/images/s_focuspic.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"0";}i:1;a:3:{s:3:"pic";s:29:"%THEME%/images/s_focuspic.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"1";}i:2;a:3:{s:3:"pic";s:29:"%THEME%/images/s_focuspic.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"2";}}s:8:"autoplay";s:4:"true";}', 1392632839, NULL),
(226, 'user:huancai/index.html', 5, 'tab_content2', 'upc_goods_show', 12, '', '', '__none__', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"4";s:6:"column";s:1:"4";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"8";}', 1392632839, NULL),
(219, 'user:huancai/index.html', 14, 'floor1_brand1', 'ad_pic', 21, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(220, 'user:huancai/index.html', 15, 'floor1_brand2', 'ad_pic', 22, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand2.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(221, 'user:huancai/index.html', 16, 'floor1_brand3', 'ad_pic', 23, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand3.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(222, 'user:huancai/index.html', 17, 'floor1_brand4', 'ad_pic', 24, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand4.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(224, 'user:huancai/index.html', 12, 'hot_sale', 'upc_goods_show', 19, '热销排行', '', 'borders/border1.html', '', 'ranklist.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"1";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"1";s:12:"gname_row_lh";s:2:"38";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"8";}', 1392632839, NULL),
(218, 'user:huancai/index.html', 13, 'floor1_focus', 'upc_slide', 20, '', '', '__none__', '', 'default.html', 'a:5:{s:5:"width";s:3:"584";s:6:"height";s:3:"289";s:12:"switcheffect";s:7:"scrollx";s:5:"flash";a:3:{i:0;a:3:{s:3:"pic";s:25:"%THEME%/images/focus2.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"0";}i:1;a:3:{s:3:"pic";s:25:"%THEME%/images/focus2.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"1";}i:2;a:3:{s:3:"pic";s:25:"%THEME%/images/focus2.jpg";s:4:"link";s:0:"";s:1:"i";s:1:"2";}}s:8:"autoplay";s:4:"true";}', 1392632839, NULL),
(217, 'user:huancai/index.html', 29, 'floor2_brand3', 'ad_pic', 36, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand3.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(216, 'user:huancai/index.html', 28, 'floor2_brand2', 'ad_pic', 35, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand2.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(215, 'user:huancai/index.html', 27, 'floor2_brand1', 'ad_pic', 34, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:25:"%THEME%/images/brand1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(213, 'user:huancai/index.html', 24, 'fl2_hts', 'upc_other_menu', 31, '', '', '__none__', '', 'default.html', 'a:2:{s:14:"top_link_title";a:4:{i:0;s:12:"特产年货";i:1;s:6:"薯片";i:2;s:6:"坚果";i:3;s:6:"饮料";}s:12:"top_link_url";a:4:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";}}', 1392632839, NULL);
INSERT INTO `sdb_widgets_set` (`widgets_id`, `base_file`, `base_slot`, `base_id`, `widgets_type`, `widgets_order`, `title`, `domid`, `border`, `classname`, `tpl`, `params`, `modified`, `vary`) VALUES
(214, 'user:huancai/index.html', 23, 'fl2_title', 'ad_pic', 30, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:28:"%THEME%/images/fl2_title.jpg";s:11:"ad_pic_link";s:0:"";}', 1392632839, NULL),
(282, 'user:huancai/block/header.html', 3, 'category', 'upc_ducegoodscat', 4, '', '', '__none__', '', 'ducedropdown2.html', 'a:14:{s:13:"show_treetype";s:1:"0";s:11:"page_devide";s:0:"";s:6:"devide";s:1:"1";s:6:"style2";a:10:{s:5:"color";s:4:"#FFF";s:6:"hcolor";s:4:"#C00";s:8:"hbgcolor";s:4:"#FFF";s:9:"overcolor";s:4:"#FFF";s:8:"fbgcolor";s:4:"#FFF";s:8:"fbdcolor";s:4:"#C00";s:6:"fcolor";s:4:"#333";s:7:"fhcolor";s:4:"#FFF";s:5:"width";s:3:"150";s:9:"fhbgcolor";s:4:"#C00";}s:5:"style";a:10:{s:8:"outcolor";s:4:"none";s:7:"padding";s:2:"16";s:7:"bdcolor";s:7:"#DADBE6";s:7:"floatbg";s:4:"#FFF";s:6:"floatw";s:3:"545";s:6:"column";s:1:"3";s:7:"ftcolor";s:4:"#666";s:5:"front";s:4:"#C00";s:6:"hcolor";s:4:"#C00";s:7:"hbcolor";s:4:"#EEE";}s:2:"li";a:2:{s:4:"span";s:12:"功能分类";s:5:"brand";s:12:"品牌分类";}s:9:"cachelife";s:3:"900";s:9:"showbrand";s:1:"1";s:13:"ducedropdown2";s:1:"1";s:14:"show_virtualid";s:0:"";s:13:"show_treenode";s:2:"on";s:20:"showCatDepth_default";s:1:"1";s:22:"ducedropdown1_CatDepth";s:1:"3";s:22:"ducedropdown2_CatDepth";s:1:"3";}', 1392632839, NULL),
(283, 'user:huancai/product.html', 0, 'nav', 'nav', 5, '', '', '__none__', '', 'default.html', 'a:0:{}', 1392092287, '*'),
(284, 'user:huancai/product.html', 0, 'recommend', 'upc_goods_show', 6, '相关推荐', '', 'borders/border3.html', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"3";s:6:"column";s:1:"1";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}', 1392092287, NULL),
(285, 'user:huancai/product.html', 1, 'p_ranking', 'upc_goods_show', 7, '热销排行', '', 'borders/border3.html', '', 'default.html', 'a:34:{s:9:"pricefrom";s:0:"";s:7:"priceto";s:0:"";s:10:"searchname";s:0:"";s:8:"g_filter";s:75:"pricefrom=&priceto=&searchname=&cat_id[]=_ANY_&brand_id[]=_ANY_&tag[]=_ANY_";s:5:"limit";s:1:"5";s:6:"column";s:1:"1";s:12:"showGoodsImg";s:2:"on";s:13:"goodsImgWidth";s:0:"";s:14:"goodsImgHeight";s:0:"";s:13:"showGoodsName";s:2:"on";s:20:"gname_row_max_length";s:1:"2";s:12:"gname_row_lh";s:2:"20";s:16:"gname_max_length";s:2:"50";s:17:"showGoodsMktPrice";s:3:"off";s:12:"mktPriceText";s:9:"市场价";s:11:"mktPriceSep";s:1:":";s:14:"showGoodsPrice";s:2:"on";s:9:"priceText";s:9:"销售价";s:8:"priceSep";s:1:":";s:13:"showGoodsSave";s:3:"off";s:8:"saveText";s:6:"节省";s:7:"saveSep";s:1:":";s:9:"showCount";s:3:"off";s:9:"countText";s:9:"折扣：";s:8:"countSep";s:1:"%";s:13:"showGoodsDesc";s:3:"off";s:20:"gdesc_row_max_length";s:1:"2";s:12:"gdesc_row_lh";s:2:"18";s:15:"desc_max_length";s:3:"200";s:8:"showMore";s:3:"off";s:6:"cat_id";a:1:{i:0;s:5:"_ANY_";}s:8:"brand_id";a:1:{i:0;s:5:"_ANY_";}s:3:"tag";a:1:{i:0;s:5:"_ANY_";}s:13:"goods_orderby";s:1:"0";}', 1392092287, NULL),
(286, 'user:huancai/product.html', 2, 'p_ads1', 'ad_pic', 8, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/lpic1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392092287, NULL),
(287, 'user:huancai/product.html', 3, 'p_ads2', 'ad_pic', 9, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/lpic2.jpg";s:11:"ad_pic_link";s:0:"";}', 1392092287, NULL),
(288, 'user:huancai/block/header.html', 2, 'cart', 'upc_topbar', 3, '', '', '__none__', '', 'default.html', 'a:0:{}', 1392632839, '*'),
(289, 'user:huancai/gallery.html', 3, 'g_focus', 'ad_pic', 10, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:26:"%THEME%/images/g_focus.jpg";s:11:"ad_pic_link";s:0:"";}', 1392190071, NULL),
(293, 'user:huancai/page.html', 2, 'l_pics1', 'ad_pic', 9, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/lpic1.jpg";s:11:"ad_pic_link";s:0:"";}', 1392259993, NULL),
(294, 'user:huancai/page.html', 3, 'l_pics2', 'ad_pic', 10, '', '', '__none__', '', 'default.html', 'a:4:{s:12:"ad_pic_width";s:0:"";s:13:"ad_pic_height";s:0:"";s:6:"ad_pic";s:24:"%THEME%/images/lpic2.jpg";s:11:"ad_pic_link";s:0:"";}', 1392259993, NULL),
(295, 'user:huancai/default.html', 0, 'nav', 'nav', 6, '', '', '__none__', '', 'default.html', 'a:0:{}', 1392279700, '*');
