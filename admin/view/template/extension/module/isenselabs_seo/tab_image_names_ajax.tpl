<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <h3><?php echo $text_image_renamer_tool_heading; ?></h3>
            <div class="image_renaming_results">
                <p><br /><strong><?php echo $text_image_last_usage; ?></strong></p>
                <ul>
                    <li><?php echo (empty($seo_image_titles_date)) ? $text_never : $seo_image_titles_date; ?></li>
                </ul>
                <p><strong><?php echo $text_image_last_results; ?></strong></p>
                <?php if (empty($seo_image_last_activity)) { ?>
                <ul>
                     <li><?php echo $text_not_used; ?></li>
                </ul>
                <?php } else { ?>
                <ul>
                    <li><?php echo $text_images_renamed; ?> <?php echo $seo_image_last_activity['renamed_images']; ?></li>
                    <li><?php echo $text_images_already_renamed; ?> <?php echo $seo_image_last_activity['already_renamed']; ?></li>
                    <li><?php echo $text_product_images_ids; ?> <?php echo (empty($seo_image_last_activity['products_with_no_image'])) ? $text_none : implode(', ', $seo_image_last_activity['products_with_no_image']); ?></li>
                    <li><?php echo $text_errors; ?> <?php echo (!$seo_image_last_activity['errors']) ? $text_no_errors : '<strong>' . $seo_image_last_activity['errors'] . '</strong>'; ?></li>
                </ul>
                <?php } ?>               
            </div>           
            <p>
                <br />
                <a onClick="generateImageNames();" class="btn btn-primary btn-md"><?php echo $text_generate_image_names; ?></a>
            </p>
            <input type="checkbox" name="rename_additional_images" value="yes" /> <?php echo $text_generate_additional_image_names; ?>
            <br>
            <hr>
            <div id="seo_images_advanced" role="tabpanel" class="tab-pane fade in">
                <br />
                <h3><?php echo $text_advanced_settings; ?></h3>
                <br>
                <label for="images_filename_string"><strong><?php echo $text_image_string; ?></strong></label>
                <input name="images_filename_string" type="text" class="form-control" value="<?php echo $images_filename_string; ?>" id="images_filename_string"/>
                <br /><?php echo $text_short_codes; ?><br />
                [product], [model], [sku], [upc]
                <p>
                    <br />
                    <a onClick="saveChanges('#seo_images_advanced');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_image_titles_helper_title; ?></h1>
            </div>
            <div class="box-content">
                <?php echo $tab_image_titles_helper; ?>
            </div>
        </div>
	</div>
</div>