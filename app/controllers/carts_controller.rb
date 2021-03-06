class CartsController < ApplicationController
  before_action :set_cart, only: [:edit, :update, :destroy]
  before_action :current_user_client?

  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # if @cart.id == session[:cart_id]
    #   @cart.destroy
    #   session[:cart_id] = nil
    # else
    @cart.line_items.each do |item|
      item.destroy
    end
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private

    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to acces invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid Cart'
    end
end
