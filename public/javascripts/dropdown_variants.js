jQuery(document).ready(function() {
  $('#product-variants select').live('change', function (event) {
    show_variant_images(this.value);
  });
});