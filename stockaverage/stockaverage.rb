class StockAverage
  def initialize(buy_price1, quantity1, buy_price2, quantity2 )
    @buy_price1 = buy_price1
    @buy_price2 = buy_price2
    @quantity1 = quantity1
    @quantity2 = quantity2
  end

  def valid_argument
    raise ArgumentError, 'Buy Price Not Negative' if @buy_price1.negative? || @buy_price2.negative?
    raise ArgumentError, 'Quantity Not Negative' if @quantity1.negative? || @quantity2.negative?
  end

  def tot_stock
    (@quantity1 + @quantity2).round
  end

  def average_amount
    ((@buy_price1 * @quantity1) + (@buy_price2 * @quantity2)).round
  end

  def average_price
    (((@buy_price1 * @quantity1) + (@buy_price2 * @quantity2)) / (@quantity1 + @quantity2).to_f).round
  end
end
puts '---------------------------------------------------------'
puts 'Enter Buy Price 1'
buy_price1 = gets.chomp.to_f

puts 'Enter Stock Quantity 1'
quantity1 = gets.chomp.to_f

puts 'Enter Buy Price 2'
buy_price2 = gets.chomp.to_f

puts 'Enter Stock Quantity 1'
quantity2 = gets.chomp.to_f
# error handling
begin
  stock = StockAverage.new(buy_price1, quantity1, buy_price2, quantity2)
  stock.valid_argument
  puts '---------------------------------------------------------'
  puts '---------Stock Average Calculator------------------------'
  puts '---------------------------------------------------------'
  puts "Total Shares :- #{stock.tot_stock}"
  puts "Total Amount :- #{stock.average_amount}"
  puts "Average Price :- #{stock.average_price}"
  puts '---------------------------------------------------------'
rescue ArgumentError => e
  puts e
end

