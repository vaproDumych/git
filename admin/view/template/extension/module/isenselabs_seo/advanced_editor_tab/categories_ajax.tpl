<br />
<ul class="nav nav-pills nav-pills-languages" role="tablist">
    <?php foreach ($languages as $language) { ?>
        <li <?php echo ($language['language_id']==$language_id) ? 'class="active"' : ''; ?>><a role="tab" data-toggle="tab" href="<?php echo $action_url;?>&language_id=<?php echo $language['language_id']; ?>">
        <?php if (VERSION >= '2.2.0.0') { ?>
            <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
        <?php } else { ?>
            <img src="view/image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
        <?php } ?>
        </a></li> 
   <?php } ?>
</ul>
<br />
<table class="table table-striped table-editor table-editor-categories" data-type="category" data-language-id="<?php echo $language_id; ?>"> 
    <thead>
        <tr> 
            <th class="col-xs-2"><?php echo $text_editor_name; ?></th> 
            <th class="col-xs-2"><?php echo $text_editor_seo_keyword; ?></th> 
            <th class="col-xs-2"><?php echo $text_editor_meta_title; ?></th> 
            <th class="col-xs-2"><?php echo $text_editor_meta_description; ?></th> 
            <th class="col-xs-2"><?php echo $text_editor_meta_keyword; ?></th> 
            <th class="col-xs-1 text-right"><?php echo $text_show; ?></th>
            <th class="col-xs-1 text-right"><?php echo $text_action; ?></th>
        </tr> 
        <tr class="filter-categories filter-form" data-route="editor_categories" data-view="editor-categories"> 
            <th><input type="text" name="filter_name" class="form-control" value="<?php echo $filter_name; ?>" /></th> 
            <th><input type="text" name="filter_keyword" class="form-control" value="<?php echo $filter_keyword; ?>" /></th> 
            <th><input type="text" name="filter_meta_title" class="form-control" value="<?php echo $filter_meta_title; ?>" /></th> 
            <th><input type="text" name="filter_meta_description" class="form-control" value="<?php echo $filter_meta_description; ?>" /></th> 
            <th><input type="text" name="filter_meta_keywords" class="form-control" value="<?php echo $filter_meta_keywords; ?>" /></th> 
            <th>
                <select name="filter_limit" class="form-control">
                    <option value="10" <?php echo ($filter_limit==10) ? 'selected="selected"' : ''; ?>>10</option>
                    <option value="20" <?php echo ($filter_limit==20) ? 'selected="selected"' : ''; ?>>20</option>
                    <option value="50" <?php echo ($filter_limit==50) ? 'selected="selected"' : ''; ?>>50</option>
                    <option value="100" <?php echo ($filter_limit==100) ? 'selected="selected"' : ''; ?>>100</option>
                </select>
            </th>
            <th class="text-right">
                <input type="hidden" name="language_id" value="<?php echo $language_id; ?>" />
                <a onClick="filterData('.filter-categories');" class="btn btn-primary"><?php echo $text_filter; ?></a>
            </th>
        </tr>
    </thead> 
    <tbody> 
        <?php if (count($sources)>0) { ?>   
            <?php foreach ($sources as $index => $result) { ?>
            <tr> 
                <th scope="row"><?php echo $result['name']; ?></th> 
                <td id="category_seo_keyword_<?php echo $result['category_id']; ?>" onDblClick="editField(<?php echo $result['category_id']; ?>, 'url_alias', this);"><span class="editable"><?php echo $result['seo_keyword']; ?></span></td> 
                <td id="category_meta_title_<?php echo $result['category_id']; ?>" onDblClick="editField(<?php echo $result['category_id']; ?>, 'meta_title', this);"><span class="editable"><?php echo $result['meta_title']; ?></span></td> 
                <td id="category_meta_description_<?php echo $result['category_id']; ?>" onDblClick="editField(<?php echo $result['category_id']; ?>, 'meta_description', this);"><span class="editable"><?php echo $result['meta_description']; ?></span></td> 
                <td id="category_meta_keyword_<?php echo $result['category_id']; ?>"onDblClick="editField(<?php echo $result['category_id']; ?>, 'meta_keyword', this);"><span class="editable"><?php echo $result['meta_keyword']; ?></span></td> 
                <td></td>
                <td></td>
            </tr> 
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="9" class="text-center"><?php echo $text_no_results; ?></td>
            </tr>
        <?php } ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="9">
    	        <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </td>
        </tr>
    </tfoot>
</table>