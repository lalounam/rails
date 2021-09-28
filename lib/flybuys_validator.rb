class FlybuysValidator
  def self.validate(card_number)
    card_number = card_number.gsub(/\s+/, "")
    card_type(card_number) + ": " + card_number + " " + valid?(card_number)
  end

  def self.valid?(card_number)
    m = 2
    digits_array = (card_number.reverse.scan /\w/).map{ |d| simplify(d.to_i * (m = one_two(m))) }
    sum = digits_array.inject(0){|sum,x| sum + x }
    sum % 10 == 0 ? "(valid)" : "(invalid)"
  end

  def self.one_two(value)
    value > 1 ? value-1 : value+1
  end

  def self.simplify(value)
    value % 10 + value / 10
  end

  def self.card_type(card_number)
    case card_number
    when /60141\d{11,12}/
      "Fly Buys Black"
    when /6014352\d{9}/
      "Fly Buys Red"
    when /^?(6014355526|6014355529)\d{6}$/
      "Fly Buys Green"
    when /6014\d{12}/
      "Fly Buys Blue"
    else
      "Unknown"
    end
  end
end
