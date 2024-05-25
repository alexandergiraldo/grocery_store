class ShoppingCart
  attr_reader :items

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
    unless invalids.empty?
      puts "Invalid items: #{invalids.join(', ')}"
    end
  end

  def sanitize_items
    if @items.nil? || @items.empty?
      puts 'No items entered'
      return
    end
    @items = items.split(',').compact
  end

  def format_items
    @items = @items.group_by(&:itself).map { |k, v| {"#{k}" => v.count} }
  end
end
