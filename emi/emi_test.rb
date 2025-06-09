require 'minitest/autorun'
require_relative 'emi'

class EmiTest < Minitest::Test
  def test_emi_loan_amount_limit
    @emi = Emi.new(1000, 10, 4)
    assert_raises(ArgumentError, 'amount range is 100000 to 100000000') { @emi.emi_cal }
  end

  def test_emi_rate
    @emi = Emi.new(100_000, 0.5, 4)
    assert_raises(ArgumentError, 'Rate range is 1 to 30') { @emi.emi_cal }
  end

  def test_emi_year_four_one
    @emi = Emi.new(100_000, 0.5, 41)
    assert_raises(ArgumentError, 'Year range is 1 to 40') { @emi.emi_cal }
  end

  def test_emi_year_zero
    @emi = Emi.new(100_000, 5, 0)
    assert_raises(ArgumentError, 'Year range is 1 to 40') { @emi.emi_cal }
  end

  def test_emi_loan_result_one
    @emi = Emi.new(200_000_0, 8.4, 20)
    assert_equal 172_30, @emi.emi_cal
  end

  def test_emi_loan_result_two
    @emi = Emi.new(100_000_000, 8.4, 20)
    assert_equal 861_504, @emi.emi_cal
  end

  def test_emi_loan_result_three
    @emi = Emi.new(100_000_000, 30, 20)
    assert_equal 250_668_9, @emi.emi_cal
  end

  def test_emi_loan_result_four
    @emi = Emi.new(100_000, 1, 1)
    assert_equal 8379, @emi.emi_cal
  end
end
