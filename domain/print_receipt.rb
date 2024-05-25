require_relative 'print'

class PrintReceipt < Print

  def initialize(total, items)
    @total = total
    @items = items
  end

  def print
    header
    division
    items
    totals
    footer
  end

  private

  def header
    puts ''
    puts "Item".ljust(COLUMN_WIDTH/2) + "Quantity".ljust(COLUMN_WIDTH) + "Price".ljust(COLUMN_WIDTH)
  end

  def items
    @items.each do |item|
      puts "#{item[:product].name}".ljust(COLUMN_WIDTH/2) + "#{item[:quantity]}".ljust(COLUMN_WIDTH) + "#{item[:price]}".ljust(COLUMN_WIDTH)
    end
  end

  def totals
    puts ''
    puts "Total price : #{@total}"
  end
end