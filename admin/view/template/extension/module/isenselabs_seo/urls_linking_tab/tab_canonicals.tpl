<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <div id="seo_canonical_settings" class="row">
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_canonical_products; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="canonical_products" class="form-control">
                          <option value="1" <?php echo ($canonical_products=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($canonical_products==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_canonical_categories; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="canonical_categories" class="form-control">
                          <option value="1" <?php echo ($canonical_categories=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($canonical_categories==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_canonical_manufacturers; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="canonical_manufacturers" class="form-control">
                          <option value="1" <?php echo ($canonical_manufacturers=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($canonical_manufacturers==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_canonical_information_pages; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="canonical_information_pages" class="form-control">
                          <option value="1" <?php echo ($canonical_information_pages=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($canonical_information_pages==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_canonical_specials; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="canonical_special_page" class="form-control">
                          <option value="1" <?php echo ($canonical_special_page=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($canonical_special_page==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_canonical_home_page; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="canonical_home_page" class="form-control">
                          <option value="1" <?php echo ($canonical_home_page=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($canonical_home_page==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <p>
                    <br />
                    <a onClick="saveChanges('#seo_canonical_settings');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
            <div class="box-heading">
                <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_canonicals_helper_title; ?></h1>
            </div>
            <div class="box-content">
                <?php echo $tab_canonicals_helper; ?>
            </div>
        </div>
	</div>
</div>