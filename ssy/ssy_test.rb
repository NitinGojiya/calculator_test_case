require 'minitest/autorun'
require_relative 'ssy'
# ssy (Sukanya Samriddhi Yojana)
class SsyTest < Minitest::Test
  def test_yearly_investment_limit_if_low
    ssy = Ssy.new(150, 3, 2019)
    assert_raises(ArgumentError, 'Yearly Investment between 250 to 150000') { ssy.valid_argument }
  end

  def test_yearly_investment_limit_if_high
    ssy = Ssy.new(150_000_0, 3, 2019)
    assert_raises(ArgumentError, 'Yearly Investment between 250 to 150000') { ssy.valid_argument }
  end

  def test_rate_static_check
    assert 8.2, Sst::RATE
  end

  def test_girl_age_limit_if_low
    ssy = Ssy.new(250, 0, 2019)
    assert_raises(ArgumentError, 'Girl Age between 1 to 10') { ssy.valid_argument }
  end

  def test_girl_age_limit_if_high
    ssy = Ssy.new(500, 12, 2019)
    assert_raises(ArgumentError, 'Girl Age between 1 to 10') { ssy.valid_argument }
  end

  def test_start_year_limit_if_low
    ssy = Ssy.new(500, 7, 2017)
    assert_raises(ArgumentError, 'Start Year between 2018 to 2030') { ssy.valid_argument }
  end

  def test_start_year_limit_if_high
    ssy = Ssy.new(500, 4, 2035)
    assert_raises(ArgumentError, 'Start Year between 2018 to 2030') { ssy.valid_argument }
  end

  def test_start_year_only_four_digit_not_in_decimal
    ssy = Ssy.new(500, 1, 2022.2)
    assert_raises(ArgumentError, 'year not in proper format') { ssy.valid_argument }
  end

  def test_girl_age_not_in_decimal
    ssy = Ssy.new(500, 4.5, 2021)
    assert_raises(ArgumentError, 'age not in proper format') { ssy.valid_argument }
  end

  def test_total_maturity_and_interest_return_one
    ssy = Ssy.new(250, 3, 2029)
    expected = {
      total_in: 3750,
      interest: 7796,
      maturity_year: 2040,
      maturity_value: 115_46
    }
    assert expected, ssy.cal_maturity
  end

  def test_total_maturity_and_interest_return_two
    ssy = Ssy.new(330_00, 6, 2025)
    expected = {
      total_in: 495_000,
      interest: 102_906_7,
      maturity_year: 2046,
      maturity_value: 152_406_7
    }
    assert expected, ssy.cal_maturity
  end

  def test_total_maturity_and_interest_return_three
    ssy = Ssy.new(427_50, 10, 2018)
    expected = {
      total_in: 641_250,
      interest: 133_311_0,
      maturity_year: 2039,
      maturity_value: 197_436_0
    }
    assert expected, ssy.cal_maturity
  end

  def test_total_maturity_and_interest_return_four
    ssy = Ssy.new(150_000, 1, 2029)
    expected = {
      total_in: 225_000_0,
      interest: 467_757_8,
      maturity_year: 2050,
      maturity_value: 692_757_8
    }
    assert expected, ssy.cal_maturity
  end

  def test_total_maturity_and_interest_return_five
    ssy = Ssy.new(777_7, 7, 2027)
    expected = {
      total_in: 116_655,
      interest: 242_517,
      maturity_year: 2048,
      maturity_value: 359_172
    }
    assert expected, ssy.cal_maturity
  end
end