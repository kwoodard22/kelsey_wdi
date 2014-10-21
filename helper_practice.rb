# Jeff's example w/ minitest

#   number_to_ssn(123456789) # => "123-45-6789"

def number_to_ssn(number, delimiter='-', **options)
  if options.fetch(:mask, nil)
    number.to_s.gsub(/(\d{3})(\d{2})(\d{4})/, "***#{delimiter}**#{delimiter}\\3")
  else 
    number.to_s.gsub(/(\d{3})(\d{2})(\d{4})/, "\\1#{delimiter}\\2#{delimiter}\\3")
  end
end

require 'minitest/autorun'
require 'minitest/spec'

describe "#number_to_ssn" do
  it 'formats a number as a social secruity number' do 
    number_to_ssn(123456789).must_equal "123-45-6789"
    number_to_ssn(987654321).must_equal "987-65-4321"
  end 
  
  it 'formats a number as a social security number with an arbitrary delimiter' do
    number_to_ssn(123456789, ' ').must_equal "123 45 6789"
  end

  it 'mask the social security number' do
    number_to_ssn(123456789, mask: true).must_equal "***-**-6789"
  end
end


# Create a helper that takes a number (123456789) and formats it like a social security number (123 -45-6789)

def soc_security_formatter(number)
  ssn = number.to_s
  ssn[0..2] + '-' + ssn[3..4] + '-' + ssn[5..9]
end


# My SUPER messy method! :(

def soc_security_formatter(numbers)
  first_3 = []
  next_2 = []
  last_4 = []
  count = 0
  numbers.split.map do |num|
    if count < 4
      first_3 << num
      count += 1
    elsif count >= 4 && count <= 5
      next_2 << num
      count += 1
    elsif count > 5 && count <= 9
      last_4 << num
      count += 1
    end
  end
  "#{first_3.to_s} - #{next_2.to_s} - #{last_4}"
end
