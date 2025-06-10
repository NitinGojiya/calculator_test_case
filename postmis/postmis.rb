# frozen_string_literal: true

# Post Office Monthly Income Scheme
class PostMis
  def initialize(investment_amount, interest_rate)
    @investment_amount = investment_amount
    @interest_rate = interest_rate
    valid_argument
  end

  def valid_argument
    raise ArgumentError, 'Investment Amount 1000 to 1500000' unless @investment_amount.between?(1000, 150_000_0)
    raise ArgumentError, 'Rate 1 to 12' unless @interest_rate.between?(1, 12)
    raise ArgumentError, 'Investment Amount Not in Decimal' if @investment_amount.instance_of?(Float)
  end

  def monthly_income
    (@investment_amount * (@interest_rate / 100.0) / 12).round
  end
end