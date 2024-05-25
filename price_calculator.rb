require_relative './domain/pricing_table'
require_relative './domain/shopping_cart'
require_relative './domain/checkout'
require_relative './domain/print_receipt'
require_relative './domain/product_factory'

# Initialize table of products for this week
factory = ProductFactory.new
factory.create

products = factory.products
product_sales = factory.product_sales

# Display products and sale prices of the week
PricingTable.new(products, product_sales).print

# Get order of products from user
puts 'Please enter all the items purchased separated by a comma'
items = gets.chomp.strip

begin
  # Create shopping cart
  shoping_cart = ShoppingCart.new(items, products)
  shoping_cart.create_cart

  # Perform checkout and display total
  checkout = Checkout.new(shoping_cart, product_sales)
  checkout.process
  receipt = PrintReceipt.new(checkout.total, checkout.savings, checkout.items)
  receipt.print
rescue InvalidItemError, NoItemsError => e
  puts e.message
end