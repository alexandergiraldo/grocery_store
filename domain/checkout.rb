require_relative './utils'

class Checkout
  include Utils
  attr_reader :product_sales, :cart, :items

  def initialize(cart, product_sales)
    @product_sales = product_sales
    @products = cart.products
    @cart = cart
    @total = 0
    @savings = 0
    @items = []
  end

  def process
    calculate_totals
  end

  def total
    to_currency(@total)
  end

  def savings
    to_currency(@savings)
  end

  private
  def calculate_totals
    @cart.items.each do |item, quantity|
      product = @products.find { |product| product.name.downcase == item.downcase }
      sale = @product_sales.find { |sale| sale.product == product }

      regular_price = calculate_regular_price(product, quantity)
      final_sale_price = calculate_sales_price(product, sale, quantity)

      sum_totals(regular_price, final_sale_price)

      @items << { product: product, quantity: quantity, price: to_currency(final_sale_price || regular_price) }
    end
  end

  def calculate_regular_price(product, quantity)
    product.price * quantity
  end

  def calculate_sales_price(product, sale, quantity)
    if sale
      sale_price = (quantity / sale.quantity) * sale.sale_price
      extra_regular_price = (quantity % sale.quantity) * product.price
      final_sale_price = sale_price + extra_regular_price
    end
  end

  def sum_totals(regular_price, final_sale_price)
    if final_sale_price
      @total += final_sale_price
      @savings += regular_price - final_sale_price
    else
      @total += regular_price
    end
  end
end
