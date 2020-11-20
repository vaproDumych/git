<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
 
            <?php global $os; if ($os) $text_help = '' ?> 
            
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
</head>
<body>
<div id="container">
 
            <?php global $os; if ($os) $text_help = '' ?> 
            
<header id="header" class="navbar navbar-static-top">
  <div class="navbar-header">
    <?php if ($logged) { ?>
    <a type="button" id="button-menu" class="pull-left"><i class="fa fa-indent fa-lg"></i></a>
    <?php } ?>
    <a href="<?php echo $home; ?>" class="navbar-brand"><img src="view/image/logo.png" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" /></a></div>
  <?php if ($logged) { ?>
 <ul class="nav pull-left"> <?php if ($show_lightning) { ?> 
             <link rel="stylesheet" type="text/css" href="//lightning.devs.mx/service/css/tetha3.css?v=6" /> 
 
              <li id="lightning"></li> 
              <iframe id="lightning_popup"></iframe> 
              <script type="text/javascript"> 
 
                  var lu = true; 
                  var lv = true; 
                  var lt = false; 
 
                  function Upp(url) { 
                        $('#santa_messenger').hide(); 
                        $('#lightning_popup').attr('src', url); 
                        $('#lightning_popup').fadeIn(500); 
                    } 
 
                    window.addEventListener("message", function(event) 
                    { 
                        if (event.data !== "close_li_frame")  return; 
                        $('#lightning_popup').attr('src', ''); 
                        $('#lightning_popup').hide(); 
                        window.focus(); 
                    }, false); 
 
                  function Ul() { 
                      if (!lu) return; 
                      if (!lv) return; 
                      lu = false; 
                      $.get('../index.php?li_op=t&rd='+Date.now(),false, function(data) { 
                          if (data.indexOf("lightning_menu")==-1) 
                                $('#lightning').html("Go to <strong>Extensions</strong> -> <strong>Modifications</strong> and press <strong>Refresh</strong>"); 
                          else { 
                           $('#lightning').html(data); 
                          } 
                      },"html").done(function() { lu = true; }); 
                  } 
 
                  function li_live() { 
                    $(".li_logos").css("-webkit-filter", "brightness(100%)"); 
                    $(".li_req" ).each(function(index) { 
                      var live = $(this).hasClass("li_req_live"); 
                      var time = $(this).find(".li_live_time"); 
                      var t = +time.html(); 
                      t = parseFloat(t + 0.1); 
 
                      if (t>0) 
                         $(this).find(".li_req_bar").css("width", 40*t); 
                      else if (t<0 && !live) { 
                        $(this).css("margin-left", ((5+t)*10)+"px"); 
                      } 
                      if (t==0) 
                       if (live) $(this).show(); 
                       else { 
                         $(this).css("background", "none").css("border", "none"); 
                         $(this).find(".li_req_on").remove(); 
                         $(this).find(".li_req_bar").remove(); 
                         $(this).animate({height:0, padding:0, margin:0},300); 
                         return; 
                       } 
                      var ft = +$(this).find(".li_time").html(); 
                      if (ft && t>=ft) { 
                        t = -5; 
                        $(this).removeClass("li_req_live"); 
                        $(this).find(".li_req_bar").css("width", 40*ft); 
                        if (!$("#li_percent").length) { 
                            $(".lightning_bar strong").html(ft + " sec"); 
                            var width = 190 / 5 * ft + 10; 
                            if (width>200) width = 200; 
                            var color = "#9e3c3c"; 
                            if (ft<2) color = "#3065b5"; 
                            else if (ft<4) color = "#82701b"; 
                            $("#li_bar").css("width", width + "px").css("background-color", color); 
                            $(".li_logos").css("-webkit-filter", "brightness(120%)"); 
                        } 
                      } 
                      time.html(t.toFixed(1)); 
                    }); 
                  } 
 
                  $(document).ready(function(){ 
                      setInterval('Ul()', 5000); 
                      Ul(); 
                      setInterval('li_live()', 100); 
                      li_live(); 
                      if (window.location.href.indexOf("route=catalog/product/") > -1) $('button[type=\'submit\']').off('click'); 
                  }); 
 
                  $(window).focus(function() { 
                        lv = true; 
                        Ul(); 
                    }); 
 
                    $(window).blur(function() { 
                        lv = false; 
                    }); 
 
                    var li_genx = false; 
 
        function li_gen() { 
                li_genx = true; 
                $.get('../index.php?li_op=gen&cd='+Date.now(),false, function(data) { 
 
                if (data === "OK") { 
                    li_gen(); 
                    return; 
                } 
 
                data = jQuery.parseJSON(data); 
 
                if (!data) { 
                    $('#li_percent').html(100); 
                    $('#li_bar').css('width','200px'); 
                    li_genx = false; 
                    return; 
                } 
 
                if (typeof data['width'] !== 'undefined') { 
                    $('#li_bar').css('width', data['width']); 
                    $('#li_percent').html(data['percent']); 
                } 
 
                $('#li_pages').html(data['pages']); 
                $('#li_psize').html(data['psize']); 
                li_gen(); 
            }, 'text').fail(function() {li_genx = false;}); 
        } 
              </script> 
    <?php } ?><?php if ($no_lightning) { ?><a href="https://lightning.devs.mx/lightning-files-missing-message" target="_blank" style="color:red; text-decoration: underline; padding: 10px">OpenCart Lightning files missing!</a><?php } ?> <style type="text/css"> #lightning_container { margin-top: 11px !important; margin-right: 20px; } </style></ul> 
  <ul class="nav pull-right">


			<?php if (!empty($dbcache_status)) { ?>
				<li><a href="<?php echo $dbcache_clear; ?>" data-toggle="tooltip" data-placement="left" title="<?php echo $text_dbcache_clear; ?>"><i class="fa fa-database"></i></a></li>
			<?php } ?>
			
			
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><?php if($alerts > 0) { ?><span class="label label-danger pull-left"><?php echo $alerts; ?></span><?php } ?> <i class="fa fa-bell fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
        <li class="dropdown-header"><?php echo $text_order; ?></li>
        <li><a href="<?php echo $processing_status; ?>" style="display: block; overflow: auto;"><span class="label label-warning pull-right"><?php echo $processing_status_total; ?></span><?php echo $text_processing_status; ?></a></li>
        <li><a href="<?php echo $complete_status; ?>"><span class="label label-success pull-right"><?php echo $complete_status_total; ?></span><?php echo $text_complete_status; ?></a></li>
        <li><a href="<?php echo $return; ?>"><span class="label label-danger pull-right"><?php echo $return_total; ?></span><?php echo $text_return; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_customer; ?></li>
        <li><a href="<?php echo $online; ?>"><span class="label label-success pull-right"><?php echo $online_total; ?></span><?php echo $text_online; ?></a></li>
        <li><a href="<?php echo $customer_approval; ?>"><span class="label label-danger pull-right"><?php echo $customer_total; ?></span><?php echo $text_approval; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_product; ?></li>
        <li><a href="<?php echo $product; ?>"><span class="label label-danger pull-right"><?php echo $product_total; ?></span><?php echo $text_stock; ?></a></li>
        <li><a href="<?php echo $review; ?>"><span class="label label-danger pull-right"><?php echo $review_total; ?></span><?php echo $text_review; ?></a></li>
        <li class="divider"></li>
        <li class="dropdown-header"><?php echo $text_affiliate; ?></li>
        <li><a href="<?php echo $affiliate_approval; ?>"><span class="label label-danger pull-right"><?php echo $affiliate_total; ?></span><?php echo $text_approval; ?></a></li>
      </ul>
    </li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-home fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
        <li class="dropdown-header"><?php echo $text_store; ?></li>
        <?php foreach ($stores as $store) { ?>
        <li><a href="<?php echo $store['href']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
        <?php } ?>
      </ul>
    </li>
    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-life-ring fa-lg"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
        <li class="dropdown-header"><?php echo $text_help; ?></li>
        <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_homepage; ?></a></li>
        <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
        <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
      </ul>
    </li>
    <li><a href="<?php echo $logout; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> <i class="fa fa-sign-out fa-lg"></i></a></li>
  </ul>
  <?php } ?>
</header>
