module Utils
  def to_currency(value)
    # cents to reais
    currency = value.to_f / 100
    "$#{currency}"
  end
end
