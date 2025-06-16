# frozen_string_literal:true

# Inflation Calculator in Ruby
class Inflation
  def initialize(current_cost, inflation_rate, years)
    @current_cost = current_cost
    @inflation_rate = inflation_rate
    @years = years
    valid_argument
  end

  def valid_argument
    raise ArgumentError, 'current cost between 1000 to 10000000' unless @current_cost.between?(1000, 100_000_00)
    raise ArgumentError, 'rate of inflation between 1 to 50' unless @inflation_rate.between?(1, 50)
    raise ArgumentError, 'time period between 1 to 30' unless @years.between?(1, 30)
  end

  def calculate_future_cost
    future_cost = @current_cost * (1 + @inflation_rate / 100.0)**@years
    cost_increase = future_cost - @current_cost
    { current_cost: @current_cost.round(2), cost_increase: cost_increase.round(2), future_cost: future_cost.round(2) }
  end
end
begin
  print 'Enter current cost (₹): '
  current_cost = gets.to_f
  print 'Enter annual inflation rate (%): '
  inflation_rate = gets.to_f
  print 'Enter time period (years): '
  years = gets.to_i
  inflation = Inflation.new(current_cost, inflation_rate, years)
  puts "\nCalculating...\n\n"
  inflation_val = inflation.calculate_future_cost
  puts "Current Cost     : ₹#{format('%.2f', current_cost)}"
  puts "Rate of Inflation: #{inflation_rate}%"
  puts "Time Period      : #{years} years"
  puts '-------------------------------'
  puts "Cost Increase    : ₹#{format('%.2f', inflation_val[:cost_increase])}"
  puts "Future Cost      : ₹#{format('%.2f', inflation_val[:future_cost])}"
rescue ArgumentError => e
  puts "ERROR:#{e.message}"
end
