# problem 1
# sum = 0

# (1...1000).each do |num|
# 	if num % 3 == 0 || num % 5 == 0
# 		sum += num
# 	end
# end

# puts sum



(2..49).each do |num|
	(2...num).each do |div|
		if num % div == 0 
			print div
			print " "
		end
	end
end



