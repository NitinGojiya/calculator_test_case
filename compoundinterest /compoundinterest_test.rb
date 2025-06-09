# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'compoundinterest'
# test cases for compound interest
class CompoundInterestTest < Minitest::Test
  def test_principa_amount_limit_low
    ci = CompoundInterest.new(10, 10, 10)
    assert_raises(ArgumentError, 'principal amount range is 1000 to 10000000') { ci.ci_cal }
  end

  def test_principa_amount_limit_high
    ci = CompoundInterest.new(100_000_000_0, 12, 15)
    assert_raises(ArgumentError, 'principal amount range is 1000 to 10000000') { ci.ci_cal }
  end

  def test_rate_limit_low
    ci = CompoundInterest.new(100_000, 0, 15)
    assert_raises(ArgumentError, 'rate range is 1 to 50') { ci.ci_cal }
  end

  def test_rate_limit_high
    ci = CompoundInterest.new(100_000, 55, 15)
    assert_raises(ArgumentError, 'rate range is 1 to 50') { ci.ci_cal }
  end

  def test_year_limit_low
    ci = CompoundInterest.new(777_77, 12, 0)
    assert_raises(ArgumentError, 'year range is 1 to 30 not in decimal') { ci.ci_cal }
  end

  def test_year_limit_high
    ci = CompoundInterest.new(457_77, 12, 35)
    assert_raises(ArgumentError, 'year range is 1 to 30 not in decimal') { ci.ci_cal }
  end

  def test_year_limit_decimal
    ci = CompoundInterest.new(867_77, 12, 12.5)
    assert_raises(ArgumentError, 'year range is 1 to 30 not in decimal') { ci.ci_cal }
  end

  def test_compound_frequency
    assert_equal [1, 2, 3], CompoundInterest::FREQUENCY
  end

  def test_compound_frequency_not_match
    ci = CompoundInterest.new(867_77, 12, 12.5, 4)
    assert_raises(ArgumentError, 'compound frequency not proper') { ci.ci_cal }
  end
  # CompoundInterest.new(p_amount, rate, years, com_frequency)
  # compound frequency yearly for 1

  def test_ci_yealy_calculate_one
    ci = CompoundInterest.new(100_000_00, 50, 1, 1)
    expected = {
      principal_amount: 100_000_00,
      tot_interest: 500_000_0,
      tot_amount: 150_000_00
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_yealy_calculate_two
    # skip
    ci = CompoundInterest.new(100_000_00, 1, 30, 1)
    expected = {
      principal_amount: 100_000_00,
      tot_interest: 347_848_9,
      tot_amount: 134_784_89
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_yealy_calculate_three
    # skip
    ci = CompoundInterest.new(381_000, 23.7, 7, 1)
    expected = {
      principal_amount: 381_000,
      tot_interest: 130_754_6,
      tot_amount: 168_854_6
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_yealy_calculate_four
    # skip
    ci = CompoundInterest.new(1000, 7.6, 12, 1)
    expected = {
      principal_amount: 1000,
      tot_interest: 1409,
      tot_amount: 2409
    }
    assert_equal expected, ci.ci_cal
  end
  # compound frequency half yearly for 2

  def test_ci_half_yealy_calculate_one
    # skip
    ci = CompoundInterest.new(100_000_00, 50, 1, 2)
    expected = {
      principal_amount: 100_000_00,
      tot_interest: 562_500_0,
      tot_amount: 156_250_00
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_half_yealy_calculate_two
    # skip
    ci = CompoundInterest.new(100_000_00, 1, 30, 2)
    expected = {
      principal_amount: 100_000_00,
      tot_interest: 348_850_2,
      tot_amount: 134_885_02
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_half_yealy_calculate_three
    # skip
    ci = CompoundInterest.new(381_000, 23.7, 7, 2)
    expected = {
      principal_amount: 381_000,
      tot_interest: 144_638_0,
      tot_amount: 182_738_0
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_half_yealy_calculate_four
    # skip
    ci = CompoundInterest.new(1000, 7.6, 12, 2)
    expected = {
      principal_amount: 1000,
      tot_interest: 1448,
      tot_amount: 2448
    }
    assert_equal expected, ci.ci_cal
  end
  # compound frequency quarterly for 3

  def test_ci_quarterly_yealy_calculate_one
    # skip
    ci = CompoundInterest.new(100_000_00, 50, 1, 3)
    expected = {
      principal_amount: 100_000_00,
      tot_interest: 587_963_0,
      tot_amount: 158_796_30
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_quarterly_yealy_calculate_two
    # skip
    ci = CompoundInterest.new(100_000_00, 1, 30, 3)
    expected = {
      principal_amount: 100_000_00,
      tot_interest: 349_185_5,
      tot_amount: 134_918_55
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_quarterly_yealy_calculate_three
    # skip
    ci = CompoundInterest.new(381_000, 23.7, 7, 3)
    expected = {
      principal_amount: 381_000,
      tot_interest: 149_994_2,
      tot_amount: 188_094_2
    }
    assert_equal expected, ci.ci_cal
  end

  def test_ci_quarterly_yealy_calculate_four
    # skip
    ci = CompoundInterest.new(1000, 7.6, 12, 3)
    expected = {
      principal_amount: 1000,
      tot_interest: 1461,
      tot_amount: 2461
    }
    assert_equal expected, ci.ci_cal
  end
end
