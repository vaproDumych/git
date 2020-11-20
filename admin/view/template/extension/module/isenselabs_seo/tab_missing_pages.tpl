<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-12">
            <ul class="nav nav-tabs nav-file-editor-tabs">
                <li class="active"><a href="#tab-missing-pages" data-toggle="tab"><?php echo $text_detected_missing_pages; ?></a></li>
                <li><a href="#tab-redirects" data-toggle="tab"><?php echo $text_404_redirects; ?></a></li>
            </ul>
            
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-missing-pages">
                    <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/missing_pages_tab/tab_detected_pages.tpl'); ?>
                </div>
                
                <div class="tab-pane fade" id="tab-redirects">
                    <?php require_once modification_vqmod(DIR_APPLICATION.'view/template/'.$modulePath.'/missing_pages_tab/tab_redirects.tpl'); ?>
                </div>
            </div>
            
  		</div>
    </div>
</div>

