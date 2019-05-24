class ApplicationController < ActionController::Base
  PAGE=1
  protect_from_forgery with: :exception

  private
    def all?
      params[:all] == 'true'
    end
  
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

    def set_page
      @page = params[:page].to_i || 0
    end
end
