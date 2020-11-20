<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <div id="robots_form" role="tabpanel" class="tab-pane fade in">
                <textarea id="robots_txt" rows="25" name="robots_txt" class="form-control well"><?php echo $file_contents; ?></textarea>
                <p>
                    <br />
                    <a onClick="saveChanges('#robots_form');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
          <div class="box-heading">
            <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $text_robots_helper_title; ?></h1>
          </div>
          <div class="box-content">
            <?php echo $text_robots_helper; ?>
          </div>
        </div>
	</div>
</div>