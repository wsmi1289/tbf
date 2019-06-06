class AdminController < ApplicationController
  before_action :set_cart, :current_user_admin?
  def index
    @orders = Order.all
    @total_sales = total_sales
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attribute(:role, params[:client])
        format.html { render :index, notice: 'Product was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def total_sales
    total = []
    @orders.each do |o|
      o.cart.line_items.each do |l|
        total<<l.total_price.to_f
      end
    end
    total.sum
  end
end
