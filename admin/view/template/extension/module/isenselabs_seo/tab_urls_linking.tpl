<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-md-12">

            <ul class="nav nav-tabs nav-link-tabs">
                <li class="active"><a href="#tab-seo-links" data-toggle="tab"><?php echo $text_seo_links; ?></a></li>
                <li><a href="#tab-customredirections" data-toggle="tab"><?php echo $text_custom_url_redirects; ?></a></li>
                <li><a href="#tab-autolinks" data-toggle="tab"><?php echo $text_auto_links; ?></a></li>
                <li><a href="#tab-canonicals" data-toggle="tab"><?php echo $text_canonicals; ?></a></li>
                <li><a href="#tab-advanced-settings" data-toggle="tab"><?php echo $text_advanced_settings; ?></a></li>
            </ul>

            <div class="tab-content">
               <div class="tab-pane fade in active" id="tab-seo-links">
                    <div class="tab-seo-links">
                        <br />
                        <div class="loader"></div>
                    </div>
               </div>   

               <div class="tab-pane fade" id="tab-customredirections">
                    <div class="tab-customredirections">
                        <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/urls_linking_tab/tab_customurls.tpl'); ?>
                    </div>
                </div>

                <div class="tab-pane fade" id="tab-autolinks">
                    <div class="tab-autolinks">
                        <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/urls_linking_tab/tab_autolinks.tpl'); ?>
                    </div>
                </div>
                
                <div class="tab-pane fade" id="tab-canonicals">
                    <div class="tab-canonicals">
                        <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/urls_linking_tab/tab_canonicals.tpl'); ?>
                    </div>
                </div>
                   
                <div class="tab-pane fade" id="tab-advanced-settings">
                    <div class="tab-advanced-settings">
                        <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/urls_linking_tab/tab_advanced.tpl'); ?>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>