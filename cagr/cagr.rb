class Cagr
  def initialize(initial_amount, final_amount, duration)
    @initial_amount = initial_amount
    @final_amount = final_amount
    @duration = duration
    valid_argument
  end

  def valid_argument
    raise ArgumentError, 'Initial invesment between 1000 to 10000000' unless @initial_amount.between?(1000, 100_000_00)
    raise ArgumentError, 'Initial invesment not Negative' if @initial_amount.negative?
    raise ArgumentError, 'Initial invesment not decimal' if @initial_amount.instance_of?(Float)
    raise ArgumentError, 'Final invesment between 1000 to 10000000' unless @final_amount.between?(1000, 100_000_00)
    raise ArgumentError, 'Final invesment not negative' if @final_amount.negative?
    raise ArgumentError, 'Final invesment not decimal' if @final_amount.instance_of?(Float)
    raise ArgumentError, 'Duration invesment between 1 to 40' unless @duration.between?(1, 40)
    raise ArgumentError, 'Duration invesment not negative' if @duration.negative?
    raise ArgumentError, 'Duration invesment decimal' if @duration.instance_of?(Float)
  end

  def cal_cagr
    cagr = ((@final_amount / @initial_amount)**(1 / @duration.to_f)) - 1
    (cagr * 100).round(2)
  end
end

puts '---------------------------------------------------------'
puts 'Enter Initial Amount'
initial_amount = gets.chomp.to_i

puts 'Enter Final Amount'
final_amount = gets.chomp.to_i

puts 'Enter Duration'
duration = gets.chomp.to_i

# error handling
begin
  cagr = Cagr.new(initial_amount, final_amount, duration)

  puts '---------------------------------------------------------'
  puts '------------------CAGR Calculator------------------------'
  puts '---------------------------------------------------------'
  puts "CAGR is  #{cagr.cal_cagr}%"
  puts '---------------------------------------------------------'
rescue ArgumentError => e
  puts e
end