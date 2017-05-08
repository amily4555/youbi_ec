<?php
$db['sync_logs'] = array(
    'columns'=>array(
        'queue_id'=>array(
            'label' => __('队列ID'),
            'width' => 60,
            'type' =>'int',
            'required' => true,
            'pkey' => true,
            'extra'=>'auto_increment',
        ),
        'bind_type' => array(
            'label' => __('绑定类型'),
            'type' => array(
                'ecos.ome' => 'ERP',
                'taodali' => '淘打',
                'crm' => 'CRM',
            ),
            'filtertype' => 'normal',
            'filterdefalut' => true,
            'width' => 60,
        ),
        'entity_id'=> array(
            'label' => __('实体ID'),
            'width' => 120,
            'type' =>'varchar(50)',
            'filtertype'=>'normal',
            'filterdefalut'=>true,
        ),
        'entity_type'=> array(
            'label' => __('实体类型'),
            'width' => 60,
            'filtertype'=>'normal',
            'filterdefalut'=>true,
            'type'=>array(
                'order'=>'订单',
                'aftersale'=>'售后申请',
                'shipment'=>'发货单',
                'payment'=>'支付单',
                'refund'=>'退款单',
                'goods'=>'商品',
            ),
        ),
        'status'=> array(
            'label' => __('同步状态'),
            'width' => 80,
            'type'=>array(
                'ready'=>'准备',
                'locking'=>'锁定',
                'syncfail'=>'同步失败',
                'matrixreject'=>'被矩阵拒绝',
                'matrixhold'=>'数据在矩阵',
                'fail'=>'失败',
                'succ'=>'成功',
            ),
            'default' =>'ready',
            'filtertype'=>'normal',
            'filterdefalut'=>true,
        ),
        'message' => array(
            'label' => __('矩阵消息'),
            'width' => 110,
            'type' => 'text',
            'default' =>'',
        ),
        'msg_id' => array(
            'label' => __('msg_id号'),
            'width' => 110,
            'type' =>'varchar(75)',
            'default' =>'',
            'hidden'=>true,
        ),
        'apiname' => array (
            'label' => __('矩阵API'),
            'width' => 130,
            'type' => 'varchar(100)',
            'default' => '',
        ),
        'data' => array (
            'label' => __('输出消息'),
            'width' => 110,
            'type' => 'longtext',
            'default' => '',
            'hidden'=>true,
        ),
        'send_num'=> array (
            'label' => __('推送次数'),
            'width' => 60,
            'type' => 'smallint',
            'default' => '1',
        ),
        'log_create_time'=> array (
            'label' => __('日志时间'),
            'width' => 110,
            'type' => 'time',
            'default' => '0',
        ),
        'last_send_time'=> array (
            'label' => __('推送时间'),
            'width' => 110,
            'type' => 'time',
            'default' => '0',
        ),
        'disabled' => array (
            'type' => 'bool',
            'default' => 'false',
            'editable' => false,
            'hidden'=>true,
        ),
    ),
    'index'=>array(
        'entity_id'=>array(
            'columns'=>array(
                0=>'entity_id',
                1=>'entity_type',
            ),
        ),
        'log_create_time'=>array(
            'columns'=>array(
                0=>'log_create_time',
            ),
        ),
    ),
);
