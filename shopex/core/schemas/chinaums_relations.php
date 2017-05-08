<?php
$db['chinaums_relations'] = array (
  'columns' =>
  array(
      'relations_id' => 
      array (
        'type' => 'int unsigned',
        'required' => true,
        'pkey' => true,
        'extra' => 'auto_increment',
        'editable' => false,
      ),
      'order_id' => 
      array (
        'type' => 'bigint unsigned',
        'required' => true,
        'default' => '0',
      ),
      's_data' => 
      array (
        'type' => 'text',
        'default' => null,
      ),
      'last_send_time' =>
      array(
          'type' => 'int(11)',
          'default' => 0,
          'required' => true,
          'editable' => false,
      ),
    ),
    'index' =>
    array(
        'ind_order_id' => 
        array (
            'columns' =>
             array (
                 0 => 'order_id',
             ),
        ),
    ),
);
?>
