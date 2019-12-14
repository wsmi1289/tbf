class StoreController < ApplicationController
  include PaginationHelper
  before_action :set_page, only: [:index]
  before_action :current_user_admin?
  
  def index
    @products = SearchService.new(Product, params, user_client?).search
    @products = @products.limit(per_page).offset(@page*per_page) unless all?
  end
end