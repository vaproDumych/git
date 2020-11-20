<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-md-8">
            <div id="feed_sitemap_settings" class="row">
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_feed_product_limit; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <input type="text" name="feed_product_limit" class="form-control" value="<?php echo $feed_product_limit ?: 100; ?>" placeholder="100">
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_feed_category_product; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="feed_category_product" class="form-control">
                          <option value="1" <?php echo $feed_category_product == '1' ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo $feed_category_product == '0' ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_feed_manufacturer_product; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="feed_manufacturer_product" class="form-control">
                          <option value="1" <?php echo $feed_manufacturer_product == '1' ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo $feed_manufacturer_product == '0' ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                
                <p>
                    <br />
                    <a onClick="saveChanges('#feed_sitemap_settings');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
        </div>
        
        <div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $text_sitemap_feed; ?></h1>
            </div>
            <div class="box-content">
                <?php echo $text_sitemap_feed_helper; ?>
            </div>

            <div class="box-heading" style="margin-top:30px;">
                <h1><?php echo $text_sitemap_feed_setting; ?></h1>
            </div>
            <div class="box-content">
                <h4><?php echo $text_feed_product_limit; ?></h4>
                <p><?php echo $text_feed_product_limit_helper; ?></p>
                
                <h4><?php echo $text_feed_category_product; ?></h4>
                <p><?php echo $text_feed_category_product_helper; ?></p>
                
                <h4><?php echo $text_feed_manufacturer_product; ?></h4>
                <p><?php echo $text_feed_manufacturer_product_helper; ?></p>
                
                <h4><?php echo $text_feed_url; ?></h4>
                <textarea rows="2" readonly="" id="input-data-feed" class="form-control"><?php echo $store['url']; ?>index.php?route=<?php echo $modulePath; ?>/sitemap_feed</textarea>
            </div>
        </div>
    </div>
</div>
