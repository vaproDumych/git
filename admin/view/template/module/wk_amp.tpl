<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      	<a href="<?php echo $cancel; ?>" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><i class="fa fa-reply"></i> </a>
      	<button onclick="$('form').submit()" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_save; ?>"><i class="fa fa-save"></i> </button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  	<?php if($error_warning) { ?>
  	    <div class="alert alert-danger">
  	      <i class="fa fa-exclamation-circle"></i>
  	      <?php echo $error_warning; ?>
  	    </div>
  	<?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="POST" enctype="text/form-data" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-wk_amp_store"><?php echo $text_store; ?></label>
            <div class="col-sm-10">
              <select name="wk_amp_store" id="input-wk_amp_store" class="form-control">
                <?php if(isset($stores) && $stores) { ?>
                  <?php foreach($stores as $store) { ?>
                      <option value="<?php echo $store['store_id']; ?>" <?php if(isset($wk_amp_store) && $wk_amp_store == $store['store_id'] ){ ?>selected<?php } ?> ><?php echo $store['name']; ?></option>
                    <?php } ?>
                <?php  } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
						<label class="col-sm-2 control-label">
              <span data-toggle="tooltip" title="<?php echo $entry_cron_log_help; ?>">
							<?php echo $entry_cron_log; ?></span>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_cron_log">
								<option value="0" <?php if(isset($wk_amp_cron_log) && !$wk_amp_cron_log) echo "selected"; ?>  ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_cron_log) && $wk_amp_cron_log) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-wk_amp_google_api_key">
              <span data-toggle="tooltip" title="<?php echo $text_api_key_help; ?>"> <?php echo $text_api_key; ?></span></label>
            <div class="col-sm-10">
              <input name="wk_amp_google_api_key" value="<?php echo $wk_amp_google_api_key; ?>" id="input-wk_amp_google_api_key" class="form-control" type="text" />
              <a href="https://console.developers.google.com/flows/enableapi"> <?php echo $text_get_api_key; ?></a>
            </div>
          </div>
        	<ul class="nav nav-tabs">
        		<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            	<li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
        	</ul>
        	<div class="tab-content">
	            <div class="tab-pane active" id="tab-general">
                <div class="form-group">
						<label class="col-sm-2 control-label">
							<?php echo $entry_status; ?>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_status">
								<option value="0" <?php if(isset($wk_amp_status) && !$wk_amp_status) echo "selected"; ?>  ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_status) && $wk_amp_status) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
          <div class="form-group">
						<label class="col-sm-2 control-label" >
							<span  data-toggle="tooltip" title="<?php echo $entry_display_parent_help; ?>">
								<?php echo $entry_display_parent; ?>
							</span>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_display_only_parent_category">
								<option value="0" <?php if(isset($wk_amp_display_only_parent_category) && !$wk_amp_display_only_parent_category) echo "selected"; ?> ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_display_only_parent_category) && $wk_amp_display_only_parent_category) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
          <div class="form-group">
						<label class="col-sm-2 control-label" >
								<?php echo $entry_show_special; ?>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_show_special">
								<option value="0" <?php if(isset($wk_amp_show_special) && !$wk_amp_show_special) echo "selected"; ?> ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_show_special) && $wk_amp_show_special) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" >
							<span  data-toggle="tooltip" title="<?php echo $entry_sub_menu_help; ?>">
								<?php echo $entry_sub_menu; ?>
							</span>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_sub_menu">
								<option value="0" <?php if(isset($wk_amp_sub_menu) && !$wk_amp_sub_menu) echo "selected"; ?> ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_sub_menu) && $wk_amp_sub_menu) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<span  data-toggle="tooltip" title="<?php echo $entry_related_footer_help; ?>">
								<?php echo $entry_footer_display; ?>
							</span>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_display_footer_links">
								<option value="0" <?php if(isset($wk_amp_display_footer_links) && !$wk_amp_display_footer_links) echo "selected"; ?>  ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_display_footer_links) && $wk_amp_display_footer_links) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">
							<span  data-toggle="tooltip" title="<?php echo $entry_related_product_help; ?>">
								<?php echo $entry_related_products; ?>
							</span>
						</label>
						<div class="col-sm-10">
							<select class="form-control" name="wk_amp_related_products">
								<option value="0" <?php if(isset($wk_amp_related_products) && !$wk_amp_related_products) echo "selected"; ?>  ><?php echo $text_disabled; ?></option>
								<option value="1" <?php if(isset($wk_amp_related_products) && $wk_amp_related_products) echo "selected"; ?> ><?php echo $text_enabled; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
		         <label class="col-sm-2 control-label"><?php echo $entry_home_page_slider; ?></label>
		            <div class="col-sm-10">
		                <div class="well well-sm" style="height: 300px; overflow: auto;">
		                <?php $image_row = 0; ?>
		                    <table class="table table-hover table-bordered" id="images">
		                  		<thead>
		                  			<tr>
		                  				<td><?php echo $text_image_title ?></td>
		                  				<td><?php echo $text_image_href ?></td>
		                  				<td><?php echo $text_image_image ?></td>
		                  				<td><?php echo $text_image_status ?></td>
		                  			</tr>
		                  		</thead>
									        <tbody>
										<?php if(isset($wk_amp_images) && $wk_amp_images) { ?>
											<?php foreach ($wk_amp_images as $image) { ?>
									         <tr id="image-row<?php echo $image_row; ?>">
									            <td class="text-left"><?php foreach ($languages as $language) { ?>
									               <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code'].'/'.$language['code'].'.png'; ?>" title="<?php echo $language['name']; ?>" /> </span>
									                 <input type="text" <?php if (isset($error_wk_amp_image[$image_row][$language['language_id']])) { ?>autofocus<?php } ?> name="wk_amp_image[<?php echo $image_row; ?>][wk_amp_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($image['wk_amp_image_description'][$language['language_id']]) ? $image['wk_amp_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $text_image_title; ?>" class="form-control" />
									               </div>
									                  <?php if (isset($error_wk_amp_image[$image_row][$language['language_id']])) { ?>
									                  <div class="text-danger"><?php echo $error_wk_amp_image[$image_row][$language['language_id']]; ?></div>
									                  <?php } ?>
									                  <?php } ?></td>
									                <td class="text-left" style="width: 30%;"><input type="text" name="wk_amp_image[<?php echo $image_row; ?>][link]" value="<?php echo $image['link']; ?>" placeholder="<?php echo $text_image_href; ?>" class="form-control" /></td>
									                <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									                  <input type="hidden" name="wk_amp_image[<?php echo $image_row; ?>][image]" value="<?php echo $image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
									                <td class="text-right" style="width: 10%;">
									                	<select class="form-control" name="wk_amp_image[<?php echo $image_row; ?>][image_status]">
									                		<option value="0" <?php if(isset($image['status']) && !$image['status']) echo "selected" ; ?> ><?php echo $text_disabled; ?></option>
									                		<option value="1" <?php if(isset($image['status']) && $image['status']) echo "selected" ; ?> ><?php echo $text_enabled; ?></option>
									                	</select>
									                <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
									            </tr>
								            	<?php $image_row++; ?>
								            <?php } ?>
								        <?php } ?>
									</tbody>
		                  		</table>
		                  	</div>
		                  	<button type="button" class="btn btn-warning" id="addImage">
		                		<?php echo $text_image_button; ?>
		                	</button>
		                </div>
		            </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-wk_amp_fb_app_id"><?php echo $text_fb_app_id; ?></label>
                  <div class="col-sm-10">
                    <input name="wk_amp_fb_app_id" value="<?php echo $wk_amp_fb_app_id; ?>" id="input-wk_amp_fb_app_id" class="form-control" type="text" />
                  </div>
                </div>
					<div class="form-group">
		                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_social_sharing_help; ?>"><?php echo $entry_social_sharing; ?></span></label>
		                <div class="col-sm-10">
		                  <div class="well well-sm" style="height: 150px; overflow: auto;">
		                	<?php foreach ($social_share as $key => $value) { ?>
		                		<div class="checkbox">
			                		<label>
			                			<?php if(isset($wk_amp_social_share) && $wk_amp_social_share && in_array($value, $wk_amp_social_share)) { ?>
			                        		<input type="checkbox" name="wk_amp_social_share[]" value="<?php echo $value; ?>" checked />
			                        	<?php } else { ?>
											<input type="checkbox" name="wk_amp_social_share[]" value="<?php echo $value; ?>"  />
			                        	<?php } ?>
			                        	<?php echo $value; ?>
			                      	</label>
			                    </div>
		                	<?php } ?>
		                  </div>
		                  <a class="selectAll"><?php echo $entry_selectall;?></a> &nbsp;&nbsp; <a class="deselectAll"><?php echo $entry_deselectall;?></a>
		                </div>
		            </div>
		        </div>
            <div class="tab-pane" id="tab-design">
	        	  <div class="form-group">
	              <label class="col-sm-2 control-label">
	                	<?php echo $entry_page_bg_color; ?>
	              </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_page_bg_color" class="form-control" value="<?php if(isset($wk_amp_page_bg_color)) echo $wk_amp_page_bg_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_header_bg_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_header_bg_color" class="form-control" value="<?php if(isset($wk_amp_header_bg_color)) echo $wk_amp_header_bg_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_a_txt_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_a_txt_color" class="form-control" value="<?php if(isset($wk_amp_a_txt_color)) echo $wk_amp_a_txt_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_a_txt_hover_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_a_txt_hover_color" class="form-control" value="<?php if(isset($wk_amp_a_txt_hover_color)) echo $wk_amp_a_txt_hover_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_footer_bg_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_footer_bg_color" class="form-control" value="<?php if(isset($wk_amp_footer_bg_color)) echo $wk_amp_footer_bg_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_footer_txt_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_footer_txt_color" class="form-control" value="<?php if(isset($wk_amp_footer_txt_color)) echo $wk_amp_footer_txt_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_btn_bg_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_btn_bg_color" class="form-control" value="<?php if(isset($wk_amp_btn_bg_color)) echo $wk_amp_btn_bg_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_btn_txt_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_btn_txt_color" class="form-control" value="<?php if(isset($wk_amp_btn_txt_color)) echo $wk_amp_btn_txt_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_btn_border_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_btn_border_color" class="form-control" value="<?php if(isset($wk_amp_btn_border_color)) echo $wk_amp_btn_border_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_side_bar_backgroundcolor; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_side_bar_backgroundcolor" class="form-control" value="<?php if(isset($wk_amp_side_bar_backgroundcolor)) echo $wk_amp_side_bar_backgroundcolor; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_section_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_section_color" class="form-control" value="<?php if(isset($wk_amp_section_color)) echo $wk_amp_section_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
	            <div class="form-group">
                <label class="col-sm-2 control-label">
                	<?php echo $entry_section_expanded_color; ?>
                </label>
                <div class="col-sm-3">
                	<div class="input-group color">
                		<input readonly type="text" name="wk_amp_section_expanded_color" class="form-control" value="<?php if(isset($wk_amp_section_expanded_color)) echo $wk_amp_section_expanded_color; ?>" />
                		<span class="input-group-addon">
                			<i class="fa fa-"></i>
                		</span>
                	</div>
                </div>
	            </div>
		        </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

$('.color').colorpicker();

var image_row = '<?php echo $image_row; ?>';

$('#addImage').on('click', function() {
	html  = '<tr id="image-row' + image_row + '">';
    html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon"><img src="language/<?php echo $language['code']."/".$language['code'].".png"; ?>" /></span><input type="text" name="wk_amp_image[' + image_row + '][wk_amp_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $text_image_title; ?>" class="form-control" />';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-left" style="width: 30%;"><input type="text" name="wk_amp_image[' + image_row + '][link]" value="" placeholder="<?php echo $text_image_href; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="wk_amp_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '<td class="text-right" style="width: 10%;"><select name="wk_amp_image[' + image_row + '][image_status]" class="form-control"><option value="0"><?php echo $text_disabled; ?></option><option value="1"><?php echo $text_enabled; ?></option></select></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	$('#images tbody').append(html);

	image_row++;
})

$('.selectAll').on('click',function(){
  $(this).prev('div').find('input[type="checkbox"]').prop('checked',true);
})

$('.deselectAll').on('click',function(){
  $(this).prevAll('div').find('input[type="checkbox"]').prop('checked',false);
})
$('document').ready(function(){
  $('ul li:first-child').addClass('active');
  $('.tab-content .tab-pane:first-child').addClass('active');
});
</script>
<script type="text/javascript">
  $('#input-wk_amp_store').on('change',function(){
    location = "index.php?route=module/wk_amp&token=<?php echo $token; ?>&store_id="+$(this).val();
  });
</script>
<?php echo $footer; ?>
