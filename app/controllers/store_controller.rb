class StoreController < ApplicationController
  before_action :set_page, only: [:index]
  before_action :admin?
  def index
    @products = SearchService.new(Product, params, current_user.id).search
    @products = @products.limit(10).offset(@page*10) unless all?
      respond_to do |format|
        format.html
        format.js
      end
  end
end