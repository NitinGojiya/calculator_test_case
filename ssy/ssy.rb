# ssy (Sukanya Samriddhi Yojana)
class Ssy
  RATE = 8.2
  def initialize(yearly_investment, girl_age, start_year)
    @yearly_investment = yearly_investment
    @girl_age = girl_age
    @start_year = start_year
  end

  def valid_argument
    raise ArgumentError, 'Yearly Investment between 250 to 150000' unless @yearly_investment.between?(250, 150_000)
    raise ArgumentError, 'Girl Age between 1 to 10' unless @girl_age.between?(1, 10)
    raise ArgumentError, 'Start Year between 2018 to 2030' unless @start_year.between?(2018, 2030)
    raise ArgumentError, 'age not in proper format' if @girl_age.instance_of?(Float)
    raise ArgumentError, 'year not in proper format' if @start_year.instance_of?(Float)
  end

  def cal_maturity
    valid_argument
    total = 0.0
    0.upto(14) do |i|
      years = 21 - i
      total += @yearly_investment * ((1 + RATE / 100.0) ** years)
    end
    total_investment = @yearly_investment * 15
    interest = total - total_investment
    maturity_year = @start_year + 21
    # create hash
    {
      total_in: total_investment.round,
      interest: interest.round,
      maturity_year: maturity_year,
      maturity_value: total.round
    }
  end
end

print "\n Enter Yearly Investment :-"
yearly_investment = gets.to_i
print "\n Enter Girl Age :-"
girl_age = gets.to_i
date = Time.now
ssy = Ssy.new(yearly_investment, girl_age, date.year)
maturity = ssy.cal_maturity
puts '--------------------------------------------------------------------------------------'
maturity.each do |key, value|
  puts "#{key.to_s}:#{value.to_s}"
end
puts '--------------------------------------------------------------------------------------'