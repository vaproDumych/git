<?php echo $amp_header; ?>
<?php if($success) { ?>
  <div class="alert alert-sucess">
    <?php echo $success; ?>
  </div>
<?php } ?>
<div id="content">
  <div class="container">
    <div class="content-left">
      <div class="product-image">
        <amp-carousel width="400" height="300" layout="responsive" type="slides">
          <amp-img src="<?php echo $popup; ?>" layout="responsive" width=720 height=422 alt="<?php echo $product['name']; ?>" ></amp-img>
          <?php if(isset($images) && $images) { ?>
            <?php foreach ($images as $key => $image) { ?>
              <amp-img src="<?php echo $image['popup']; ?>" width="400" height="300" layout="responsive" alt="a sample image"></amp-img>
            <?php } ?>
          <?php } ?>
        </amp-carousel>
      </div>
    </div>
    <div class="content-right">
      <div class="product-name detail-section"><?php echo $product['name']; ?></div>
      <div class="status-rating detail-section">
        <span class="text-success"><?php echo $stock; ?></span>
        <span class="seperator">|</span>
        <?php for($i = $product['rating']; $i > 0  ; $i--) { ?>
          <span class="star star-yellow"></span>
        <?php } ?>
        <?php for($i = 0; $i < 5-$product['rating'] ; $i++) { ?>
          <span class="star"></span>
        <?php } ?>
      </div>
      <div class="product-price detail-section">
        <?php if (!$special) { ?>
          <?php echo $price; ?>
        <?php } else { ?>
          <?php echo $special; ?>
        <?php } ?>
      </div>
      <div class="cart-share">
        <div class="cart-button">
          <a href="<?php echo $buy_now; ?>" class="button button-link add-to-cart">Buy Now</a>
        </div>
        <div class="social-share">
          <?php if(isset($social_share) && $social_share) { ?>
            <?php if(in_array('Twitter', $social_share)) { ?>
              <amp-social-share type="twitter" width="35" height="35"> </amp-social-share>
            <?php } ?>
            <?php if(in_array('Goolge+', $social_share)) { ?>
              <amp-social-share type="gplus" width="35" height="35"></amp-social-share>
            <?php } ?>
            <?php if(in_array('Email', $social_share)) { ?>
              <amp-social-share type="email" width="35" height="35"></amp-social-share>
            <?php } ?>
            <?php if(in_array('Pinterest', $social_share)) { ?>
              <amp-social-share type="pinterest" width="35" height="35"></amp-social-share>
            <?php } ?>
            <?php if(in_array('LinkedIn', $social_share)) { ?>
              <amp-social-share type="linkedin" width="35" height="35"></amp-social-share>
            <?php } ?>
            <?php if(in_array('Facebook', $social_share) && $wk_amp_fb_app_id) { ?>
              <amp-social-share type="facebook" width="35" height="35" data-param-app_id="<?php echo $wk_amp_fb_app_id; ?>"></amp-social-share>
            <?php } ?>
            <?php if(in_array('WhatsApp', $social_share)) { ?>
              <amp-social-share class="whatsapp-sharing" type="whatsapp" width="35" height="35" data-share-endpoint="whatsapp://send"></amp-social-share>
            <?php } ?>
          <?php } ?>
        </div>
      </div>
    </div>
    <div class="product-details">
      <amp-accordion>
        <section class="section-heading" expanded>
            <h4>Description</h4>
            <article  class="section-content">
              <?php echo $product['description']; ?>
            </article>
        </section>
        <?php if(isset($reviews) && $reviews) { ?>
          <section class="section-heading">
            <h4>Reviews</h4>
            <div class="review-background">
              <div class="wk-product-rating-head">
                  <div class="wk-product-rating-box-panel">
                    <div class="wk-product-rating-box wk-table-cell">
                        <div class="wk-product-rating-info">
                            <span class="wk-rating-number"><?php echo $product['rating']; ?></span>
                            <span class="wk-rating-stars">
                                <div class="ratings">
                                    <div class="rating-box center">
                                        <div class="rating">
                                          <?php for($i = $product['rating']; $i > 0  ; $i--) { ?>
                                            <span class="star star-yellow"></span>
                                          <?php } ?>
                                          <?php for($i = 0; $i < 5-$product['rating'] ; $i++) { ?>
                                            <span class="star"></span>
                                          <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </span>
                            <span class="wk-rating-text">based on</span>
                            <span class="wk-rating-text"><?php echo count($reviews)?> reviews</span>
                        </div>
                    </div>
                  </div>
                </div>
              <?php foreach ($reviews as $review) { ?>
                <div class="wk-review-item">
                  <div class="wk-review-item-content">
                    <div class="wk-review-item-head">
                      <div class="wk-review-item-head-content">
                        <div class="wk-reviewer-name">Author : <?php echo $review['author'] ; ?></div>
                      </div>
                    </div>
                    <div class="wk-review-item-body">
                      <div class="ratings-table">
                        <div class="rating-box">
                           <div class="rating">
                              <?php for($i = $review['rating']; $i > 0  ; $i--) { ?>
                                <span class="star star-yellow"></span>
                              <?php } ?>
                              <?php for($i = 0; $i < 5-$review['rating'] ; $i++) { ?>
                                <span class="star"></span>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                      <div class="wk-review-posted-date">Posted on - <?php echo $review['date_added'] ; ?></div>
                      <div class="wk-review-summary"><?php echo $review['text'] ; ?></div>
                    </div>
                  </div>
                </div>
              <?php } ?>
            </div>
          </section>
        <?php } ?>
        <?php if(isset($attribute_groups) && $attribute_groups) { ?>
          <section class="section-heading">
            <h4>Specification</h4>
            <p>
              <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <span class="spec-header"><strong><?php echo $attribute_group['name']; ?></strong></span>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <span class="spec-name"><?php echo $attribute['name']; ?></span>
                  <span class="spec-text"><?php echo $attribute['text']; ?></span>
                  <?php } ?>
              <?php } ?>
            </p>
          </section>
        <?php } ?>
      </amp-accordion>
    </div>
    <?php if(isset($related_products) && $related_products) { ?>
      <div class="related-product-heading">
        Related Products
      </div>
    <?php } ?>
    <div class="related_products">
      <?php if(isset($related_products) && $related_products) { ?>
        <amp-carousel width="auto" height="230" layout="fixed-height" type="carousel">
          <?php foreach ($related_products as $key => $related_product) { ?>
            <a class="tile" href="<?php echo $related_product['href']; ?>">
              <amp-img src="<?php echo $related_product['thumb']; ?>" width="200" height="150" layout="responsive" ></amp-img>
              <p class="name">
                <?php if(strlen($related_product['name']) > 20) { ?>
                  <?php echo substr($related_product['name'],0,17); ?><span class="name-hide">...</span><span class="name-show"><?php echo substr($related_product['name'],17); ?></span>
                <?php } else { ?>
                  <?php echo $related_product['name']; ?>
                <?php } ?>
              </p>
              <p class="price">
                <?php if (!$related_product['special']) { ?>
                  <?php echo $related_product['price']; ?>
                <?php } else { ?>
                  <?php echo $related_product['special']; ?>
                <?php } ?>
              </p>
            </a>
          <?php } ?>
        </amp-carousel>
      <?php } ?>
    </div>
  </div>
</div>

<?php echo $amp_footer; ?>
