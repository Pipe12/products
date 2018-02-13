class ProductsController < ApplicationController
	def index
		@products = Product.all
		@categories = Category.all
	end

	def new
		@categories = Category.all
	end

	def edit
		@product = Product.find(params[:id])
		@categories = Category.all
	end

	def create
		@product = Product.new(product_params)
		
		params[:category_ids].each do |id|
			@product.categories << Category.find(id)
		end

		@product.save
		redirect_to 'products#index'
	end

	def update
		@product = Product.find(params[:id])
		categories = Category.all

		categories.each do |category|
			if @product.categories.exists?("#{category.id}")
				@product.categories.delete("#{category.id}")
			end
		end

		params[:category_ids].each do |id|
			@product.categories << Category.find(id)
		end

		@product.update(product_params)
		redirect_to @product
	end

	private
		def product_params
			params.require(:product).permit(:name, :price, category_ids: [])
		end
end
