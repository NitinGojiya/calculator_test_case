class Salary
  def initialize(ctc, bonus_ctc_per, m_profesional_pf, m_employer_pf, m_employee_pf, m_add_deduction1, m_add_deduction2)
    @ctc = ctc
    @bonus_ctc_per = bonus_ctc_per
    @m_profesional_pf = m_profesional_pf
    @m_employer_pf = m_employer_pf
    @m_employee_pf = m_employee_pf
    @m_add_deduction1 = m_add_deduction1
    @m_add_deduction2 = m_add_deduction2
    # m for months in all varible
  end

  def valid_argument
    raise ArgumentError, 'argumnet in only zero and positive number' unless @ctc.zero? || @ctc.positive?
    raise ArgumentError, 'argumnet in only zero and positive number' unless @bonus_ctc_per.zero? || @bonus_ctc_per.positive?
    raise ArgumentError, 'argumnet in only zero and positive number' unless @m_profesional_pf.zero? || @m_profesional_pf.positive?
    raise ArgumentError, 'argumnet in only zero and positive number' unless @m_employer_pf.zero? || @m_employer_pf.positive?
    raise ArgumentError, 'argumnet in only zero and positive number' unless @m_employee_pf.zero? || @m_employee_pf.positive?
    raise ArgumentError, 'argumnet in only zero and positive number' unless @m_add_deduction1.zero? || @m_add_deduction1.positive?
    raise ArgumentError, 'argumnet in only zero and positive number' unless @m_add_deduction2.zero? || @m_add_deduction2.positive?
  end

  def tota_m_deduction
    @ctc_bonus = @ctc * @bonus_ctc_per / 100.0
    m_ctc_bonus = @ctc_bonus / 12
    m = m_ctc_bonus + @m_profesional_pf + @m_employer_pf + @m_employee_pf + @m_add_deduction1 + @m_add_deduction2
    m.round
  end

  def tota_a_deduction
    # a for annual
    @ctc_bonus = @ctc * @bonus_ctc_per / 100.0
    m_ctc_bonus = @ctc_bonus / 12
    m = m_ctc_bonus + @m_profesional_pf + @m_employer_pf + @m_employee_pf + @m_add_deduction1 + @m_add_deduction2
    (m * 12).round
  end

  def take_home_m_salary
    m = @ctc / 12
    @ctc_bonus = @ctc * @bonus_ctc_per / 100.0
    m_ctc_bonus = @ctc_bonus / 12
    m_d = m_ctc_bonus + @m_profesional_pf + @m_employer_pf + @m_employee_pf + @m_add_deduction1 + @m_add_deduction2
    t_home = m - m_d
    t_home.ceil
  end

  def take_home_a_salary
    @ctc - tota_a_deduction
  end
end
puts 'Cost to Company (CTC'
ctc = gets.to_i
puts 'Bonus Included in CTC in percentage'
bonus_ctc_per = gets.to_i
puts 'Monthly Professional Tax'
m_profesional_pf = gets.to_i
puts 'Monthly Employer PF'
m_employer_pf = gets.to_i
puts 'Monthly Employee PF'
m_employee_pf = gets.to_i
puts 'Monthly Additional Deduction 1'
m_add_deduction1 = gets.to_i
puts 'Monthly Additional Deduction 1'
m_add_deduction2= gets.to_i
salary = Salary.new(ctc, bonus_ctc_per, m_profesional_pf, m_employer_pf, m_employee_pf, m_add_deduction1, m_add_deduction2)
begin
  # salary.valid_argument
  puts "Total Monthly Deduction :-Rs.#{salary.tota_m_deduction}"
  puts "Total Anualy Deduction:-Rs. #{salary.tota_a_deduction}"
  puts "Take Home Monthly Salary:-Rs. #{salary.take_home_m_salary}"
  puts "Take Home Anualy Salary:-Rs. #{salary.take_home_a_salary}"
rescue ArgumentError => e
  puts e
end

