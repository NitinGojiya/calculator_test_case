class Sip
  attr_reader :p

  def initialize(p_amount, rate, year)
    @p = p_amount
    @r = rate
    @n = year
  end

  def calculate_sip
    raise ArgumentError, 'Monthly investment must be between 100 and 1,000,000' unless @p.between?(100, 1_000_000)
    raise ArgumentError, 'rate not less than 1 or morethan 30' unless @r.between?(1, 30)
    raise ArgumentError, 'year not less than 1 or morethan 40' unless @n.between?(1, 40)

    rate = @r / 12.0 / 100.0
    months = @n * 12
    m = @p * (((1 + rate)**months - 1) / rate) * (1 + rate)
    puts '------------------------------------------------------------------'
    puts "|                  Sip Answer is :-#{m.floor}                     |"
    puts '------------------------------------------------------------------'
    m.floor
  end

  def calculate_lumpsum
    raise ArgumentError, 'Monthly investment must be between 500 and 1,000,000,0' unless @p.between?(500, 1_000_000_0)
    raise ArgumentError, 'rate not less than 1 or morethan 30' unless @r.between?(1, 30)
    raise ArgumentError, 'year not less than 1 or morethan 40' unless @n.between?(1, 40)

    rate = @r / 100.00 # per months rate
    # months = 12 * @n # in months
    t = @n # in year
    fv = (@p * (1 + rate / t)**(t * t))
    puts '------------------------------------------------------------------'
    puts "|              Lumsum Answer is :-#{fv.floor}                     |"
    puts '------------------------------------------------------------------'
    fv.floor
  end

  def diff
    # calculate_sip - calculate_lumpsum
    puts '------------------------------------------------------------------'
    puts "|                     Diffrence is :-#{calculate_sip - calculate_lumpsum}                     |"
    puts '------------------------------------------------------------------'
  end
end

n = true
puts ''
puts '-------------------------For calculate sip and lumpsum------------------------'
puts 'Enter Monthly invesment'
p_amount = gets.to_i
puts 'Enter Rate '
rate = gets.to_i
puts 'Enter Year '
year = gets.to_i
sip = Sip.new(p_amount, rate, year)
# sip.calculate_lumpsum
while n

  print "\nSelect any one\n 1.For Sip Calculater\n 2. For Lumpsum Calculater\n 3.Diffrence between sip and lumpsum\n 4.For Exit"
  print "\nEnter Your Choice:-"
  choice = gets.to_i
  case choice
  when 1 then sip.calculate_sip
  when 2 then sip.calculate_lumpsum
  when 3 then sip.diff
  else
    n = false
  end
end
