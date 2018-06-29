class AdminController < ApplicationController
  before_action :set_cart, :user_is_admin?
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
  
  private
    def user_is_admin?
      unless current_user.try(:admin)
        redirect_to two_barn_farm_path
      end
    end
end
