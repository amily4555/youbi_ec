<?php

class cache_nocache extends cachemgr{
    function set($key,$value,$varys=NULL){return true;}
    function get($key,&$value){return false;}
    function setModified($key){;}
    function status(){;}
    function clear(){;}
    function &exec($func,$args,$ttl=3600){;}
    function fetch(){return false;}
    function store(){return false;}
}
