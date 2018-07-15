class StoreController < ApplicationController
  before_action :searching?
  before_action :admin?
  def index
    @products = Product.all
  end

  def filter
    if params.has_key?(:product)
      filter = params[:product][:filter]
      puts filter
      @products = Product.where(category: filter)
      respond_to do |format|
        format.js
      end
    else
      render "index"
    end
  end

  def sort
    @products = Product.all.order("#{params[:sort]} #{params[:direction]}")
    render 'index'
  end

  def in_stock

  end

  private

    def searching?
      if params.has_key?(:q)
        @products = Product.search_products(params[:q]).order("created_at DESC")
        render "index"
      end
    end

    def toggle_active
      update active: !active
    end
end