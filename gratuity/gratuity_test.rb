require 'minitest/autorun'
require_relative 'gratuity'

class GratuityTest < Minitest::Test
  def test_monthly_salary_limit_low
    gratuity = Gratuity.new(1000, 5)
    assert_raises(ArgumentError, 'salary must be between 10000 to 1000000000') { gratuity.valid_argument }
  end

  def test_monthly_salary_limit_high
    gratuity = Gratuity.new(100_000_000_000, 5)
    assert_raises(ArgumentError, 'salary must be between 10000 to 1000000000') { gratuity.valid_argument }
  end

  def test_year_limit_low
    gratuity = Gratuity.new(100_00, 4)
    assert_raises(ArgumentError, 'year must 5 >= and <= 50') { gratuity.valid_argument }
  end

  def test_year_limit_high
    gratuity = Gratuity.new(100_00, 55)
    assert_raises(ArgumentError, 'year must 5 >= and <= 50') { gratuity.valid_argument }
  end

  def test_total_gratuity_payable_one
    gratuity = Gratuity.new(100_000_000_0, 50)
    assert_equal 288_461_538_5, gratuity.tota_pay
  end

  def test_total_gratuity_payable_two
    gratuity = Gratuity.new(350_00, 23)
    assert_equal 464_423, gratuity.tota_pay
  end

  def test_total_gratuity_payable_three
    gratuity = Gratuity.new(555_55, 15)
    assert_equal 480_764, gratuity.tota_pay
  end

  def test_total_gratuity_payable_four
    gratuity = Gratuity.new(660_50, 26)
    assert_equal 990_750, gratuity.tota_pay
  end

  def test_total_gratuity_payable_five
    gratuity = Gratuity.new(834_100_00, 33)
    assert_equal 158_799_807_7, gratuity.tota_pay
  end

  def test_year_floating
    gratuity = Gratuity.new(100_00, 11.5)
    assert_raises(ArgumentError, 'year not in decimal') { gratuity.valid_argument }
  end
end