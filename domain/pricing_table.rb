require_relative './utils'
require_relative './print'

class PricingTable < Print
  include Utils

  # products: Array of Product
  # sales: Array of ProductSale
  def initialize(products, sales)
    @products = products
    @sales = sales
  end

  def print
    header
    division
    items
    footer
  end

  private

  def header
    puts "Item".ljust(COLUMN_WIDTH/2) + "Unit Price".ljust(COLUMN_WIDTH) + "Sale Price".ljust(COLUMN_WIDTH)
  end

  def items
    @products.each do |product|
      sale = @sales.find { |sale| sale.product == product }
      sale_price = sale.nil? ? '' : to_currency(sale.sale_price)
      price = to_currency(product.price)
      sale_price_text = sale_price.empty? ? '' : "#{sale.quantity} for #{sale_price}"
      puts "#{product.name}".ljust(COLUMN_WIDTH/2) + "#{price}".ljust(COLUMN_WIDTH) + "#{sale_price_text}".ljust(COLUMN_WIDTH)
    end
  end
end