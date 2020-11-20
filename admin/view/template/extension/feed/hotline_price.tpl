<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" xmlns:>
	<?= '<script id="pageTemplate" type="text/html">' ?>
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-hotline_price" data-toggle="tooltip" title="{{:button_save}}" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="{{:cancel}}" data-toggle="tooltip" title="{{:button_cancel}}" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
			<h1>{{:heading_title}}</h1>
			<ul class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
				{{for breadcrumbs}}
				<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
					<a itemprop="item" href="{{:href}}" itemprop="url">
						<span itemprop="name">{{:text}}</span>
					</a>
				</li>
				{{/for}}
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		{{if error_warning}}
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {{:error_warning}}
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		{{/if}}
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> {{:text_edit}}</h3>
			</div>
			<div class="panel-body">
				<form action="{{:action}}" method="post" enctype="multipart/form-data" id="form-hotline_price" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab">{{:tab_general}}</a></li>
                        <li><a href="#tab-delivery" data-toggle="tab">{{:tab_shipping}}</a></li>
						<li><a href="#tab-option" data-toggle="tab">{{:tab_option}}</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-status">{{:entry_status}}</label>
								<div class="col-sm-10">
									<select name="hotline_price_status" id="input-status" class="form-control">
										{{if hotline_price_status}}
										<option value="1" selected="selected">{{:text_enabled}}</option>
										<option value="0">{{:text_disabled}}</option>
										{{else}}
										<option value="1">{{:text_enabled}}</option>
										<option value="0" selected="selected">{{:text_disabled}}</option>
										{{/if}}
									</select>
								</div>
							</div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">{{:entry_guarantee_status}}</label>
                                <div class="col-sm-10">
                                    {{if hotline_price_guarantee_status}}
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_status" value="1" checked>
                                            {{:text_yes}}
                                        </label>
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_status" value="0">
                                            {{:text_no}}
                                        </label>
                                    {{else}}
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_status" value="1" >
                                            {{:text_yes}}
                                        </label>
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_status" value="0" checked>
                                            {{:text_no}}
                                        </label>
                                    {{/if}}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">{{:entry_guarantee_type}}</label>
                                <div class="col-sm-10">
                                    {{if hotline_price_guarantee_type}}
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_type" value="shop" checked>
                                            {{:text_shop}}
                                        </label>
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_type" value="manufacturer">
                                            {{:text_manufacturer}}
                                        </label>
                                    {{else}}
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_type" value="shop" >
                                            {{:text_shop}}
                                        </label>
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_guarantee_type" value="manufacturer" checked >
                                            {{:text_manufacturer}}
                                        </label>
                                    {{/if}}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">{{:entry_guarantee_type_unit}}</label>
                                <div class="col-sm-10">
                                    {{if hotline_price_type_unit}}
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_type_unit" value="1" checked>
                                            {{:text_month}}
                                        </label>
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_type_unit" value="0">
                                            {{:text_day}}
                                        </label>
                                    {{else}}
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_type_unit" value="1"  >
                                            {{:text_month}}
                                        </label>
                                        <label for="" class="radio-inline">
                                            <input type="radio" name="hotline_price_type_unit" value="0" checked >
                                            {{:text_day}}
                                        </label>
                                    {{/if}}

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">{{:entry_guarantee_days}}</label>
                                <div class="col-sm-10">
                                    <input type="text"  class="form-control" value="{{:hotline_price_guarantee_days}}" name="hotline_price_guarantee_days">
                                </div>
                            </div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-language">{{:entry_language}}</label>
								<div class="col-sm-10">
									<select name="hotline_price_language" id="input-language" class="form-control">
										{{props languages}}
											{{if prop.code == ~root.hotline_price_language}}
												<option value="{{>prop.code}}" selected="selected">{{>prop.name}}</option>
											{{else}}
												<option value="{{>prop.code}}">{{>prop.name}}</option>
											{{/if}}
										{{/props}}
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-data-feed">{{:entry_data_feed}}</label>
								<div class="col-sm-10">
									<textarea rows="5" readonly id="input-data-feed" class="form-control">{{:data_feed}}</textarea>
								</div>
							</div>
						</div>
                        <div class="tab-pane" id="tab-delivery">
                            {{:link_hotline_xml_deliver}}
                            <div class="well">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <div class="form-group col-sm-12">
                                            <label for="" class="control-label">{{:text_type}}</label>
                                            <select  id="type" class="form-control">
                                                <?php foreach ($delivery['type'] as $key=> $type){ ?>
                                                    <option value="<?php echo $key; ?>"><?php echo $key; ?></option>
                                                <?php } ?>
                                            </select>
                                            <label for="" class="control-label">{{:text_time}}</label>
                                            <select  id="time" class="form-control">
                                                <option value="">{{:text_no}}</option>
                                                <?php foreach ($delivery['time'] as $key=> $type){ ?>
                                                    <option value="<?php echo $key; ?>"><?php echo $type; ?></option>
                                                <?php } ?>
                                            </select>
                                            <label for="" class="control-label">{{:text_carrier}}</label>
                                            <select  id="carrier" class="form-control">
                                                <option value="">{{:text_no}}</option>
                                                <?php foreach ($delivery['carrier'] as $key=> $type){ ?>
                                                    <option value="<?php echo $key; ?>"><?php echo $type; ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group col-sm-12">
                                            <label for="" class="control-label">{{:text_region}}</label>
                                            <input type="text" id="region" class="form-control">
                                            <label for="" class="control-label">{{:text_cost}}</label>
                                            <input type="text" id="cost" class="form-control">
                                            <label for="" class="control-label">{{:text_free_from}}</label>
                                            <input type="text" id="freeFrom" class="form-control">

                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group col-sm-12">
                                            <div class="row">
                                                <label for="" class="control-label">{{:text_in_checkout}}</label>
                                                <input type="checkbox" id="inCheckout" class="form-control">
                                            </div>
                                            <div class="row">
                                                <label for="" class="control-label">{{:text_express}}</label>
                                                    <input type="checkbox" id="express" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <button type="button" class="btn btn-success" onclick="addDelivery();"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                               <table class="table table-striped table-bordered table-hover">
                                   <thead>
                                       <tr>
                                           <td>{{:text_type}}</td>
                                           <td>{{:text_time}}</td>
                                           <td>{{:text_carrier}}</td>
                                           <td>{{:text_region}}</td>
                                           <td>{{:text_cost}}</td>
                                           <td>{{:text_free_from}}</td>
                                           <td>{{:text_in_checkout}}</td>
                                           <td>{{:text_express}}</td>
                                           <td></td>
                                       </tr>
                                   </thead>
                                   <tbody id="table-delivery">
                                        <?php  $row=0; foreach($hotline_price_delivery_setting as  $item){ ?>
                                            <tr id="row-<?php echo $row;?>">
                                                <td><?php echo $item['type']; ?></td>
                                                <td><?php echo $delivery['time'][$item['time']]; ?></td>
                                                <td><?php echo $delivery['carrier'][$item['carrier']]; ?></td>
                                                <td><?php echo $item['region']; ?></td>
                                                <td><?php echo $item['cost']; ?></td>
                                                <td><?php echo $item['freeFrom']; ?></td>
                                                <td><?php echo $item['inCheckout']; ?></td>
                                                <td><?php echo $item['express']; ?></td>
                                                <td><button type="button" onclick="$('#row-<?php echo $row;?>').remove()" class="btn btn-danger"><i class="fa fa-trash"></i></button></td>
                                            </tr>
                                        <?php $row++; } ?>
                                   </tbody>
                               </table>

                        </div>

						<div class="tab-pane" id="tab-option">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-hotline_store_id">{{:entry_hotline_store}}</label>
								<div class="col-sm-10">
									<input type="text" name="hotline_price_store_id" id="input-hotline_store_id" placeholder="{{:entry_hotline_store}}" class="form-control" value="{{:hotline_price_store_id}}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-image_width">{{:entry_image_width}}</label>
								<div class="col-sm-10">
									<input type="text" name="hotline_price_image_width" id="input-image_width" placeholder="{{:entry_image_width}}" class="form-control" value="{{:hotline_price_image_width}}" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-image_height">{{:entry_image_height}}</label>
								<div class="col-sm-10">
									<input type="text" name="hotline_price_image_height" id="input-image_height" placeholder="{{:entry_image_height}}" class="form-control" value="{{:hotline_price_image_height}}" />
								</div>
							</div>
							<div class="form-group hide" >
								<label class="col-sm-2 control-label" for="input-image_count">{{:entry_image_count}}</label>
								<div class="col-sm-10">
									<input type="text" name="hotline_price_image_count" id="input-image_count" placeholder="{{:entry_image_count}}" class="form-control" value="{{:hotline_price_image_count}}" />
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title"><i class="fa fa-pencil"></i> {{:text_edit}}</h3>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th>{{:column_category}}</th>
												{{for stores}}
													<th>{{:name}}</th>
												{{/for}}
											</tr>
										</thead>
										{{for category tmpl="#categoryTemplate" ~level=0}}{{/for}}
									</table>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<?= '</script>' ?>

<script id="categoryTemplate" type="text/html">
	<tr >
		<td><span class="level{{:~level}}">{{:name}}<span></td>
		{{for ~root.stores ~category=#data}}
		<td><input type="checkbox" value="{{:~category.category_id}}" name="hotline_price_store[{{:store_id}}][]" data-parent="{{:~category.parent_id}}" {{:~checked(store_id, ~category.category_id)}}></td>
		{{/for}}
	</tr>
	{{if a_tree.length}}
		{{for a_tree tmpl="#categoryTemplate" ~level=~level+1}}{{/for}}
	{{/if}}
</script>

<script type="text/javascript">
    var i=<?php echo $row;?>;
    function addDelivery(){
        var type=$('#type').val();
        var time=$('#time').find('option:selected').text();
        var time_val=$('#time').val();
        var carrier=$('#carrier').find('option:selected').text();
        var carrier_val=$('#carrier').val();
        var region=$('#region').val();
        var cost=$('#cost').val();
        var inCheckout=$('#inCheckout').prop('checked');
        var freeFrom=$('#freeFrom').val();
        var express=$('#express').prop('checked');
        var err=0;
        $('#time').css('border-color','');
        if(type!='pickup' && time_val==''){
            err=1;
            $('#time').css('border-color','red');
        }
        if(!err) {
            html = '<tr id="row-'+i+'">' +
                    '<td>' + type + '<input type="text" style="display: none;"  name="hotline_price_delivery_setting['+i+'][type]" value="' + type + '">' + '</td>' +
                    '<td>' + time + '<input type="text" style="display: none;" name="hotline_price_delivery_setting['+i+'][time]" value="' + time_val + '">' + '</td>' +
                    '<td>' + carrier + '<input type="text" style="display: none;" name="hotline_price_delivery_setting['+i+'][carrier]" value="' + carrier_val + '">' + '</td>' +
                    '<td>' + region + '<input type="text" style="display: none;" name="hotline_price_delivery_setting['+i+'][region]" value="' + region + '">' + '</td>' +
                    '<td>' + cost + '<input type="text" style="display: none;" name="hotline_price_delivery_setting['+i+'][cost]" value="' + cost + '">' + '</td>' +
                    '<td>' + freeFrom + '<input type="text" style="display: none;" name="hotline_price_delivery_setting['+i+'][freeFrom]" value="' + freeFrom + '">' + '</td>' +
                    '<td>' + inCheckout + '<input type="text" style="display: none;" name="hotline_price_delivery_setting['+i+'][inCheckout]" value="' + inCheckout + '">' + '</td>' +
                    '<td>' + express + '<input type="text" style="display: none;"  name="hotline_price_delivery_setting['+i+'][express]" value="' + express + '">' + '</td>' +
                    '<td><button type="button" onclick="$(\'#row-'+i+'\').remove()" class="btn btn-danger"><i class="fa fa-trash"></i></button></td>' +
                '<tr>';
            i++;
            $('#table-delivery').append(html);
        }
    }


	$(document).ready(function () {
		$.templates("pageTmpl", "#pageTemplate");

		$.views.helpers({
			checked: function (store, category) {
				return ( store in this.ctx.root.hotline_price_store
					&& this.ctx.root.hotline_price_store[store].indexOf(category) !== -1 )	? 'checked="checked"' : '';
			}
		});

		var page = $.render.pageTmpl(<?= json_encode($data) ?>),
			data = <?= json_encode($data) ?>;
		$('#content').html(page);

		function checkedChildren(checkbox, checked){
			$(checkbox)
				.parents('tbody')
				.find(':checkbox[name="'+$(checkbox).attr('name')+'"][data-parent='+$(checkbox).val()+']')
				.each(function(){
					checkedChildren(this, checked);
					$(this).prop("checked", checked);
				});
		}

		function checkedParent(checkbox, checked){
			$(checkbox)
				.parents('tbody')
				.find(':checkbox[name="'+$(checkbox).attr('name')+'"][value='+$(checkbox).data('parent')+']')
				.each(function(){
					checkedParent(this, checked);
					$(this).prop("checked", checked);
				});
		}

		$('table').on('click', ':checkbox', function(){
			checkedChildren(this, $(this).prop("checked"));
			if($(this).parents('tbody').find(':checkbox[name="'+$(this).attr('name')+'"][data-parent='+$(this).data('parent')+']:checked').length){
				checkedParent(this, true);
			} else {
				checkedParent(this, false);
			}
		});
	});
</script>
</div>
<style>
	.level1 {
		padding-left: 20px;
	}
	.level2 {
		padding-left: 40px;
	}
	.level3 {
		padding-left: 60px;
	}
</style>
<?php echo $footer; ?>