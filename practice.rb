# people = [
#   {:name => "Stacy", :money => 5, :plays_instrument => true},
#   {:name => "Daniel", :money => 10, :plays_instrument => false},
#   {:name => "Oscar", :money => 80, :plays_instrument => true},
#   {:name => "Kayla", :money => 20, :plays_instrument => false},
#   {:name => "Brandon", :money => 20, :plays_instrument => false},
#   {:name => "John", :money => 90, :plays_instrument => false},
#   {:name => "Steven", :money => 10, :plays_instrument => true},
#   {:name => "James", :money => 15, :plays_instrument => false},
#   {:name => "Adrien", :money => 8, :plays_instrument => false},
#   {:name => "Sean", :money => 7, :plays_instrument => true},
#   {:name => "Max", :money => 35, :plays_instrument => true},
#   {:name => "Matthew", :money => 12, :plays_instrument => true},
#   {:name => "Ruchi", :money => 75, :plays_instrument => false},
#   {:name => "Kenn", :money => 27, :plays_instrument => true},
#   {:name => "Matt", :money => 35, :plays_instrument => true},
#   {:name => "Tim", :money => 11, :plays_instrument => true},
#   {:name => "Babak", :money => 15, :plays_instrument => false},
#   {:name => "Erwin", :money => 7, :plays_instrument => true},
#   {:name => "Camelia", :money => 35, :plays_instrument => true},
#   {:name => "Lydia", :money => 102, :plays_instrument => true},
#   {:name => "Paul", :money => 75, :plays_instrument => false},
#   {:name => "Kelsey", :money => 17, :plays_instrument => true},
# ]

# Who has the most money?
# If we have at least 5 people that play instruments we can start a band. Can we?
# If a new drum set costs $350, do we have enough money to buy one?

# people.collect do |hash|
#   hash.max_by {|k, v| v}
# end

wine_cellar = [
  {:label => "Rutherford Hill", :type => "Chardonnay", :color => "white"},
  {:label => "Nina Veneto", :type => "Pinot Grigio", :color => "white"},
  {:label => "Wairau River", :type => "Sauvignon Blanc", :color => "white"},
  {:label => "Tangley Oaks", :type => "Merlot", :color => "red"},
  {:label => "Chimney Rock", :type => "Cabernet Sauvignon", :color => "red"},
  {:label => "Sanford", :type => "Pinot Noir", :color => "red"},
  {:label => "Alderbrook", :type => "Pinot Noir", :color => "red"},
  {:label => "Colavita", :type => "Pinot Noir", :color => "red"},
  {:label => "Markham", :type => "Chardonnay", :color => "white"},
  {:label => "Angeline", :type => "Pinot Noir", :color => "red"}
]

# Adds a wine of your choice to the cellar

new_wine = {:label => "Alamos", :type => "Malbec", :color => "white" }

wine_cellar << new_wine

# Returns a random wine from the cellar

puts wine_cellar.sample

# Returns an array of just the white wines

puts wine_cellar.select { |wine| wine[:color] == "white" }


# Returns an array listing the unique types of wine

puts wine_cellar.uniq { |wine| wine[:type] }

# Returns an array with the all the wines that have 2-word labels

puts wine_cellar.select { |wine| wine[:label].include? " " }
puts wine_cellar.select { |wine| wine[:label].index(" ") }

# Returns an array with the labels of the wines that a type of Pinot Noir


