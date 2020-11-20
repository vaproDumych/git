<div class="section-payment">
  <div class="title section-title"><?php echo $j3->settings->get('sectionTitlePaymentMethod'); ?></div>
  <div class="section-body">
    <div v-if="Object.keys(payment_methods).length === 0" class="alert alert-warning"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
    <div v-for="payment_method in payment_methods">
      <div class="radio">
        <label>
          <input v-bind:value="payment_method.code" type="radio" name="payment_method" v-model="order_data.payment_code"/>
          <span v-html="payment_method.title + (payment_method.terms ? '(' + payment_method.terms + ')' : '') "></span>
        </label>
      </div>
    </div>
  </div>
</div>
