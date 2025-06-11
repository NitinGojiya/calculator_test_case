# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'fd'

# fd calculator test cases
class FdTest < Minitest::Test
  def test_total_investment_low
    assert_raises(ArgumentError, 'Total Investment is Between 5000 to 10000000') { Fd.new(500, 12, 1) }
  end

  def test_total_investment_high
    assert_raises(ArgumentError, 'Total Investment is Between 5000 to 10000000') { Fd.new(500_000_00, 12, 1) }
  end

  def test_total_investment_not_allow_decimal
    assert_raises(ArgumentError, 'Total Investment is only integer') { Fd.new(224_00.04, 12, 1) }
  end

  def test_which_time_period_low
    assert_raises(ArgumentError, 'Which time period 1 for days 2 for months 3 for years not proper') { Fd.new(224_00, 12, 1, -1) }
  end

  def test_which_time_period_high
    assert_raises(ArgumentError, 'Which time period 1 for days 2 for months 3 for years not proper') { Fd.new(224_00, 12, 1, 4) }
  end

  def test_rate_low
    assert_raises(ArgumentError, 'Rate 1 to 15') { Fd.new(5000, 0, 1) }
  end

  def test_rate_high
    assert_raises(ArgumentError, 'Rate 1 to 15') { Fd.new(5000, 24, 1) }
  end

  def test_period_type_days_limit_low
    assert_raises(ArgumentError, 'Days 1 to 31') { Fd.new(5000, 4, 0, 1) }
  end

  def test_period_type_days_limit_high
    assert_raises(ArgumentError, 'Days 1 to 31') { Fd.new(5000, 2, 32, 1) }
  end

  def test_period_type_months_limit_low
    assert_raises(ArgumentError, 'Months 1 to 11') { Fd.new(5000, 5, -1, 2) }
  end

  def test_period_type_months_limit_high
    assert_raises(ArgumentError, 'Months 1 to 11') { Fd.new(5000, 5, 12, 2) }
  end

  def test_period_type_year_limit_low
    assert_raises(ArgumentError, 'Years 1 to 25') { Fd.new(5000, 7, -12, 3) }
  end

  def test_period_type_year_limit_high
    assert_raises(ArgumentError, 'Years 1 to 25') { Fd.new(5000, 7, 28, 3) }
  end

  # Fd.new(total_investment, rate, time_period, which_time_period)
  # which_time_period = 1 for days 2 for months 3 for years
  # yearly calculate
  def test_total_cal_yearly_fd_one
    fd = Fd.new(555_55, 10.5, 5, 3)
    expected = { total_value: 932_80, est_return: 377_25, investment_amount: 555_55 }
    assert_equal expected, fd.cal_fd
  end

  def test_total_cal_yearly_fd_two
    fd = Fd.new(216_500_0, 7.5, 18, 3)
    expected = { total_value: 824_758_2, est_return: 608_258_2, investment_amount: 216_500_0 }
    assert_equal expected, fd.cal_fd
  end

  def test_total_cal_yearly_fd_three
    fd = Fd.new(100_000_00, 15, 25, 3)
    expected = { total_value: 397_018_312, est_return: 387_018_312, investment_amount: 100_000_00 }
    assert_equal expected, fd.cal_fd
  end

  # monthly calculate
  def test_total_cal_monthly_fd_one
    fd = Fd.new(555_55, 10.5, 5, 2)
    expected = { total_value: 580_07, est_return: 2452, investment_amount: 555_55 }
    assert_equal expected, fd.cal_fd
  end

  def test_total_cal_monthly_fd_two
    fd = Fd.new(216_500_0, 7.5, 11, 2)
    expected = { total_value: 231_760_4, est_return: 152_604, investment_amount: 216_500_0 }
    assert_equal expected, fd.cal_fd
  end

  def test_total_cal_monthly_fd_three
    fd = Fd.new(100_000_00, 15, 5, 2)
    expected = { total_value: 106_327_80, est_return: 632_780, investment_amount: 100_000_00 }
    assert_equal expected, fd.cal_fd
  end

  # Days calculate
  def test_total_cal_days_fd_one
    fd = Fd.new(555_55, 10.5, 30, 1)
    expected = { total_value: 560_30, est_return: 475, investment_amount: 555_55 }
    assert_equal expected, fd.cal_fd
  end

  def test_total_cal_days_fd_two
    fd = Fd.new(216_500_0, 7.5, 11, 1)
    expected = { total_value: 216_985_4, est_return: 4854, investment_amount: 216_500_0}
    assert_equal expected, fd.cal_fd
  end

  def test_total_cal_days_fd_three
    fd = Fd.new(100_000_00, 15, 5, 1)
    expected = { total_value: 100_201_92, est_return: 201_92, investment_amount: 100_000_00 }
    assert_equal expected, fd.cal_fd
  end
end
