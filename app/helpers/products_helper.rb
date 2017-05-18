module ProductsHelper
	def get_product(product_id)
      @product = Product.find(product_id)
    end
end
