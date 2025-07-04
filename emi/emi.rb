class Emi
  def initialize(p_amount = 0, rate = 0, year = 0)
    @p_amount = p_amount
    @rate = rate
    @year = year
  end

  def emi_cal
    raise ArgumentError, 'amount range is 100000 to 100000000' unless @p_amount.between?(100_000, 100_000_000)
    raise ArgumentError, 'Rate range is 1 to 30' unless @rate.between?(1, 30)
    raise ArgumentError, 'Year range is 1 to 40' unless @year.between?(1, 40)
    raise ArgumentError, 'Year range is 1 to 40' if @year.instance_of?(Float)

    p_amount = @p_amount
    rate_p_month = @rate / 12.0 / 100.0
    months = @year * 12
    emi = (p_amount * rate_p_month * (1 + rate_p_month)**months) / ((1 + rate_p_month)**months - 1)
    emi.round
  end

  def tot_loan_amount
    emi_cal * (@year * 12)
  end

  def tot_interest
    tot_loan_amount - @p_amount
  end
end

begin
  puts 'Enter emi loan principal amount'
  p_amount = gets.chomp.to_i
  puts 'Enter emi loan Rate'
  rate = gets.chomp.to_f
  puts 'Enter emi loan Year'
  year = gets.chomp.to_i
  emi = Emi.new(p_amount, rate, year)
  puts '-------------------------------------------------'
  puts '---------------Emi Calculator--------------------'
  puts '-------------------------------------------------'
  puts "Your Monthly Emi is :-#{emi.emi_cal}"
  puts "Total Loan  :-#{emi.tot_loan_amount}"
  puts "Total Interest  :-#{emi.tot_interest}"
  puts "Principal Amount  :-#{p_amount}"
  puts '-------------------------------------------------'
rescue ArgumentError => e
  puts "Erorr:- #{e}"
end

