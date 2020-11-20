<?php echo $amp_header; ?>

<div id="content">
	<?php if(isset($slides) && $slides) { ?>
		<div class="product-image">
			<amp-carousel width="400" height="300" layout="responsive" type="slides">
	            <?php foreach ($slides as $key => $slide) { ?>
	            	<a href="<?php echo $slide['link']; ?>" title="<?php echo $slide['title']; ?>">
	              		<amp-img src="<?php echo $slide['image']; ?>" width="400" height="300" layout="responsive" alt="a sample image"></amp-img>
	              </a>
	            <?php } ?>
	        </amp-carousel>
		</div>
	<?php } ?>
	<?php if(isset($bestSellers) && $bestSellers) { ?>
		<div class="breadcrumb">
			<div class="category-name">
		       	Top Selling Products
		    </div>
		</div>
		<div class="wk-amp-product-list">
			<?php foreach ($bestSellers as $key => $bestSeller) { ?>
				<div class="wk-amp-product-list-item">
			        <div class="wk-amp-product-list-item-img">
			            <a href="<?php echo $bestSeller['href']; ?>"><amp-img src="<?php echo $bestSeller['thumb']; ?>" width="75" height="75" alt="<?php echo $bestSeller['name'] . "image";?>" layout="responsive"></amp-img></a>
			        </div>
			        <div class="wk-amp-product-list-item-content">
			            <div class="wk-amp-product-list-item-name">
			                <a href="<?php echo $bestSeller['href']; ?>"><?php echo $bestSeller['name']; ?></a>
			            </div>
				        <?php if($bestSeller['reviews']) { ?>
			            	<div class="wk-amp-product-list-item-ratings">
				                <div class="ratings">
				                    <div class="rating-box">
				                		<div class="rating wk-100">
				                			<?php for($i = $bestSeller['rating']; $i > 0  ; $i--) { ?>
									          	<span class="star star-yellow"></span>
									        <?php } ?>
									        <?php for($i = 0; $i < 5-$bestSeller['rating'] ; $i++) { ?>
									          	<span class="star"></span>
									        <?php } ?>
				                		</div>
				            		</div>
				                	<span class="amount"><a href="<?php echo $bestSeller['href']; ?>"><?php echo $bestSeller['reviews']?> Review(s)</a></span>
				   		 		</div>
			            	</div>
				   		 <?php } ?>
			            <div class="wk-amp-product-list-item-price">
							<div class="price-box">
			                    <span class="regular-price" id="product-price-9">
			                    	<span class="price">
															<?php if (!$bestSeller['special']) { ?>
																<?php echo $bestSeller['price']; ?>
															<?php } else { ?>
																<?php echo $bestSeller['special']; ?>
															<?php } ?>
														</span>
			                    </span>
			                </div>
						</div>
			        </div>
				</div>
			<?php } ?>
		</div>
	<?php } ?>
	<?php if(isset($latests) && $latests) { ?>
		<div class="breadcrumb">
			<div class="category-name">
	        	New Products in Store
      		</div>
      	</div>
		<div class="wk-amp-product-list">
			<?php foreach ($latests as $key => $latest) { ?>
				<div class="wk-amp-product-list-item">
			        <div class="wk-amp-product-list-item-img">
			            <a href="<?php echo $latest['href']; ?>"><amp-img src="<?php echo $latest['thumb']; ?>" width="75" height="75" alt="<?php echo $latest['name'] . "image";?>" layout="responsive"></amp-img></a>
			        </div>
			        <div class="wk-amp-product-list-item-content">
			            <div class="wk-amp-product-list-item-name">
			                <a href="<?php echo $latest['href']; ?>"><?php echo $latest['name']; ?></a>
			            </div>
				        <?php if($latest['reviews']) { ?>
			            	<div class="wk-amp-product-list-item-ratings">
				                <div class="ratings">
				                    <div class="rating-box">
				                		<div class="rating wk-100">
				                			<?php for($i = $latest['rating']; $i > 0  ; $i--) { ?>
									          	<span class="star star-yellow"></span>
									        <?php } ?>
									        <?php for($i = 0; $i < 5-$latest['rating'] ; $i++) { ?>
									          	<span class="star"></span>
									        <?php } ?>
				                		</div>
				            		</div>
				                	<span class="amount"><a href="<?php echo $latest['href']; ?>"><?php echo $latest['reviews']?> Review(s)</a></span>
				   		 		</div>
			            	</div>
				   		 <?php } ?>
			            <div class="wk-amp-product-list-item-price">
							<div class="price-box">
			                    <span class="regular-price" id="product-price-9">
			                    	<span class="price">
															<?php if (!$latest['special']) { ?>
																<?php echo $latest['price']; ?>
															<?php } else { ?>
																<?php echo $latest['special']; ?>
															<?php } ?>
														</span>
			                    </span>
			                </div>
						</div>
			        </div>
				</div>
			<?php } ?>
		</div>
	<?php } ?>
</div>


<?php echo $amp_footer; ?>
