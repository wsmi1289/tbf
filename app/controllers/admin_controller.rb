class AdminController < ApplicationController
  before_action :set_cart, :admin?
  def index
    @carts = Cart.all
    total = []
    @carts.each do |c|
      c.line_items.each do |l|
        total<<l.total_price.to_f
      end
    end
    @total_sales = total.sum
    @users = User.all
  end

  def create
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attribute(:client, params[:client])
        format.html { render :index, notice: 'Product was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
end
