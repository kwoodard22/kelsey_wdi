# def add_arguments(num1, num2, *rest)
#   puts "num1 = #{num1}"
#   puts "num2 = #{num2}"
#   puts "rest = #{rest}"
#   if rest.empty?
#     return num1 + num2
#   else
#     rest.push(num1)
#     rest.push(num2)
#     rest.inject(0) {|sum, num| sum += num }
#   end
# end

# add_arguments(10, 11, 13)

# Takes 2 arguments and prints your first name and last name

  # def print_name(first_name, last_name, *prefix)
  #   if prefix.empty?
  #     puts "#{first_name} #{last_name}"
  #   elsif 
  #     puts "#{prefix.inject { |string, word| string += word }} #{first_name} #{last_name}"
  #   end
  # end

  # print_name("Kelsey", "Woodard", "Ms.", "Dr.")

# Contrived calculator

  # def operate_on_two_numbers(num1, num2, operation)
  #   if operation == "Add"
  #     result = num1 + num2
  #   else
  #     "not Add"
  #   end
  #   return result
  # end

  # def calculate(num1, num2, **options_hash)
  #   if options_hash[:operation] == "Add"
  #     result = num1 + num2
  #   else
  #     "not Addition"
  #   end
  #   result
  # end

# =======================
name_hash = {
  first: "Kelsey",
  middle: "Margaret",
  last: "Woodard",
  title: "Ms.",
  suffix: "Jr.",
}

def full_name(**options_hash)
  puts "#{options_hash[:title]} #{options_hash[:first]} #{options_hash[:middle]} #{options_hash[:last]} #{options_hash[:suffix]}"
end

# full_name(name_hash)

# full_name(first: "Jane", last: "Doe", title: "Princess", middle: "Hollatcha", suffix: "IX")

# ========================

# call full_name, print wrapper 80 times then name, then wrapper 80 times again

def pretty_wrapper(wrap_element, &block) # writing &block is optional; can leave it out!
  puts wrap_element * 80
  print yield
  puts wrap_element * 80
end

pretty_wrapper("%") { full_name(name_hash) }


