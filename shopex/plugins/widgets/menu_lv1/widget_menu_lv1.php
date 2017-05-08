<?php
function widget_menu_lv1($setting,&$system){
    $sitemap = &$system->loadModel('content/sitemap');
    $res = $sitemap->getMap(1);
    foreach($res as $k=>$v){
        if('true' === $v['hidden']){
            unset($res[$k]);
        }
    }
    $i = 0;
    $result = array();
    foreach($res as $k=>$v){
        $result[$i] = $v;
        $i++;
    }
    $setting['max_leng']=$setting['max_leng']?$setting['max_leng']:7;
    $setting['showinfo']=$setting['showinfo']?$setting['showinfo']:"更多";
    
    return $result;
}
