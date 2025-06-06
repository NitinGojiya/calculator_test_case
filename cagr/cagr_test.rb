require 'minitest/autorun'
require_relative 'cagr'
# CAGR (Compounded Annual Growth Rate )
# Cagr.new(initial_amount,final_amount,duration)
class CagrTest < Minitest::Test
  def test_initial_invesment_limit_low
    assert_raises(ArgumentError, 'Initial invesment between 1000 to 10000000') { Cagr.new(100, 1000, 10) }
  end

  def test_initial_invesment_limit_high
    assert_raises(ArgumentError, 'Initial invesment between 1000 to 10000000') { Cagr.new(100_000_000_0, 1000, 10) }
  end

  def test_initial_invesment_negative
    assert_raises(ArgumentError, 'Initial invesment not Negative') { Cagr.new(-1000, 1000, 10) }
  end

  def test_initial_invesment_decimal
    assert_raises(ArgumentError, 'Initial invesment not decimal') { Cagr.new(4500.56, 1000, 10) }
  end

  def test_final_invesment_limit_low
    assert_raises(ArgumentError, 'Final invesment between 1000 to 10000000') { Cagr.new(1000, 100, 10) }
  end

  def test_final_invesment_limit_high
    assert_raises(ArgumentError, 'Final invesment between 1000 to 10000000') { Cagr.new(1000, 100_000_000_0, 10) }
  end

  def test_final_invesment_negative
    assert_raises(ArgumentError, 'Final invesment between 1000 to 10000000') { Cagr.new(1000, -5678, 10) }
  end

  def test_final_invesment_decimal
    assert_raises(ArgumentError, 'Final invesment not decimal') { Cagr.new(1000, 5678.0556, 10) }
  end

  def test_duration_invesment_limit_low
    assert_raises(ArgumentError, 'Duration invesment between 1 to 40') { Cagr.new(1000, 1000, 0) }
  end

  def test_duration_invesment_limit_high
    assert_raises(ArgumentError, 'Duration invesment between 1 to 40') { Cagr.new(1000, 1000, 45) }
  end

  def test_duration_invesment_negative
    assert_raises(ArgumentError, 'Duration invesment not negative') { Cagr.new(1000, 5678, -10) }
  end

  def test_duration_invesment_decimal
    assert_raises(ArgumentError, 'Duration invesment decimal') { Cagr.new(1000, 5678.0556, 10.5) }
  end

  def test_cagr_calculate_one
    cagr = Cagr.new(105_319_6, 814_079, 2)
    assert_equal -100.0, cagr.cal_cagr
  end

  def test_cagr_calculate_two
    cagr = Cagr.new(964_72, 625_724, 10)
    assert_equal 19.62, cagr.cal_cagr
  end

  def test_cagr_calculate_three
    cagr = Cagr.new(109_637_2, 374_828_1, 29)
    assert_equal 3.86, cagr.cal_cagr
  end

  def test_cagr_calculate_four
    cagr = Cagr.new(100_000_00, 100_000_00, 0.0)
    assert_equal 3.86, cagr.cal_cagr
  end

  def test_cagr_calculate_five
    cagr = Cagr.new(555_55, 555_555, 5)
    assert_equal 58.49, cagr.cal_cagr
  end
end