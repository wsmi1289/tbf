class ApplicationController < ActionController::Base
  include ApplicationHelper
  include FormatHelper
  protect_from_forgery with: :exception

  private
  
    def current_user_admin?
      unless current_user.admin?
        redirect_to two_barn_farm_path
      end
    end

    def current_user_client?
      unless current_user.client? || current_user.admin? ||
        current_user.root?
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

    private

    def serialize_collection(collection, options = {})
      ActiveModel::Serializer::CollectionSerializer.new(collection, options).as_json
    end
end
