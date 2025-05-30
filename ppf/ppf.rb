class Ppf
  RATE = 7.1
  def initialize(p_amount, years)
    @p_amount = p_amount
    @years = years
    @rate = RATE / 100.0
  end

  def ppf_calculate
    raise ArgumentError, 'investment is only 500 to 150000 not in floting' unless @p_amount.between?(500, 150_000)
    raise ArgumentError, 'Time period is only 15 to 50 also not in floating' unless @years.between?(15, 50)
    raise ArgumentError, 'investment is only 500 to 150000 not in floting' if @p_amount.instance_of?(Float)
    raise ArgumentError, 'Time period is only 15 to 50 also not in floating' if @years.instance_of?(Float)

    value = @p_amount * ((((1 + @rate)**@years) - 1) / @rate)
    # value1 = @p_amount * (1 + @rate)**@years
    # value1.round
    return value.round
  end

  def investment
    @p_amount * @years
  end
end

ppf = Ppf.new(100_00, 15)
puts ppf.ppf_calculate
