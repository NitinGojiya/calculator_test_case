require "minitest/autorun"
require_relative "swp"

class SwpTest < Minitest::Test
  def test_instance
    @swp = Swp.new
  end

  def test_swp_argument_check_investment
    assert_raises(ArgumentError, 'total investment between 10000 to 10000000') { @swp.swp_cal }
  end

  def test_swp_argument_check_withdraw_per_month
    assert_raises(ArgumentError, 'total investment between 500 to 1000000') { @swp.swp_cal }
  end

  def test_swp_argument_check_rate
    assert_raises(ArgumentError, 'total investment between 1 to 30') { @swp.swp_cal }
  end

  def test_swp_argument_check_year
    assert_raises(ArgumentError, 'total investment between 1 to 30') { @swp.swp_cal }
  end

  def test_swp_argument_check_year
    assert_raises(ArgumentError, 'year is not in  floating') { @swp.swp_cal }
  end

  def test_swp_argument_check_year
    assert_raises(ArgumentError, 'year is not in  floating') { @swp.swp_cal }
  end

end


# The formula for a Systematic Withdrawal Plan (SWP) calculator is:
#  A = PMT * ((1 + r/n)^(nt) - 1) / (r/n), where:
# A: is the estimated final investment value.
# PMT: is the withdrawal amount per period (e.g., monthly).
# r: is the annual rate of return.
# n: is the compounding frequency per year (e.g., 12 for monthly).
# t: is the investment duration in years.

1000 * ((1 + 0.12/1)**(1*1) - 1) / (0.12/1)


# A = PMT ((1+r/n)^nt-1)/(r/n))

# Where:
# 'A' is the final value of your investment
# 'PMT' is the withdrawal amount per period
# 'n' is compounding frequency
# 't' is the investment duration

# Consider this example:
# Initial Investment amount: Rs. 10,00,000
# SWP tenure: 5 years • Desired monthly withdrawal: Rs. 20,000
# Expected Rate of Return: 12%

20000 * ((1+0.12/12)**(12*5-1))/(0.12/12)