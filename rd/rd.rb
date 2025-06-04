class Rd
  def initialize(m_invesment, rate, years)
    @q_rate = rate.to_f / 4 / 100
    @years = years
    @months = years * 12
    @m_invesment = m_invesment
  end

  def valid_argument
    raise ArgumentError, 'Monthly invesment is 500 to 1000000' unless @m_invesment.between?(500, 100_000_0)
    raise ArgumentError, 'Rate limit 1 to 15' unless @q_rate.between?(1, 15)
    raise ArgumentError, 'Year limit 1 to 10' unless @years.between?(1, 10)
  end

  def cal_est_ret
    total_return = (1..@months).sum do |month|
      remaining_q = (@months - month + 1).to_f / 3
      monthly_amount = @m_invesment * (1 + @q_rate)**remaining_q
      # puts "Months #{month}:-#{monthly_amount.round(2)}"
      monthly_amount
    end
    # puts total_return
    (total_return - (@m_invesment * @months)).round
  end

  def cal_est_tot
    cal_est_ret + (@m_invesment * @months)
  end
end

rd = Rd.new(5000, 8, 1)
# rd.cal_est_ret
rd.cal_est_tot
