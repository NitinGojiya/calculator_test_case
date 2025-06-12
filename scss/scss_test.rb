# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'scss'
# Senior Citizen Savings Scheme (SCSS) Calculator
class ScssTest < Minitest::Test
  def test_yearly_investment_limit_low
    assert_raises(ArgumentError, 'Yearly Investment is only 500 to 300000') { Scss.new(200) }
  end

  def test_yearly_investment_limit_high
    assert_raises(ArgumentError, 'Yearly Investment is only 500 to 300000') { Scss.new(300_000_0) }
  end

  def test_tenure_static
    assert_equal 5, Scss::TENURE
  end

  def test_rate_static
    assert_equal 8.2, Scss::RATE
  end

  def test_scss_calculate_one
    scss = Scss.new(300_000)
    expected = {
      principal_amount: 300_000,
      quarterly_interest_payment: 6150,
      total_interest_earned: 123_000,
      total_maturity_amount: 423_000
    }
    assert_equal expected, scss.scss_calculate
  end

  def test_scss_calculate_two
    scss = Scss.new(186_500)
    expected = {
      principal_amount: 186_500,
      quarterly_interest_payment: 3823,
      total_interest_earned: 764_65,
      total_maturity_amount: 262_965
    }
    assert_equal expected, scss.scss_calculate
  end

  def test_scss_calculate_three
    scss = Scss.new(545_00)
    expected = {
      principal_amount: 545_00,
      quarterly_interest_payment: 1117,
      total_interest_earned: 223_45,
      total_maturity_amount: 768_45
    }
    assert_equal expected, scss.scss_calculate
  end

  def test_scss_calculate_four
    scss = Scss.new(555_5)
    expected = {
      principal_amount: 555_5,
      quarterly_interest_payment: 114,
      total_interest_earned: 2278,
      total_maturity_amount: 7833
    }
    assert_equal expected, scss.scss_calculate
  end

  def test_scss_calculate_five
    scss = Scss.new(500)
    expected = {
      principal_amount: 500,
      quarterly_interest_payment: 10,
      total_interest_earned: 205,
      total_maturity_amount: 705
    }
    assert_equal expected, scss.scss_calculate
  end
end