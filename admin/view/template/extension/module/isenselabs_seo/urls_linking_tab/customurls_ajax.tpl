<div class="pull-left">
    <a class="btn btn-primary" onClick="addCustomUrl();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $text_add_custom_url; ?></a>
</div>
<div class="clearfix"></div>
<table class="table table-striped table-customurls table-hover"> 
    <thead>
        <tr>
             <th><input type="checkbox" onclick="$('input[name*=\'customurls_queries\']').prop('checked', this.checked);$('input[name*=\'customurls_queries\']').trigger('change');"></th> 
            <th><?php echo $text_route; ?></th> 
            <th><?php echo $text_custom_url; ?></th> 
            <th class="text-right"><?php echo $text_action; ?></th> 
        </tr> 
    </thead> 
    <tbody> 
        <?php if (count($sources)> 0) { ?> 
            <tr class="customurls-options" style="display:none;">
                <td colspan="5">
                    <a onClick="deleteCustomUrls();" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $text_delete_selected_items; ?></a>
                </td>
            </tr>  
            <?php foreach ($sources as $index => $result) { ?>
            <tr> 
                <td scope="row">
                    <input type="checkbox" name="customurls_queries[]" value="<?php echo $result['query']; ?>" />
                </td>
                <td><a href="/index.php?route=<?php echo $result['query']; ?>" target="_blank">/<?php echo $result['query']; ?></a></td> 
                <td><a href="/index.php?route=<?php echo $result['keyword']; ?>" target="_blank">/<?php echo $result['keyword']; ?></a></td> 
                <td class="text-right">
                    <a onClick="editCustomUrl('<?php echo $result['query']; ?>');" class="btn btn-primary btn-md"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                    &nbsp;
                    <a onClick="deleteCustomUrl('<?php echo $result['query']; ?>');" class="btn btn-danger btn-md"><i class="fa fa-times" aria-hidden="true"></i></a>
                </td> 
            </tr> 
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="4" class="text-center"><?php echo $text_no_custom_urls; ?></td>
            </tr>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="5">
    	        <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </td>
        </tr>
    </tfoot>
</table>
