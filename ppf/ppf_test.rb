require 'minitest/autorun'
require_relative 'ppf'

class PpfTest < Minitest::Test
  # def test_object_create
  #   @ppf = Ppf.new
  # end

  def test_investment_year_limit
    @ppf = Ppf.new(100, 15)
    assert_raises(ArgumentError, 'investment is only 500 to 150000 not in floting') { @ppf.ppf_calculate }
  end

  def test_time_period_limit
    @ppf = Ppf.new(100, 11)
    assert_raises(ArgumentError, 'Time period is only 15 to 50 also not in floating') { @ppf.ppf_calculate }
  end

  def test_rate_only
    assert_equal 7.1, Ppf::RATE
  end

  def test_ppf_calculate_five_thousand_fifty_year_
    @ppf = Ppf.new(5000, 50)
    assert_equal 210_320_5, @ppf.ppf_calculate
  end

  def test_ppf_calculate_five_five_five_twenty_eight_year_
    @ppf = Ppf.new(555, 28)
    assert_equal 332_27, @ppf.ppf_calculate
  end

  def test_ppf_calculate_thirty_lack_twenty_year_
    @ppf = Ppf.new(555, 28)
    assert_equal 332_27, @ppf.ppf_calculate
  end

  def test_ppf_invesment_amount_total
    @ppf = Ppf.new(500, 15)
    assert_equal 7500, @ppf.investment
  end

  def test_ppf_high_year
    @ppf = Ppf.new(500, 55)
    assert_raises(ArgumentError, 'Time period is only 15 to 50 also not in floating') { @ppf.ppf_calculate }
  end

  def test_ppf_invesment_not_in_floting
    @ppf = Ppf.new(122_22.22, 55)
    assert_raises(ArgumentError, 'investment is only 500 to 150000 not in floting') { @ppf.ppf_calculate }
  end

  def test_ppf_year_in_floating
    @ppf = Ppf.new(500, 55.5)
    assert_raises(ArgumentError, 'Time period is only 15 to 50 also not in floating') { @ppf.ppf_calculate }
  end

  def test_ppf_zero_investment
    @ppf = Ppf.new(0, 55)
    assert_raises(ArgumentError, 'investment is only 500 to 150000 not in floting') { @ppf.ppf_calculate }
  end

  def test_ppf_zero_both
    @ppf = Ppf.new(0, 0)
    assert_raises(ArgumentError, 'investment is only 500 to 150000 not in floting') { @ppf.ppf_calculate }
    assert_raises(ArgumentError, 'Time period is only 15 to 50 also not in floating') { @ppf.ppf_calculate }
  end
end
