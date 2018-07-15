class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  
    def admin?
      unless current_user.try(:admin)
        redirect_to two_barn_farm_path
      end
    end

    def client?
      unless current_user.try(:client) || current_user.try(:admin)
        redirect_to two_barn_farm_path
      end
    end

    def set_cart 
        @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
    end
end
