class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(products_params)
    if @product.save
      flash[:notice] = "Product has been successfully created 👍"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product = Product.update(products_params)
      flash[:notice] = "Product  successfully edited 👍"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = "Product has been successfully deleted 💬"
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:product_name, :price, :description, :user_id)
  end

  def require_user
    if current_user != @product.user
      flash[:notice] = "Only user can edit or delete their article 🎭"
      redirect_to products_path
    end
  end
end
