<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8 tab-detected-pages-results">
            <br />
            <div class="loader"></div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
          <div class="box-heading">
  		    <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_detected_pages_helper_title; ?></h1>
          </div>
          <div class="box-content">
  		    <?php echo $tab_detected_pages_helper; ?>
            <br />
            <strong><?php echo $text_crawler_actions; ?></strong>:
            <br />
            <br />
            <?php if (!empty($toggle_404_detection) && ($toggle_404_detection=='1')) { ?>
            <a class="btn btn-sm btn-default" href="<?php echo $toggle_404_detection_url; ?>"><?php echo $text_disable_404_detection; ?></a>
            <?php } else if (isset($toggle_404_detection) && ($toggle_404_detection == '0')) { ?>
            <a class="btn btn-sm btn-primary" href="<?php echo $toggle_404_detection_url; ?>"><?php echo $text_enable_404_detection; ?></a>
            <?php } ?>
            <br /><br />
            <a class="btn btn-sm btn-primary" onClick="clearMissingPagesResults();"><?php echo $text_clear_analysis_list; ?></a>
          </div>
      </div>
	</div>
</div>