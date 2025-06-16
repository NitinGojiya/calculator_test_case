# frozen_string_literal:true

require 'minitest/autorun'
require_relative 'inflation'
# Inflation Calculator Test Cases
class InflationTest < Minitest::Test
  def test_current_cost_limit_low
    assert_raises(ArgumentError, 'current cost between 1000 to 10000000') { Inflation.new(500, 5, 5) }
  end

  def test_current_cost_limit_high
    assert_raises(ArgumentError, 'current cost between 1000 to 10000000') { Inflation.new(500_000_00, 5, 5) }
  end

  def test_rate_of_inflation_limit_low
    assert_raises(ArgumentError, 'rate of inflation between 1 to 50') { Inflation.new(2000, 0, 5) }
  end

  def test_rate_of_inflation_limit_high
    assert_raises(ArgumentError, 'rate of inflation between 1 to 50') { Inflation.new(2000, 70, 5) }
  end

  def test_time_period_limit_low
    assert_raises(ArgumentError, 'time period between 1 to 30') { Inflation.new(2000, 6, 0) }
  end

  def test_time_period_limit_high
    assert_raises(ArgumentError, 'time period between 1 to 30') { Inflation.new(2000, 7, 50) }
  end

  def test_cal_inflation_one
    inflation = Inflation.new(100_000_00, 32.6, 1)
    expected = { current_cost: 100_000_00, cost_increase: 326_000_0.00, future_cost: 132_600_00.00 }
    assert_equal expected, inflation.calculate_future_cost
  end

  def test_cal_inflation_two
    inflation = Inflation.new(313_600_0, 8.6, 13)
    expected = { current_cost: 313_600_0, cost_increase: 602_966_0.83, future_cost: 916_566_0.83 }
    assert_equal expected, inflation.calculate_future_cost
  end

  def test_cal_inflation_three
    inflation = Inflation.new(1000, 1, 1)
    expected = { current_cost: 1000.00, cost_increase: 10.00, future_cost: 1010.00 }
    assert_equal expected, inflation.calculate_future_cost
  end
end