# frozen_string_literal: true

# Compound Interest calculate class
class CompoundInterest
  FREQUENCY = [1, 2, 3].freeze
  def initialize(p_amount, rate, years, com_frequency = 1)
    @p_amount = p_amount
    @rate = rate
    @years = years
    @com_frequency = com_frequency
  end

  def ci_cal
    raise ArgumentError, 'principal amount range is 1000 to 10000000' unless @p_amount.between?(100_0, 100_000_00)
    raise ArgumentError, 'rate range is 1 to 50' unless @rate.between?(1, 50)
    raise ArgumentError, 'year range is 1 to 30 not in decimal' unless @years.between?(1, 30)
    raise ArgumentError, 'year range is 1 to 30 not in decimal' unless @years.integer?
    raise ArgumentError, 'compound frequency not proper' unless FREQUENCY.include?(@com_frequency)

    rate = @rate / 100.0
    tot_interest = (@p_amount * (1 + rate / @com_frequency)**(@com_frequency * @years)).round
    {
      principal_amount: @p_amount,
      tot_interest: tot_interest - @p_amount,
      tot_amount: tot_interest
    }
  end
end

begin
  print "\n Enter Principal Amount :"
  p_amount = gets.chomp.to_i
  print "\n Enter Rate of Interest :"
  rate = gets.chomp.to_f
  print "\n Enter Time Period :"
  years = gets.chomp.to_i
  print "\n select Compound Feaquency Yearly:1 Half Yealy:2 Quarterly:3 :"
  feaquency = gets.chomp.to_i
  ci = CompoundInterest.new(p_amount, rate, years, feaquency)
  va_hash = ci.ci_cal
  puts '--------------------------------------------------------------'
  puts "Principal Amount: #{va_hash[:principal_amount]}"
  puts "Total Interest: #{va_hash[:tot_interest]}"
  puts "Total Amount: #{va_hash[:tot_amount]}"
  puts '--------------------------------------------------------------'
rescue StandardError => e
  puts "ERORRS:- #{e}"
end
