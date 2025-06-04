require 'minitest/autorun'
require_relative 'rd'

class RdTest < Minitest::Test
  def test_limit_monthly_investment_low
    rd = Rd.new(10, 10, 8)
    assert_raises(ArgumentError, 'Monthly invesment is 500 to 1000000') { rd.valid_argument }
  end

  def test_limit_monthly_investment_high
    rd = Rd.new(100_000_00, 10, 7)
    assert_raises(ArgumentError, 'Monthly invesment is 500 to 1000000') { rd.valid_argument }
  end

  def test_limit_rate_low
    rd = Rd.new(100_000_0, 0, 6)
    assert_raises(ArgumentError, 'Rate limit 1 to 15') { rd.valid_argument }
  end

  def test_limit_rate_high
    rd = Rd.new(100_000_0, 17, 6)
    assert_raises(ArgumentError, 'Rate limit 1 to 15') { rd.valid_argument }
  end

  def test_limit_year_low
    rd = Rd.new(100_000, 1, 0)
    assert_raises(ArgumentError, 'Year limit 1 to 10') { rd.valid_argument }
  end

  def test_limit_year_high
    rd = Rd.new(100_005, 1, 13)
    assert_raises(ArgumentError, 'Year limit 1 to 10') { rd.valid_argument }
  end

  def test_return_one
    rd = Rd.new(100_000_0, 15, 10)
    assert_equal 155_523_568, rd.cal_est_ret
    assert_equal 275_523_568, rd.cal_est_tot
  end

  def test_return_two
    rd = Rd.new(500, 6.2, 3)
    assert_equal 181_9, rd.cal_est_ret
    assert_equal 198_19, rd.cal_est_tot
  end

  def test_return_three
    rd = Rd.new(328_000, 10.4, 6)
    assert_equal 916_911_5, rd.cal_est_ret
    assert_equal 327_851_15, rd.cal_est_tot
  end

  def test_return_four
    rd = Rd.new(130_500, 1.5, 3)
    assert_equal 110_103, rd.cal_est_ret
    assert_equal 480_810_3, rd.cal_est_tot
  end
end