<?php
/**
* @table gnotify;
*
* @package Schemas
* @version $
* @copyright 2003-2009 ShopEx
* @license Commercial
*/

$db['bind']=array (
  'columns' =>
  array (
    'bind_id' =>
    array (
      'type' => 'number',
      'required' => true,
      'pkey' => true,
      'extra' => 'auto_increment',
      'comment' => __('绑定id'),
    ),
    'name' =>
    array (
      'type' => 'varchar(200)',
      'comment' => __('绑定类型名称'),
    ),
    'node_id' =>
    array (
      'type' => 'varchar(20)',
      'comment' => __('来源node_id'),
    ),
    'node_type' => array(
      'type' => 'varchar(128)',
    ),
    'status' =>
    array (
      'type' => array(
        'bind' => '绑定',
        'unbind' => '解绑',
      ),
      'comment' => __('绑定状态'),
    ),
    'creat_time' =>
    array (
      'type' => 'time',
      'comment' => __('绑定时间'),
    ),
    'last_modify' =>
    array (
      'type' => 'time',
      'comment' => __('最后修改时间'),
    ),
  ),
  'comment' => '绑定关系列表',
  'index' =>
  array (
    'ind_goods' =>
    array (
      'columns' =>
      array (
        0 => 'bind_id',
      ),
    ),
  ),
);