<?php if(!defined("DIR_CACHE")){$Mxe=getcwd();chdir(dirname(__FILE__));if(file_exists("../../config.php"))require"../../config.php";else require"../../../../config.php";chdir($Mxe);}
function Weo($Man){foreach(glob($Man."/*")as$Miv){if(is_dir($Miv)){foreach(glob($Miv."/*")as$Mj_)@unlink($Mj_);@rmdir($Miv);}else @unlink($Miv);}
if(file_exists($Man."/meters"))@unlink($Man."/meters");}
Weo(DIR_CACHE."lightning/alpha");Weo(DIR_CACHE."lightning/beta");Weo(DIR_CACHE."lightning/gamma");Weo(DIR_CACHE."lightning/tetha");foreach(glob(DIR_CACHE."lightning/epsilon/*")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);foreach(glob(DIR_CACHE."lightning/".'b'."*")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);foreach(glob(DIR_CACHE."*")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);foreach(glob("journal-cache/*")as$Mj_)if(!is_dir($Mj_)and!strpos($Mj_,"htaccess"))unlink($Mj_);$Mnz=DIR_LOGS."lightning.log";if(file_exists($Mnz))unlink($Mnz);$Mnz=DIR_LOGS."lightning_optimize.log";if(file_exists($Mnz))unlink($Mnz);foreach(glob(DIR_CACHE."lightning/*.css")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);foreach(glob(DIR_CACHE."lightning/*.js")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);foreach(glob(DIR_IMAGE."cache/lightning/*.css")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);foreach(glob(DIR_IMAGE."cache/lightning/*.js")as$Mj_)if(!is_dir($Mj_))unlink($Mj_);