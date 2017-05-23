class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy, :my_products ]
  before_action :find_product, except: [ :index, :new, :create, :my_products ]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.create(product_params)

    if @product.save
      flash[:notice] = "Product saved successfully"
      redirect_to root_path
    else
      flash[:notice] = "Error ! could not be saved"
      render "new"
    end
  end

  def show
  end

  def edit

  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product updated successfully"
      redirect_to @product
    else
      flash[:notice] = "Error ! could not be updated"
      render "edit"
    end

  end

  def destroy
    prod_name = Product.find(params[:id])
    @product.delete
    flash[:notice] = "Product #{prod_name.name} deleted successfully"
    redirect_to root_path
  end

  def my_products
    @products = current_user.products
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :user_id)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end