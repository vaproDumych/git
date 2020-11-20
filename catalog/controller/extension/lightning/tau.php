<?php require_once"beta.php";require_once"special.php";$tests[]='light_test_index_php';function light_test_index_php(){$Mbs=substr(DIR_SYSTEM,0,-7)."index.php";$Mkb="extension/lightning/gamma.php";$Mdt=file_get_contents($Mbs);$should=false;$bad=!strpos($Mdt,$Mkb);if($bad){$Maf=strpos($Mdt,"index.php");$Maf=strpos($Mdt,"}",$Maf+1);if($Maf){$Maf++;$should=substr($Mdt,0,$Maf)."\n\n<font color='red'>if (file_exists(".'$'."li"." = DIR_APPLICATION.'/controller/extension/lightning/gamma.php')) require_once(".'$'."li"."); //Lightning</font>".substr($Mdt,$Maf);$should=str_replace("<?","&lt;?",$should);}}
return Wb('index_php',$bad,$should);}
$tests[]='light_test_robots_txt';function Whh(){if(file_exists(substr(DIR_SYSTEM,0,-7)."no_robots.txt"))return false;$Mtq=substr(DIR_SYSTEM,0,-7)."robots.txt";$insert="\n# === Lightning code start\nDisallow: /*li_op=\nDisallow: /*tag=\nDisallow: /*search=\nDisallow: /*manufacturer_id=\nDisallow: /*sort=\nDisallow: /*order=\nDisallow: /*limit=\nDisallow: /*filter_name=\nDisallow: /*filter_sub_category=\nDisallow: /*filter_description=\n# === Lightning code end\n";if(!file_exists($Mtq))return"User-agent: *".$insert;$Mdt=file_get_contents($Mtq);$Mpi=true;$bad="# === Lightning code start\nUser-agent: *\nDisallow: /*li_op=\nDisallow: /*tag=\nDisallow: /*search=\nDisallow: /*manufacturer_id=\nDisallow: /*sort=\nDisallow: /*order=\nDisallow: /*limit=\nDisallow: /*filter_name=\nDisallow: /*filter_sub_category=\nDisallow: /*filter_description=\n# === Lightning code end";if(strpos($Mdt,$bad)!==false){$Mdt=str_replace($bad,'',$Mdt);$Mpi=false;}
$sections=explode("User-agent:",$Mdt);if(count($sections)<2)return"User-agent: *".$insert.$Mdt;foreach($sections as$Mcb=>&$section){if(!$Mcb)continue;if(strpos($section,"li_op"))continue;$Mpi=false;$Maf=strpos($section,"\n");$section=substr($section,0,$Maf).$insert.substr($section,$Maf);}
if($Mpi)return false;return implode("User-agent:",$sections);}
function light_test_robots_txt(){$Mum=Whh();return Wb('robots_txt',$Mum!==false,$Mum);}
$tests[]='light_test_https';function light_test_https(){$Mlm=false;if(light_get_setting("config_secure")){if(!strpos(HTTP_SERVER,"ttps:")or!strpos(HTTPS_SERVER,"ttps:"))$Mlm=true;}
return Wb("https",$Mlm,array("http"=>HTTP_SERVER,"https"=>HTTPS_SERVER));}
$tests[]='light_test_cron';function light_test_cron(){global$Mwa;$cron=false;if(file_exists(DIR_CACHE."lightning/"."cron_working"))$cron=@filemtime(DIR_CACHE."lightning/"."cron_working")>time()-15*60;if(!$cron)for($Mcb=0;$Mcb<10;$Mcb++)if("ping"!==$Mbm=Wkc(HTTP_SERVER."index.php?li_op=ping")){if(!trim($Mbm)){global$Mdf;$Mbm="Код ошибки HTTP: ".$Mdf;}
return Wb("cron",true,array("key"=>"cron","response"=>$Mbm))+$Mwa;}
if($cron){$M_j=DIR_CACHE."lightning/".'gz';$check_save_file=DIR_CACHE."lightning/".'cron_check_save';$Mbm=false;if(file_exists($M_j)&&(file_get_contents($M_j)=="DONE"||filemtime($M_j)<time()-20*60)){$Mbm=file_get_contents($M_j);file_put_contents($check_save_file,$Mbm);}
else if(file_exists($check_save_file))$Mbm=file_get_contents($check_save_file);if($Mbm&&$Mbm!="DONE"){if(substr($Mbm,0,7)=="FAULT: ")$Mbq=array("key"=>"cron","response"=>substr($Mbm,7));else$Mbq=array("key"=>"cron","kill_time"=>$Mbm);return Wb("cron",true,$Mbq)+$Mwa;}}
$Map=getcwd()."/catalog/controller/extension/lightning/cron.php";return Wb("cron",!$cron,array("key"=>"cron","line"=>PHP_BINDIR."/php -f ".$Map))+(!$cron*$Mwa);}
$tests[]='light_test_image_optimization';function light_test_image_optimization(){$Mtu=DIR_IMAGE."catalog/lightning_optimized_data";if(file_exists($Mtu)&&filemtime($Mtu)>time()-60*30)return Wb('image_optimization',false);require_once"optima.php";if(optimizers_ready())return Wb('image_optimization',false);$Map=getcwd()."/catalog/controller/extension/lightning/lio";if(file_exists($Map)&&(fileperms($Map)&0777)!==0777){@chmod(getcwd()."/catalog/controller/extension/lightning",0755);@chmod($Map,0777);clearstatcache();if((fileperms($Map)&0777)!==0777)$Mbq["chmod"]=$Map;}
$Mbq["cron"]=$Map;if(defined("HTTP_CATALOG"))$Mbq["link"]=HTTP_CATALOG;else$Mbq["link"]=HTTP_SERVER;$Mbq["link"].="index.php?li_op=t&op=image_check";return Wb('image_optimization',true,$Mbq);}
$tests[]='light_test_php7';function light_test_php7(){return Wb('php7',phpversion()<7);}
$tests[]='light_test_php_acceleration';function light_test_php_acceleration(){$opcache=(extension_loaded('apc')&&ini_get('apc.enabled'))||(extension_loaded('apcu')&&ini_get('apc.enabled'))||((extension_loaded('opcache')or extension_loaded('Zend OPcache'))&&ini_get('opcache.enable'))||(extension_loaded('eaccelerator')&&ini_get('eaccelerator.enable'))||(extension_loaded("xcache"));return Wb('php_acceleration',!$opcache,phpversion());}
$tests[]='light_test_http2';function light_test_http2(){global$single_test;if(!$single_test&&too_early())return true;$conn="http";if(strpos(HTTP_SERVER,"ttps:")||(light_get_setting("config_secure")&&strpos(HTTPS_SERVER,"ttps:")))$conn="https";$Mbe=substr(HTTP_SERVER,strpos(HTTP_SERVER,"://")+3,-1);$Mho=curl_init("http://lightning.devs.mx/service/protocol.php?h=1&url=".$Mbe);curl_setopt($Mho,CURLOPT_RETURNTRANSFER,1);curl_setopt($Mho,CURLOPT_TIMEOUT,10);curl_setopt($Mho,CURLOPT_CONNECTTIMEOUT,10);$Mhp=curl_exec($Mho);$headers=array();$heads=explode("\n",substr($Mhp,strpos($Mhp,"\n")+1));$Mhp=substr($Mhp,0,strpos($Mhp,"\n"));foreach($heads as$h){$Maf=strpos($h,':');if(!$Maf)continue;$headers[strtolower(trim(substr($h,0,$Maf)))]=trim(substr($h,$Maf+1));}
Wb('mod_pagespeed',!empty($headers["x-mod-pagespeed"])or!empty($headers["x-page-speed"]));Wb('varnish',!empty($headers["x-varnish"]));Wb('keep_alive',!empty($headers["connection"])&&strtolower($headers["connection"])=="close");$Mpr="";if(!empty($headers["server"]))$Mpr=$headers["server"];$Mwe=false;if($Mhp=="NOCERT")$Mwe="nocert";elseif($conn=="http"&&substr($Mhp,0,4)=="HTTP")$Mwe=array("gossl","http"=>HTTP_SERVER,"https"=>HTTPS_SERVER);elseif($Mhp=="HTTP/1.1")$Mwe="https";elseif($Mhp=="HTTP/2")$Mwe="http2";if(strpos($Mpr,' '))$Mpr=substr($Mpr,0,strpos($Mpr,' '));if($Mwe&&!is_array($Mwe))$Mwe.=" ".$Mpr;Wb('http2',!empty($Mwe),$Mwe,true);$pusher=DIR_CACHE."lightning/".'fv';if($Mwe){if(file_exists($pusher))@unlink($pusher);global$Mwa;if($Mwa)return 2;return true;}else{file_put_contents($pusher,'');return false;}}
function too_early(){global$too_early_answer;if(is_null($too_early_answer))return false;if($too_early_answer!=="?")return$too_early_answer;$Map=DIR_CACHE."lightning/".'x24';if(!file_exists($Map)or filemtime($Map)<time()-24*60*60){file_put_contents($Map,'');return$too_early_answer=false;}
return$too_early_answer=true;}
function light_get_setting($Maz){global$db;if(!$db){require_once"beta.php";$db=Ws();}
$Mlm=$db->query("SELECT value FROM ".DB_PREFIX."setting WHERE `key`='$Maz' AND store_id=0")->row;if(!$Mlm)return false;return$Mlm["value"];}
function Wdy(){global$tests,$too_early_answer;$too_early_answer="?";foreach($tests as$Mfz)$Mfz();Wdw();}
function Wc($Mld){global$single_test;$single_test=true;$Mji="light_test_".$Mld;if(!function_exists($Mji))return true;$Mlm=$Mji();if($Mlm===2)return 2;return!$Mji();}