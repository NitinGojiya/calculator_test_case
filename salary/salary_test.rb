require 'minitest/autorun'
require_relative 'salary'


class SalaryTest < Minitest::Test
  def test_positive_argument_all_one
    salary = Salary.new(-1, 5, 200, 1800, 1800, 0, 0)
    assert_raises(ArgumentError, 'argumnet in only zero and positive number') { salary.valid_argument }
  end

  def test_positive_argument_all_two
    salary = Salary.new(1, 5, 200, -1800, 1800, 0, 0)
    assert_raises(ArgumentError, 'argumnet in only zero and positive number') { salary.valid_argument }
  end

  def test_positive_argument_all_three
    salary = Salary.new(1, -5, 200, -1800, 1800, 0, 0)
    assert_raises(ArgumentError, 'argumnet in only zero and positive number') { salary.valid_argument }
  end

  def test_positive_argument_all_four
    salary = Salary.new(1, -5, 200, -1800, -1800, 0, 0)
    assert_raises(ArgumentError, 'argumnet in only zero and positive number') { salary.valid_argument }
  end

  def test_positive_argument_all_five
    salary = Salary.new(1, 5, 200, 1600, 1800, -1, 0)
    assert_raises(ArgumentError, 'argumnet in only zero and positive number') { salary.valid_argument }
  end

  def test_salary_cal_one
    salary = Salary.new(600_000, 15, 200, 1800, 1800, 0, 0)
    assert_equal 113_00, salary.tota_m_deduction
    assert_equal 135_600, salary.tota_a_deduction
    assert_equal 387_00, salary.take_home_m_salary
    assert_equal 464_400, salary.take_home_a_salary
  end

  def test_salary_cal_two
    salary = Salary.new(430_000_0, 20, 500, 5000, 3000, 0, 200)
    assert_equal 80_367, salary.tota_m_deduction
    assert_equal 964_400, salary.tota_a_deduction
    assert_equal 277_967, salary.take_home_m_salary
    assert_equal 333_560_0, salary.take_home_a_salary
  end

  def test_salary_cal_three
    salary = Salary.new(30_000_0, 10, 500, 500, 200, 10, 200)
    assert_equal 391_0, salary.tota_m_deduction
    assert_equal 469_20, salary.tota_a_deduction
    assert_equal 210_90, salary.take_home_m_salary
    assert_equal 253_080, salary.take_home_a_salary
  end

  def test_salary_cal_four
    salary = Salary.new(0, 10, 500, 500, 200, 10, 200)
    assert_equal 141_0, salary.tota_m_deduction
    assert_equal 169_20, salary.tota_a_deduction
    assert_equal -141_0, salary.take_home_m_salary
    assert_equal -169_20, salary.take_home_a_salary
  end

  def test_salary_cal_five
    salary = Salary.new(555_55, 5, 555, 555, 55, 55, 0)
    assert_equal 145_1, salary.tota_m_deduction
    assert_equal 174_18, salary.tota_a_deduction
    assert_equal 317_8, salary.take_home_m_salary
    assert_equal 381_37, salary.take_home_a_salary
  end
end