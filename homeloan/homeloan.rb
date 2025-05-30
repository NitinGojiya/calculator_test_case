class HomeLoan
  def initialize(p_amount, rate, years)
    @p_amount = p_amount
    @rate = rate
    @years = years
  end

  def loan_cal
    raise ArgumentError, 'value not in negative or range is 100000 to 100000000' unless @p_amount.between?(100_000, 100_000_000)
    raise ArgumentError, 'value not in negative or range is 1 to 30' unless @rate.between?(1, 30)
    raise ArgumentError, 'value not in negative or range is 1 to 30' unless @years.between?(1, 30)
    raise ArgumentError, 'year not in decimal' if @year.instance_of?(Float)

    m_rate = (@rate / 100.0) / 12
    @months = @years * 12
    formula1 = @p_amount * m_rate * (1 + m_rate)**@months
    formula2 = ((1 + m_rate)**@months) - 1
    emi = formula1 / formula2
    emi.round
  end

  def cal_tot_loan
    (loan_cal * @months)
  end
end

# print 'Enter the principal loan amount : '
# p_amount = gets.chomp.to_f

# print 'Enter the annual interest rate : '
# rate = gets.chomp.to_f

# print 'Enter the loan tenure in years : '
# years = gets.chomp.to_i

# loan = HomeLoan.new(p_amount, rate, years)
# puts "\n-------------------------------------"
# puts 'Loan Details:'
# puts "Principal Amount: #{p_amount}"
# puts "Annual Interest Rate: #{rate}"
# puts "Loan Tenure: #{years} years"
# puts '-------------------------------------'
# puts "Your estimated Monthly EMI: ₹#{loan.loan_cal}"
# puts '-------------------------------------'
# puts '-------------------------------------'
# puts "Your Total Loan Amount: ₹#{loan.loan_cal}"
# puts '-------------------------------------'
#  P * r * (1 + r)^n / ((1 + r)^n - 1)