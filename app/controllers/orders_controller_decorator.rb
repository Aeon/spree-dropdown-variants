OrdersController.class_eval do
  before_filter :disregard_if_blank_option_types, :only => [:populate]
  before_filter :add_variants_from_drop_downs, :only => [:populate]
  
protected
  
  def disregard_if_blank_option_types
    if params[:option_types] and params[:product]
      if params[:option_types].any?{|key, value| value.blank?}
        flash[:error] = 'Please choose product options before continuing to the cart.'
        redirect_to product_path(Product.find params[:product])
      end
    end
  end
  
  def add_variants_from_drop_downs
    @order = current_order(true)
    
    if params[:option_types] and params[:product]
      disregard_if_blank_option_types
      variant = Variant.find_by_option_types_and_product(params[:option_types], params[:product])
      quantity = params[:quantity].to_i
      @order.add_variant(variant, quantity) if quantity > 0
    end
  end
end
