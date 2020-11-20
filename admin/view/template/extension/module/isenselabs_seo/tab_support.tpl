<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-6 col-md-4">
    		<div class="box-heading">
      			<h2><i class="fa fa-user"></i>&nbsp;&nbsp;<?php echo $text_your_license; ?></h2>
    		</div>
    		<div class="box-contents">
			    <?php if (empty($moduleData['LicensedOn'])): ?>
                <table class="table notLicensedTable">
                	<tr>
                    	<td colspan="2">
                            <div class="form-group">
                                <label for="moduleLicense"><?php echo $text_please_enter_the_code; ?></label>
                                <input type="text" class="licenseCodeBox form-control input-lg" placeholder="XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX" name="<?php echo $moduleName; ?>[LicenseCode]" id="moduleLicense" value="<?php echo !empty($moduleData['LicenseCode']) ? $moduleData['LicenseCode'] : ''?>" />
                                <br />
                                <div class="licenseAlerts"></div>
    			                <div class="licenseDiv"></div>
                                <button type="button" class="btn btn-success btn-lg btnActivateLicense"><i class="fa fa-check"></i>&nbsp;<?php echo $text_activate_license; ?></button>
                                <br /><br />
                                <button type="button" class="btn btn-default btn-sm" onclick="window.open('http://isenselabs.com/users/purchases/')"><?php echo $text_not_having_a_license; ?>&nbsp;&nbsp;<i class="fa fa-external-link"></i></button>
                        	</div>
                  		</td>
                	</tr>
              	</table>
                <script type="text/javascript" src="//isenselabs.com/external/validate/"></script>
    		    <?php endif; ?>
    
			    <?php if (!empty($moduleData['LicensedOn'])): ?>
    			<input name="cHRpbWl6YXRpb24ef4fe" type="hidden" value="<?php echo base64_encode(json_encode($moduleData['License'])); ?>" />
    			<input name="OaXRyb1BhY2sgLSBDb21" type="hidden" value="<?php echo $moduleData['LicensedOn']; ?>" />
    			<table class="table licensedTable">
                    <tr>
                    	<td><?php echo $text_license_holder; ?></td>
                    	<td><?php echo $moduleData['License']['customerName']; ?></td>
                    </tr>
                	<tr>
                		<td><?php echo $text_registered_domains; ?></td>
                		<td>
                    		<ul class="registeredDomains">
                    			<?php foreach ($moduleData['License']['licenseDomainsUsed'] as $domain): ?>
                        			<li><i class="fa fa-check"></i>&nbsp;<?php echo $domain; ?></li>
                    			<?php endforeach; ?>
                    		</ul>
                		</td>
                	</tr>
                	<tr>
                		<td><?php echo $text_expires_on; ?></td>
                		<td><?php echo date("F j, Y",strtotime($moduleData['License']['licenseExpireDate'])); ?></td>
                	</tr>
                	<tr>
                    	<td colspan="2" style="text-align:center;background-color:#EAF7D9;"><?php echo $text_valid_license; ?> ( <a href="http://isenselabs.com/users/purchases" target="_blank"><?php echo $text_manage; ?></a> )</td>
                	</tr>
				</table>
    		    <?php endif; ?>
            </div>
  		</div>
  
		<div class="col-xs-6 col-md-8">
    		<div class="box-heading">
      			<h2><i class="fa fa-users"></i>&nbsp;&nbsp;<?php echo $text_get_support; ?></h2>
    		</div>
    		<div class="box-contents">
                <br />
                <div class="row">
                    <div class="col-xs-6 col-md-4">
                        <div class="thumbnail">
                            <img src="view/image/<?php echo $moduleName; ?>/community.png">
                            <div class="caption" style="text-align:center;padding-top:0px;">
                                <h3><?php echo $text_community; ?></h3>
                                <p><?php echo $text_ask_our_community; ?> </p>
                                <p style="padding-top: 5px;"><a href="http://isenselabs.com/forum" target="_blank" class="btn btn-lg btn-default"><?php echo $text_browse_forums; ?></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4">
                        <div class="thumbnail">
                            <img src="view/image/<?php echo $moduleName; ?>/tickets.png">
                            <div class="caption" style="text-align:center;padding-top:0px;">
                                <h3><?php echo $text_tickets; ?></h3>
                                <p><?php echo $text_open_a_ticket; ?></p>
                                <p style="padding-top: 5px;"><a href="http://isenselabs.com/tickets/open/<?php echo base64_encode('Support Request').'/'.base64_encode('429').'/'. base64_encode($_SERVER['SERVER_NAME']); ?>" target="_blank" class="btn btn-lg btn-default"><?php echo $text_open_ticket_for_real; ?></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-md-4 ">
                        <div class="thumbnail">
                            <img alt="Pre-sale support" src="view/image/<?php echo $moduleName; ?>/pre-sale.png">
                            <div class="caption" style="text-align:center;padding-top:0px;">
                                <h3><?php echo $text_pre_sale; ?></h3>
                                <p><?php echo $text_pre_sale_text; ?></p>
                                <p style="padding-top: 5px;"><a href="https://isenselabs.com/pages/premium-services#section-contact" target="_blank" class="btn btn-lg btn-default"><?php echo $text_bump_the_sales; ?></a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</div>
</div>