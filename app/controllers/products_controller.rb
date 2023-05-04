class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    
  end

  def create
    @user = User.find(params[:user_id])
    @comment = @user.products.create(product_params)
    redirect_to user_path(@user)
  end

  private
   def product_params
     params.require(:product).permit(:title, :category_id, :description, :price, :location, :image)
   end
end
