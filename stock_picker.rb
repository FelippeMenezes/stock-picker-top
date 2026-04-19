def stock_picker(array)
  lower_value = array[0]
  buy_day = 0

  higher_value = 0
  sell_day = 0

  max_profit = 0

  array.each_with_index do |value, index|
    if value < lower_value
      lower_value = value
      buy_day = index
    end

    profit = value - lower_value

    if profit > max_profit
      max_profit = profit
      higher_value = value
      sell_day = index
    end
  end

  p "for a profit of $#{higher_value} - $#{lower_value} == $#{max_profit}"
  [buy_day, sell_day]
end

stock_picker([17,3,6,9,15,8,6,1,10])
