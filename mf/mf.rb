# frozen_string_literal: true

# Mutual Fund Returns Calculator
class Mf
  def initialize(total_investment, rate, years)
    @total_investment = total_investment
    @rate = rate
    @years = years
    valid_argument
  end

  def valid_argument
    unless @total_investment.between?(500, 100_000_00)
      raise ArgumentError, 'Total Investment 500 to 10000000 and only integer'
    end
    raise ArgumentError, 'Total Investment 500 to 10000000 and only integer' if @total_investment.instance_of?(Float)
    raise ArgumentError, 'Rate only 1 to 50  or decimal' unless @rate.between?(1, 50)
    raise ArgumentError, 'Years only 1 to 40  only integer' unless @years.between?(1, 40)
    raise ArgumentError, 'Years only 1 to 40  only integer' if @years.instance_of?(Float)
  end

  def calculate_mf
    total_return = (@total_investment * (1 + @rate.to_f / 100)**@years).round
    { investment_amount: @total_investment, est_return: total_return - @total_investment, total_return: total_return }
  end
end
begin
  puts '----------------------------------------------------------------'
  print "\nEnter Total Investment :"
  total_investment = gets.chomp.to_i
  print "\nEnter Rate :"
  rate = gets.chomp.to_f
  print "\nEnter Years :"
  years = gets.chomp.to_i
  mf = Mf.new(total_investment, rate, years)
  val_hash = mf.calculate_mf
  puts '----------------------------------------------------------------'
  puts '-------------------MF Return------------------------------------'
  puts "Invested Amount : #{total_investment} "
  puts "Est Return : #{val_hash[:est_return]} "
  puts "Total Value : #{val_hash[:total_return]} "
  puts ''
  puts '----------------------------------------------------------------'
rescue ArgumentError => e
  puts "ERROR:#{e.message}"
end


