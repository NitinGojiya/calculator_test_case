# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'postmis'

# Post Office Monthly Income Scheme Test Cases
class PostMisTest < Minitest::Test
  def test_investment_amount_limit_low
    assert_raises(ArgumentError, 'Investment Amount 1000 to 1500000') { PostMis.new(100, 6) }
  end

  def test_investment_amount_limit_high
    assert_raises(ArgumentError, 'Investment Amount 1000 to 1500000') { PostMis.new(250_0000, 6) }
  end

  def test_rate_limit_low
    assert_raises(ArgumentError, 'Rate 1 to 12') { PostMis.new(1000, 0) }
  end

  def test_rate_limit_high
    assert_raises(ArgumentError, 'Rate 1 to 12') { PostMis.new(1000, 15) }
  end

  def test_investment_amount_decimal_not_valid
    assert_raises(ArgumentError, 'Investment Amount Not in Decimal') { PostMis.new(1564.4, 6) }
  end

  def test_monthly_income_one
    postmis = PostMis.new(150_000_0, 12)
    assert_equal 150_00, postmis.monthly_income
  end

  def test_monthly_income_two
    postmis = PostMis.new(122_700_0, 8.1)
    assert_equal 8282, postmis.monthly_income
  end

  def test_monthly_income_three
    postmis = PostMis.new(555_55, 5.5)
    assert_equal 255, postmis.monthly_income
  end

  def test_monthly_income_four
    postmis = PostMis.new(493_500, 7.1)
    assert_equal 2920, postmis.monthly_income
  end

  def test_monthly_income_five
    postmis = PostMis.new(115_500_0, 10.4)
    assert_equal 100_10, postmis.monthly_income
  end
end

