class Print
  COLUMN_WIDTH = 20

  def division
    length = COLUMN_WIDTH + (COLUMN_WIDTH * 2)
    line = ''

    length.times { line += '-' }
    puts line
  end

  def footer
    puts ''
    puts ''
  end
end