<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
           <ul id="seo_product_heading_tags_languages_tabs" class="nav nav-pills" role="tablist">
               <?php foreach ($languages as $language) { ?>
               <li <?php echo ($language['language_id']==$default_language_id) ? 'class="active"' : ''; ?>><a role="tab" data-toggle="tab" href="#seo_product_heading_tags_<?php echo $language['language_id']; ?>">
                <?php if (VERSION >= '2.2.0.0') { ?>
                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } else { ?>
                    <img src="view/image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } ?>
               </a></li> 
               <?php } ?>
                <li><a role="tab" data-toggle="tab" href="#seo_product_heading_tags_advanced"><?php echo $tab_seo_product_heading_tags_title; ?></a></li>
            </ul>
            <div class="tab-content tabs">
                <?php foreach ($languages as $language) { $lid = $language['language_id']; ?>
                <div id="seo_product_heading_tags_<?php echo $language['language_id']; ?>" role="tabpanel" class="tab-pane fade in <?php echo ($language['language_id']==$default_language_id) ? 'active' : ''; ?>">                
                    <table class="table table-hover text-center"> 
                        <thead> 
                            <tr> 
                                <th>#</th>
                                <th class="text-center"><?php echo $text_h1_heading_tags; ?></th>
                                <th class="text-center"><?php echo $text_h2_heading_tags; ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><?php echo $text_total_items; ?></th>
                                <td><?php echo $seo_data['total_products'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_products'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_product_heading_tags; ?></th>
                                <td><?php echo $seo_data['total_products_with_h1_tags'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_products_with_h2_tags'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_missing_heading_tags; ?></th>
                                <td class="<?php echo ($seo_data['total_h1_tags_difference'][$lid]>0) ? 'danger' : 'success' ?>"><?php echo $seo_data['total_h1_tags_difference'][$lid]; ?></td>
                                <td class="<?php echo ($seo_data['total_h2_tags_difference'][$lid]>0) ? 'danger' : 'success' ?>"><?php echo $seo_data['total_h2_tags_difference'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_action; ?></th>
                                <td>
                                    <a onclick="seoFixNow('product_h1_tags', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_data['total_h1_tags_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('product_h1_tags_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('product_h2_tags', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_data['total_h2_tags_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('product_h2_tags_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <?php } ?>
                <div id="seo_product_heading_tags_advanced" role="tabpanel" class="tab-pane fade in">
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <h3><?php echo $text_h1_heading_tags_string; ?></h3>
                        <input name="h1_heading_tags_string" type="text" class="form-control input-md" value="<?php echo $h1_heading_tags_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [product], [model], [sku], [upc], [site_name]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <h3><?php echo $text_h2_heading_tags_string; ?></h3>
                        <input name="h2_heading_tags_string" type="text" class="form-control input-md" value="<?php echo $h2_heading_tags_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [product], [model], [sku], [upc], [site_name]
                    </div>
                    <div class="col-xs-12 col-md-12">
                        <p class="text-left">
                            <br />
                            <a onClick="saveChanges('#seo_product_heading_tags_advanced');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                        </p>
                    </div>
                </div>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_seo_product_heading_tags_helper_title; ?></h1>
            </div>
            <div class="box-content">
            <?php echo $tab_seo_product_heading_tags_helper; ?>
            </div>
        </div>
	</div>
</div>