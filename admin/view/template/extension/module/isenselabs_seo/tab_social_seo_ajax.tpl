<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <div id="seo_social_links" role="tabpanel" class="tab-pane fade in">
                <h3><?php echo $tab_social_seo; ?></h3>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_fb_og; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="facebook_open_graph" class="form-control">
                          <option value="1" <?php echo ($facebook_open_graph=='1') ? 'selected="selected"' : ''; ?>>Yes</option>
                          <option value="0" <?php echo ($facebook_open_graph=='0') ? 'selected="selected"' : ''; ?>>No</option>
                        </select>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_product_data; ?>:</span>
                            <select name="facebook_open_graph_product_data" class="form-control">
                              <option value="1" <?php echo ($facebook_open_graph_product_data=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_enable; ?></option>
                              <option value="0" <?php echo ($facebook_open_graph_product_data=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_disable; ?></option>
                            </select>
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_app_id; ?>:</span>
                            <input name="facebook_open_graph_app_id" type="text" class="form-control" value="<?php echo $facebook_open_graph_app_id; ?>" />
                        </div>
                    </div>
                </div>
                <br />
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_twitter_card; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="twitter_card" class="form-control">
                          <option value="1" <?php echo ($twitter_card=='1') ? 'selected="selected"' : ''; ?>>Yes</option>
                          <option value="0" <?php echo ($twitter_card=='0') ? 'selected="selected"' : ''; ?>>No</option>
                        </select>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_product_data; ?>:</span>
                            <select name="twitter_card_product_data" class="form-control">
                              <option value="1" <?php echo ($twitter_card_product_data=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_enable; ?></option>
                              <option value="0" <?php echo ($twitter_card_product_data=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_disable; ?></option>
                            </select>
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_username; ?>:</span>
                            <input name="twitter_card_username" type="text" class="form-control" value="<?php echo $twitter_card_username; ?>" />
                        </div>
                    </div>
                </div>
                <br />
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_google_publisher; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="google_publisher" class="form-control">
                          <option value="1" <?php echo ($google_publisher=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($google_publisher=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_google_plus_id; ?>:</span>
                            <input name="google_publisher_id" type="text" class="form-control" value="<?php echo $google_publisher_id; ?>" />
                        </div>
                    </div>
                </div>
                <br />
                <hr />
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_hreflang; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_products; ?></span>
                            <select name="hreflang_products" class="form-control">
                              <option value="1" <?php echo ($hreflang_products=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_enable; ?></option>
                              <option value="0" <?php echo ($hreflang_products=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_disable; ?></option>
                            </select>
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_categories; ?></span>
                            <select name="hreflang_categories" class="form-control">
                              <option value="1" <?php echo ($hreflang_categories=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_enable; ?></option>
                              <option value="0" <?php echo ($hreflang_categories=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_disable; ?></option>
                            </select>
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_manufacturers; ?></span>
                            <select name="hreflang_manufacturers" class="form-control">
                              <option value="1" <?php echo ($hreflang_manufacturers=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_enable; ?></option>
                              <option value="0" <?php echo ($hreflang_manufacturers=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_disable; ?></option>
                            </select>
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><?php echo $text_informations; ?></span>
                            <select name="hreflang_informations" class="form-control">
                              <option value="1" <?php echo ($hreflang_informations=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_enable; ?></option>
                              <option value="0" <?php echo ($hreflang_informations=='0') ? 'selected="selected"' : ''; ?>><?php echo $text_disable; ?></option>
                            </select>
                        </div>
                        <br />
                    </div>
                </div>
                <p>
                    <br />
                    <a onClick="saveChanges('#seo_social_links');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_social_links_helper_title; ?></h1>
            </div>
            <div class="box-content">
                <?php echo $tab_social_links_helper; ?>
            </div>
        </div>
	</div>
</div>