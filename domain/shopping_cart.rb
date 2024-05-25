class InvalidItemError < StandardError
end

class NoItemsError < StandardError
end

class ShoppingCart
  attr_reader :items, :products

  def initialize(items = [], products)
    @items = items
    @products = products
  end

  def create_cart
    sanitize_items
    validate_items
    format_items
  end

  private
  def validate_items
    invalids = []
    @items.each do |item|
      if @products.find { |product| product.name.downcase == item.downcase }.nil?
        invalids << item
      end
    end

    raise InvalidItemError, "Invalid item(s): #{invalids.join(', ')}" unless invalids.empty?
  end

  def sanitize_items
    raise NoItemsError, "No items in cart" if @items.nil? || @items.empty?

    @items = items.split(',').compact
  end

  def format_items
    @items = @items.group_by(&:itself).transform_values { |item| item.count }
  end
end
