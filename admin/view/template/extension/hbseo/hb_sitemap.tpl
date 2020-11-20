<?php echo $header; ?><?php echo $column_left; ?>
<!--Main Content block start-->

<div id="content">
  <!--Header Start-->
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-latest" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> SAVE</button>
		<a class="btn btn-danger" onclick="deletelink();" id="button-deletelink"><i class="fa fa-minus"></i> Remove Links</a>
		<a class="btn btn-default" href="<?php echo $google_index_link; ?>" target="_blank"><i class="fa fa-search"></i> Check Google Indexed Pages</a>
		<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <!--Header End-->
  <!--Container 1 start -->
  <div class="container-fluid">
    <!--Start - Error / Success Message if any -->
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <!--End - Error / Success Message if any -->	
	
	<div id="msgoutput"></div>
	<?php if (!($htaccess_enabled)) { ?>
	<div class="pr_error no-htaccess" id="htaccess-msg-block">
		Relevant code not detected in your .htaccess file. Please add the code given in your settings tab to your .htaccess file in your web root directory.
		<a class="btn btn-warning" id="add-htacess-code">Add Code to .htaccess file</a>
	</div>
    <?php } ?>
	
	<!--Panel Content Start-->
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
			<?php if ($stores) { ?>
			<div class="pull-right">
			<select id="store">
				<option value="0" <?php echo ($store_id == 0)?'selected':''; ?>>Default Store</option>
				<?php foreach ($stores as $store) { ?>
					<option value="<?php echo $store['store_id']; ?>" <?php echo ($store_id == $store['store_id'])?'selected':''; ?>><?php echo $store['name']; ?></option>
				<?php } ?>
			</select>
			</div>
			<?php } ?>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language" class="form-horizontal">
			<!--Tabs UL Starts-->
			<ul class="nav nav-tabs" id="tabs">
                <li class="active"><a href="#tab-dashboard" data-toggle="tab"><i class="fa fa-tachometer" aria-hidden="true"></i> <?php echo $tab_dashboard; ?></a></li>
				<li><a href="#tab-misc" data-toggle="tab"><i class="fa fa-link" aria-hidden="true"></i> <?php echo $tab_misc; ?></a></li>
				<li><a href="#tab-setting" data-toggle="tab"><i class="fa fa-cogs" aria-hidden="true"></i> <?php echo $tab_setting; ?></a></li>
				<li><a href="#tab-tools" data-toggle="tab"><i class="fa fa-wrench" aria-hidden="true"></i> <?php echo $tab_tools; ?></a></li>
	          </ul>
			  <!--Tabs UL Ends-->
			  <div class="tab-content">
			  	<div class="tab-pane active" id="tab-dashboard">
					<div class="panel panel-default">
      					<div class="panel-heading"><h3>Sitemap Index File [Dynamic Version]</h3></div>
						 <div class="panel-body">
							<div class="col-sm-8">	
								<input type="text" class="form-control" value="<?php echo $sitemap_index_link; ?>" readonly="" />
								<div class="pr_warning">The above mentioned link is the sitemap index file of this store. Submit this file (Link) alone to search engines.</div>
							</div>
							<div class="col-sm-4">
								<a href="<?php echo $sitemap_index_link; ?>" class="btn btn-primary col-sm-12" target="_blank" style="margin-bottom:10px;"><i class="fa fa-sitemap"></i> Open Sitemap Index File</a>

								<a href="<?php echo $ping_google_link; ?>" class="btn btn-success col-sm-12" target="_blank" style="margin-bottom:10px;"><i class="fa fa-google"></i> Ping Google</a></p>

								<a href="<?php echo $ping_bing_link; ?>" class="btn btn-success col-sm-12" target="_blank" style="margin-bottom:10px;"><i class="fa fa-windows"></i> Ping Bing</a>
							</div>
						</div>
					</div>
					
					<h2>All Sitemap Links within Sitemap Index File</h2>
					<table class="table table-hover table-bordered">
						<thead>
						<tr class="warning">
							<th>Sitemap Files</th>
							<th class="text-right">Last Modified</th>
						</tr>
						</thead>
						<tbody>
						<?php if ($sitemaps) { ?>
							<?php foreach ($sitemaps as $sitemap) { ?>
							<tr>
								<td><a href="<?php echo $sitemap['loc']; ?>" target="_blank"><?php echo $sitemap['loc']; ?></a></td>
								<td class="text-right"><?php echo $sitemap['last_modified']; ?></td>
							</tr>
							<?php } ?>
						<?php } else { ?>
							<tr>
								<td colspan="2" class="pr_error">No sitemap links found in the sitemap index file. Please enable the sitemaps under the settings tab of this page and click on Save button.</td>
							</tr>
						<?php } ?>
						</tbody>
					</table>
					
				</div>
				
				
				
	  			<!--MISC TAB-->
	  			<div class="tab-pane" id="tab-misc">	
						 
					 <div class="form-group">
						<div class="col-sm-4">
							<input type="text" id="link" class="form-control" value="" placeholder="Enter Link" />
						</div>
						<div class="col-sm-3">
							<select id="freq" class="form-control">
								<option value="monthly">This page is updated once in a month</option>
								<option value="weekly">This page is updated once in a week</option>
								<option value="yearly">This page is updated once in a year</option>
								<option value="daily">This page is updated daily</option>
								<option value="hourly">This page is updated every hour</option>
								<option value="always">This page is updated everytime</option>
								<option value="never">This page remains same all the time</option>
							</select>
						</div>
						<div class="col-sm-3">
							<select id="priority" class="form-control">
								<option value="1">100% Most Important</option>
								<option value="0.9">90% Important</option>
								<option value="0.8">80% </option>
								<option value="0.7">70% </option>
								<option value="0.6">60% </option>
								<option value="0.5">50% Average</option>
								<option value="0.4">40% </option>
								<option value="0.3">30% </option>
								<option value="0.2">20% </option>
								<option value="0.1">10% Least Important</option>
								
							</select>
						</div>
						<div class="col-sm-2">
							<a class="btn btn-success col-sm-12" onclick="addlink();" id="button-addlink"><i class="fa fa-plus"></i> Add Link</a>
						</div>
				     </div>
					
					<div id="misc-block"></div>
				
				</div>
				
				<!--SETUP-->
				<div class="tab-pane" id="tab-setting">	
					<div class="col-sm-6">
				   		<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-8 control-label">Product Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_product" class="form-control" value="1" <?php echo ($hb_sitemap_product == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Product Tags Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_producttags" class="form-control" value="1" <?php echo ($hb_sitemap_producttags == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Category Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_category" class="form-control" value="1" <?php echo ($hb_sitemap_category == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Manufacturer Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_brand" class="form-control" value="1" <?php echo ($hb_sitemap_brand == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Information Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_info" class="form-control" value="1" <?php echo ($hb_sitemap_info == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Category to Product Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_ctopr" class="form-control" value="1" <?php echo ($hb_sitemap_ctopr == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Manufacturer to Product Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_btopr" class="form-control" value="1" <?php echo ($hb_sitemap_btopr == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">Misc/Custom Links Sitemap</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_misc" class="form-control" value="1" <?php echo ($hb_sitemap_misc == '1')? 'checked':'' ; ?> />
								</div>
						   </div> 
						   <div class="form-group">
								<label class="col-sm-8 control-label">
									Other 3rd Party Extension inclusion in to this Sitemap
									<div class="pr_warning">Enable this only if you use Journal2 Template's Blog Module. This option can also be extended to be used for other 3rd party module inclusion in this sitemap. Contact support for more information</div>
								</label>
								<div class="col-sm-4">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_others" class="form-control" value="1" <?php echo ($hb_sitemap_others == '1')? 'checked':'' ; ?> />
								</div>
						   </div>
				   		</div>
					</div>
					
					<div class="col-sm-6">
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-sm-4 control-label">Enable Extension / Enable Sitemap Index</label>
								<div class="col-sm-8">
									<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_enable" class="form-control" value="1" <?php echo ($hb_sitemap_enable == '1')? 'checked':'' ; ?> />
								</div>
						   </div>
						   <div class="form-group">
								<label class="col-sm-4 control-label">Number of Products per page</label>
								<div class="col-sm-8">
								  <input type="text" name="hb_sitemap_limit"  value="<?php echo $hb_sitemap_limit; ?>" class="form-control" />
								</div>
							</div>		
							
							<div class="form-group">
								<label class="col-sm-4 control-label">Image Resize Dimension</label>
								<div class="col-sm-4">
									<div class="input-group">
										<div class="input-group-addon"> <i class="fa fa-arrows-h" aria-hidden="true"></i> </div>
										<input type="text" name="hb_sitemap_width" value="<?php echo $hb_sitemap_width; ?>" class="form-control" />
										<div class="input-group-addon"> px </div>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="input-group">
										<div class="input-group-addon"> <i class="fa fa-arrows-v" aria-hidden="true"></i> </div>
										<input type="text" name="hb_sitemap_height" value="<?php echo $hb_sitemap_height; ?>" class="form-control" />
										<div class="input-group-addon"> px </div>
									</div>
								</div>
							 </div>
							 <div class="form-group">
									<label class="col-sm-4 control-label">Enable XML Formatter</label>
									<div class="col-sm-8">
										<input type="checkbox" data-toggle="toggle" data-onstyle="success" name="hb_sitemap_beautify" class="form-control" value="1" <?php echo ($hb_sitemap_beautify == '1')? 'checked':'' ; ?> />
										<div class="pr_warning">[Recommended] Keep this option disabled. Enable this in case of debugging.</div>
									</div>
							   </div>
				   		</div>
				   </div>
				   
					
					<div class="col-sm-12">			 
					<!--LANGUAGE BLOCK PANEL-->		
					<div class="panel panel-default">
					  <div class="panel-body">

					  		<ul class="nav nav-tabs" id="languages">
							<?php foreach ($languages as $language) { ?>
							<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
							<?php } ?>
							</ul>
						
							<div class="tab-content"> <!-- language tab content -->
							<?php foreach ($languages as $language) { ?>
							<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">	
								<div class="pr_warning"><b>Short-code:</b> {p} - Product Name</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">Image Caption Pattern</label>
									<div class="col-sm-9">
									  <input type="text" name="hb_sitemap_caption<?php echo $language['language_id']; ?>" value="<?php echo $hb_sitemap_caption[$language['language_id']]; ?>" class="form-control" />
									</div>
								 </div>
								 
								 <div class="form-group">
									<label class="col-sm-3 control-label">Image Title Pattern</label>
									<div class="col-sm-9">
									  <input type="text" name="hb_sitemap_title<?php echo $language['language_id']; ?>" value="<?php echo $hb_sitemap_title[$language['language_id']]; ?>" class="form-control" />
									</div>
								 </div>
								 
								 <div class="form-group">
									<label class="col-sm-3 control-label">Additional Image Caption Pattern</label>
									<div class="col-sm-9">
									  <input type="text" name="hb_sitemap_a_caption<?php echo $language['language_id']; ?>" value="<?php echo $hb_sitemap_a_caption[$language['language_id']]; ?>" class="form-control" />
									</div>
								 </div>
								 
								 <div class="form-group">
									<label class="col-sm-3 control-label">Additional Image Title Pattern</label>
									<div class="col-sm-9">
									  <input type="text" name="hb_sitemap_a_title<?php echo $language['language_id']; ?>" value="<?php echo $hb_sitemap_a_title[$language['language_id']]; ?>" class="form-control" />
									</div>
								 </div>
							</div>
							<?php } ?>
							</div> <!-- language tab content end-->	

					  </div>
					</div>
					<!--LANGUAGE BLOCK PANEL-->		
					
					<!--HTACCESS BLOCK PANEL-->		
					<?php if (!($htaccess_enabled)) { ?>
					<div class="panel panel-default no-htaccess">
					  <div class="panel-heading"><h3>Add these lines to your .htaccess file</h3></div>
					  <div class="panel-body">
					  	<div class="pr_warning">Add these lines to your htaccess file in your web root directory just below the line <b>RewriteRule ^system/download/(.*) index.php?route=error/not_found [L]</b></div>
					  	<textarea class="form-control" rows="10" readonly="readonly"><?php echo $htaccess_code; ?></textarea>
					  </div>
					 </div>
					 <?php } ?>
					 
					 </div>

				</div>
				
				<!--TOOLS TAB-->
				<div class="tab-pane" id="tab-tools">
					<div class="form-group">
						<div class="col-sm-12">
							<div class="well">
								<p><?php echo $invalid_date; ?></p>
								<br /><a class="btn btn-primary" onclick="fixDates();">Fix Dates</a>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-12">
							<h3>Import bulk links to Custom Links Sitemaps</h3>
							<p>You can enter each link on each line or use seperator (|) for the links.</p>
						</div>
						<div class="col-sm-12">
						  <textarea id="bulk-links" class="form-control" rows="10"></textarea>
						</div>
						<div class="col-sm-12" style="margin-top:10px;">
							<a class="btn btn-primary btn-lg" onclick="importBulk();">IMPORT</a>
						</div>
					</div>
					<div id="import-result"></div>
				</div>

				
			  </div><!--tab-content block end-->
        </form>
		
      </div>
    </div>
    <!--Panel Content End-->
    <!--Huntbee copyrights-->
    <div class="container-fluid">
      <center>
        <span class="help"><?php echo $heading_title; ?> - <?php echo $extension_version;?> &copy; <a href="https://www.huntbee.com/">WWW.HUNTBEE.COM</a> | <a href="https://www.huntbee.com/get-support">SUPPORT</a> | <a href="https://www.huntbee.com/documentation/docs/seo-xml-sitemap-generator-pro/" target="_blank">DOCUMENTATION</a></span>
      </center>
    </div>
    <!--Huntbee copyrights end-->
  </div>
  <!--Container 1 start -->
</div>
<!--Main Content block end-->
<style type="text/css">
.pr_error,.pr_info,.pr_infos,.pr_success,.pr_warning{margin:10px 0;padding:12px}.pr_info{color:#00529B;background-color:#BDE5F8}.pr_success{color:#4F8A10;background-color:#DFF2BF}.pr_warning{color:#9F6000;background-color:#FEEFB3}.pr_error{color:#D8000C;background-color:#FFBABA}.pr_error i,.pr_info i,.pr_success i,.pr_warning i{margin:10px 0;vertical-align:middle}
</style>

<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>	   

<script type="text/javascript"><!--
$('#languages a:first').tab('show');
//--></script>

<script type="text/javascript">
$(document).ready(function() {
	loadreports();
});
</script>
<script type="text/javascript">
function loadreports(){
	$('#misc-block').load('index.php?route=extension/hbseo/hb_sitemap/customlinks&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>');
}

$('#misc-block').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();
	$('#misc-block').load(this.href);
});
</script>

<script type="text/javascript">
$('#store').on('change', function() {
	window.location.href = 'index.php?route=extension/hbseo/hb_sitemap&token=<?php echo $token; ?>&store_id='+$('#store').val();
});

$('#add-htacess-code').on('click', function() {
	$('#msgoutput').html('');
	$.ajax({
		  url: 'index.php?route=extension/hbseo/hb_sitemap/addhtaccess&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>',
		  dataType: 'json',		
		  beforeSend: function() {
				$('#add-htacess-code').button('loading');
		  },
		  complete: function() {
				$('#add-htacess-code').button('reset');
		  },
		  success: function(json) {
		  		if (json['warning']) {
					  $('#msgoutput').html('<div class="pr_warning"><i class="fa fa-warning"></i> '+json['warning']+'</div>');
				}
				if (json['success']) {
					  $('#msgoutput').html('<div class="pr_success"><i class="fa fa-check"></i> '+json['success']+'</div>');
					  $('.no-htaccess').remove();
				}
		  },
		  error:  $('#msgoutput').html('<div class="pr_error"><i class="fa fa-times"></i> Some issues while trying to add the code to your .htaccess file. Please add the code manually.</div>')
	 });
});

function addlink(){
	$('#msgoutput').html('');
	$.ajax({
		  type: 'post',
		  url: 'index.php?route=extension/hbseo/hb_sitemap/addlink&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>',
		  data: {link : $('#link').val(), freq : $('#freq').val(), priority : $('#priority').val()},
		  dataType: 'json',		
		  beforeSend: function() {
				$('#button-addlink').button('loading');
		  },
		  complete: function() {
				$('#button-addlink').button('reset');
		  },
		  success: function(json) {
				if (json['success']) {
					  $('#msgoutput').html('<div class="pr_success"><i class="fa fa-check"></i> '+json['success']+'</div>');
				}
				if (json['error']) {
					  $('#msgoutput').html('<div class="pr_error"><i class="fa fa-warning"></i> '+json['error']+'</div>');
				}
				loadreports();
		  },			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}

	 });
}

function deletelink(){
	$('#msgoutput').html('');
	var arraydata = $('input[name="selected[]"]:checked').map(function(){
        return this.value;
    }).get()
	
	$.ajax({
		  type: 'post',
		  url: 'index.php?route=extension/hbseo/hb_sitemap/deletelink&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>',
		  data: {selected : arraydata},
		  dataType: 'json',		
		  beforeSend: function() {
				$('#button-deletelink').button('loading');
		  },
		  complete: function() {
				$('#button-deletelink').button('reset');
		  },
		  success: function(json) {
				if (json['success']) {
					  $('#msgoutput').html('<div class="pr_success"><i class="fa fa-check"></i> '+json['success']+'</div>');
				}
				if (json['warning']) {
					  $('#msgoutput').html('<div class="pr_error"><i class="fa fa-warning"></i> '+json['warning']+'</div>');
				}
				loadreports();
		  },			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}

	 });
}

function fixDates(){
	$.ajax({
		  url: 'index.php?route=extension/hbseo/hb_sitemap/fixdates&token=<?php echo $token; ?>',
		  dataType: 'json',	
		  success: function(json) {
				if (json['success']) {
					  $('#msgoutput').html('<div class="pr_success"><i class="fa fa-check"></i> '+json['success']+'</div>');
				}
		  }			
	 });
}

function importBulk(){
	$.ajax({
		  type: 'post',
		  url: 'index.php?route=extension/hbseo/hb_sitemap/importbulk&token=<?php echo $token; ?>&store_id=<?php echo $store_id; ?>',
		  dataType: 'json',	
		  data: {links : $('#bulk-links').val()},
		  success: function(json) {
				if (json['success']) {
					  $('#import-result').html('<div class="pr_success"><i class="fa fa-check"></i> '+json['success']+'</div>');
					  loadreports();
					  $('#bulk-links').val('');
				}
				if (json['warning']) {
					  $('#import-result').html('<div class="pr_error"><i class="fa fa-warning"></i> '+json['warning']+'</div>');
				}
		  }			
	 });
}
</script>
<?php echo $footer; ?>