class CheckoutsController < ApplicationController
  before_action :set_cart
  before_action :client?
  def new
  end

  def create
    CheckoutMailer.with(cart: @cart).receipt_email.deliver_now
    respond_to do |format|
      format.html { redirect_to @cart, notice: 'Receipt Sent to your email' }
    end
  end
end