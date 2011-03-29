ProductsHelper.class_eval do
  def instock_option_values(product, option_type)
    instock = product.variants.find_all{|variant| variant.in_stock? || Spree::Config[:show_zero_stock_products]}
    uniq_option_values = instock.collect(&:option_values).flatten.uniq
    uniq_option_values.find_all{|ov| ov.option_type == option_type}
  end
end
