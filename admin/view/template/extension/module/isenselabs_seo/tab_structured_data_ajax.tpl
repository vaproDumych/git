<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <div id="seo_rich_snippets" role="tabpanel" class="tab-pane fade in">
                <h3><?php echo $tab_structured_data; ?></h3>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_product_data; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="richsnippets_product_data" class="form-control">
                          <option value="1" <?php echo ($richsnippets_product_data=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($richsnippets_product_data==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_product_breadcrumbs; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="richsnippets_product_breadcrumbs" class="form-control">
                          <option value="1" <?php echo ($richsnippets_product_breadcrumbs=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($richsnippets_product_breadcrumbs==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_richsnippets_category_breadcrumbs; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="richsnippets_category_breadcrumbs" class="form-control">
                          <option value="1" <?php echo ($richsnippets_category_breadcrumbs=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($richsnippets_category_breadcrumbs==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 col-xs-6">
                        <label>
                          <?php echo $text_enable_company_info; ?>
                        </label>
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <select name="richsnippets_company_info" class="form-control">
                          <option value="1" <?php echo ($richsnippets_company_info=='1') ? 'selected="selected"' : ''; ?>><?php echo $text_yes; ?></option>
                          <option value="0" <?php echo ($richsnippets_company_info==='0') ? 'selected="selected"' : ''; ?>><?php echo $text_no; ?></option>
                        </select>
                    </div>
                </div>
                <p>
                    <br />
                    <a onClick="saveChanges('#seo_rich_snippets');" class="btn btn-md btn-primary"><?php echo $text_save_changes; ?></a>
                </p>
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
          <div class="box-heading">
            <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $tab_rich_snippets_helper_title; ?></h1>
          </div>
          <div class="box-content">
            <?php echo $tab_rich_snippets_helper; ?>
          </div>
      </div>
	</div>
</div>