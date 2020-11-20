<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
           <ul id="seo_url_languages_tabs" class="nav nav-pills" role="tablist">
               <?php foreach ($languages as $language) { ?>
               <li <?php echo ($language['language_id']==$default_language_id) ? 'class="active"' : ''; ?>><a role="tab" data-toggle="tab" href="#seo_links_<?php echo $language['language_id']; ?>">
                <?php if (VERSION >= '2.2.0.0') { ?>
                    <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } else { ?>
                    <img src="view/image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                <?php } ?>
               </a></li> 
               <?php } ?>
                <li><a role="tab" data-toggle="tab" href="#seo_links_advanced"><?php echo $tab_seo_links_title; ?></a></li>
            </ul>
            <div class="tab-content tabs">
                <?php foreach ($languages as $language) { $lid = $language['language_id']; ?>
                <div id="seo_links_<?php echo $language['language_id']; ?>" role="tabpanel" class="tab-pane fade in <?php echo ($language['language_id']==$default_language_id) ? 'active' : ''; ?>">                
                    <table class="table table-hover text-center"> 
                        <thead> 
                            <tr> 
                                <th>#</th>
                                <th class="text-center"><?php echo $text_products; ?></th>
                                <th class="text-center"><?php echo $text_categories; ?></th>
                                <th class="text-center"><?php echo $text_manufacturers; ?></th>
                                <th class="text-center"><?php echo $text_information_pages; ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row"><?php echo $text_total_items; ?></th>
                                <td><?php echo $seo_link_data['total_products'][$lid]; ?></td>
                                <td><?php echo $seo_link_data['total_categories'][$lid]; ?></td>
                                <td><?php echo $seo_link_data['total_manufacturers'][$lid]; ?></td>
                                <td><?php echo $seo_link_data['total_informations'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_seo_urls; ?></th>
                                <td><?php echo $seo_link_data['total_products_meta'][$lid]; ?></td>
                                <td><?php echo $seo_link_data['total_categories_meta'][$lid]; ?></td>
                                <td><?php echo $seo_link_data['total_manufacturers_meta'][$lid]; ?></td>
                                <td><?php echo $seo_link_data['total_informations_meta'][$lid]; ?></td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_missing_urls; ?></th>
                                <td class="<?php echo ($seo_link_data['total_products_difference'][$lid]>0) ? 'danger' : 'success' ?>">
                                    <?php echo $seo_link_data['total_products_difference'][$lid]; ?>
                                    <?php if ($seo_link_data['total_products_difference'][$lid] < 0) { ?>
                                        <div style="margin-top:5px">
                                            <a onclick="seoFixNow('product_fix_minus_urls', <?php echo $language['language_id']; ?>);" class="btn btn-sm btn-primary btn-url-minus-fix"><?php echo $text_fix_missing_urls_count; ?></a>
                                        </div>
                                    <?php } ?>
                                </td>
                                <td class="<?php echo ($seo_link_data['total_categories_difference'][$lid]>0) ? 'danger' : 'success' ?>">
                                    <?php echo $seo_link_data['total_categories_difference'][$lid]; ?>
                                    <?php if ($seo_link_data['total_categories_difference'][$lid] < 0) { ?>
                                        <div style="margin-top:5px">
                                            <a onclick="seoFixNow('category_fix_minus_urls', <?php echo $language['language_id']; ?>);" class="btn btn-sm btn-primary btn-url-minus-fix"><?php echo $text_fix_missing_urls_count; ?></a>
                                        </div>
                                    <?php } ?>
                                </td>
                                <td class="<?php echo ($seo_link_data['total_manufacturers_difference'][$lid]>0) ? 'danger' : 'success' ?>">
                                    <?php echo $seo_link_data['total_manufacturers_difference'][$lid]; ?>
                                    <?php if ($seo_link_data['total_manufacturers_difference'][$lid] < 0) { ?>
                                        <div style="margin-top:5px">
                                            <a onclick="seoFixNow('manufacturer_fix_minus_urls', <?php echo $language['language_id']; ?>);" class="btn btn-sm btn-primary btn-url-minus-fix"><?php echo $text_fix_missing_urls_count; ?></a>
                                        </div>
                                    <?php } ?>
                                </td>
                                <td class="<?php echo ($seo_link_data['total_informations_difference'][$lid]>0) ? 'danger' : 'success' ?>">
                                    <?php echo $seo_link_data['total_informations_difference'][$lid]; ?>
                                    <?php if ($seo_link_data['total_informations_difference'][$lid] < 0) { ?>
                                        <div style="margin-top:5px">
                                            <a onclick="seoFixNow('information_fix_minus_urls', <?php echo $language['language_id']; ?>);" class="btn btn-sm btn-primary btn-url-minus-fix"><?php echo $text_fix_missing_urls_count; ?></a>
                                        </div>
                                    <?php } ?>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><?php echo $text_action; ?></th>
                                <td>
                                    <a onclick="seoFixNow('product_seo_urls', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_link_data['total_products_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('product_seo_urls_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('category_seo_urls', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_link_data['total_categories_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('category_seo_urls_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('manufacturer_seo_urls', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_link_data['total_manufacturers_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('manufacturer_seo_urls_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                                <td>
                                    <a onclick="seoFixNow('information_seo_urls', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-primary <?php echo ($seo_link_data['total_informations_difference'][$lid]>0) ? '' : 'disabled'; ?> btn-seo-fix margin-fix"><?php echo $text_generate; ?></a>
                                    <br /><br />
                                    <a onclick="seoFixNow('information_seo_urls_all', <?php echo $language['language_id']; ?>);" class="btn btn-md btn-success btn-seo-fix"><?php echo $text_start_fresh; ?></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <?php } ?>
                <div id="seo_links_advanced" role="tabpanel" class="tab-pane fade in">
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <h3><?php echo $text_product_url_string; ?></h3>
                        <input name="product_url_string" type="text" class="form-control input-md" value="<?php echo $product_url_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [product], [model], [sku], [upc], [manufacturer], [lang], [id], [random]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <h3><?php echo $text_category_url_string; ?></h3>
                        <input name="category_url_string" type="text" class="form-control input-md" value="<?php echo $category_url_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [category], [lang], [random]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <br />
                        <h3><?php echo $text_manufacturer_url_string; ?></h3>
                        <input name="manufacturer_url_string" type="text" class="form-control input-md" value="<?php echo $manufacturer_url_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [manufacturer], [lang], [random]
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <br />
                        <br />
                        <h3><?php echo $text_information_url_string; ?></h3>
                        <input name="information_url_string" type="text" class="form-control input-md" value="<?php echo $information_url_string; ?>" />
                        <br /><?php echo $text_short_codes; ?><br />
                        [information], [lang], [random]
                    </div>
                    <div class="col-xs-12 col-md-12">
                        <p>
                            <br />
                            <?php echo $text_random_shortcode; ?>
                        </p>
                        <p class="text-left">
                            <br />
                            <a onClick="saveChanges('#seo_links_advanced');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                        </p>
                    </div>
                </div>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_seo_links_helper_title; ?></h1>
            </div>
            <div class="box-content">
            <?php echo $tab_seo_links_helper; ?>
            </div>
        </div>
	</div>
</div>
