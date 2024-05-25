class ProductSale
  attr_reader :product, :quantity, :sale_price

  # pruduct: Product
  # quantity: int
  # sale_price: int
  def initialize(product, quantity, sale_price)
    @product = product
    @quantity = quantity
    @sale_price = sale_price
  end
end
