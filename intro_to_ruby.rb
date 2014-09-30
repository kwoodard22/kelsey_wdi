require 'pry' 

# puts "What is your favorite food?"
# answer = gets.chomp
# # binding.pry
# puts "#{answer}?!?! I like brussel sprouts!"

# counter = 10

# until counter == 0
# 	puts counter
# 	counter == 1
	# binding.pry
# elsif counter == 0
# 	puts "Everything is awesome!"
# else
# 	puts "Blast Off!!"
# end

# keyword = "fruit"
# answer = nil

# while answer != keyword
# 	puts "Guess"
# 	answer = gets.chomp 
# end

# puts "YOU GOT IT! #{keyword.upcase} was it!"

puts "what character would you like to use?"
character = gets.chomp

puts "How many lines tall would you like your pyramid?"
answer = gets.chomp.to_i
rows = 0

until answer > 0
	puts "Please enter an integer."
	answer = gets.chomp.to_i
end

until rows == answer * 2
	if rows % 2 > 0 
		puts ("#{character}" * rows).center(answer * 2)
	end
	rows += 1
end


