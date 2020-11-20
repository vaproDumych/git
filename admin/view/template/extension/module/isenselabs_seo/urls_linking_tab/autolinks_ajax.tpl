<div class="pull-left">
    <a class="btn btn-primary" onClick="addAutoLink();"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $text_add_new_autolink; ?></a>
</div>
<div class="clearfix"></div>
<table class="table table-striped table-autolinks table-hover"> 
    <thead>
        <tr> 
            <th><input type="checkbox" onclick="$('input[name*=\'autolinks_ids\']').prop('checked', this.checked);$('input[name*=\'autolinks_ids\']').trigger('change');"></th> 
            <th><?php echo $text_keyword; ?></th> 
            <th><?php echo $text_link; ?></th> 
            <th class="text-right"><?php echo $text_action; ?></th> 
        </tr> 
    </thead> 
    <tbody> 
        <?php if (count($sources)>0) { ?>  
            <tr class="autolinks-options" style="display:none;">
                <td colspan="5">
                    <a onClick="deleteAutoLinks();" class="btn btn-danger btn-sm"><i class="fa fa-times" aria-hidden="true"></i> <?php echo $text_delete_selected_items; ?></a>
                </td>
            </tr>    
            <?php foreach ($sources as $index => $result) { ?>
            <tr> 
                <td scope="row">
                    <input type="checkbox" name="autolinks_ids[]" value="<?php echo $result['id']; ?>" />
                </td> 
                <td><?php echo $result['keyword']; ?></td> 
                <td><a href="<?php echo $result['url']; ?>" target="_blank"><?php echo $result['url']; ?></a></td> 
                <td class="text-right">
                    <a onClick="editAutoLink(<?php echo $result['id']; ?>);" class="btn btn-primary btn-md"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                    &nbsp;
                    <a onClick="deleteAutoLink(<?php echo $result['id']; ?>);" class="btn btn-danger btn-md"><i class="fa fa-times" aria-hidden="true"></i></a>
                </td> 
            </tr> 
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="4" class="text-center"><?php echo $text_no_auto_links; ?></td>
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