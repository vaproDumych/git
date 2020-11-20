<div class="col-xs-12 col-md-8 seo-analysis-tab">
    <br />
    <div class="loader"></div>
</div>
<div class="col-xs-12 col-md-4">
	<div class="box-heading">
    	<h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $text_seo_analysis_helper_title; ?></h1>
    </div>
    <div class="box-content">
    	<?php echo $text_seo_analysis_helper; ?>
    </div>
    <br /><br />
    <strong><?php echo $text_crawler_actions; ?></strong>:
    <p><br />
    <?php if (!empty($toggle_seo_analysis) && ($toggle_seo_analysis=='1')) { ?>
    <a class="btn btn-sm btn-default" href="<?php echo $toggle_seo_analysis_url; ?>"><?php echo $btn_disable_seo_analysis; ?></a>
    <?php } else if (isset($toggle_seo_analysis) && ($toggle_seo_analysis == '0')) { ?>
    <a class="btn btn-sm btn-primary" href="<?php echo $toggle_seo_analysis_url; ?>"><?php echo $btn_enable_seo_analysis; ?></a>
    <?php } ?>
    <br /><br />
    <a class="btn btn-sm btn-primary" onClick="clearAnalysisResults();"><?php echo $text_clear_analysis_list; ?></a>
    </p>
</div>