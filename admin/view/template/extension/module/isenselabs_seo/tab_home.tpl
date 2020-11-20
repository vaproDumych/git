<div class="container-fluid">
	<div class="row">
  		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-5 text-center">
            <div class="well">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="seo_score_chart">
                            <h1><?php echo $text_seo_score_for; ?></h1>
                            <div id="seo_score"></div>
                            <div class="clearfix"></div>

                            <div class="button">
                                <br />
                                <a class="btn btn-lg btn-primary btn-retest" data-loading-text="Please wait..." onclick="getSEOScore();"><?php echo $button_test_again; ?></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <a onClick="showSeoScoreHelper();" class="pointer-cursor"><?php echo $text_seo_score_meaning; ?></a>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <p><?php echo $text_seo_score_last_checked; ?><?php echo $seo_score_last_checked; ?></p>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
  		</div>
  		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
            <h3><?php echo $text_what_can_be_improved . ' (<span class="improved_count">' . count($fixes) . '</span>)'; ?></h3>
            <br />
            <div class="list-group list-group-fixes">
                <?php if (count($fixes)>0) { ?>
                    <?php foreach ($fixes as $fix) { ?>
                    <div class="list-group-item">
                        <span class="pull-left">
                            <a onclick="seoFixQuick('<?php echo $fix['event']; ?>', this);" class="btn btn-sm btn-primary"><?php echo $text_fix_now; ?></a>
                        </span>
                        &nbsp;
                        <?php echo $fix['name']; ?>
                        
                    </div>
                    <?php } ?>
                <?php } else { ?>
                    <i class="fa fa-check-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $text_already_improved_great_result; ?>
                <?php } ?> 
            </div>
            
            <div class="padding-top"></div>
            <h3><?php echo $text_what_is_already_improved . ' (' . count($fixed) . ')'; ?></h3>
            <br />
            <div class="list-group list-group-fixes">
                <?php if (count($fixed)>0) { ?>
                    <?php foreach ($fixed as $index=>$fix) { ?>
                        <div class="list-group-item <?php echo ($index>4) ? 'show-hide-list' : ''; ?>">
                            <span class="pull-left">
                                <a onclick="seoFixQuick('<?php echo $fix['event']; ?>', this);" class="btn btn-sm btn-success disabled"><?php echo $text_success_btn; ?></a>
                            </span>
                            &nbsp;
                            <?php echo $fix['name']; ?>
                        </div>
                    <?php } ?>
                    <?php if ($show_more) { ?>
                        <div class="text-center padding-top"><a onClick="showHideList();" class="btn btn-default btn-sm btn-show-hide-list"><?php echo $text_show_more; ?></a></div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
	</div>
</div>


<script>
var seo_score = c3.generate({
    bindto: '#seo_score',
    data: {
        columns: [
            ['SEO Score', <?php echo $seo_score; ?>],
            ['Can be Improved', <?php echo 100-$seo_score; ?>]
        ],
        type: 'donut',
        onclick: function (d, i) { /*console.log("onclick", d, i);*/ },
        onmouseover: function (d, i) { /*console.log("onmouseover", d, i);*/ },
        onmouseout: function (d, i) { /*console.log("onmouseout", d, i);*/ }
    }
});
</script>
