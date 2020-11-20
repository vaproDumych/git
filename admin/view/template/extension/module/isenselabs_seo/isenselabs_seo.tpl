<?php echo $header; ?><?php echo $column_left; ?>
<?php
if (!function_exists('modification_vqmod')) {
    function modification_vqmod($file) {
        if (class_exists('VQMod')) {
            return VQMod::modCheck(modification($file), $file);
        } else {
            return modification($file);
        }
    }
}
?>
 <div id="content" class="isense_seo_module">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-filter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary save-changes" style="display:none;"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default" style="display:none;"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  
    <?php if ($enableMigrateOption) { ?>
    <div class="alert alert-warning fade in">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h4><?php echo $text_old_seo_urls_detected; ?></h4>
        <p><?php echo $text_old_seo_urls_helper; ?></p><div style="height:5px;"></div>
        <a class="btn btn-warning" onClick="seoFixNow('migrate_seo_urls');"><?php echo $text_migrate_seo_urls; ?></a>
    </div>
    <?php } ?>
    
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    
    <?php if ($success) { ?>
    <div class="alert alert-success autoSlideUp"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <script>$('.autoSlideUp').delay(3000).fadeOut(600, function(){ $(this).show().css({'visibility':'hidden'}); }).slideUp(600);</script>
    <?php } ?>
    
	<div class="row row-main">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter" class="form-horizontal">
            <div class="panel panel-default">
                <div class="panel-body">
                   <ul class="nav nav-tabs mainMenuTabs" role="tablist">
                      <li class="active">
                          <a role="tab" data-toggle="tab" href="#home-tab"><?php echo $tab_home; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#urls-linking-tab"><?php echo $tab_urls_linking; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#content-tab"><?php echo $tab_content; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#advanced-editor-tab"><?php echo $tab_advanced_editor; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#social-seo-tab"><?php echo $tab_social_seo; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#structured-data-tab"><?php echo $tab_structured_data; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#image-names-tab"><?php echo $tab_image_names; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#crawler-tab"><?php echo $tab_page_crawler; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#analysis-tab"><?php echo $tab_seo_analysis; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#missing-pages-tab"><?php echo $text_404_manager; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#file-editor-tab"><?php echo $tab_file_editor; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#feed-tab"><?php echo $tab_feed; ?></a>
                      </li>
                      <li>
                          <a role="tab" data-toggle="tab" href="#faq-tab"><?php echo $tab_what_is_seo; ?></a>
                      </li>
                    </ul>

                    <div class="tab-content">
                        <div id="home-tab" role="tabpanel" class="tab-pane seo-home-tab seo-tabs-main fade in active">
                            <br />
                            <div class="loader"></div>
                        </div>
                        <div id="urls-linking-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_urls_linking.tpl'); ?>
                        </div>
                        <div id="content-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_content.tpl'); ?>
                        </div>
                        <div id="advanced-editor-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_advanced_editor.tpl'); ?>
                        </div>
                        <div id="social-seo-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_social_seo.tpl'); ?>
                        </div>
                        <div id="structured-data-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_structured_data.tpl'); ?>
                        </div>
                        <div id="image-names-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_image_names.tpl'); ?>
                        </div>
                        <div id="crawler-tab" role="tabpanel" class="tab-pane seo-crawler-tab seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_crawler.tpl'); ?>
                        </div>
                        <div id="analysis-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_seo_analysis.tpl'); ?>
                        </div>
                        <div id="missing-pages-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_missing_pages.tpl'); ?>
                        </div>
                        <div id="file-editor-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_file_editor.tpl'); ?>
                        </div>
                        <div id="feed-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_feed.tpl'); ?>
                        </div>
                        <div id="faq-tab" role="tabpanel" class="tab-pane seo-tabs-main fade">
                            <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/tab_faq.tpl'); ?>
                        </div>
                    </div>

                </div>
            </div><!--.panel-->
        </form> 
        
    </div>
  </div>
</div>
<script type="text/javascript">
<?php 
$hostname = (!empty($_SERVER['HTTP_HOST'])) ? $_SERVER['HTTP_HOST'] : '' ;
$hostname = (strstr($hostname,'http://') === false) ? 'http://'.$hostname: $hostname;
?>
var store                                   = <?php echo json_encode($store); ?>;
var storeId                                 = '<?php echo $store["store_id"]; ?>';
var domain                                  = '<?php echo base64_encode($hostname); ?>';
var domainraw                               = '<?php echo $hostname; ?>';
var timenow                                 = '<?php echo time(); ?>';
var MID                                     = 'VBHAVAKDXS';
var token                                   = '<?php echo $token; ?>';
var token_string                            = '<?php echo $token_string; ?>';
var moduleName                              = '<?php echo $moduleName; ?>';
var modulePath                              = '<?php echo $modulePath; ?>';
var fixIssuesAjaxURL                        = 'index.php?route=' + modulePath + '/fix_seo_issues&' + token_string + '=' + token + '&store_id=' + storeId;
var saveSettingsAjaxURL                     = 'index.php?route=' + modulePath + '/save_settings&' + token_string + '=' + token + '&store_id=' + storeId;
var languages                               = <?php echo json_encode($languages); ?>;
var defaultLanguageId                       = '<?php echo $config_language_id; ?>';
var text_running_tests                      = '<?php echo $text_running_tests; ?>';
var text_loading_please_wait                = '<?php echo $text_loading_please_wait; ?>';
var text_performing_operation               = '<?php echo $text_performing_operation; ?>';
var text_unexpected_error_id                = '<?php echo $text_unexpected_error_id; ?>';
var text_delete                             = '<?php echo $text_delete; ?>';
var text_delete_confirmation                = '<?php echo $text_delete_confirmation; ?>';
var text_delete_a_confirmation              = '<?php echo $text_delete_a_confirmation; ?>';
var text_add_custom_url                     = '<?php echo $text_add_custom_url; ?>';
var text_opencart_route                     = '<?php echo $text_opencart_route; ?>';
var text_cancel                             = '<?php echo $text_cancel; ?>';
var text_submit                             = '<?php echo $text_submit; ?>';
var text_confirm                            = '<?php echo $text_confirm; ?>';
var text_url_address                        = '<?php echo $text_url_address; ?>';
var text_fields_filled_in_helper            = '<?php echo $text_fields_filled_in_helper; ?>';
var text_all_fields_filled_in_helper        = '<?php echo $text_all_fields_filled_in_helper; ?>';
var text_add_new_autolink                   = '<?php echo $text_add_new_autolink; ?>';
var text_edit_autolink                      = '<?php echo $text_edit_autolink; ?>';
var text_keyword_field                      = '<?php echo $text_keyword_field; ?>';
var text_edit_customurl                     = '<?php echo $text_edit_customurl; ?>';
var text_complete                           = '<?php echo $text_complete; ?>';
var text_error                              = '<?php echo $text_error; ?>';
var text_show_more                          = '<?php echo $text_show_more; ?>';
var text_show_less                          = '<?php echo $text_show_less; ?>';
var text_confirm_action                     = '<?php echo $text_confirm_action; ?>';
var text_confirm_image_rename               = '<?php echo $text_confirm_image_rename; ?>';
var text_crawler_error_heading              = '<?php echo $text_crawler_error_heading; ?>';
var text_crawler_url_error                  = '<?php echo $text_crawler_url_error; ?>';
var text_loading_data                       = '<?php echo $text_loading_data; ?>';
var text_confirm_clear_analysis             = '<?php echo $text_confirm_clear_analysis; ?>';
var text_empty_field_alert                  = '<?php echo $text_empty_field_alert; ?>';
var text_remove_selected_row                = '<?php echo $text_remove_selected_row; ?>'; 
var text_old_address                        = '<?php echo $text_old_address; ?>'; 
var text_new_address                        = '<?php echo $text_new_address; ?>'; 
var text_add_new_redirect                   = '<?php echo $text_add_new_redirect; ?>'; 
</script> 
<?php echo $footer; ?>
