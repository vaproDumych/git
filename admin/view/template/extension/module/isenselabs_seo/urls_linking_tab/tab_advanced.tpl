<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <div id="seo_advanced_url_settings" class="row">
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_unify_urls; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="unify_urls" class="form-control">
                          <option value="1" <?php echo ($unify_urls=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($unify_urls==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_breadcrumb_products; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="breadcrumb_products" class="form-control">
                          <option value="1" <?php echo ($breadcrumb_products=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($breadcrumb_products==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_breadcrumb_categories; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="breadcrumb_categories" class="form-control">
                          <option value="1" <?php echo ($breadcrumb_categories=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($breadcrumb_categories==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_products_autogenerate; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="url_product_autogenerate" class="form-control">
                          <option value="1" <?php echo ($url_product_autogenerate=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($url_product_autogenerate==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_categories_autogenerate; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="url_category_autogenerate" class="form-control">
                          <option value="1" <?php echo ($url_category_autogenerate=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($url_category_autogenerate==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_manufacturers_autogenerate; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="url_manufacturer_autogenerate" class="form-control">
                          <option value="1" <?php echo ($url_manufacturer_autogenerate=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($url_manufacturer_autogenerate==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_informations_autogenerate; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="url_information_autogenerate" class="form-control">
                          <option value="1" <?php echo ($url_information_autogenerate=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($url_information_autogenerate==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_subfolder_prefixes; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="subfolder_prefixes" class="form-control">
                          <option value="1" <?php echo ($subfolder_prefixes=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($subfolder_prefixes==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                  <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_subfolder_prefixes_alias; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <?php foreach ($languages as $language) { ?>
                            <div class="input-group" style="margin:5px auto;">
                              <div class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></div>
                              <input type="text" class="form-control" name="subfolder_prefixes_alias[<?php echo $language['code']; ?>]" value="<?php echo $subfolder_prefixes_alias[$language['code']]; ?>">
                            </div>
                        <?php } ?>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_default_lang_prefix; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="default_lang_prefix" class="form-control">
                          <option value="1" <?php echo ($default_lang_prefix=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($default_lang_prefix==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_redirect_active_lang_prefix; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="redirect_active_lang_prefix" class="form-control">
                          <option value="0" <?php echo ($redirect_active_lang_prefix==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                          <option value="1" <?php echo ($redirect_active_lang_prefix=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_cyrillic_url; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="cyrillic_urls" class="form-control">
                            <option value="1" <?php echo ($cyrillic_urls=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                            <option value="0" <?php echo ($cyrillic_urls==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_redirect_to_seo_links; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="redirect_to_seo_links" class="form-control">
                            <option value="1" <?php echo ($redirect_to_seo_links=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                            <option value="0" <?php echo ($redirect_to_seo_links==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                
                <p>
                    <br />
                    <a onClick="saveChanges('#seo_advanced_url_settings');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $text_advanced_settings; ?></h1>
            </div>
            <div class="box-content">
                <h4><?php echo $text_unify_urls; ?></h4>
                <p><?php echo $text_unify_urls_helper; ?></p>
                
                <h4><?php echo $text_breadcrumb_products; ?></h4>
                <p><?php echo $text_breadcrumb_products_helper; ?></p>
                
                <h4><?php echo $text_breadcrumb_categories; ?></h4>
                <p><?php echo $text_breadcrumb_categories_helper; ?></p>
                
                <h4><?php echo $text_autogenerate; ?></h4>
                <p><?php echo $text_autogenerate_helper; ?></p>
                
                <h4><?php echo $text_subfolder_prefixes; ?></h4>
                <p><?php echo $text_subfolder_prefixes_helper; ?></p>

                <h4><?php echo $text_default_lang_prefix; ?></h4>
                <p><?php echo $text_default_lang_prefix_helper; ?></p>

                <h4><?php echo $text_redirect_active_lang_prefix; ?></h4>
                <p><?php echo $text_redirect_active_lang_prefix_helper; ?></p>

                <h4><?php echo $text_cyrillic_url; ?></h4>
                <p><?php echo $text_cyrillic_url_helper; ?></p>
            </div>
        </div>
	</div>
</div>
