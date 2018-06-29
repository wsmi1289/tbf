class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :toggle]
  before_action :set_cart
  before_action :searching?
  before_action :user_is_client?

  def index
    if current_user.try(:admin)
      @products = Product.all
    else
      @products = Product.where(in_stock: true)
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle
    respond_to do |format|
      if @product.update_attribute(:in_stock, params[:in_stock])
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  private

    def product_params
      params.require(:product).permit(:title, :description, :category, :price, :image, :in_stock)
    end

    def searching?
      if params.has_key?(:q)
        if current_user.try(:admin)
          @products = Product.search_products(params[:q]).order("created_at DESC")
        else
          @products = Product.where(in_stock: true).search_products(params[:q]).order("created_at DESC")
        end
        render "index"
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def user_is_client?
      unless current_user.try(:client) || current_user.try(:admin)
        redirect_to two_barn_farm_path
      end
    end
end
