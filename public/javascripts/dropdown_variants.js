$(document).ready(function(){
  
  $('#product-variants select').live('change', function(e){
    var $form = $(this).closest('form');
    $form.find("button[type=submit]").addClass('disabled');
    var productId = $form.find("input[name=product]").val();
    $.ajax({
       type: "POST",
       url: "/products/selected_variant/"+productId,
       data: $form.serialize(),
       dataType: 'script'
     });
  });
  
});