<div class="detected-pages-filter-row well">
    <div class="col-xs-12 col-sm-12 col-md-6">
        <div class="form-group">
           <label for="filter_route"><?php echo $text_route; ?>:</label>
            <input name="filter_route" id="route_entry" class="form-control detected-pages-filter" value="<?php echo $filter_route; ?>" />
        </div>
        <div class="form-group">
            <label for="date_start_entry"><?php echo $text_date_start; ?>:</label>
            <input name="date_start" id="date_start_entry" class="form-control date" data-date-format="YYYY-MM-DD" value="<?php echo $date_start; ?>" />
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-6">
        <div class="form-group">
            <label for="visits"><?php echo $text_visits; ?>:</label>
            <input name="visits" id="visits_entry" class="form-control detected-pages-filter" value="<?php echo $visits; ?>" />
        </div>
        <div class="form-group">
            <label for="date_end_entry"><?php echo $text_date_end; ?>:</label>
            <input name="date_end" id="date_end_entry" class="form-control date" data-date-format="YYYY-MM-DD" value="<?php echo $date_end; ?>" />
        </div>
    </div>         
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="form-group text-right">
             <button class="btn btn-detected-pages-filter btn-primary" onClick="filterDetectedPages(this, event);"><?php echo $text_filter; ?></button>
        </div>
    </div>
    <div class="clearfix"></div>            
</div>
<table class="table table-striped table-detected-pages table-hover"> 
    <thead>
        <tr>
            <th><input type="checkbox" onclick="$('input[name*=\'detectedpages_ids\']').prop('checked', this.checked);$('input[name*=\'detectedpages_ids\']').trigger('change');"></th> 
            <th><?php echo $text_route; ?></th> 
            <th><?php echo $text_visits; ?></th> 
            <th><?php echo $text_first_visited; ?></th>
            <th><?php echo $text_last_visited; ?></th>
            <th class="text-right"><?php echo $text_action; ?></th> 
        </tr> 
    </thead> 
    <tbody> 
        <?php if (count($sources)> 0) { ?> 
            <tr class="detectedpages-options" style="display:none;">
                <td colspan="6">
                    <a onClick="deleteDetectedPages();" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $text_delete_selected_items; ?></a>
                </td>
            </tr>  
            <?php foreach ($sources as $index => $result) { ?>
            <tr> 
                <td scope="row">
                    <input type="checkbox" name="detectedpages_ids[]" value="<?php echo $result['page_id']; ?>" />
                </td>
                <td><a href="/<?php echo $result['route']; ?>" target="_blank">/<?php echo $result['route']; ?></a></td> 
                <td><?php echo $result['visits']; ?></td> 
                <td><?php echo $result['first_visited']; ?></td> 
                <td><?php echo $result['last_visited']; ?></td> 
                <td class="text-right">
                    <a onClick="addRedirectForMissingPage('<?php echo $result['routeParam']; ?>', '.tab-detected-pages-results');" class="btn btn-primary btn-md"><i class="fa fa-external-link-square" aria-hidden="true"></i></a>
                    &nbsp;
                    <a onClick="deleteDetectedPage(<?php echo $result['page_id']; ?>);" class="btn btn-danger btn-md"><i class="fa fa-times" aria-hidden="true"></i></a>
                </td> 
            </tr> 
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="6" class="text-center"><?php echo $text_no_detected_pages; ?></td>
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
$('.date').datetimepicker({
	pickTime: false
});
    
// input auto-send query
$('.detected-pages-filter').on('keydown', function(e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $('.btn-detected-pages-filter').trigger('click');
    }
});
</script>