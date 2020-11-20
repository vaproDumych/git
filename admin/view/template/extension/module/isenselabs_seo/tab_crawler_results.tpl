<?php if ($display_data) { ?>
    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_server_speed; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php if ($fields_checker_values['ttfb_loading'] >= '1.0') { ?>
               <h4 class="text-danger"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_server_response_time_bad; ?></h4>
            <?php } else if ($fields_checker_values['ttfb_loading'] > '0.2' && $fields_checker_values['ttfb_loading'] <= '1.0') { ?>
               <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_server_response_time_medium; ?></h4>
            <?php } else { ?>
               <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_server_response_time_good; ?></h4>
            <?php } ?>

            <br />
            <p><strong><?php echo $text_ttfb_time; ?></strong> <?php echo $fields_checker_values['ttfb_loading']; ?> <?php echo $text__seconds; ?></p>
            <p><strong><?php echo $text_site_loading_time; ?></strong> <?php echo $fields_checker_values['site_loading']; ?> <?php echo $text__seconds; ?></p>

            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_ttfb_helper; ?><br /><br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_site_load_helper; ?><br />
            <hr />
        </div>
    </div>

    <br /><br />
      
    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_https_ssl; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php if ($fields_checker_values['ssl_enabled']) { ?>
               <h4 class="text-success"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_https_is_supported; ?></h4>
            <?php } else { ?>
               <h4 class="text-danger"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_https_is_not_supported; ?></h4>
            <?php } ?>

            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_ssl_helper; ?><br /><br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_ssl_helper2; ?><br />
            <hr />
        </div>
    </div>

    <br /><br />
       
    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_title_tag; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php $string_length = $fields_checker_values['title_length'];
            if ($string_length < 10 || $string_length > 60) { ?>
               <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_long_small_title_tag; ?></h4>
            <?php } else { ?>
               <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_title_perfect_tag; ?></h4>
            <?php } ?>

            <br />
            <p><strong><?php echo $text_character_text; ?></strong> "<?php echo $fields_checker_values['title']; ?>"</p>
            <p><strong><?php echo $text_character_length; ?></strong> <?php echo $fields_checker_values['title_length']; ?></p>

            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_title_tag_helper; ?>
            <hr />
        </div>
    </div>

    <br /><br />

    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_description_tag; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php $string_length = $fields_checker_values['meta_description_length'];
            if ($string_length < 10 || $string_length > 160) { ?>
               <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_long_small_meta_description_tag; ?></h4>
            <?php } else { ?>
               <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_meta_description_perfect_tag; ?></h4>
            <?php } ?>

            <br />
            <p><strong><?php echo $text_character_text; ?></strong> "<?php echo $fields_checker_values['meta_description']; ?>"</p>
            <p><strong><?php echo $text_character_length; ?></strong> <?php echo $fields_checker_values['meta_description_length']; ?></p>

            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_meta_description_tag_helper; ?>
            <hr />
        </div>
    </div>

    <br /><br />

    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_canonical_tag; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php if ($fields_checker_values['canonical'] == '') { ?>
               <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_canonical_missing_tag; ?></h4>
            <?php } else { ?>
               <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_canonical_tag_success; ?></h4>
            <?php } ?>

            <br />
            <p><strong><?php echo $text_canonical_url; ?></strong> <?php echo $fields_checker_values['canonical']; ?></p>
            <p><strong><?php echo $text_canonical_tested_url; ?></strong> <?php echo $fields_checker_values['full_url']; ?></p>

            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_canonical_helper; ?>
            <hr />
        </div>
    </div>

    <br /><br />

    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_og_tag; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php if (count($fields_checker_values['og_tags']) == 0) { ?>  
               <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_no_og_tags; ?></h4>
            <?php } else { ?>
               <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_og_tags_success; ?></h4>
            <?php } ?>

            <?php if (count($fields_checker_values['og_tags']) > 0) { ?>  
                <br /><?php echo $text_og_tags_listing; ?><br /><br />
                <table class="table table-striped table-hover">
                   <thead>
                      <tr>
                         <th><?php echo $text_tag; ?></th>
                         <th><?php echo $text_content; ?></th>
                      </tr>
                   </thead>
                   <tbody>
                      <?php foreach ($fields_checker_values['og_tags'] as $og_tag) { ?>
                          <tr>
                             <td><?php echo $og_tag['name']; ?></td>
                             <td><?php echo $og_tag['value']; ?></td>
                          </tr>
                      <?php } ?>
                   </tbody>
                </table>   
            <?php } ?>                 
            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_og_tags_helper; ?>
            <hr />
        </div>
    </div>

    <br /><br />

    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_twitter_tags; ?></h4>
        </div>
        <div class="col-xs-9">
            <?php if (count($fields_checker_values['twitter_tags']) == 0) { ?>  
               <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_no_twitter_tags; ?></h4>
            <?php } else { ?>
               <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_twitter_tags_success; ?></h4>
            <?php } ?>

            <?php if (count($fields_checker_values['twitter_tags']) > 0) { ?>  
                <br /><?php echo $text_og_tags_listing; ?><br /><br />
                <table class="table table-striped table-hover">
                   <thead>
                      <tr>
                         <th><?php echo $text_tag; ?></th>
                         <th><?php echo $text_content; ?></th>
                      </tr>
                   </thead>
                   <tbody>
                      <?php foreach ($fields_checker_values['twitter_tags'] as $twitter_tag) { ?>
                          <tr>
                             <td><?php echo $twitter_tag['name']; ?></td>
                             <td><?php echo $twitter_tag['value']; ?></td>
                          </tr>
                      <?php } ?>
                   </tbody>
                </table>   
            <?php } ?>                 
            <br />
            <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_twitter_tags_helper; ?>
            <hr />
        </div>
    </div>

    <br /><br />

    <div class="row">
        <div class="col-xs-3">
            <h4><?php echo $text_heading_titles; ?></h4>
        </div>
        <div class="col-xs-9">

            <table class="table table-striped table-hover">
               <thead>
                  <tr>
                     <th>H1</th>
                     <th>H2</th>
                     <th>H3</th>
                     <th>H4</th>
                     <th>H5</th>
                     <th>H6</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><?php echo $heading_tags['h1']; ?></td>
                     <td><?php echo $heading_tags['h2']; ?></td>
                     <td><?php echo $heading_tags['h3']; ?></td>
                     <td><?php echo $heading_tags['h4']; ?></td>
                     <td><?php echo $heading_tags['h5']; ?></td>
                     <td><?php echo $heading_tags['h6']; ?></td>
                  </tr>
               </tbody>
            </table>

            <br />
            <?php if ($heading_tags['h1'] == 0) {?>
                <h4 class="text-danger"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> <?php echo $text_missing_h1; ?></h4>
                <p><?php echo $text_h1_missing; ?></p>
            <?php } else if ($heading_tags['h1'] > 1) { ?>
                <h4 class="text-danger"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> <?php echo $text_many_h1_tags; ?></h4>
                <p><?php echo $text_h1_missing; ?></p>
            <?php } else if ($heading_tags['h1'] == 1) { ?>
               <?php $string_length = strlen($fields_checker_values['h1'][0]); 
                   if ($string_length < 15 || $string_length > 65) { ?>
                       <h4 class="text-warning"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_long_small_h1_tag; ?></h4>
                   <?php } else { ?>
                       <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_h1_tag; ?></h4>
                   <?php } ?>
                   <p><?php echo $text_h1_label; ?></p>
                   <h4>"<?php echo $fields_checker_values['h1'][0]; ?>"</h4>
            <?php } ?>


            <br />
            <?php if ($small_long_headings_counter > 0) { ?>
                <h4 class="text-danger"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> <?php echo $text_long_small_headings; ?> (<?php echo $small_long_headings_counter; ?>)</h4>
                <table class="table table-striped table-hover">
                   <thead>
                      <tr>
                         <th class="col-xs-2"><?php echo $text_heading; ?></th>
                         <th class="col-xs-10"><?php echo $text_text; ?></th>
                      </tr>
                   </thead>
                   <tbody>
                      <?php foreach ($small_long_headings as $heading) { ?>
                          <tr>
                             <td><?php echo $heading['heading']; ?></td>
                             <td><?php echo $heading['text']; ?></td>
                          </tr>
                      <?php } ?>
                   </tbody>
                </table>
                <br /><b />
                <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_long_small_headings_helper; ?>
            <?php } else { ?>
                <h4 class="text-success"><i class="fa fa-check-circle" aria-hidden="true"></i> <?php echo $text_long_small_headings; ?> (<?php echo $small_long_headings_counter; ?>)</h4>
                <p>Great! It looks like you are doing great! You have no headings which are too small or too big.</p>
                <br />
                <i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_long_small_headings_helper; ?>
            <?php } ?>

            <hr />
        </div>
    </div>
<?php } else { ?>
    <?php if ($missing_functionality) { ?>
        <br /><br />
        <h3 class="text-center"><?php echo $text_crawler_missing_functionality; ?></h3>
    <?php } else { ?> 
        <br /><br />
        <h2 class="text-center"><?php echo $text_url_not_accessible; ?></h2>
    <?php } ?>
<?php } ?>