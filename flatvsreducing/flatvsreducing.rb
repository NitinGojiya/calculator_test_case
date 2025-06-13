# frozen_string_literal: true

# calclulater of Flat VS Reducing Rate loan
class FlatVsReducing
  def initialize(loan_amount, rate, loan_tenure)
    @loan_amount = loan_amount
    @rate = rate
    @loan_tenure = loan_tenure
    valid_argument
  end

  def valid_argument
    unless @loan_amount.between?(1000, 100_000_00)
      raise ArgumentError, 'Loan amount should be 1000 to 10000000 only integer'
    end
    raise ArgumentError, 'Rate should be 1 to 50' unless @rate.between?(1, 50)
    raise ArgumentError, 'Years should be 1 to 50 not decimal' unless @loan_tenure.between?(1, 50)
    raise ArgumentError, 'Years should be 1 to 50 not decimal' if @loan_tenure.instance_of?(Float)
    raise ArgumentError, 'Loan amount should be 1000 to 10000000 only integer' if @loan_amount.instance_of?(Float)
  end

  def cal_flat
    months = @loan_tenure * 12
    total_interest = @loan_amount * @rate * @loan_tenure / 100.0
    total_payment = @loan_amount + total_interest
    monthly_emi = total_payment / months
    { monthly_emi: monthly_emi.round, total_interest: total_interest.round, total_amount: total_payment.round }
  end

  def cal_reducing
    monthly_rate = (@rate / 100.0) / 12.0
    months = @loan_tenure * 12

    emi = @loan_amount * monthly_rate * ((1 + monthly_rate)**months) / (((1 + monthly_rate)**months) - 1)
    total_payment = emi * months
    total_interest = total_payment - @loan_amount

    { monthly_emi: emi.round, total_interest: total_interest.round, total_amount: total_payment.round }
  end

  def cal_diff
    cal_flat[:total_amount] - cal_reducing[:total_amount]
  end
end
begin
  puts '------------------------------------------------------------------'
  print "\nEnter Loan Amount :"
  loan_amount = gets.chomp.to_i
  print "\nEnter Rate :"
  rate = gets.chomp.to_i
  print "\nEnter Tenure(Years) :"
  loan_tenure = gets.chomp.to_i
  flatvsreducing = FlatVsReducing.new(loan_amount, rate, loan_tenure)
  flate_rate = flatvsreducing.cal_flat
  reducing_rate = flatvsreducing.cal_reducing
  puts '------------------------------------------------------------------'
  puts '--------------Flat vs Reducing Rate Calculator--------------------'
  puts '=================================================================='
  puts '------------------------Flat Rate---------------------------------'
  puts "Monthly Emi : #{flate_rate[:monthly_emi]}"
  puts "Total Interest : #{flate_rate[:total_interest]}"
  puts "Total Amount : #{flate_rate[:total_amount]}"
  puts '------------------------Reducing Rate-----------------------------'
  puts "Monthly Emi : #{reducing_rate[:monthly_emi]}"
  puts "Total Interest : #{reducing_rate[:total_interest]}"
  puts "Total Amount : #{reducing_rate[:total_amount]}"
  puts '------------------------You Save----------------------------------'
  puts "Different  : #{flatvsreducing.cal_diff}"
  puts '------------------------------------------------------------------'
rescue ArgumentError => e
  puts "ERROR:#{e.message}"
end

