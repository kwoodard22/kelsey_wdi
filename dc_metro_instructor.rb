def dc_metro_info
  red = ['Woodley Park', 'Dupont Circle', 'Farragut North', 'Metro Center', 'Judiciary Square', 'Union Station']
  turquoise = ['Crystal City', 'Metro Center', 'Shaw-Howard', 'Beltwater']
  orange = ['Farragut West', 'McPherson Square', 'Metro Center', 'Federal Triangle', 'Smithsonian', "L'enfant Plaza"]

  dc_metro = {}
  dc_metro[:red] = red
  dc_metro[:turquoise] = turquoise
  dc_metro[:orange] = orange
  dc_metro # Need to call the hash as the value of this method (what it prints)
end

def all_stops(line)
  dc_metro_info.fetch(line) # Gives a more helpful error message; used instead of dc_metro_info[line]
end

def distance_from(start, stop)
  line_position(start) - line_position(stop)
end

def line_for(stop)
  dc_metro_info.first do |line, stops|
    puts "Line: #{line}"
    puts "Stops: #{stops}"
  end
end

def line_position(stop)
  # Dupont Circle = 1 
  line = line_for(stop)
  line.index(stop)
end


# ==== TEST METHOD ====
def assert_equals(expected, actual)
  if expected != actual
    puts "Expected: #{expected}"
    puts "Actual: #{actual}"
  else
    puts true
  end
end

# List stops
assert_equals 5, all_stops(:red).size
assert_equals "Woodley Park", all_stops(:red).first # Test the program
assert_equals "Beltwater", all_stops(:turquoise).last

# Same stop
assert_equals 0, distance_from("Dupont Circle", "Dupont Circle")
assert_equals 1, distance_from("Dupont Circle", "Woodley Park")

# Line_position
# assert_equals 1, line_position("Dupont Circle")
# assert_equals 3, line_position("Beltwater")

# Line_for
# assert_equals :red, line_for("Dupont Circle")



