class CheckoutsController < ApplicationController
  before_action :set_cart
  before_action :client?
  def new
  end

  def create
    CheckoutMailer.with(cart: @cart, email: current_user.email).receipt_email.deliver_now
    CheckoutMailer.with(cart: @cart, email: 'willsmith12289@gmail.com', orderer: current_user.email).receipt_email.deliver_now
    respond_to do |format|
      @cart.destroy
      format.html { redirect_to products_path, notice: 'Receipt Sent to your email' }
    end
  end
end