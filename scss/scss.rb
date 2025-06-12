# frozen_string_literal: true

# Senior Citizen Savings Scheme (SCSS) Calculator
class Scss
  RATE = 8.2
  TENURE = 5
  def initialize(yearly_investment)
    @yearly_investment = yearly_investment
    valid_argument
  end

  def valid_argument
    raise ArgumentError, 'Yearly Investment is only 500 to 300000' unless @yearly_investment.between?(500, 300_000)
  end

  def scss_calculate
    annual_interest_rate_decimal = RATE / 100.0
    quarterly_interest_rate = annual_interest_rate_decimal / 4.0
    quarterly_interest_payment = @yearly_investment * quarterly_interest_rate
    total_quarters = TENURE * 4
    total_interest_earned = quarterly_interest_payment * total_quarters
    total_maturity_amount = @yearly_investment + total_interest_earned
    {
      principal_amount: @yearly_investment,
      quarterly_interest_payment: quarterly_interest_payment.round,
      total_interest_earned: total_interest_earned.round,
      total_maturity_amount: total_maturity_amount.round
    }
  end
end

# scss = Scss.new(555_5)
# puts scss.scss_calculate