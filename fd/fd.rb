# frozen_string_literal: true

# fd calcolator
class Fd
  def initialize(total_investment, rate, time_period, which_time_period = 3)
    @total_investment = total_investment
    @rate = rate
    @time_period = time_period
    @which_time_period = which_time_period
    valid_argument
  end

  def valid_argument
    raise ArgumentError, 'Total Investment is Between 5000 to 10000000' unless @total_investment.between?(5000, 100_000_00)
    raise ArgumentError, 'Rate 1 to 15' unless @rate.between?(1, 15)
    raise ArgumentError, 'Total Investment is only integer' if @total_investment.instance_of?(Float)

    case @which_time_period
    when 1
      raise ArgumentError, 'Days 1 to 31' unless @time_period.between?(1, 31)
    when 2
      raise ArgumentError, 'Months 1 to 11' unless @time_period.between?(1, 11)
    when 3
      raise ArgumentError, 'Years 1 to 25' unless @time_period.between?(1, 25)
    else
      raise ArgumentError, 'Which time period 1 for days 2 for months 3 for years not proper'
    end
  end

  def cal_fd
    case @which_time_period
    when 1
      total_return = (@total_investment * ((1 + @rate / 400.0)**(4 * (@time_period.to_f / 365)))).round
      { total_value: total_return, est_return: total_return - @total_investment, investment_amount: @total_investment }
    when 2
      total_return = (@total_investment * ((1 + @rate / 400.0)**(@time_period.to_f / 3))).round
      { total_value: total_return, est_return: total_return - @total_investment, investment_amount: @total_investment }
    when 3
      total_return = (@total_investment * ((1 + @rate / 400.0)**(4 * @time_period))).round
      { total_value: total_return, est_return: total_return - @total_investment, investment_amount: @total_investment }
    else
      raise ArgumentError, 'Which time period 1 for days 2 for months 3 for years not proper'
    end
  end
end


begin
  puts '----------------------------------------------------------------'
  print "\nEnter Total Investment :"
  total_investment = gets.chomp.to_i
  print "\nEnter Rate :"
  rate = gets.chomp.to_f
  print "\nEnter Which Type Tenure 1 for days 2 for months 3 for years :"
  which_time_period = gets.chomp.to_i
  print "\nEnter Tenure :"
  time_period = gets.chomp.to_i
  fd = Fd.new(total_investment, rate, time_period, which_time_period)
  val_hash = fd.cal_fd
  puts '----------------------------------------------------------------'
  puts '-------------------Fd Return------------------------------------'
  puts "Invested Amount : #{total_investment} "
  puts "Est Return : #{val_hash[:est_return]} "
  puts "Total Value : #{val_hash[:total_value]} "
  print "Time Period : #{time_period} "
  print 'Days' if which_time_period == 1
  print 'Months' if which_time_period == 2
  print 'Years' if which_time_period == 3
  puts ''
  puts '----------------------------------------------------------------'
rescue ArgumentError => e
  puts "ERROR:#{e.message}"
end


