class Gst
  TAX = [0.25, 3, 5, 12, 18].freeze
  def initialize(total_amount, tax)
    @total_amount = total_amount
    @tax = tax
  end

  def valid_argument
    raise ArgumentError, 'amount is 5000 to 500000' unless @total_amount.between?(5000, 500_000)
    raise ArgumentError, 'tax not valid' unless TAX.include?(@tax)
  end

  def gst
    (@total_amount * @tax / 100).round
  end

  def excluding
    (gst + @total_amount).round
  end

  def gst_in
    gst = @total_amount / (1 + @tax / 100.0)
    (@total_amount - gst).round
  end

  def including
    gst = @total_amount / (1 + @tax / 100.0)
    gst.round
  end
end