<?php function Wiy(&$Mrl){$GLOBALS['Wiy']=&$Mrl;}
function Wiz($Mkq,$Meu=''){$GLOBALS['Wiy']=Wau($Mkq,$Meu,$GLOBALS['Wiy']);}
function Wkk(&$Myn,$Mkq,$Meu=''){$Myn=Wau($Mkq,$Meu,$Myn);}
function Wij($Mxs,$Myo){global$Myp,$Myq,$Myr,$Mys,$Mxr,$Myt,$Myu,$Myv,$db_santa_active;$Myu=false;if(lc('ho')||$db_santa_active||empty($Myo)||file_exists(DIR_APPLICATION."model/extension/module/mega_filter.php")||(!empty($Myo["sort"])and in_array($Myo["sort"],explode(' ',"p.viewed random sales")))||(empty($Myo["start"])&&$Myo["limit"]<12)){$Myq=-1;return 0;}
unset($Myo["preset"]);$Myq=false;if(!empty($Myo["price"])){if($Myo["price"]["max"]<100000000&&($Myo["price"]["min"]||$Myo["price"]["max"]))$Myq=$Myo["price"];unset($Myo["price"]);}
$Myr=false;$Mys=0;if(!empty($Myo["limit"])){$Myr=$Myo["limit"];unset($Myo["limit"]);if(!empty($Myo["start"]))$Mys=(int)$Myo["start"];if($Mys<0)$Mys=0;unset($Myo["start"]);}
if($Myo!=$Myp){$Myv=DB_PREFIX."lightning_t".substr(md5(serialize($Myo)),0,16);if($Myu&&Wdd("SHOW TABLES LIKE '$Myv'"))$Myp=$Myo;else{global$Myw;Wkk($Myv,"lightning_t","light_temp_");if(isset($Myw[$Myv]))$Myp=$Myo;}}
if($Myo===$Myp){if($Mxr)return array();$Mpl='';if($Myq)$Mpl=" WHERE full_price ".$Mxs->lightning_between($Myq);if(!empty($Myr))$Mpl.=" LIMIT $Mys, $Myr";return Wdd("SELECT * FROM $Myv".$Mpl);}
$Myt=microtime(true);$Myp=$Myo;return 0;}
function Wjg(&$Mhj){$Mhj=str_replace("`"," ",$Mhj);$Mhj=trim(preg_replace('/\s+/',' ',$Mhj));}
function Wik($Mxs,$Mhj){global$Myp,$Myq,$Mxr,$Myr,$Mys,$Myu,$Myv;if($Myq===-1){global$db;return$db->query($Mhj)->rows;}
Wjg($Mhj);Wiy($Mhj);if(!empty($Myp["limit"]))$Mhj=Wcz(""," LIMIT",$Mhj);if(!empty($Myq)){$Myx=$Mxs->lightning_between($Myq);Wiz("AND COALESCE( ( SELECT price*$Myx");}
if(strpos($Mhj,"BETWEEN"))Wiz("AND COALESCE( ( SELECT price*GROUP BY","GROUP BY");Wiz("( SELECT price*special,","COALESCE( ( SELECT price FROM ".DB_PREFIX."product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '1' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1 ) , ( SELECT price FROM ".DB_PREFIX."product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '1' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1 ), p.price) AS full_price,");Wiz("(CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)","full_price");$Myy=Wc_("customer")->getGroupId();if($Myy>1)Wiz("ps.customer_group_id = '1'","ps.customer_group_id = '$Myy'");Wiz("( SELECT AVG(rating)*rating,");Wiz("ORDER BY rating","ORDER BY ( SELECT AVG(rating) total FROM ".DB_PREFIX."review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id )");if(empty($Myp["sort"])||$Myp["sort"]!=="viewed")Wiz(", p.viewed");if(!empty($Myr))$Mhj=Wcz("","LIMIT ",$Mhj);$Mhj="CREATE TEMPORARY TABLE $Myv (KEY product_id(product_id), KEY full_price(full_price)) ".$Mhj;light_optimize_query($Mhj);Wdd($Mhj);global$Myt,$Myz,$Myw;$Myw[$Myv]=1;$Myt=microtime(true)-$Myt;$Myz+=$Myt;if($Myu&&$Myt>0.9){$My_=DB_PREFIX."lightning_t".substr(md5(serialize($Myp)),0,16);Wdd("CREATE TABLE $My_ (KEY product_id(product_id), KEY full_price(full_price)) SELECT * FROM $Myv");}
if($Mxr)return array();$Mpl='';if($Myq)$Mpl=" WHERE full_price ".$Myx;if(!empty($Myr))$Mpl.=" LIMIT $Mys, $Myr";return Wdd("SELECT * FROM $Myv".$Mpl);}
function Wil($Mxs){global$Mxr,$db_santa_active;if(lc('ho')||$db_santa_active)return false;$Myo=$Mxs->getFilterData();if(empty($Myo)||file_exists(DIR_APPLICATION."model/extension/module/mega_filter.php")||(!empty($Myo["sort"])and in_array($Myo["sort"],explode(' ',"p.viewed random sales")))||(empty($Myo["start"])&&$Myo["limit"]<12))return false;$Mxr=1;$Mxs->getProductIds();$Mxr=0;global$Myv;if(!$Myv)return false;return true;}
function Wjc($Mxs,$Mza=0,$Myo=null,$M_n=0){if(!lc('cj'))return-1;global$Mjq,$Mzb,$Myz,$Mam,$Mjd,$Mzc;if(!$Myo)$Myo=$Mxs->getFilterData();if($Mza===0){$Mjh=debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS,2+$M_n);$Mza=$Mjh[1+$M_n]["function"];}
$Mzc=false;if($Mza=="getTags"){$Mzc=true;unset($Myo["price"]);}
unset($Myo["preset"]);$Mzb="ModelJournal3Filter->$Mza ".str_replace(array(",",":"),array(", ",": "),str_replace(str_split("[]{}\""),'',json_encode($Myo)));$Mfs=$Mxs->config->get('bf');if($Mfs)$Mzb="$Mfs $Mzb";$Mhp=Wbd("beta",$Mzb);if($Mhp!==false&&Wc_('db')->db->Wbx("FROM ".DB_PREFIX."product ",$Mjq)){if($Mam)$Mjd[]=array('Mhj'=>$Mzb,'cr'=>$Mjq,'Mbt'=>0,'Mjv'=>Wce());$Mhp=unserialize($Mhp);if($Mza=="getPriceRange")$Mhp=array("min"=>floor($Mxs->applyTax($Mhp["min"])),"max"=>ceil($Mxs->applyTax($Mhp["max"])),);global$Mg_;$Mg_++;return$Mhp;}
$Myz=microtime(true);return-1;}
function Wjf(&$Mhp,$Mza=0,$M_n=0){global$Myz,$Myt,$Mzb,$Mzc;if($Mzb&&lc('cj')&&(microtime(true)-$Myz+$Myt>0.1||$Mzc)){if($Mza===0){$Mjh=debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS,2+$M_n);$Mza=$Mjh[1+$M_n]["function"];}
if(!strpos($Mzb,$Mza))return;Wbb("beta",$Mzb,serialize($Mhp));}}
function Win($Mxs){$Mhp=Wjc($Mxs,"getTotalProducts");if($Mhp!=-1)return$Mhp;if(!Wil($Mxs))return-1;global$Myq;$Mpl='';if($Myq)$Mpl=" WHERE full_price ".$Mxs->lightning_between($Myq);global$Myv;$Mhp=Wc_("db")->query("SELECT count(*) AS total FROM $Myv".$Mpl)->row["total"];Wjf($Mhp,"getTotalProducts");return$Mhp;}
function Wio($Mxs,&$Mhj,$M_n=0){$Mjh=debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS,2+$M_n);$Myj=$Mjh[1+$M_n]["function"];global$Myp;if($Myj=="getCategories"){if(!empty($Myp["filter_category_id"])or!empty($Myp["categories"]))return false;}
if($Myj=="getManufacturers"){if(!empty($Myp["filter_manufacturer_id"])or!empty($Myp["manufacturers"]))return false;}
if($Myj=="getAttributes"){if(!empty($Myp["attributes"]))return false;}
if($Myj=="getOptions"){if(!empty($Myp["options"]))return false;}
if($Myj=="getFilters"){if(!empty($Myp["filters"]))return false;}
if(!Wil($Mxs))return false;Wiy($Mhj);global$Myq,$Myv;if($Myj=="getPriceRange")Wiz("MIN(COALESCE(*AS max","MIN(full_price) AS min, MAX(full_price) AS max");if(!strpos(str_replace("p.product_id =",'',$Mhj),"p.")){Wiz("LEFT JOIN `".DB_PREFIX."product`","JOIN ".$Myv);Wiz("`".DB_PREFIX."product`",$Myv);}
else$Mhj.=" JOIN $Myv lt ON (lt.product_id = p.product_id)";if($Myj=="getPriceRange")return true;if($Myj=="getTags")$Mhj.=" JOIN `".DB_PREFIX."product_description` pd ON (p.product_id = pd.product_id)";if($Myq)$Mhj.=" WHERE full_price ".$Mxs->lightning_between($Myq);else if($Myj!="getTags")$Mhj.=" WHERE 1";if($Myj=="getTags")$Mhj.=" GROUP BY tag";return true;}