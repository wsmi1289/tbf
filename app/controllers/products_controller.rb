class ProductsController < ApplicationController
  include PaginationHelper
  before_action :set_page, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_cart
  before_action :current_user_client?

  def index
    svc = SearchService.new(Product, params, user_client?)
    @products = paginate(svc.search)
    
    search_posts if @products.empty?
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      handle_image_cropping
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      handle_image_cropping
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

    def handle_image_cropping
      product_params[:image].present? ?
        render(:crop) : redirect_to(products_path, notice: 'Success.')
    end

    def product_params
      params.require(:product).permit(:title, :description, :category_id, :price, :image, :in_stock, :crop_x, :crop_y, :crop_w, :crop_h)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def search_posts
      svc = SearchService.new(Post, params, user_client?)
      redirect_to posts_path(params.permit(:q)) if svc.search.any?
    end
end
