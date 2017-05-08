<?php
class UpgradeScript extends Upgrade{
    
    var $noticeMsg = array();
    
    //重新编辑config 2013-05-09 by Fuxiudong
    function upgrade_EditConfig(){
        //备份config.php文件
        $conf_file = BASE_DIR.'config/config.php';
        $conf_file_bk = BASE_DIR.'config/config_bk_'.date('Y-m-d',time()).'.php';
        //如果config.php 文件存在 则备份config.php文件
        if(!is_file($conf_file) || !touch($conf_file_bk) || !copy($conf_file,$conf_file_bk) ) exit("备份config.php文件失败!");
        
        $conf_sample_file = BASE_DIR.'config/config.sample.php';
        if( !is_file($conf_sample_file) ) return 'error';
        if(!is_writable($conf_sample_file) )  chmod($conf_sample_file,777);
        if(!is_writable($conf_file) )  chmod($conf_file,777);
        $file_handle = fopen($conf_sample_file,'r');
        //重新组织config.php中的内容
        while(!feof($file_handle)){
            $line = trim(fgets($file_handle));
            //if(!$line) continue;
            if( strpos($line,'DB_USER') ){
                $content .= str_replace('usernamehere',DB_USER,$line);
            }elseif( strpos($line,'DB_PASSWORD') ){
                $content .= str_replace('yourpasswordhere',DB_PASSWORD,$line);
            }elseif( strpos($line,'DB_NAME') ){
                $content .= str_replace('putyourdbnamehere',DB_NAME,$line);
            }elseif( strpos($line,'DB_HOST') ){
                $content .= str_replace('localhost',DB_HOST,$line);
            }elseif( strpos($line,'STORE_KEY') ){
                $content .= "define('STORE_KEY', '".STORE_KEY."');";
            }elseif( strpos($line,'DB_PREFIX') ){
                $content .= str_replace('sdb_',DB_PREFIX,$line);
            }else{
                $content .= $line;
            }
            $content .= chr(10);  //换行
        }
        fclose($file_handle);
        //将组织好的内容写入config.php文件
        file_put_contents($conf_file,$content);
        unset($content);
        
        return 'finish';
    }
    
    //自动校验数据库 2013-05-10 by Fuxiudong
    function upgrade_checkDB(){
        //校验数据库
        $schema = &$this->system->loadModel('utility/schemas');
        $ret = array();
        $db = &$this->system->database();
        $dbtables = $schema->get_system_schemas();
        foreach($dbtables as $tbname=>$struct){
            if($diff = $schema->diff($tbname,$struct)){
                //$ret[$db->prefix.$tbname] = $diff;
                foreach($diff as $sql){
                    if( strpos($sql,'msgqueue')){
                        $db->exec('ALTER TABLE `sdb_msgqueue` DROP INDEX `ind_message`');
                    }
                    $db->exec($sql);
                }
            }
        }
        return 'finish';
    }
    
    //更新地区 2013-05-10 by Fuxiudong
    function upgrade_regions(){
        $this->db = $this->system->database();
        $file = dirname(__FILE__)."/76988/area.txt";  //最新地区文件
        if( is_file($file) ){
            $file_handle = fopen($file,'r');
            //取得最后一条数据的ID 
            $id_nums = $this->db->selectrow("SELECT region_id FROM sdb_regions ORDER BY region_id DESC");
            $i = $count = $id_nums['region_id']+1; //从最后一条+1的位置开始插入
            $sql = "INSERT INTO `sdb_regions` (`region_id`, `package`, `p_region_id`,`region_path`,`region_grade`, `local_name`, `en_name`, `p_1`, `p_2`) VALUES ";
            //取得数据库中现有的全部一级地区
            $p1 = $this->db->select("SELECT region_id,local_name FROM sdb_regions WHERE region_grade=1 AND package='mainland'");
            while( !feof($file_handle) ){
                $line = trim(fgets($file_handle)); //一次取一行
                if(!$line) continue;
                
                //筛选一级地区
                if( '::' == substr($line,-2) ){
                    list($province) = explode('::',$line); //省
                    $a = 0;
                    foreach($p1 as $k=>$v){
                        if( (false !== strpos($province,$v['local_name'])) || (false !== strpos($v['local_name'],$province)) )
                        { 
                            //如果一级地区已存在 则取出对应的二级地区
                            $f_pid_1 = $v['region_id']; //记录p_id
                            $region_path_1 = ",".$v['region_id'].",";
                            //取得全部二级地区
                            $p2 = $this->db->select("SELECT region_id,local_name FROM sdb_regions WHERE region_grade=2 AND package='mainland' AND p_region_id={$f_pid_1}");
                            $a++;
                        }
                    }
                    //一级地区不存在 插入到数据库
                    if($a <= 0){
                        $i++;
                        $region_path_1 = ",".$i.",";
                        $aSql = array();
                        $aSql[] = "(".$i.", 'mainland', NULL, '".$region_path_1."', '1', '".$province."', NULL, NULL, NULL)";
                        $f_pid_1 = $i;
                    }
                }else{
                    if( strstr($line, ':') ){ //二级地区
                        list($city,$county) = explode(':',$line); 
                        $city = trim($city); //市
                        $county = trim($county); //区/县
                        
                        if($city){
                            if( $p2 && is_array($p2) ){
                                $b = 0;
                                foreach($p2 as $k2=>$v2){
                                    if( (false !== strpos($city,$v2['local_name'])) || (false !== strpos($v2['local_name'],$city)) ){
                                        $region_path_2 = $region_path_1.$v2['region_id'].',';
                                        $f_pid_2 = $v2['region_id'];
                                        
                                        //获取已有的三级地区
                                        $p3 = $this->db->select("SELECT region_id,local_name FROM sdb_regions WHERE region_grade=3 AND package='mainland' AND p_region_id={$f_pid_2}");
                                        $b++;
                                    }
                                }
                                //二级地区不存在执行插入
                                if($b <= 0 ){
                                    $i++;
                                    $region_path_2 = $region_path_1.$i.',';
                                    $f_pid_2 = $i;
                                    $aSql[] = "(".$i.", 'mainland', ".intval($f_pid_1).", '".$region_path_2."', '2', '".$city."', NULL, NULL, NULL)";
                                }
                            }else{ //一级地区是新增的时走这里
                                $i++;
                                $region_path_2 = $region_path_1.$i.',';
                                $f_pid_2 = $i;
                                $aSql[] = "(".$i.", 'mainland', ".intval($f_pid_1).", '".$region_path_2."', '2', '".$city."', NULL, NULL, NULL)";
                            }
                        }
                        
                        //三级地区
                        if($county){
                            $aTmp = (array)explode(',',$county);
                            if( $p3 && is_array($p3) ){
                                foreach($p3 as $k3=>$v3){
                                    foreach($aTmp as $k=>$v){
                                        if( false !== strpos($v3['local_name'],$v) ||  (false !== strpos($v,$v3['local_name'])) ){
                                            unset($aTmp[$k]);
                                        }
                                    }
                                }
                                //已存在二级地区中新增三级地区走这里，比如:其它
                                if($aTmp){
                                    foreach($aTmp as $ka=>$va){
                                        $i++;
                                        $region_path_3 = $region_path_2.$i.',';
                                        $aSql[] = "(".$i.", 'mainland', ".intval($f_pid_2).", '".$region_path_3."', '3', '".$va."', NULL, NULL, NULL)";
                                        unset($region_path_3);
                                    }
                                    unset($aTmp);
                                }
                            }else{
                                foreach($aTmp as $k3=>$v3){
                                    $i++;
                                    $region_path_3 = $region_path_2.$i.",";
                                    $aSql[] = "(".$i.", 'mainland', ".intval($f_pid_2).", '".$region_path_3."','3','".$v3."', NULL, NULL, NULL)";
                                    unset($region_path_3);
                                }
                                unset($aTmp);
                            }
                        }
                    }
                } 
                
                //执行入库
                if($aSql){
                    $sqlInsert = $sql.implode(',', $aSql).";";
                    $this->db->exec($sqlInsert);
                    unset($aSql);
                }
            }
            fclose($handle);
            $add_count = $i - $count; //计算插入总条数
            //exit('地区更新成功! 新增地区'.$add_count.'条');
            return 'finish';
        }else{
            //exit('地区文件不存在,请检查!');
            return 'error';
        }
    }
}

?>