class Checkout
  attr_reader :product_sales, :cart, :total

  def initialize(cart, product_sales)
    @product_sales = product_sales
    @products = cart.products
    @cart = cart
    @total = 0
  end

  def process
    calculate_totals
  end

  private
  def calculate_totals
    @cart.items.each do |item, quantity|
      product = @products.find { |product| product.name.downcase == item.downcase }
      sale = @product_sales.find { |sale| sale.product == product }

      regular_price = product.price * quantity

      if sale
        sale_price = (quantity / sale.quantity) * sale.sale_price
        extra_regular_price = (quantity % sale.quantity) * product.price
        final_sale_price = sale_price + extra_regular_price
      end

      if final_sale_price
        @total += final_sale_price
      else
        @total += regular_price
      end
    end
  end
end
