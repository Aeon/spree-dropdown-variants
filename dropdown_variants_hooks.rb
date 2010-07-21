class DropdownVariantsHooks < Spree::ThemeSupport::HookListener
  replace  :inside_product_cart_form, 'products/dropdown_variants'
  
  insert_after :inside_head do
    "<%= javascript_include_tag 'dropdown_variants' %>"
  end
end
