def stock_picker(array)
  buy_day = 0
  sell_day = 1
  lower_value = array[0]
  higher_value = 0
  possible_buy_day = 0

  array.each_with_index do |value, index|
    if value < lower_value
      lower_value = value
      possible_buy_day = index
    end

    if index > possible_buy_day && (value - lower_value) > higher_value
      higher_value = value - lower_value
      buy_day = possible_buy_day
      sell_day = index
    end
  end

  p "for a profit of $#{array[sell_day]} - $#{array[buy_day]} == $#{higher_value}"
  [buy_day, sell_day]
end

stock_picker([17,3,6,9,15,8,6,1,10])
