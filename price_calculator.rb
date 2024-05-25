require_relative './domain/product'
require_relative './domain/product_sale'

# Initialize table of products for this week
milk = Product.new('Milk', 397)
bread = Product.new('Bread', 217)
banana = Product.new('Banana', 99)
apple = Product.new('Apple', 89)

# Initialize sale prices for this week
milk_sale = ProductSale.new(milk, 2, 5)
bread_sale = ProductSale.new(bread, 3, 6)

# Get order of products from user
puts 'Please enter all the items purchased separated by a comma'
products = gets.chomp.strip

# Validate products are not empty and are valid
if products.nil? || products.empty?
  puts 'No items entered'
  return
end
