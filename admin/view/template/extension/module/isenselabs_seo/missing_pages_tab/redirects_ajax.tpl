<div class="missing-redirects-filter-row well">
    <div class="col-xs-12 col-sm-12 col-md-6">
        <div class="form-group">
           <label for="route_from"><?php echo $text_route_from; ?>:</label>
            <input name="route_from" id="route_from_entry" class="form-control missing-redirects-filter" value="<?php echo $route_from; ?>" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-6">
        <div class="form-group">
            <label for="route_to"><?php echo $text_route_to; ?>:</label>
            <input name="route_to" id="route_to_entry" class="form-control missing-redirects-filter" value="<?php echo $route_to; ?>" />
        </div>
    </div>         
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group text-right">
             <button class="btn btn-missing-redirects-filter btn-primary" onClick="filterMissingRedirects(this, event);"><?php echo $text_filter; ?></button>
        </div>
    </div>
    <div class="clearfix"></div>            
</div>
<div class="pull-left">
    <a class="btn btn-primary" onclick="addRedirectForMissingPage('', '.tab-redirects-results');"><i class="fa fa-external-link-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $text_add_404_redirect; ?></a>
</div>
<div class="clearfix"></div>
<table class="table table-striped table-redirects table-hover"> 
    <thead>
        <tr>
            <th><input type="checkbox" onclick="$('input[name*=\'redirects_ids\']').prop('checked', this.checked);$('input[name*=\'redirects_ids\']').trigger('change');"></th> 
            <th><?php echo $text_route_from; ?></th> 
            <th><?php echo $text_route_to; ?></th> 
            <th><?php echo $text_created; ?></th>
            <th class="text-right"><?php echo $text_action; ?></th> 
        </tr> 
    </thead> 
    <tbody> 
        <?php if (count($sources)> 0) { ?> 
            <tr class="redirects-options" style="display:none;">
                <td colspan="6">
                    <a onClick="deleteRedirects();" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $text_delete_selected_items; ?></a>
                </td>
            </tr>  
            <?php foreach ($sources as $index => $result) { ?>
            <tr> 
                <td scope="row">
                    <input type="checkbox" name="redirects_ids[]" value="<?php echo $result['redirect_id']; ?>" />
                </td>
                <td><a href="/<?php echo $result['route_from']; ?>" target="_blank">/<?php echo $result['route_from']; ?></a></td> 
                <td><?php echo $result['route_to']; ?></td> 
                <td><?php echo $result['date_added']; ?></td> 
                <td class="text-right">
                    <a onClick="deleteRedirect(<?php echo $result['redirect_id']; ?>);" class="btn btn-danger btn-md"><i class="fa fa-times" aria-hidden="true"></i></a>
                </td> 
            </tr> 
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="6" class="text-center"><?php echo $text_no_redirects; ?></td>
            </tr>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="6">
    	        <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </td>
        </tr>
    </tfoot>
</table>
<script type="text/javascript">
// input auto-send query
$('.missing-redirects-filter').on('keydown', function(e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $('.btn-missing-redirects-filter').trigger('click');
    }
});
</script>