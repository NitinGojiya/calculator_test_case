require 'minitest/autorun'
require_relative 'sip'

class SipTest < Minitest::Test
  def test_monthly_invenstment_sip_less
    sip = Sip.new(90, 1.4, 1)
    assert_raises(ArgumentError, 'Monthly investment not less than 100 or morethan 1000000') { sip.calculate_sip }
  end

  def test_monthly_invenstment_sip_more
    sip = Sip.new(100_000_01, 1.4, 1)
    assert_raises(ArgumentError, 'Monthly investment not less than 100 or morethan 1000000') { sip.calculate_sip }
  end

  def test_monthly_rate_sip_less
    # skip
    sip = Sip.new(90, 0, 1)
    assert_raises(ArgumentError, 'rate not less than 1 or morethan 30') { sip.calculate_sip }
  end

  def test_monthly_rate_sip_more
    # skip
    sip = Sip.new(1000, 31, 1)
    assert_raises(ArgumentError, 'rate not less than 1 or morethan 30') { sip.calculate_sip }
  end

  def test_monthly_year_sip_less
    # skip
    sip = Sip.new(100, 12, 0)
    assert_raises(ArgumentError, 'year not less than 1 or morethan 40') { sip.calculate_sip }
  end

  def test_monthly_year_sip_more
    # skip
    sip = Sip.new(1000, 12, 41)
    assert_raises(ArgumentError, 'year not less than 1 or morethan 40') { sip.calculate_sip }
  end

  def test_monthly_invenstment_amount
    # skip
    sip = Sip.new(100, 1.4, 1)
    assert_equal 100, sip.p
  end

  def test_sip_calculate
    # skip
    sip = Sip.new(1000, 12, 1)
    assert_equal 128_09, sip.calculate_sip
  end

  def test_sip_calculate_five_hund_six_seven
    # skip
    sip = Sip.new(567, 11.75, 4)
    assert_equal 348_70, sip.calculate_sip
  end

  def test_sip_calculate_seven_hund_seven
    # skip
    sip = Sip.new(777, 2.22, 20)
    assert_equal 234_916, sip.calculate_sip
  end

  def test_sip_calculate_five_thousand
    # skip
    sip = Sip.new(500, 5, 2)
    assert_equal 126_45, sip.calculate_sip
  end

  def test_monthly_invenstment_lumpsum_less_more
    # skip
    sip = Sip.new(400, 1.4, 1)
    assert_raises(ArgumentError, 'Monthly investment no less than 500 or morethan 10000000') { sip.calculate_lumpsum }
  end

  def test_monthly_invenssip_tetment_lumpsum_more
    skip
    sip = Sip.new(100_000_000_1, 1.4, 1)
    assert_raises(ArgumentError, 'Monthly investment no less than 500 or morethan 10000000') { sip.calculate_lumpsum }
  end

  def test_lumpsum_calculate_one_thousand
    skip
    sip = sip.new(1000, 12, 1)
    assert_equal 1120, sip.calculate_lumpsum
  end

  def test_lumpsum_calculate_ten_thousand
    skip
    sip = sip.new(100_00, 6, 1)
    assert_equal 112_36, sip.calculate_lumpsum
  end
end


# M= P × ({[1 + i]^n – 1} / i) × (1 + i).
#A = P × ({([1 + r]^n) – 1} / r) × (1 + r)
#Future estimated lumpsum value or FV = P* (1 + r/n) ^ (nt)
# Let us understand what these variables in the formula mean
# FV = Future Value
# P = Principal lumpsum amount you invest at the start
# r = expected annual rate of return on a compounded basis
# n = Number of times the interest is compounded (example. quarterly, annually, semi-annually)
# t = Tenure of the lumpsum investment
# Once these figures are inputted, the online lumpsum investment calculator uses this formula to estimate the investment’s future value, giving you an idea of how much investment could grow over a specific period.
# One word of caution here. Input data in a transparent, pragmatic, and honest manner. Otherwise, the output and outcomes will be far off from one another.
#A = P × ({([1 + r]^n) – 1} / r) × (1 + r)

