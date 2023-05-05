class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end
  
  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
    
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to users_path, status: :see_other
  end
  
  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
     params.require(:product).permit(:title, :category_id, :description, :price, :location, :image, :user_id)
    end
end
