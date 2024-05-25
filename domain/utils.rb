module Utils
  def to_currency(value)
    currency = value.to_f / 100
    "$#{currency}"
  end
end
