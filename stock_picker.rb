def stock_picker(array)
  hash = Hash.new(0)
  array.each_with_index do | value, index |
    hash[index] = value
  end

  higher_value = 0
  sell_day = 0

  hash.each do | key, value |
    if value > higher_value && key > sell_day
      higher_value = value
      sell_day = key
    end
  end

  lower_value = array[0]
  buy_day = ""

  hash.each do | key, value |
    if key < sell_day && value < lower_value
      lower_value = value
      buy_day = key
    end
  end

  result = [ buy_day, sell_day]
  p "for a profit of $#{higher_value} - $#{lower_value} == $#{higher_value - lower_value}"
  result
end

stock_picker([17,3,6,9,15,8,6,1,10])
