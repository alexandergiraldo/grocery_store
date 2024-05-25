require_relative 'product'
require_relative 'product_sale'

class ProductFactory
  attr_reader :products, :product_sales

  def initialize
    @products = []
    @product_sales = []
  end

  def create
    milk = Product.new('Milk', 397)
    bread = Product.new('Bread', 217)
    banana = Product.new('Banana', 99)
    apple = Product.new('Apple', 89)

    milk_sale = ProductSale.new(milk, 2, 500)
    bread_sale = ProductSale.new(bread, 3, 600)

    @products = [milk, bread, banana, apple]
    @product_sales = [milk_sale, bread_sale]
  end
end