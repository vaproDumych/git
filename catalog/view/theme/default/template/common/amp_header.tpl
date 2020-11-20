<!doctype html>
<html ⚡ dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
	<head>
  		<meta charset="utf-8">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
  		<title><?php echo $title; ?></title>
			<?php if ($description) { ?>
		<meta name="description" content="<?php echo str_replace(array('\'','"'),' ',$description); ?>" />
		<?php } ?>
		<?php if ($keywords) { ?>
		<meta name="keywords" content= "<?php echo str_replace(array('\'','"'),' ',$keywords); ?>" />
		<?php } ?>
  		<?php if(isset($main_url) && $main_url) { ?>
	   		<link rel="canonical" href="<?php echo $main_url; ?>">
	   	<?php } ?>
			<?php if(isset($iframe) && $iframe) { ?>
				<script async custom-element="amp-iframe" src="https://cdn.ampproject.org/v0/amp-iframe-0.1.js"></script>
			<?php } ?>
			<script async custom-element="amp-bind" src="https://cdn.ampproject.org/v0/amp-bind-0.1.js"></script>
			<script async custom-element="amp-list" src="https://cdn.ampproject.org/v0/amp-list-0.1.js"></script>
			<script async custom-template="amp-mustache" src="https://cdn.ampproject.org/v0/amp-mustache-0.1.js"></script>
	   	<?php if($wk_route == 'common/amp_home') { ?>
	   		<script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
	   		<script async custom-element="amp-form" src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script>
				<?php if ($display_footer_links) { ?>
	  			<script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
				<?php } ?>
				<?php if($display_slide_image) { ?>
	  			<script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
				<?php } ?>
	   	<?php } else if ($wk_route == 'product/amp_product') {?>
	   		<script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
	  		<script async custom-element="amp-form" src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script>
	  		<script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
	  		<script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
				<?php if($wk_amp_social_share) { ?>
	  			<script async custom-element="amp-social-share" src="https://cdn.ampproject.org/v0/amp-social-share-0.1.js"></script>
				<?php } ?>
	   	<?php } else if ($wk_route == 'product/amp_category') {?>
	   		<script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
	  		<script async custom-element="amp-form" src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script>
				<?php if ($display_footer_links) { ?>
	  			<script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
				<?php } ?>
	   	<?php } else { ?>
	   		<script async custom-element="amp-sidebar" src="https://cdn.ampproject.org/v0/amp-sidebar-0.1.js"></script>
	  		<script async custom-element="amp-form" src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script>
	  		<script async custom-element="amp-live-list" src="https://cdn.ampproject.org/v0/amp-live-list-0.1.js"></script>
	  		<script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
	  		<script async custom-element="amp-carousel" src="https://cdn.ampproject.org/v0/amp-carousel-0.1.js"></script>
				<?php if($wk_amp_social_share) { ?>
	  			<script async custom-element="amp-social-share" src="https://cdn.ampproject.org/v0/amp-social-share-0.1.js"></script>
				<?php } ?>
	  		<script async custom-element="amp-lightbox" src="https://cdn.ampproject.org/v0/amp-lightbox-0.1.js"></script>
	   	<?php }?>
  		<script async src="https://cdn.ampproject.org/v0.js"></script>
  		<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
  		<style amp-custom >
				*, *:before, *:after {
				  box-sizing: inherit;
				}
  			html,body {
  				box-sizing: border-box;
  				font-family: roboto;
					max-width: 800px;
					margin: auto;
  			}
				/**
				 * z-index
				 */
				.z-0 {
					z-index: 0;
				}
				.z-1 {
					z-index: 1;
				}
				.z-2 {
					z-index: 2;
				}
				.z-3 {
					z-index: 3;
				}
				.z-4 {
					z-index: 4;
				}
				.z-5 {
					z-index: 5;
				}
				.z-6 {
					z-index: 6;
				}
				.z-7 {
					z-index: 7;
				}
				.z-8 {
					z-index: 8;
				}
				.z-9 {
					z-index: 9;
				}
				.z-10 {
					z-index: 10;
				}
				.z-11 {
					z-index: 11;
				}
				.z-12 {
					z-index: 12;
				}

				a {
					text-decoration: none;
					color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#FFF"; ?>;
				}
				a: hover {
					color: <?php if(isset($wk_amp_a_txt_hover_color) && $wk_amp_a_txt_hover_color) echo $wk_amp_a_txt_hover_color; else echo "#FFF"; ?>;
				}

				.left {
					float: left;
				}

				.right {
					float: right;
				}

				.clear {
					clear: both;
				}

				header,footer,#content{
					padding: 10px 0px;
					box-shadow: 0 0 1px 1px #d2cdcd;
					height: auto;

				}
				header,footer {
				min-height: 60px;
				text-align: center;
				height: auto;
				overflow: auto;
				}

				header {
					background-color: <?php if(isset($wk_amp_header_bg_color) && $wk_amp_header_bg_color) echo $wk_amp_header_bg_color; else echo "#1888B3"; ?>;
				}

				footer {
					background-color: <?php if(isset($wk_amp_footer_bg_color) && $wk_amp_footer_bg_color) echo $wk_amp_footer_bg_color; else echo "#111111"; ?>;
					color: <?php if(isset($wk_amp_footer_txt_color) && $wk_amp_footer_txt_color) echo $wk_amp_footer_txt_color; else echo "#FFF"; ?>;;
				}

				footer a {
					color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#FFF"; ?>;
					font-size: 0.9em;
					font-weight: 300;
				}
				footer a:hover {
					color: <?php if(isset($wk_amp_a_txt_hover_color) && $wk_amp_a_txt_hover_color) echo $wk_amp_a_txt_hover_color; else echo "#bbb"; ?>;
				}

  			section[expanded] .show-more {
			    display: none;
				}
		  	section:not([expanded]) .show-less {
		    	display: none;
		  	}
				section[expanded] h4 {
						background-color: <?php if($wk_amp_section_expanded_color) echo $wk_amp_section_expanded_color; else echo "#0098ed" ;?>
				}

				/**
				 * sidebar
				 */
				 amp-sidebar {
 		      width: 270px;
 		      background-color: <?php echo $wk_amp_side_bar_backgroundcolor;?>;
 		    }

				.wk-cat-container {
			    border-bottom: 1px solid #ccc;
			    display: inline-block;
			    padding: 20px 20px;
			    width: 100%;

				}
				.wk-cat-label {
					text-align: center;
					width: 100%;
			    display: inline-block;
			    font-weight: 500;
			    text-transform: uppercase;
			    font-size: 18px;
			    line-height: 25px;
				}
				.wk-cat-label > a {
					color:black;
				}

				.side-menu {
					height: 100%;
					overflow: auto;
					display: block;
					overflow-x: hidden;
				}
				.side-menu > ul {
					height: 95%;
					overflow: auto;
					padding: 0px 10px;
					width: 100%;
				}
				/**
				 * sidebar css ends here
				 */
				/**
				 * header css
				 */

				.logo-image {
					height: 100%;
				}
				.upper-header {
					display: block;
					position: relative;
					width: 100%;
					height: 80px;
				}
				.lower-header {
					display: block;
					position: relative;
					width: 100%;
					height: 40px;
					margin-top: 15px;
					text-align: center;

				}
				.category {
			    width: 20%;
			    height: 100%;
			    text-align: center;
			    vertical-align: center;
			    padding-top: 20px;
			    /*box-sizing: inherit;*/
			    cursor: pointer;
				}
				/*.category > amp-img{
					margin: auto;
					vertical-align: center;
					border: 1px solid #403a3a;
				}*/
				.logo {
					align-self: center;

			    height: 100%;
			    margin: auto;
			    overflow: auto;
			    padding: 19px 5px 10px 5px;
			    text-align: center;
			    vertical-align: middle;
			    width: 70%;
				}
				.search-bar {
					display: block;
					width: 100%;
					border: none;
					height: 40px;
					overflow: auto;
					padding: 0px 10px;

				}
				.menu-button {
					background-image : url('<?php echo $nav_icon_normal; ?>');
					background-repeat: no-repeat;
					background-position: center;
					height: 40px;
			    width: 100%;
			    border: none;
			    cursor: pointer;
			    margin: auto;
			    outline: none;
					background-color: <?php if(isset($wk_amp_header_bg_color) && $wk_amp_header_bg_color) echo $wk_amp_header_bg_color; else echo "#1888B3"; ?>;
				}
				form > .text-input {
			    outline: none;
			    border-radius: 4px;
			    -webkit-border-radius: 4px;
  				-moz-border-radius: 4px;
			    height: 46px;
			    background-color: #FFF;
			    color: <?php if(isset($wk_amp_header_bg_color) && $wk_amp_header_bg_color) echo $wk_amp_header_bg_color; else echo "#1888B3"; ?>;
			    height: 33px;
			    float: left;
			    border: 1px solid <?php if(isset($wk_amp_header_bg_color) && $wk_amp_header_bg_color) echo $wk_amp_header_bg_color; else echo "#1885af"; ?>;
			    padding: 5px;

			    width: 100%;
			    font-size: 14px;
				}
				form > .text-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
					color: <?php if(isset($wk_amp_header_bg_color) && $wk_amp_header_bg_color) echo $wk_amp_header_bg_color; else echo "#1888B3"; ?>;
				}
				form > .button-text {
					background-color: inherit;
					background-image: url('<?php echo $search_image_normal; ?>');
					background-repeat: no-repeat;
					background-position: center;
    			padding: 0;
			    border: none;
			    margin: 0;
			    cursor: pointer;
			    width: 30px;
			    height: 33px;
			    right: 15px;
			    position: absolute;
				}
				.select-option {
					font-size: 1.25em;
				}
				.autosuggest-box {
					box-shadow: 0px 2px 6px rgba(0,0,0,.3);
				}
				.select-option {
						text-align: left;
						display: block;

						height: 30px;
						line-height: 30px;
						padding-left: 15px;
						background: white;
						color: black;
				}
				.select-option:focus {
					box-shadow: inset rgb(94, 158, 215) 0px 0px 45px;
					background: #fff;
				}
				.select-option:nth-child(2n) {
					background: #eee;
				}
				.search-box-suggestion-container {
					position: relative;
				}
				.search-box-suggestion {
					position: absolute;
					top: -18px;
					width: 100%;
				}
				.image-search {
					height: 20px;
					width: 20px;
					padding: 5px;
				}
				/**
				 * header css ends here
				 */

				.menu-opener {
					float: right;
					background: url('<?php echo $drop_down_menu; ?>') no-repeat 50% 50% ;
					height: 45px;
					width: 50px;
				}
				.menu-opener:hover {
					background: url('<?php echo $drop_up_menu; ?>') no-repeat 50% 50% ;
				}
				.menu-opener:hover + ul {
					display: block;
				}

				.side-menu > ul li a {
					color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#232323"; ?>;
					display: block;
					font-family: roboto-medium;
					padding: 0px;
				}
				.side-menu ul li > ul {
					padding: 10px;
					display: none;
				}
				.category-children {
					padding-left: 15px;
				}
				.side-menu li {
					margin-bottom: 10px;
					list-style: none;
				}
				.side-menu li:last-child {
					margin-bottom: 0px;
				}
				.side-menu li:hover > ul {
					display: block;
				}

		  	.list-overflow {
			    position: absolute;
			    bottom: 0;
				}
		  	.section-heading > h4  {
		  		padding: 10px 16px;
		  		font-size: 20px;
		  		color: <?php if($wk_amp_section_color) echo "#545454"; else echo "white"; ?>;
		  		font-weight: normal;
		  		background-color: <?php if($wk_amp_section_color) echo $wk_amp_section_color; else echo "#747474"; ?>;
		  	}
		  	.section-content {
		  		background-color: #fff;
			    color: #535353;
			    padding: 20px 30px;
		  	}
		  	.spec-header {
			    display: block;
			    padding: 5px;
			    clear: both;
			    border: 2px solid #EEE;
			}
			.spec-name {
			    display: block;
			    float: left;
			    text-align: left;
			    width: 40%;
			    padding: 10px;
			    border: 1px solid #EEE;
			    border-right: none;
			}
			.spec-text {
			    display: block;
			    float: right;
			    text-align: left;
			    width: 40%;
			    padding: 10px;
			    border: 1px solid #EEE;
			}
  		.footer-block {
			  	padding: 1px 20px;
			  	text-align: left;
			}
			.footer-block:last-of-type {
				margin-bottom: 20px;
				border-bottom: 1px solid #464646;
			}
			.footer-block-header {
			  	color: <?php if(isset($wk_amp_footer_txt_color) && $wk_amp_footer_txt_color) echo $wk_amp_footer_txt_color; else echo "#FFF"; ?>;
			  	font-family: roboto-regular;
			  	font-size: 1.1em;
			  	font-weight: 400;
			  	background-color: <?php if($wk_amp_footer_bg_color) echo $wk_amp_footer_bg_color; else echo "#111111"; ?>;
			  	border: 0px;
			  	box-shadow: 0 0px;
			  	text-align: left;
			  	min-height: 0px;
			  	padding : 0px;
			  	margin-bottom: 3px;

			}
			.footer-block > ul {
			  	padding: 0 20px;
			}
			.footer-block li {
			  	margin-bottom: 10px;
			  	list-style: none;
			}

  			#content {
  				min-height: 400px;
  				padding: 10px;
  				background-color: <?php if(isset($wk_amp_page_bg_color) && $wk_amp_page_bg_color) echo $wk_amp_page_bg_color; else echo "#f2f2f2"; ?>;

  				box-shadow: 0 0px;
  			}
  			.container {
  				padding: 0;
  				background-color: #f2f2f2;
  			}
		    button {
		      margin-left: 20px;
		    }
			form.amp-form-submit-success [submit-success],
			form.amp-form-submit-error [submit-error]{
			    margin-top: 16px;
			}
			form.amp-form-submit-success [submit-success] {
			    color: green;
			}
			form.amp-form-submit-error [submit-error] {
			    color: red;
			}
			form.amp-form-submit-success.hide-inputs > input {
			    display: none
			}
			.horizontal-display {
			    display: flex;
			    align-items: center;
			}
			.other-input {
			    margin: 0 16px;
			}
			.content-left {
			    width: 100%;
			}
			.content-right {
			    padding: 22px;
			    text-align: center;
			    background-color: #FFF;
			}
			.detail-section {
				margin: 10px;
			}
			.product-name {
				color: #535353;
				font-family: roboto-medium;
				font-size: 24px;
			}
			.product-price {
				color: #535353;
				font-family: roboto-medium;
				font-size: 14px;
			}
			.seperator {
				color: #B7B7B7;
			}
			.star {
				color: #535353;
			}
			.star-yellow {
				color: #F89020;
			}
			.star:before {
				content: "\2605";
			}
			.product-description {
			    background-color: #fff;
			    border-top: 1px solid #e9e9e9;
			    color: #828181;
			    font-family: roboto-medium;
			    font-size: 15px;
			    margin: 0;
			    padding: 10px 32px;
			    text-align: justify;
			}
			.product {
				display: block;
			    width: auto;
			    padding: 5px;
			    height: auto;
			    overflow: auto;
				min-height: 300px;
    			text-align: center;
    			background-color: #e9e9e9;
			}
			.product + div {
				display: block;
			    overflow: auto;
			    background-color: #EEE;
			    padding: 5px;

			}
			.product-grid {
				display: inline-block;
				width: 44%;
				height: 235px;
				border: 1px solid #EEE;
				/*padding: 5px;*/

				float: left;
				margin: 20px auto 20px 15px;
				background-color: #FFF;
			}
			.product-grid:hover {
				box-shadow: 0px 0px 4px 2px #BABABA;
			}

			.product-grid a {
				color: #2098C5;
				font-size: 14px;
			}
			.product-grid > .product-image {
				border: none;
			    border-bottom: 1px solid #EEE;
				background-color: #FFF;
				border-radius: 0px;
			}
			.product-image {
			    min-height: 160px;
			    box-shadow: 2px 2px 5px #e8e8e8;
			}
			.related-image {

			  	padding: 0px 22px;
			  	height: 140px;
			  	background-color: #E9E9E9;
			  	box-shadow: 2px 2px 5px #e8e8e8;
			}
			.related-thumb {
			    border-radius: 4px;
			    display: inline-block;
			    width: 100px;
			}
			.related-thumb > amp-img {
				border-radius: 4px;
			}
			.product-details {
			    clear: both;
			    padding: 10px 0px;
			}
			.product-grid > .product-detail {
			    display: block;
			    padding: 4px 0;
			    margin-top: 5px;
			    border-top: 1px solid #dedede;
			}
			.product-grid > .product-detail > .name {
				margin: 6px 5px;
		    color: #2098C5;
		    font-size: 20px;
		    text-align: center;
			}

			.product-grid > .product-detail > .name > a:hover {
				text-decoration: underline;
			}

			.description {
				margin: 5px;
				min-height: 80px;
				color: #999;
			}
			ul.rating {
				display: inline-block;
			    text-align: left;
			    padding: 2px;
			    margin: 0px 2px 0px 2px;
			    height: 18px;
			}
			.star {
				display: inline;
			}
			.text-success {
				color: #1DA220;
				font-size: 14px;
				font-family: roboto-light;
			}

			.button {
			  	background-color: <?php if(isset($wk_amp_btn_bg_color) && $wk_amp_btn_bg_color) echo $wk_amp_btn_bg_color; else echo "#FFF"; ?>;
			    border: 1px solid <?php if(isset($wk_amp_btn_border_color) && $wk_amp_btn_border_color) echo $wk_amp_btn_border_color; else echo "#1888b3"; ?>;
			    border-radius: 1px;
			    color: <?php if(isset($wk_amp_btn_txt_color) && $wk_amp_btn_txt_color) echo $wk_amp_btn_txt_color; else echo "#1888b3"; ?>;
			    display: inline-block;
			    float: left;
			    font-family: roboto-medium;
			    font-size: 16px;
			    font-weight: 600;
			    padding: 10px 20px;
			    width: 45%;
			    margin: auto;
			    margin-right: .5%;
			}
			.button-half {
			    background-color: #1888b3;
			    color: #fff;
			    width: 8%;
			    height: 18px;
			}
			.button-wishlist {
			    background: url('<?php echo $wishlist; ?>') no-repeat 50% 50% ;
			    background-color: <?php if(isset($wk_amp_btn_bg_color) && $wk_amp_btn_bg_color) echo $wk_amp_btn_bg_color; else echo "#1888b3"; ?>;
			}
			.button-compare {
				background: url('<?php echo $compare; ?>') no-repeat 50% 50% ;
			    background-color: <?php if(isset($wk_amp_btn_bg_color) && $wk_amp_btn_bg_color) echo $wk_amp_btn_bg_color; else echo "#1888b3"; ?>;
			}
			.cart-share {
				background-color: #FFF;

				padding-top: 40px;
			}
			.cart-button {

			  	display: block;
			  	height: 50px;
			  	margin: auto;
			  	padding: 0px 20px 10px;
			  	text-align: center;
			  	width: 100%;
			}
			.social-share {

			  	margin-top: 10px;
			  	padding: 23px 10px;
			  	text-align: center;
			}

			.related_products {
				clear: both;
				display: block;
				text-align: center;
			}
			.related-product-image {
			    height: 250px;
			    width: 230px;
			    float: left;
			    text-align: center;
			}
			.related-product-image a {
			    color: #219AC8;
			    font-size: 20px;
			}
			.related-product-image a:hover{
				text-decoration: underline;
			}
			.related-product-heading {
				padding: 7px;
				text-align: left;
				display: block;
				clear: both;
				font-size: 24px;
				font-weight: 500;
			}
			.tile {
				width: 180px;
				height: 200px;
				max-width: 200px;
				margin: 8px 0;
			}
			.name {
				margin: 4px;
			}
			.name:hover {
				text-decoration: underline;
				color: <?php if(isset($wk_amp_a_txt_hover_color) && $wk_amp_a_txt_hover_color) echo $wk_amp_a_txt_hover_color; else echo "#FFF"; ?>;
			}
			.name-hide {
				visibility: visible;
			}
			.name-show {
				visibility: hidden;
			}
			.name:hover > .name-show {
				visibility: visible;
				position: relative;
				z-index: 20;
			}
			.name:hover > .name-hide {
				visibility: hidden;
				display: none;
			}
			.price {
				margin: 4px;
				color: #666;
			}
			.caption {
			    text-align: center;
			    position: absolute;
			    bottom: 0;
			    left: 0;
			    right: 0;
			    padding: 0px 24px 18px 24px;
			    background: rgba(200, 200, 200, 0.8);
			    color: #333;
			    font-size: 36px;
			    height: 30px;
			    font-weight: 300;
			}
			.product-grid a.buy-now {
			  	background-color: <?php if(isset($wk_amp_btn_bg_color) && $wk_amp_btn_bg_color) echo $wk_amp_btn_bg_color; else echo "#1888b3"; ?>;

			  	color: <?php if(isset($wk_amp_btn_txt_color) && $wk_amp_btn_txt_color) echo $wk_amp_btn_txt_color; else echo "#FFF"; ?>;
			  	font-family: roboto-regular;
			  	font-size: 18px;
			  	font-weight: normal;
			  	margin-top: 7px;
			  	padding: 5px 0px;
			  	text-align: center;
			  	width: 100%;
			}
			.breadcrumb {
			    background-color: #d6d6d6;
				color: #0098ed;
				font-family: roboto-medium;
				font-size: 24px;
				height: 60px;
				width: 100%;
			}
			.back {

			  	float: left;
			  	height: 100%;
			  	padding: 13px;
			  	text-align: center;
			  	width: 20%;
			}
			.back a {
				color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#3b3b3b"; ?>;
				font-family: roboto-medium;
				font-size: 24px;
			}
			.category-name {

			  	float: right;
			  	height: 100%;
			  	padding: 16px 12px 14px 12px;
			  	text-align: center;
			  	width: 100%;
			  	background-color: <?php if(isset($wk_amp_page_bg_color) && $wk_amp_page_bg_color) echo $wk_amp_page_bg_color; else echo "#f2f2f2"; ?>;
			}
			.amp-pagination {
			    float: left;
			    display: block;
			}
			.amp-pagination > ul {
				margin: 9px;
			}
			ul.pagination {
				padding-left: 5px;
			}
			.pagination li {
			    display: inline-block;
			    width: auto;
			    border: 1px solid #2098c5;
			    border-right: none;
			    margin-bottom: 0px;
			    color: #219AC8;
			}
			.pagination li:last-child {
				border-right: 1px solid #2098c5;
			}
			.pagination li.active {
				background-color: #337ab7;
				color: #FFF;
				padding: 8px 13px;
			}
			.pagination li a {
				color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#219AC8"; ?>;
				padding: 8px 13px;
				display: block;
			}
			.results {
			    float: right;
			    display: block;
			    padding: 10px;
    			margin: 8px;
			    color: #525252;
			}
			.whatsapp-sharing {
				background-image: url('<?php echo $whatsapp; ?>');
			}
			.menu-logo {

				display: inline-block;
				height: 80px;
				padding: 20px;
				width: 200px;
			}
			.alert {
				width: 100%;
				display: block;
				height: 50px;
				background-color: #dff0d8;
				color: #1da220;
				position: absolute;
				top: 0px;
				left: 0px;
			}
			.alert {
			  	-webkit-animation-name: hideit;
			  	-webkit-animation-duration: 1s;
			  	-webkit-animation-timing-function: ease-in;
			  	-webkit-animation-delay: 10s;
			  	-webkit-animation-iteration-count: 1;
			  	-webkit-animation-fill-mode: forwards;
			  	-moz-animation-name: hideit;
			  	-moz-animation-duration: 1s;
			  	-moz-animation-timing-function: ease-in;
			  	-moz-animation-delay: 10s;
			  	-moz-animation-iteration-count: 1;
			  	-moz-animation-fill-mode: forwards;
			  	-animation-name: hideit;
			  	-animation-duration: 1s;
			  	-animation-timing-function: ease-in;
			  	-animation-delay: 10s;
			  	-animation-iteration-count: 1;
			  	-animation-fill-mode: forwards;
			}

			@-webkit-keyframes hideit {
			  	0% { opacity: 0; z-index: 0}
  				100% { opacity: 0; z-index: 0 }
			}
			.slider {
			    border-top: 6px solid #e0e0e0;
			    box-shadow: none;

			    display: block;
			    height: 242px;
			    margin-bottom: 10px;
			    padding: 1px;
			    width: 100%;
			    overflow: auto;
			}

			.add-to-cart {
				float : none;
				width: 80%;
				margin: auto;
			}
			.footer-ul {
				padding: 10px 20px;
			}
			.wk-review-item {
			    border-bottom: 1px solid #ccc;
			    padding: 10px 20px;
			    color: #555;
			}
			.wk-review-item-head {
			    display: inline-block;
			    width: 100%;
			    position: relative;
			    padding: 0px;
			}
			.wk-review-item-img {
			    display: inline-block;
			    left: 0;
			    position: absolute;
			}
			.wk-review-item-head-content {

			    display: inline-block;
			    float: left;
			    padding-left: 0px;
			    width: 100%;
			    font-size: 1.4em;
			}
			.wk-review-item-head-content > div {
			    display: inline-block;
			    margin-bottom: 5px;
			    width: 100%;
			}
			.wk-review-item-body {
			    display: inline-block;
			    padding: 0 0 10px;
			    width: 100%;
			}
			.rating-box {
			    height: 18px;
			    overflow: hidden;
			    width: 145px;
			    display: inline-block;
			}
			.rating-box .rating {
			    float: left;
			    height: 25px;
			    background-position: 0px -24px;
			}
			.wk-review-posted-date {
			    padding: 5px 0;
			}
			.wk-review-item-title {
			    font-weight: 600;
			    padding: 5px 0;
			    margin-bottom: 5px;
			}
			.wk-review-summary {
			    text-align: justify;
			}
			.wk-product-rating-box-panel {
			    text-align: center;
			    padding: 10px 0px;
			    border-bottom: 1px solid #ccc;
			}
			.wk-product-rating-box {
			    border: 10px solid #f9b33d;
			    border-radius: 50%;
			    display: inline-block;
			    height: 200px;
			    width: 200px;

			}
			.wk-product-rating-info {

			    display: inline-block;
			    line-height: unset;
			    padding-top: 30px;
			    vertical-align: middle;
			    width: 180px;
			}
			.wk-rating-number {
			    font-size: 30px;
			}
			.wk-product-rating-info > span {
			    display: inline-block;
			    text-align: center;
			    width: 100%;

			    color: #555;
			}
			.review-background {
				background-color: white;
			}
			.center {
			    margin: auto;
			    width: 50%;
			}
			.wk-rating-text {
				font-size: 1.5em;
			}
			.wk-amp-product-list-item {
			    border-bottom: 1px solid #ccc;

			    display: inline-block;
			    min-height: 95px;
			    padding: 10px;
			    position: relative;
			    width: 100%;
			}
			.wk-amp-product-list-item-img {
			    display: inline-block;
			    position: absolute;
			    width: 75px;
			}
			.wk-amp-product-list-item-content {

			    display: inline-block;
			    padding-left: 85px;
			    width: 100%;
			}
			.wk-amp-product-list-item-name {
			    color: #0098ed;
			    display: inline-block;
			    margin-bottom: 5px;
			    width: 100%;
			}
			.wk-amp-product-list-item-ratings {
			    color: #0098ed;
			    display: inline-block;
			    width: 100%;
			    float: left;
			    min-height: 23px;
			}
			.amount {
			    color: #0098ed;
			    display: inline-block;
			    font-size: 14px;
			    width: 100%;
			}
			.wk-amp-product-list-item-price {
			    display: inline-block;
			    width: 100%;
			    margin-top: 5px;
			}
			.price-box {
			    font-size: 20px;
			    font-weight: 500;
			}
			.price {
			    color: #fa0a0a;
			    height: 40px;
			}
			.wk-amp-product-list {
			    background: #fff none repeat scroll 0 0;

			    display: inline-block;
			    padding: 10px;
			    width: 100%;
			}
			.price {
			    color: #088065;
			}
			.wk-amp-product-list-item-name > a {
				color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#0098ed"; ?>;
			  	display: block;
			  	font-family: roboto-medium;
			  	padding: 0px;
			  	font-size:22px;
			}
			.amount > a {
			  	color: <?php if(isset($wk_amp_a_txt_color) && $wk_amp_a_txt_color) echo $wk_amp_a_txt_color; else echo "#0098ed"; ?>;
			}
			.amount > a:hover {
				color: <?php if(isset($wk_amp_a_txt_hover_color) && $wk_amp_a_txt_hover_color) echo $wk_amp_a_txt_hover_color; else echo "#1888B3"; ?>;
			}

		</style>
		<?php if($amp_page == 'home') { ?>
			<script type="application/ld+json">
				{
					"@context": "http://schema.org",
					"@type": "WebSite",
					"url": "<?php echo $website_url; ?>",
					"name":"<?php echo $wkconfig_name; ?>",
					"potentialAction": {
						"@type": "SearchAction",
						"target": "<?php echo $website_url;?>index.php?route=product/search&search={search_term_string}",
						"query-input": "required name=search_term_string"
					}
				}
			</script>
		<?php } else if ($amp_page == 'product') { ?>
			<script type="application/ld+json">
				{
					"@context": "http://schema.org",
					"@type": "Product",
					"@id": "<?php echo $wkproducturl;?>",
					"name": "<?php echo $wk_richsnippetproduct_info['name'];?>",
					"offers": {
						"@type": "Offer",
						"availability": "http://schema.org/<?php if($wk_richsnippetproduct_info['quantity']==0){ echo 'OutOfStock'; }else{ echo 'InStock'; } ?>",
						"price": "<?php if(!$special) {  $wkprice = preg_replace("/[^0-9,.]/", "", $price); echo $wkprice;  } else { $wkprice = preg_replace("/[^0-9,.]/", "", $special); echo $wkprice; } ?>",
						"priceCurrency": "<?php echo $currency_code; ?>"
					},
					"aggregateRating": {
						"@type": "AggregateRating",
						"ratingValue": "<?php if($rating==0){ echo "3.5"; } else { echo $rating; }?>",
						"reviewCount": "<?php if($rating==0){ echo "1"; } else { echo $reviews; }?>",
						"bestRating": "5",
						"worstRating": "1",
						"itemReviewed": {
							"@type":"Thing",
							"name": "<?php echo $wk_richsnippetproduct_info['name'];?>"
						}
					},
					"description": "<?php if(!empty($description)) { echo strip_tags($description); } else { echo $wk_richsnippetproduct_info['name']; }?>",
					"manufacturer": "<?php echo $wk_richsnippetproduct_info['manufacturer']; ?>",
					"category" : "<?php foreach ($wk_richsnippetproduct_info['category_info'] as $key => $value) {
					  if($key>0){echo '/' . $value['name'];} else {echo $value['name'];}
					}?>",
					"image": {
					  "@type": "imageObject",
					  "url": "<?php echo $thumb; ?>",
					  "width": "<?php echo $wkproductimagewidth; ?>",
					  "height": "<?php echo $wkproductimageheight; ?>"
					},
					"sku": "<?php echo $wk_richsnippetproduct_info['sku']; ?>",
					"gtin12": "<?php echo $wk_richsnippetproduct_info['upc']; ?>",
					"gtin13": "<?php echo $wk_richsnippetproduct_info['ean']; ?>",
					"mpn": "<?php echo $wk_richsnippetproduct_info['mpn']; ?>",
					"additionalProperty": {
					    "@type": "PropertyValue",
					    "name": "Approx. Weight",
					    "value": "<?php echo (INT)$wk_richsnippetproduct_info['weight'];?>",
					    "unitText": "<?php echo $wkweight_class; ?>"
					},
					"width": {
					    "@type" : "QuantitativeValue",
					    "value" : "<?php echo (INT)$wk_richsnippetproduct_info['width'];?>",
					    "unitCode": "CMT"
					},
					"height": {
					    "@type" : "QuantitativeValue",
					    "value" : "<?php echo (INT)$wk_richsnippetproduct_info['height'];?>",
					    "unitCode": "CMT"
					},
					<?php if (isset($products) && is_array($products)) { ?>
					    <?php foreach($products as $relatedwkproduct){ ?>
							"isRelatedTo": {
								"@type": "product",
								"name": "<?php echo $relatedwkproduct['name'];?>",
								"description": "<?php echo $relatedwkproduct['description'];?>",
								"image": {
									"@type": "imageObject",
									"url": "<?php echo $relatedwkproduct['thumb'];?>"
								}
							},
						<?php } ?>
					<?php } ?>
					"brand": {
					    "@context":"http://schema.org",
					    "@type":"Organization",
					    "name":"<?php echo $wkconfig_name; ?>",
					    "logo": "<?php echo $wkstore_logo;?>",
					    "url" : "<?php echo $website_url;?>"
					 },
					"releaseDate": "<?php echo $wk_richsnippetproduct_info['date_available']?>"
				}
            </script>
		<?php } ?>
	</head>

	<body on="tap:
		autosuggest-list.hide"
		>
		<amp-sidebar id='sidebar' layout="nodisplay" side="left">
			<div class="wk-cat-container">
				<div class="wk-cat-label">
					<a href="<?php echo $home; ?>">
						<?php echo $wkconfig_name; ?>
					</a>
				</div>
			</div>
			<div class="side-menu">
				<ul class="left">
					<?php if(isset($categories) && $categories) { ?>
						<?php foreach ($categories as $key => $category) { ?>
							<li>
								<?php if(isset($category['children']) && $category['children']) { ?>
									<!-- <span class="menu-opener"></span> -->
								<?php } ?>
								<a href="<?php echo $category['href']; ?>" >
									<b><?php echo $category['name']; ?></b>
								</a>
								<?php if(isset($wk_amp_sub_menu) && $wk_amp_sub_menu) { ?>
									<?php if(isset($category['children']) && $category['children']) { ?>
										<?php foreach ($category['children'] as $key => $child1) { ?>
											<li class="category-children" >
												<a href="<?php echo $child1['href']; ?>" >
													<?php echo $child1['name']; ?>
												</a>
											</li>
										<?php } ?>
									<?php } ?>
								<?php } ?>
	  						</li>
						<?php } ?>
					<?php } ?>
				</ul>
			</div>
		</amp-sidebar>
		<header>
			<div class="upper-header">
				<div class="category left">
					<button class='menu-button amp-close-image' on="tap:sidebar.toggle" role="button" tabindex="0"></button>
				</div>
				<div class="logo left">
					<a href="<?php echo $home; ?>">
						<amp-img class="logo-image" src="<?php echo $logo; ?>" width="136" height="38" layout="responsive" alt="<?php echo $name; ?>"></amp-img>
					</a>
				</div>
			</div>
			<div class="lower-header">
				<div class="search-bar">
					<form
						class="form minisearch"
						id="search_mini_form"
						action-xhr="<?php echo $search; ?>"
						action="<?php echo $search; ?>"
						method="get"
						target="_blank"
						on="submit:autosuggest-list.hide;"
				    autocomplete="off"
					>
						<input
							id="query"
							name="query"
							type="search"
							class="text-input data-input"
							placeholder="Search..."
							on="input-debounced:AMP.setState({
									query: event.value,
									autosuggest: event.value
								}),
								autosuggest-list.show"
							[value]="query || ''"
						/>
					</form>
				</div>
			</div>
		</header>
		<div class="search-box-suggestion-container">
			<div class="search-box-suggestion z-10">
				<amp-list
					class="autosuggest-box"
					layout="fixed-height"
					height="150"
					src="<?php echo $base;?>index.php?route=product/amp_search/jsonSearch"
					[src]="'<?php echo $base;?>index.php?route=product/amp_search/jsonSearch&search=' + (autosuggest || '')"
					id="autosuggest-list"
					hidden
				>
					<template type="amp-mustache">
							{{#option}}
								<div
									class="select-option no-outline"
									role="option"
									tabindex="0"
									on="tap:autosuggest-list.hide"
								>{{.}}</div>
							{{/option}}
								<a href="{{ href }}" class="select-option">
									<div>
											{{ name }}
									</div>
								</a>
					</template>
				</amp-list>
			</div>
		</div>
