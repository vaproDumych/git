<?php echo $amp_header; ?>

<div id="content">
	<div class="breadcrumb">
		<div class="category-name">
			<?php echo $heading_title; ?>
		</div>
	</div>
	<div class="wk-amp-product-list">
		<?php if(isset($products) && $products) { ?>
			<?php foreach ($products as $key => $product) { ?>
				<div class="wk-amp-product-list-item">
			        <div class="wk-amp-product-list-item-img">
			            <a href="<?php echo $product['href']; ?>"><amp-img src="<?php echo $product['thumb']; ?>" width="75" height="75" alt="<?php echo $product['name'] . "image";?>" layout="responsive"></amp-img></a>
			        </div>
			        <div class="wk-amp-product-list-item-content">
			            <div class="wk-amp-product-list-item-name">
			                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			            </div>
				        <?php if($product['reviews']) { ?>
			            	<div class="wk-amp-product-list-item-ratings">
				                <div class="ratings">
				                    <div class="rating-box">
				                		<div class="rating wk-100">
				                			<?php for($i = $product['rating']; $i > 0  ; $i--) { ?>
									          	<span class="star star-yellow"></span>
									        <?php } ?>
									        <?php for($i = 0; $i < 5-$product['rating'] ; $i++) { ?>
									          	<span class="star"></span>
									        <?php } ?>
				                		</div>
				            		</div>
				                	<span class="amount"><a href="<?php echo $product['href']; ?>"><?php echo $product['reviews']?> Review(s)</a></span>
				   		 		</div>
			            	</div>
				   		 <?php } ?>
			            <div class="wk-amp-product-list-item-price">
							<div class="price-box">
			                    <span class="regular-price" id="product-price-9">
			                    	<span class="price">
															<?php if (!$product['special']) { ?>
																<?php echo $product['price']; ?>
															<?php } else { ?>
																<?php echo $product['special']; ?>
															<?php } ?>
														</span>
			                    </span>
			                </div>
						</div>
			        </div>
				</div>
			<?php } ?>
		<?php } else { ?>
			<div class="no-product">
				There are no products to list in this category.
			</div>
		<?php } ?>
	</div>
	<div class="wk-amp-product-list">
		<div class="amp-pagination">
			<?php echo $pagination; ?>
		</div>
		<div class="results">
			<?php echo $results; ?>
		</div>
	</div>
</div>
<?php echo $amp_footer; ?>
