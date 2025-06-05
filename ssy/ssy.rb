class Ssy
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

  end
end