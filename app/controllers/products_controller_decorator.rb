ProductsController.class_eval do
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
  private
    def show
      @product = Product.find_by_permalink!(params[:id])
      return unless @product
      
      @variants = Variant.active.includes([:option_values, :images]).where(:product_id => @product.id)
      @variant_opt_val = Hash[@variants.map{ |v| [v.option_values.map{ |ov| ov.option_type_id.to_s+"_"+ov.id.to_s }.sort.join("-"), v.id ] }]
      @product_properties = ProductProperty.includes(:property).where(:product_id => @product.id)
      @selected_variant = @variants.detect { |v| v.available? }

      referer = request.env['HTTP_REFERER']

      if referer && referer.match(HTTP_REFERER_REGEXP)
        @taxon = Taxon.find_by_permalink($1)
      end

      respond_with(@product)
    end
   
end