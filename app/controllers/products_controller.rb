class ProductsController < ApplicationController
  before_action :set_page, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :toggle]
  before_action :set_cart
  before_action :client?

  def index
    @products = SearchService.new(Product, params, current_user.id).search
    @products = @products.limit(10).offset(@page*10) unless all?
    redirect_to posts_path(params.permit(:q)) if @products.empty?
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if product_params[:image].present?
        render :crop
      else
        redirect_to products_path, notice: 'Product was successfully created.'
      end
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      if product_params[:image].present?
        render :crop
      else
        redirect_to products_path, notice: 'Product was successfully updated.'
      end
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :category_id, :price, :image, :in_stock, :crop_x, :crop_y, :crop_w, :crop_h)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
