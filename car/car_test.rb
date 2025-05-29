require 'minitest/autorun'
require_relative 'car'

class CarTest < Minitest::Test
  def test_object_create
    @car = Car.new
  end

  def test_car_loan_amount_limit
    @car.new(1000, 10, 4)
    assert_raises(ArgumentError, 'amount range is 100000 to 100000000') { @car.car_cal }
  end

  def test_car_rate
    @car.new(100_000, 0.5, 4)
    assert_raises(ArgumentError, 'Rate range is 1 to 30') { @car.car_cal }
  end

  def test_car_year_four_one
    @car.new(100_000, 0.5, 41)
    assert_raises(ArgumentError, 'Year range is 1 to 40') { @car.car_cal }
  end

  def test_car_year_zero
    @car.new(100_000, 5, 0)
    assert_raises(ArgumentError, 'Year range is 1 to 40') { @car.car_cal }
  end

  def test_car_loan_result
    @car.new(200_000_0, 8.4, 20)
    assert_equal 167_79, @car.car_cal
  end

  def test_car_loan_result_
    @car.new(100_000_000, 8.4, 20)
    assert_equal 861_505, @car.car_cal
  end

  def test_car_loan_result_thirty_rate
    @car.new(100_000_000, 30, 20)
    assert_equal 250_668_9, @car.car_cal
  end

  def test_car_loan_result_one_one_one
    @car.new(100_000, 1, 1)
    assert_equal 8379, @car.car_cal
  end
end


# emi = (2000000 * 0.0067 * (1 + 0.0067)**240) / ((1 + 0.0067)**240 - 1)
# emi = p * r * (1+r)**months)/((1+r)**months-1)