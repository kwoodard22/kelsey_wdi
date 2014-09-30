require 'pry'
red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
orange = ['Farragut West', 'McPherson Square', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

dc_metro = {}
dc_metro[:red] = red
dc_metro[:turquoise] = turquoise
dc_metro[:orange] = orange

distance_from_center = {
	"woodley park" => -3,
	"dupont circle" => -2,
	"farragut north" => -1,
	"metro center" => 0,
	"judiciary square" => 1,
	"union station" => 2,
	"farragut west" => -2,
	"mcpherson square" => -1,
	"federal triangle" => 1,
	"smithsonian" => 2,
	"l'enfant plaza" => 3,
	"crystal city" => -1,
	"shaw-howard" => 1,
	"beltwater" => 2
}

count_lines = 0
count_stations = 0
line_number_hash = {}
station_number_hash = {}

# Welcome to Metro
puts ""
puts "Welcome to the DC Metro!".upcase
puts ""

# Requests the departure line
puts "Which line are you departing from? Enter the line number:"
lines = dc_metro.keys.collect {|line_symbol| line_symbol.to_s.capitalize}
lines.each.with_index { |line, index| puts "#{index + 1}: #{line}"; count_lines += 1; line_number_hash[index + 1] = line} #creates hash of index keys and line color values
departing_line = gets.chomp.to_i

# Checks validity of response
until departing_line <= count_lines && departing_line > 0
	puts "Please enter a number between 1 and #{count_lines}."
	departing_line = gets.chomp.to_i
end

# Lists stations based on name given
puts ""
depart = line_number_hash[departing_line].downcase
puts "Here are the stations on the #{depart.upcase} line:"
dc_metro[depart.to_sym].each_with_index do |station, num|
	puts "#{num + 1}: #{station}"
	count_stations += 1 
 end

# Collects departure station
puts "Enter the station number you are departing from:"
departure = gets.chomp.to_i

# Checks validity of response
until departure <= count_stations && departure > 0
	puts "Please enter a number between 1 and #{count_stations}."
	departure = gets.chomp.to_i
end

# Gives user departing station name
dc_metro[depart.to_sym].each_with_index do |station, num|
	if departure == num + 1
		puts "Your departing station is #{station.upcase}."
		departure = station.downcase # saves DEPARTURE
	end
end

# ======== CHECKING DESTINATION ==========
puts ""
puts "On which line is your destiination? Enter the line number:"
#lines = dc_metro.keys.collect {|line_symbol| line_symbol.to_s.capitalize}
lines.each.with_index { |line, index| puts "#{index + 1}: #{line}"; count_lines += 1; line_number_hash[index + 1] = line} #creates hash of index keys and line color values
destination_line = gets.chomp.to_i

# Checks validity of response
until destination_line <= count_lines && destination_line > 0
	puts "Please enter a number between 1 and #{count_lines}."
	destination_line = gets.chomp.to_i
end

# Lists stations based on name given
puts ""
arrive = line_number_hash[destination_line].downcase
puts "Here are the stations on the #{arrive.upcase} line:"
dc_metro[arrive.to_sym].each_with_index do |station, num|
	puts "#{num + 1}: #{station}"
	count_stations += 1 
 end

# Collects destination 
puts "Enter the station number of your destination:"
destination = gets.chomp.to_i

# Checks validity of response
until destination <= count_stations && destination > 0
	puts "Please enter a number between 1 and #{count_stations}."
	destination = gets.chomp.to_i
end

# Checks that departure & destination are not equal.
if departure == destination
	puts "ERROR: You cannot have the same departure and destination. Enter a new destination."
	dc_metro[arrive.to_sym].each_with_index do |station, num|
		puts "#{num + 1}: #{station}"
		count_stations += 1 
	end
	destination = gets.chomp.to_i
end

# Gives destination
dc_metro[arrive.to_sym].each_with_index do |station, num|
	if destination == num + 1
		puts "Your destination is #{station.upcase}."
		destination = station.downcase # saves DESTINATION
	end
end

# Check to see if the departure & destination are on the same metro line.
departure = departure.to_s
destination = destination.to_s

puts ""
stop_num = "stops"
if dc_metro[depart.to_sym] == dc_metro[arrive.to_sym]
	same_line = distance_from_center[departure] - distance_from_center[destination]
	if same_line.abs == 1
		stop_num = "stop"
	end
	puts "There will be #{same_line.abs} #{stop_num} between #{departure.upcase} and #{destination.upcase}."
else # If not on the same line, different equation
	transfer_line = distance_from_center[departure].abs + distance_from_center[destination].abs
	if transfer_line == 1
		stop_num = "stop"
	end
	puts  "There will be #{transfer_line} #{stop_num} between #{departure.upcase} and #{destination.upcase}."
end
puts ""
puts "============== THANK YOU FOR RIDING DC METRO!! ============== "

# Gives list of all metro stations & asks for destination
# puts ""
# puts "What is your destination? Enter the number:"
# all_stations = distance_from_center.keys.collect {|station_sym| station_sym.to_s.capitalize}
# all_stations.each.with_index { |station, index| puts "#{index + 1}: #{station.capitalize}"; count_stations += 1; station_number_hash[index + 1] = station}
# station_num = gets.chomp.to_i
# destination = station_number_hash[station_num].downcase

# ?? WAS TRYING TO FIND DESTINATION IN HASH TO GET THE LINE COLOR. 
# dc_metro.keys.each do |line_key|
# 	if dc_metro[line_key].include? destination.split.map { |i| i.capitalize }.join(' ') == true
# 		stop_line = "GRRRR"
# 		puts "Grrrr"
# 	end
# end

