class LineItemsController < ApplicationController
  before_action :set_cart, only: [:create, :update]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :client?

  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity].blank? ? 1 : params[:quantity].to_i
    @line_item = @cart.add_product(product.id, quantity)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.js
        format.json { render :show, status: :created, location: @line_item }
      else
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item.cart, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :quantity)
    end
end
