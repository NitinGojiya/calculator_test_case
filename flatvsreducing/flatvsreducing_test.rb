# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'flatvsreducing'

# calclulater of Flat VS Reducing Rate loan Test Cases
class FlatVsReducingTest < Minitest::Test
  def test_loan_amount_limit_low
    assert_raises(ArgumentError, 'Loan amount should be 1000 to 10000000 only integer') { FlatVsReducing.new(500, 11, 10) }
  end

  def test_loan_amount_limit_high
    assert_raises(ArgumentError, 'Loan amount should be 1000 to 10000000 only integer') { FlatVsReducing.new(100_000_000, 11, 10) }
  end

  def test_loan_amount_decimal
    assert_raises(ArgumentError, 'Loan amount should be 1000 to 10000000 only integer') { FlatVsReducing.new(10012.3, 11, 10) }
  end

  def test_rate_limit_low
    assert_raises(ArgumentError, 'Rate should be 1 to 50') { FlatVsReducing.new(5000, 0, 10) }
  end

  def test_rate_limit_high
    assert_raises(ArgumentError, 'Rate should be 1 to 50') { FlatVsReducing.new(100_000_0, 58, 10) }
  end

  def test_years_limit_low
    assert_raises(ArgumentError, 'Years should be 1 to 50 not decimal') { FlatVsReducing.new(5000, 14, 0) }
  end

  def test_years_limit_high
    assert_raises(ArgumentError, 'Years should be 1 to 50 not decimal') { FlatVsReducing.new(100_000_0, 8, 59) }
  end

  def test_years_decimal
    assert_raises(ArgumentError, 'Years should be 1 to 50 not decimal') { FlatVsReducing.new(100_000_0, 8, 34.5) }
  end

  def test_calculate_flate_reducing_one
    flatvsreducing = FlatVsReducing.new(1000, 10, 10)
    expected_flat = { monthly_emi: 17, total_interest: 1000, total_amount: 2000 }
    expected_reducing = { monthly_emi: 13, total_interest: 586, total_amount: 1586 }
    assert_equal expected_flat, flatvsreducing.cal_flat
    assert_equal expected_reducing, flatvsreducing.cal_reducing
    assert_equal 414, flatvsreducing.cal_diff
  end

  def test_calculate_flate_reducing_two
    flatvsreducing = FlatVsReducing.new(100_565, 12.3, 45)
    expected_flat = { monthly_emi: 1217, total_interest: 556_627, total_amount: 657_192 }
    expected_reducing = { monthly_emi: 1035, total_interest: 458_331, total_amount: 558_896 }
    assert_equal expected_flat, flatvsreducing.cal_flat
    assert_equal expected_reducing, flatvsreducing.cal_reducing
    assert_equal 982_96, flatvsreducing.cal_diff
  end

  def test_calculate_flate_reducing_three
    flatvsreducing = FlatVsReducing.new(715_700_0, 23.6, 9)
    expected_flat = { monthly_emi: 207_023, total_interest: 152_014_68, total_amount: 223_584_68 }
    expected_reducing = { monthly_emi: 160_320, total_interest: 101_575_88, total_amount: 173_145_88 }
    assert_equal expected_flat, flatvsreducing.cal_flat
    assert_equal expected_reducing, flatvsreducing.cal_reducing
    assert_equal 504_388_0, flatvsreducing.cal_diff
  end

  def test_calculate_flate_reducing_four
    flatvsreducing = FlatVsReducing.new(100_000_00, 50, 50)
    expected_flat = { monthly_emi: 433_333, total_interest: 250_000_000, total_amount: 260_000_000 }
    expected_reducing = { monthly_emi: 416_667, total_interest: 240_000_000, total_amount: 250_000_000 }
    assert_equal expected_flat, flatvsreducing.cal_flat
    assert_equal expected_reducing, flatvsreducing.cal_reducing
    assert_equal 10_000_000, flatvsreducing.cal_diff
  end
end