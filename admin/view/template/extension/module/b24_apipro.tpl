<?php echo $header; ?>

<?php echo $column_left; ?>
	<div id="content">
		<div class="page-header">
			<div class="container-fluid">
				<div class="pull-right">
					<button type="submit" name='event-bind' value='event-bind' form="form-html" data-toggle="tooltip" title="Прикрепить событие" class="btn btn-primary"><i class="fa fa-save"></i></button>
					<!--<button type="submit" name='import' value='import' form="form-html" data-toggle="tooltip" title="import" class="btn btn-primary"><i class="fa fa-exchange"></i></button>-->
					<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
				<h1><?php echo $heading_title; ?></h1>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<?php if (!empty($error_warning)) { ?>
				<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>
			<?php } ?>
			<?if(!empty($connect_error)){?>
				<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $connect_error; ?>
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>
			<?}?>
			<?if(!empty($connect_success)){?>
				<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $connect_success; ?>
					<button type="button" class="close" data-dismiss="success">&times;</button>
				</div>
			<?}?>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">



						<!--<div class="form-group">-->
						<!--  <label class="col-sm-2 control-label" for="input-name">--><?php //echo $entry_name; ?><!--</label>-->
						<!--  <div class="col-sm-10">-->
						<!--    <input type="text" name="name" value="--><?php //echo $name; ?><!--" placeholder="--><?php //echo $entry_name; ?><!--" id="input-name" class="form-control" />-->
						<!--    --><?php //if ($error_name) { ?>
						<!--    <div class="text-danger">--><?php //echo $error_name; ?><!--</div>-->
						<!--    --><?php //} ?>
						<!--  </div>-->
						<!--</div>         -->
						<div class="tab-pane">
							<ul class="nav nav-tabs" id="language">
								<?php //foreach ($languages as $language) { ?>
									<!--<li><a href="#language--><?php //echo $language['language_id']; ?><!--" data-toggle="tab"><img src="view/image/flags/--><?php //echo $language['image']; ?><!--" title="--><?php //echo $language['name']; ?><!--" /> --><?php //echo $language['name']; ?><!--</a></li>-->
									<li><a href="#connect-b24-tab" data-toggle="tab">Соединение</a></li>
									<li><a href="#customer-b24-tab" data-toggle="tab">Заказы</a></li>
								<?php //} ?>
							</ul>
							<div class="tab-content">
								<?php //foreach ($languages as $language) { ?>
									<!--<div class="tab-pane" id="language--><?php //echo $language['language_id']; ?><!--">-->
									<div class="tab-pane" id="connect-b24-tab">

										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Код приложения</label>
												<input type="text" name="client_id" class="form-control" required value="<?= $saved_config['CLIENT_ID']?>">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Ключ приложения</label>
												<input type="text" name="client_secret" class="form-control" value="<?= $saved_config['CLIENT_SECRET']?>" required>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Домен сайта</label>
												<input type="text" name="domain"  class="form-control" value="<?= $saved_config['DOMAIN']?>" required>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Путь после домена</label>
												<input type="text" name="path"  class="form-control"  value="<?= $saved_config['PATH']?>" required>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Разрешения</label>
												<?
												if ( !empty($scope_list) )
												{
													foreach ( $scope_list as $scope )
													{
														$selected = in_array($scope, $saved_config['SCOPE']) ? 'checked="checked"' : '';
														?>

														<div>
															<input type="checkbox" name="scope[]" value="<?= $scope?>" <?= $selected?> >
															<label for=""><?=$scope?></label>
														</div>

													<?}
												}
												?>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Домен Битрикс24</label>
												<input type="text" name="b24_domain"  class="form-control"  value="<?= $saved_config['B24_DOMAIN']?>" required>
											</div>
										</div>


										<!--select MAnager-->

										<!--<div class="form-group">-->
										<!--  <div class="col-sm-12 col-lg-6">-->
										<!--    <label for="manager">Выберите менеджера</label>-->
										<!--    <select name="manager" id="manager" class="form-control">-->
										<!--      --><?php
										//    // print_r($user_list);
										//    foreach($user_list as $manager)
										//    {
										//      $name = $manager['LAST_NAME'] .' '. $manager['NAME'];
										//      $managerId = $manager['ID'];
										//      $selected = $managerId == $manager_id ? 'selected' : '';
										//      echo "<option value='$managerId' $selected>$name</option>";
										//      }
										//      ?>
										<!--    </select>-->
										<!--  </div>-->
										<!--</div>-->

										<!-- Refresh user LIST-->
										<div class="form-group">
											<div class="col-sm-12">
												<!--<button type="submit" class="btn btn-success" name="refresh-user-list" value="refresh">Обновить список пользователей</button>-->
												<input type="submit" class="btn btn-success" name="save-config" value="Сохранить">
												<input type="submit" class="btn btn-success" name="connect" value="Соединиться">
											</div>
										</div>

										<!--<div class="form-group">-->
										<!--  <div class="col-sm-12">-->
										<!--    <p>Список добавленных событии:</p>-->
										<!--    <table class="table">-->
										<!--      <tr>-->
										<!--        <th>Name(event)</th>-->
										<!--        <th>Url(handler)</th>-->
										<!--        <th>User id(auth_type)</th>-->
										<!--      </tr>-->
										<!--      --><?//
										//  foreach($result['result'] as $event)
										//  {
										//  echo '<tr>';
										//
										//      echo "<td>{$event['event']}</td>";
										//      echo "<td>{$event['handler']}</td>";
										//      echo "<td>{$event['auth_type']}</td>";
										//
										//      echo '</tr>';
										//      }
										//      ?>
										<!--    </table>-->
										<!--  </div>-->
										<!--</div>-->
									</div>

									<div class="tab-pane" id="customer-b24-tab">



										<!--select MAnager-->

										<div class="form-group">
											<div class="col-sm-12 col-lg-6">
												<label for="manager">Выберите менеджера</label>
												<select name="manager" id="manager" class="form-control">
													<?php
													// print_r($user_list);
													foreach($user_list as $manager)
													{
														$name = $manager['LAST_NAME'] .' '. $manager['NAME'];
														$managerId = $manager['ID'];
														$selected = $managerId == $manager_id ? 'selected' : '';
														echo "<option value='$managerId' $selected>$name</option>";
													}
													?>
												</select>
											</div>
										</div>

										<!-- Refresh user LIST-->
										<div class="form-group">
											<div class="col-sm-12">
												<button type="submit" class="btn btn-success" name="refresh-user-list" value="refresh">Обновить список пользователей</button>
												<button type="submit" class="btn btn-success" name="set-manager" value="set-manager">Назначить менеджера</button>
											</div>
										</div>
									</div>
								<?php //} ?>
							</div>
						</div>
					</form>
					<div class="col-sm-6 message">
						<?if ($access_token){?>
							<p class="bg-success">Ключ установлен</p>
						<?}else{?>
							<p class="bg-danger">Ключ не установлен</p>
						<?}?>
					</div>

					<style>
						.message .bg-danger, .message .bg-success{
							padding: 2em;
							border-radius: 5px;
						}
					</style>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			$('#language a:first').tab('show');

			function selectedTab() {
				var tabId = localStorage.getItem('tab_b24_api_pro');

				if(!tabId)
				{
					tabId = $('#language a:first').attr('href');
				}

				return tabId;
			}

			$('#language a').click(function () {
				$this = $(this);

				var tabId = $this.attr('href');
				localStorage.setItem('tab_b24_api_pro', tabId);
			});

			$('#language a[href=' + selectedTab() +' ]').click();

		</script></div>
<?php echo $footer; ?>