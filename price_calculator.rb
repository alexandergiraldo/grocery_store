require_relative './domain/product'
require_relative './domain/product_sale'
require_relative './services/pricing_table'
require_relative './domain/shopping_cart'

# Initialize table of products for this week
milk = Product.new('Milk', 397)
bread = Product.new('Bread', 217)
banana = Product.new('Banana', 99)
apple = Product.new('Apple', 89)

# Initialize sale prices for this week
milk_sale = ProductSale.new(milk, 2, 500)
bread_sale = ProductSale.new(bread, 3, 600)

products = [milk, bread, banana, apple]
product_sales = [milk_sale, bread_sale]

# Display products and sale prices of the week
PricingTable.new(products, product_sales).print

# Get order of products from user
puts 'Please enter all the items purchased separated by a comma'
items = gets.chomp.strip

# Create shopping cart
ShoppingCart.new(items, products).create_cart
