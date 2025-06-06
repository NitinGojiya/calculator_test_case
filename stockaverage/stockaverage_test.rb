require 'minitest/autorun'
require_relative 'stockaverage'
# StockAverage.new(buy_price1, quantity1, buy_price2, quantity2)
class StockAverageTest < Minitest::Test
  def test_buy_price_one_negative
    stockaverage = StockAverage.new(-1, 12, 200, 10)
    assert_raises(ArgumentError, 'Buy Price Not Negative') { stockaverage.valid_argument }
  end

  def test_buy_price_two_negative
    stockaverage = StockAverage.new(1, 12, -200, 10)
    assert_raises(ArgumentError, 'Buy Price Not Negative') { stockaverage.valid_argument }
  end

  def test_calculate_stock_average_one
    stockaverage = StockAverage.new(100, 100, 100, 10)
    assert_equal 110, stockaverage.tot_stock
    assert_equal 110_00, stockaverage.average_amount
    assert_equal 100, stockaverage.average_price
  end

  def test_calculate_stock_average_two
    stockaverage = StockAverage.new(500.55, 55.55, 55, 10)
    assert_equal 66, stockaverage.tot_stock
    assert_equal 283_56, stockaverage.average_amount
    assert_equal 433, stockaverage.average_price
  end

  def test_calculate_stock_average_three
    stockaverage = StockAverage.new(3000, 30, 4000, 12)
    assert_equal 42, stockaverage.tot_stock
    assert_equal 138_000, stockaverage.average_amount
    assert_equal 328_6, stockaverage.average_price
  end

  def test_calculate_stock_average_four
    stockaverage = StockAverage.new(500, 1000, 600, 500)
    assert_equal 1500, stockaverage.tot_stock
    assert_equal 800_000, stockaverage.average_amount
    assert_equal 533, stockaverage.average_price
  end

  def test_calculate_stock_average_five
    stockaverage = StockAverage.new(5000, 100, 2000, 500)
    assert_equal 600, stockaverage.tot_stock
    assert_equal 150_000_0, stockaverage.average_amount
    assert_equal 250_0, stockaverage.average_price
  end
end