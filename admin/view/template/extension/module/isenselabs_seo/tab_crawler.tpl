<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-md-8">
            <h3><?php echo $text_seo_crawler; ?></h3><br />
            <div class="well page-crawler">
              <div class="row">
                <div class="col-xs-12 col-md-12">
                 <div class="input-group url-buttons">
                       <div class="input-group-btn">
                           <h4>Choose page:</h4>
                           <button type="button" class="btn btn-default btn-crawler-fix" onClick="addUrl(this);" data-url="<?php echo $urls_array['home']; ?>"><?php echo $text_home_page; ?></button> 
                           <button type="button" class="btn btn-default btn-crawler-fix" onClick="addUrl(this);" data-url="<?php echo $urls_array['product']; ?>"><?php echo $text_product_page; ?></button> 
                           <button type="button" class="btn btn-default btn-crawler-fix" onClick="addUrl(this);" data-url="<?php echo $urls_array['category']; ?>"><?php echo $text_category_page; ?></button> 
                           <button type="button" class="btn btn-default btn-crawler-fix" onClick="addUrl(this);" data-url="<?php echo $urls_array['information']; ?>"><?php echo $text_information_page; ?></button> 
                       </div> 
                    </div>
                </div>
              </div>
              <br>
              <div class="row">
                <div class="col-xs-12 col-md-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <select class="form-control input-md" name="seo_crawler_left_url">
                          <?php foreach ($stores as $store_data) { ?>
                              <option value="<?php echo $store_data['url']; ?>"><?php echo $store_data['url']; ?></option>
                          <?php } ?>
                      </select>
                    </div>
                    <div class="col-sm-6">
                      <input type="text" placeholder="<?php echo $text_enter_a_web_page_url; ?>" class="form-control seo_crawler_input input-md" aria-describedby="sizing-addon1">
                    </div>
                  </div>
                </div>
                <div class="col-xs-2 col-md-2">
                  <button type="button" onClick="crawlerAnalyze(this);" class="btn-crawler-analyze btn btn-primary btn-block btn-md"><?php echo $text_analyze; ?></button>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="seo_crawler_results">
            
            </div>
  		</div>
  		
  		<div class="col-xs-12 col-md-4">
        <div class="box-heading">
		      <h1><i class="fa fa-info-circle" aria-hidden="true"></i><?php echo $text_crawler_helper_title; ?></h1>
        </div>
        <div class="box-content">
          <?php echo $text_crawler_helper; ?>
        </div>
      </div>
	</div>
</div>