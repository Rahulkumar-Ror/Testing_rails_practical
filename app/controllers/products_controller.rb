class ProductsController < ApplicationController 
	# before_action :auth_admin, except: [:show]
	before_action :authenticate_user!
	before_action :require_permission, only: [:edit, :update, :destroy]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
		@products = Product.all
  end

  def show
  end

  def edit
  end

  def new
		@product = Product.new
  end

	def create 
	  @product = current_user.products.build(product_params)
		if @product.save 
			flash[:notice] = "Product was successfully created...."
			redirect_to products_path
		else
			render :new, status: :unprocessable_entity
    end
	end

	def update
	  if @product.update(product_params)
			flash[:notice] = "Product is successfully updated...."
			redirect_to products_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@product.destroy
		redirect_to products_path
		flash[:alert] = "Product was successfully deleted"
	end

	private

	def product_params 
	  params.require(:product).permit(:product_name, :description, :price, :user_id)
	end

	def find_product
    @product = Product.find_by_id(params[:id])
	end

	def require_permission 
	  if current_user != @product.user
			flash[:notice]  = "User can only edit or delete the product"
      redirect_to products_path
		end
  end
end
