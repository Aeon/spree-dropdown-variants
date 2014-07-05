jQuery(document).ready(function() {
  $('ul#product-thumbnails').data("opt_val", <%= @variant_opt_val.to_json.html_safe %> );
  $('#product-variants').delegate('select', 'change', function (event) {
			var opt_val = eval($('ul.thumbnails').data("opt_val"));
			var arr = [];
			$("#product-variants select option:selected").each(function () {
				var ot_ov_str = $(this).parent().attr('id').match(/(option_types_)(\d+)/)[2]+"_"+$(this).attr('value');
				arr.push(ot_ov_str);
			});
			arr.sort();
	    show_variant_images(opt_val[arr.join("-")]);
	});
});