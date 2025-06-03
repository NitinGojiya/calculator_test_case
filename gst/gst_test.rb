require 'minitest/autorun'
require_relative 'gst'

class GstTest < Minitest::Test
  def test_amount_limit_low
    gst = Gst.new(500, 12)
    assert_raises(ArgumentError, 'amount is 5000 to 500000') { gst.valid_argument }
  end

  def test_gst_limit_low
    gst = Gst.new(500, 6)
    assert_raises(ArgumentError, 'gst tax not included 0.25,3,5,12,18') { gst.valid_argument }
  end

  def test_rate_invalid
    gst = Gst.new(500, 12.4)
    assert_raises(ArgumentError, 'tax not valid') { gst.valid_argument }
  end

  def test_rate_constant
    assert_equal [0.25, 3, 5, 12, 18], Gst::TAX
  end

  def test_excluding_gst_one
    gst = Gst.new(500_000, 5)
    assert_equal 250_00, gst.gst
    assert_equal 525_000, gst.excluding
  end

  def test_excluding_gst_two
    gst = Gst.new(6767, 0.25)
    assert_equal 17, gst.gst
    assert_equal 6784, gst.excluding
  end

  def test_excluding_gst_three
    gst = Gst.new(2345, 3)
    assert_equal 70, gst.gst
    assert_equal 2415, gst.excluding
  end

  def test_excluding_gst_four
    gst = Gst.new(5555, 5)
    assert_equal 277, gst.gst
    assert_equal 5832, gst.excluding
  end

  def test_excluding_gst_five
    gst = Gst.new(412_34, 18)
    assert_equal 742_2, gst.gst
    assert_equal 486_56, gst.excluding
  end

  def test_including_gst_one
    gst = Gst.new(555_55, 5)
    assert_equal 2645, gst.gst_in
    assert_equal 529_10, gst.including
  end

  def test_including_gst_two
    gst = Gst.new(8841, 0.25)
    assert_equal 22, gst.gst_in
    assert_equal 8819, gst.including
  end

  def test_including_gst_three
    gst = Gst.new(9999, 18)
    assert_equal 1525, gst.gst_in
    assert_equal 8474, gst.including
  end

  def test_including_gst_four
    gst = Gst.new(412_34, 12)
    assert_equal 4418, gst.gst_in
    assert_equal 368_16, gst.including
  end
end