<div class="container-fluid">
	<div class="row">
        <h3><?php echo $tab_seo_analysis; ?></h3><br />
        <div class="seo-analysis-filter-row well">
            <div class="col-xs-12 col-sm-12 col-md-6">
                <div class="form-group">
                    <label for="crawler_entry"><?php echo $text_crawler; ?>:</label>
                    <select name="crawler" id="crawler_entry" class="form-control">
                        <?php foreach ($crawler_list as $crawler_entry) { ?>
                        <option value="<?php echo $crawler_entry; ?>" <?php if ($crawler==$crawler_entry) echo 'selected="selected"'; ?>><?php echo $crawler_entry; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="date_start_entry"><?php echo $text_date_start; ?>:</label>
                    <input name="date_start" id="date_start_entry" class="form-control date" data-date-format="YYYY-MM-DD" value="<?php echo $date_start; ?>" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6">
                <div class="form-group">
                    <label for="url_entry"><?php echo $text_url; ?>:</label>
                    <input name="url" id="url_entry" class="form-control seo-analysis-url-filter" value="<?php echo $url; ?>" />
                </div>
                <div class="form-group">
                    <label for="date_end_entry"><?php echo $text_date_end; ?>:</label>
                    <input name="date_end" id="date_end_entry" class="form-control date" data-date-format="YYYY-MM-DD" value="<?php echo $date_end; ?>" />
                </div>
            </div>         
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group text-right">
                     <button class="btn btn-seo-analysis-filter btn-primary" onClick="filterSeoAnalysis(this, event);"><?php echo $text_filter; ?></button>
                </div>
            </div>
            <div class="clearfix"></div>            
        </div>
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-striped table-seo-analysis"> 
                    <thead>
                        <tr> 
                            <th>#</th> 
                            <th><?php echo $text_crawler; ?></th> 
                            <th><?php echo $text_visited_url; ?></th> 
                            <th class="text-right"><?php echo $text_date_time; ?></th> 
                        </tr> 
                    </thead> 
                    <tbody> 
                        <?php if (count($sources)> 0) { ?> 
                            <?php foreach ($sources as $index => $result) { ?>
                            <tr> 
                                <th scope="row"><?php echo ($index+1)*$page; ?></th> 
                                <td><?php echo $result['crawler']; ?></td> 
                                <td><a href="<?php echo $result['url']; ?>" target="_blank"><?php echo $result['url']; ?></a></td> 
                                <td class="text-right"><?php echo $result['date_added']; ?></td> 
                            </tr> 
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td colspan="4" class="text-center"><?php echo $text_no_crawler_results; ?></td>
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
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$('.date').datetimepicker({
	pickTime: false
});
    
// SEO-Analysis input auto-send query
$('.seo-analysis-url-filter').on('keydown', function(e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $('.btn-seo-analysis-filter').trigger('click');
    }
});
</script>