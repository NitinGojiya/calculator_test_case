# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'mf'

# Mutual Fund Returns Calculator Test Cases
class MfTest < Minitest::Test
  def test_total_investment_limit_low
    assert_raises(ArgumentError, 'Total Investment 500 to 10000000 and only integer') { Mf.new(40, 1, 5) }
  end

  def test_total_investment_limit_high
    assert_raises(ArgumentError, 'Total Investment 500 to 10000000 and only integer') { Mf.new(100_000_00_0, 1, 5) }
  end

  def test_total_investment_only_integer
    assert_raises(ArgumentError, 'Total Investment 500 to 10000000 and only integer') { Mf.new(100_00.34, 1, 5) }
  end

  def test_rate_limit_low
    assert_raises(ArgumentError, 'Rate only 1 to 50  or decimal') { Mf.new(100_000, 0, 5) }
  end

  def test_rate_limit_high
    assert_raises(ArgumentError, 'Rate only 1 to 50  or decimal') { Mf.new(100_000, 55, 5) }
  end

  def test_years_limit_low
    assert_raises(ArgumentError, 'Years only 1 to 40  only integer') { Mf.new(100_000, 4, 0) }
  end

  def test_years_limit_high
    assert_raises(ArgumentError, 'Years only 1 to 40  only integer') { Mf.new(100_000, 5, 45) }
  end

  def test_years_only_integer
    assert_raises(ArgumentError, 'Years only 1 to 40  only integer') { Mf.new(100_000, 5, 4.5) }
  end

  def test_mf_cal_return_one
    mf = Mf.new(100_000_00, 1, 40)
    expected = { investment_amount: 100_000_00, est_return: 488_863_7, total_return: 148_886_37 }
    assert_equal expected, mf.calculate_mf
  end

  def test_mf_cal_return_two
    mf = Mf.new(429_950_0, 20.5, 17)
    expected = { investment_amount: 429_950_0, est_return: 980_764_04, total_return: 102_375_904 }
    assert_equal expected, mf.calculate_mf
  end

  def test_mf_cal_return_three
    mf = Mf.new(555, 5.5, 15)
    expected = { investment_amount: 555, est_return: 684, total_return: 1239 }
    assert_equal expected, mf.calculate_mf
  end
end