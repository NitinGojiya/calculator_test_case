class Gratuity
  def initialize(month_salary, year_working)
    @month_salary = month_salary
    @year_working = year_working
  end

  def valid_argument
    raise ArgumentError, 'salary must be between 10000 to 1000000000' unless @month_salary.between?(100_00, 100_000_000_0)
    raise ArgumentError, 'year must 5 >= and <= 50' unless @year_working.between?(5, 50)
  end

  def tota_pay
    @month_salary * @year_working * 15 / 26
  end
end

