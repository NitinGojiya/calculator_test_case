require 'minitest/autorun'
require_relative 'homeloan'

class HomeLoanTest < Minitest::Test
  def test_value_not_in_negative_principal_amount
    loan = HomeLoan.new(-1, 12, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 100000 to 100000000') { loan.loan_cal }
  end

  def test_value_not_in_negative_rate
    loan = HomeLoan.new(100_000, -12, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 1 to 30') { loan.loan_cal }
  end

  def test_value_not_in_negative_year
    loan = HomeLoan.new(100_000, 12, -10)
    assert_raises(ArgumentError, 'value not in negative or range is 1 to 30') { loan.loan_cal }
  end

  def test_value_not_in_range_principal_amount_low
    loan = HomeLoan.new(1000, 12, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 100000 to 100000000') { loan.loan_cal }
  end

  def test_value_not_in_low_rate_zero
    loan = HomeLoan.new(100_000, 0, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 1 to 30') { loan.loan_cal }
  end

  def test_value_not_in_low_year
    loan = HomeLoan.new(100_000, 12, 0)
    assert_raises(ArgumentError, 'value not in negative or range is 1 to 30') { loan.loan_cal }
  end

  def test_value_not_in_range_principal_amount_high
    loan = HomeLoan.new(100_000_000_0, 12, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 100000 to 100000000') { loan.loan_cal }
  end

  def test_value_not_in_high_rate_four_five
    loan = HomeLoan.new(100_000, 45, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 1 to 30') { loan.loan_cal }
  end

  def test_value_not_in_zero_year
    loan = HomeLoan.new(100_000, 12, 0)
    assert_raises(ArgumentError, 'value not in negative or range is 1 to 30') { loan.loan_cal }
  end

  def test_value_not_in_decimal_year
    loan = HomeLoan.new(100_000, 12, 1.5)
    assert_raises(ArgumentError, 'year not in decimal') { loan.loan_cal }
  end

  def test_value_not_in_range_principal_amount_high_eight_nine
    loan = HomeLoan.new(888_888_888_889, 12, 10)
    assert_raises(ArgumentError, 'value not in negative or range is 100000 to 100000000') { loan.loan_cal }
  end

  def test_emi_one
    loan = HomeLoan.new(100_000, 1, 1)
    assert_equal 8379, loan.loan_cal
  end

  def test_emi_two
    loan = HomeLoan.new(136_500_00, 3.7, 14)
    assert_equal 104_225, loan.loan_cal
  end

  def test_emi_three
    loan = HomeLoan.new(136_500_00, 3.7, 30)
    assert_equal 628_29, loan.loan_cal
  end

  def test_emi_four
    loan = HomeLoan.new(136_500_00, 30, 30)
    assert_equal 341_297, loan.loan_cal
  end

  def test_emi_five
    loan = HomeLoan.new(999_999_99, 30, 30)
    assert_equal 250_034_5, loan.loan_cal
  end

  def test_emi_six
    loan = HomeLoan.new(999_999_99, 1, 30)
    assert_equal 321_640, loan.loan_cal
  end

  def test_emi_seven
    loan = HomeLoan.new(555_55, 24.3, 15)
    assert_raises(ArgumentError, 'value not in negative or range is 100000 to 100000000') { loan.loan_cal }
  end

  def test_total_amount_one
    loan = HomeLoan.new(945_000_0, 8.6, 10)
    assert_equal 141_206_99, loan.cal_tot_loan
  end

  def test_total_amount_two
    loan = HomeLoan.new(111_111_1, 11, 11)
    assert_equal 192_021_1, loan.cal_tot_loan
  end
end
# E = [1, 00, 00,000 x 12 x (1+12) ^ 15] / [)1+12) ^ 20-1]
# (10000000*12*(1+12)**15/((1+12)**20-1))