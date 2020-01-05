module ProductHelper
  def stocked?(product)
    product.in_stock? ? "In stock" : "Out of stock"
  end
end