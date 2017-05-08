<?php
class ctl_matrix extends shopPage{
    function update_callback_status(){
        $_POST = array_merge($_POST,$_GET);
        if ( @constant( "DEBUG_API" ) ) {
           foreach ($_POST as $key=>$val) {
               $array_debug_info[] = $key."=".stripslashes($val);
           }
           $str_debug_info = implode("&", $array_debug_info);
           // _error_log(date("c")."\t".rawurldecode($str_debug_info)."\n".stripslashes(var_export($_POST,true))."\n\n",3,HOME_DIR."/logs/callback_api_".date("Y-m-d",time()).".log");
           unset($str_debug_info,$array_debug_info);
        }    
        $matrix = $this->system->loadModel('system/matrix');
        $params = $_POST;
        $params['date'] = $_POST['date'];
        $params['res'] = $_POST['res'];
        $params['msg_id'] = $_POST['msg_id'];
        $params['rsp'] = $_POST['rsp'];
        $params['type_id'] = $_GET['type_id'];
        $params['type'] = $_GET['type'];
        $params['data'] = $_POST['data'];
        //$sign = $matrix->get_matrix_sign($params);
        if($params['msg_id']&&$params['type']){
            // if( $array = $matrix->getCallbackType($params['method']) ){
                if($params['rsp']=='fail'){
                    $typeid = $params['type_id']?$params['type_id']:$matrix->getIdByMsgid($params['msg_id']);
                    $times = $matrix->checkCallbackCount($params['method'],$typeid);
                    $matrix->update_callback($params['msg_id'],$params,'false');
                }else{
                    $matrix->update_callback($params['msg_id'],$params);
                }
            // }
        }
    }
}