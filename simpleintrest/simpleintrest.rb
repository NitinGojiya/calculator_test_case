class SimpleIntrest
  def initialize(principal, rate, years)
    @p_amount = principal
    @rate = rate
    @years = years
  end

  def si_cal
    raise ArgumentError, 'principal amount range is 1000 to 10000000' unless @p_amount.between?(100_0, 100_000_00)
    raise ArgumentError, 'rate range is 1 to 50' unless @rate.between?(1, 50)
    raise ArgumentError, 'year range is 1 to 30 not in decimal' unless @years.between?(1, 30)
    raise ArgumentError, 'year range is 1 to 30 not in decimal' unless @years.integer?
    si = (@p_amount * @rate.to_f * @years) / 100
    si.round
  end

  def si_cal_tot_amount
    (@p_amount + si_cal).round
  end
end


# si = SimpleIntrest.new(777_77, 7.77, 7)
# puts si.si_cal
# puts si.si_cal_tot_amount