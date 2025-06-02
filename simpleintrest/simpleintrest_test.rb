require 'minitest/autorun'
require_relative 'simpleintrest'

class SimpleIntrestTest < Minitest::Test
  def test_principa_amount_limit_low
    si = SimpleIntrest.new(10, 10, 10)
    assert_raises(ArgumentError, 'principal amount range is 1000 to 10000000') { si.si_cal }
  end

  def test_principa_amount_limit_high
    si = SimpleIntrest.new(100_000_000_0, 12, 15)
    assert_raises(ArgumentError, 'principal amount range is 1000 to 10000000') { si.si_cal }
  end

  def test_rate_limit_low
    si = SimpleIntrest.new(100_000, 0, 15)
    assert_raises(ArgumentError, 'rate range is 1 to 50') { si.si_cal }
  end

  def test_rate_limit_high
    si = SimpleIntrest.new(100_000, 55, 15)
    assert_raises(ArgumentError, 'rate range is 1 to 50') { si.si_cal }
  end

  def test_year_limit_low
    si = SimpleIntrest.new(777_77, 12, 0)
    assert_raises(ArgumentError, 'year range is 1 to 30 not in decimal') { si.si_cal }
  end

  def test_year_limit_high
    si = SimpleIntrest.new(457_77, 12, 35)
    assert_raises(ArgumentError, 'year range is 1 to 30 not in decimal') { si.si_cal }
  end

  def test_year_limit_decimal
    si = SimpleIntrest.new(867_77, 12, 12.5)
    assert_raises(ArgumentError, 'year range is 1 to 30 not in decimal') { si.si_cal }
  end

  def test_intrest_one
    si = SimpleIntrest.new(100_000_00, 50, 1)
    assert_equal 500_000_0, si.si_cal
  end

  def test_intrest_two
    si = SimpleIntrest.new(729_000, 23.6, 6)
    assert_equal 103_226_4, si.si_cal
  end

  def test_intrest_three
    si = SimpleIntrest.new(178_000_0, 13.2, 30)
    assert_equal 704_880_0, si.si_cal
  end

  def test_total_amount_one
    si = SimpleIntrest.new(277_800_0, 14, 10)
    assert_equal 666_720_0, si.si_cal_tot_amount
  end

  def test_total_amount_two
    si = SimpleIntrest.new(756_000, 41.5, 5)
    assert_equal 232_470_0, si.si_cal_tot_amount
  end

  def test_total_amount_three
    si = SimpleIntrest.new(777_77, 7.5, 7)
    assert_equal 120_080, si.si_cal_tot_amount
  end
end
