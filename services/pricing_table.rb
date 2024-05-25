require_relative '../domain/utils'

class PricingTable
  include Utils

  COLUMN_WIDTH = 20

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

  def division
    length = COLUMN_WIDTH + (COLUMN_WIDTH * 2)
    line   = ''

    length.times { line += '-' }
    puts line
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

  def footer
    puts ''
    puts ''
  end
end