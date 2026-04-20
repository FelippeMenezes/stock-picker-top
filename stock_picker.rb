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

puts "Enter comma-separated list of stock prices, one for each day:"
stocks = gets.chomp.split(",")
converted_stocks = stocks.map { |stock| stock.to_i }

stock_picker(converted_stocks)

# # stock-picker-top
# A Ruby method that analyzes an array of stock prices and determines the best days to buy and sell for maximum profit. The method returns the indices of the buy and sell days, ensuring the purchase occurs before the sale. This project reinforces fundamentals like arrays, conditionals, and iteration while handling edge cases.

# ## Why a Single Pass Instead of Nested Loops?
# The naive approach would be to compare every possible pair using nested loops — for each buy_day, check every sell_day > buy_day and track the best profit. It works, but has O(n²) time complexity: with 1,000 prices, that's ~500,000 comparisons. Double the input, quadruple the work.

# This implementation uses a single-pass O(n) algorithm instead. It iterates the array exactly once, simultaneously tracking lower_value (best buy candidate) and higher_value (highest profit achievable up to the current day).

# ### The key insight:

# You don't need to compare all pairs. Just ensure possible_buy_day always points to the lowest price seen before any candidate sell_day. If today's price drops below lower_value, update it — pure greedy.
# Result: 10,000 prices → 10,000 iterations, not 100,000,000.
