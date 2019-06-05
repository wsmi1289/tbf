class CheckoutsController < ApplicationController
  before_action :set_cart
  before_action :current_user_client?
  def new
    @order = Order.new
  end

  def create
    @order = Order.new({cart: @cart, user: current_user})
    @order.save
    CheckoutMailer.with(cart: @cart, email: current_user.email).receipt_email.deliver_now
    CheckoutMailer.with(cart: @cart, email: 'willsmith12289@gmail.com', orderer: current_user.email).receipt_email.deliver_now
    respond_to do |format|
      session[:cart_id] = nil
      format.html { redirect_to products_path, notice: 'Receipt Sent to your email' }
    end
  end
end