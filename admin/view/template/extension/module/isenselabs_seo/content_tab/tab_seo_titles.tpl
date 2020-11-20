<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
           <ul id="seo_title_languages_tabs" class="nav nav-pills" role="tablist">
               <?php foreach ($languages as $language) { ?>
               <li <?php echo ($language['language_id']==$default_language_id) ? 'class="active"' : ''; ?>><a role="tab" data-toggle="tab" href="#seo_titles_<?php echo $language['language_id']; ?>">
                <?php if (VERSION >= '2.2.0.0') { ?>
                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } else { ?>
                    <img src="view/image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } ?>
               </a></li> 
               <?php } ?>
                <li><a role="tab" data-toggle="tab" href="#seo_titles_advanced"><?php echo $tab_seo_meta_titles_title; ?></a></li>
            </ul>
            <div class="tab-content tabs">
                <?php foreach ($languages as $language) { $lid = $language['language_id']; ?>
                <div id="seo_titles_<?php echo $language['language_id']; ?>" role="tabpanel" class="tab-pane fade in <?php echo ($language['language_id']==$default_language_id) ? 'active' : ''; ?>">                
                    <table class="table table-hover text-center"> 
                        <thead> 
                            <tr> 
                                <th>#</th>
                                <th class="text-center"><?php echo $text_products; ?></th>
                                <th class="text-center"><?php echo $text_categories; ?></th>
                                <th class="text-center"><?php echo $text_information_pages; ?></th>
                                <th class="text-center"><?php echo $text_manufacturers; ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><?php echo $text_total_items; ?></th>
                                <td><?php echo $seo_data['total_products'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_categories'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_informations'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_manufacturers'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_meta_titles; ?></th>
                                <td><?php echo $seo_data['total_products_meta'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_categories_meta'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_informations_meta'][$lid]; ?></td>
                                <td><?php echo $seo_data['total_manufacturers_meta'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_missing_meta_titles; ?></th>
                                <td class="<?php echo ($seo_data['total_products_difference'][$lid]>0) ? 'danger' : 'success' ?>"><?php echo $seo_data['total_products_difference'][$lid]; ?></td>
                                <td class="<?php echo ($seo_data['total_categories_difference'][$lid]>0) ? 'danger' : 'success' ?>"><?php echo $seo_data['total_categories_difference'][$lid]; ?></td>
                                <td class="<?php echo ($seo_data['total_informations_difference'][$lid]>0) ? 'danger' : 'success' ?>"><?php echo $seo_data['total_informations_difference'][$lid]; ?></td>
                                <td class="<?php echo ($seo_data['total_manufacturers_difference'][$lid]>0) ? 'danger' : 'success' ?>"><?php echo $seo_data['total_manufacturers_difference'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_action; ?></th>
                                <td>
                                    <a onclick="seoFixNow('product_seo_titles', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_data['total_products_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('product_seo_titles_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('category_seo_titles', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_data['total_categories_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('category_seo_titles_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('information_seo_titles', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_data['total_informations_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('information_seo_titles_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('manufacturer_seo_titles', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_data['total_manufacturers_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('manufacturer_seo_titles_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <?php } ?>
                <div id="seo_titles_advanced" role="tabpanel" class="tab-pane fade in">
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <h3><?php echo $text_product_title_string; ?></h3>
                        <input name="product_title_string" type="text" class="form-control input-md" value="<?php echo $product_title_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [product], [model], [sku], [upc], [site_name]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <h3><?php echo $text_category_title_string; ?></h3>
                        <input name="category_title_string" type="text" class="form-control input-md" value="<?php echo $category_title_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [category], [site_name]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <br />
                        <h3><?php echo $text_information_title_string; ?></h3>
                        <input name="information_title_string" type="text" class="form-control input-md" value="<?php echo $information_title_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [information], [site_name]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <br />
                        <h3><?php echo $text_manufacturer_title_string; ?></h3>
                        <input name="manufacturer_title_string" type="text" class="form-control input-md" value="<?php echo $manufacturer_title_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [information], [site_name]
                    </div>
                    <div class="col-xs-12 col-md-12">
                        <p class="text-left">
                            <br />
                            <a onClick="saveChanges('#seo_titles_advanced');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                        </p>
                    </div>
                </div>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_seo_meta_titles_helper_title; ?></h1>
            </div>
            <div class="box-content">
            <?php echo $tab_seo_meta_titles_helper; ?>
            </div>
        </div>
	</div>
</div>