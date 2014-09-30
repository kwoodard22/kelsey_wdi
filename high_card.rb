# Methods to research:
# each_with_index
# max

# Build a decks of shuffled cards
# Collect an array of player names by prompting

class HighCard
	
	def welcome
		puts "Welcome to this awesome game of High Card!"
		puts "How many players are playing today?"
		@pnum = gets.chomp.to_i
		while @pnum.to_i <= 0
			puts "Please enter a number greater than 0."
			@pnum = gets.chomp.to_i
		end
		player_names
	end

	def player_names
		puts "Your game has #{@pnum} players."
		num = 0
		count = 1
		@players = []

		deck_o_cards

		while count <= @pnum.to_i
			puts "Enter the name of player #{count}:"
			s_name = gets.chomp
			player = {} # moved this into the loop to fix repeating same hash error
			player[:key] = s_name
			player[:card] = @deck[num]
			@players << player
			num += 1
			count += 1
		end

		puts "Great, our players are:"
		@players.each_with_index do |key, index|
			puts "Player #{index + 1} - #{key[:key]}"
		end
		
		play_game # THIS IS WHERE I LEFT OFF
	end

	def play_game

		# how to sort by hash --> leaderboard = scores.sort_by { |_, score| -score }

		#puts @players #[:card][:suit]

		@players.each do |key, card|
			puts "#{key[:card][:suit]}"
			puts "====================================="
			puts key[:card] #[:value].sort_by { |num, kind| -num } # trying to sort by hash
		 	puts "=========================================="
		end
		#print @players

	end

	def deck_o_cards
		values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
		suits = ['hearts', 'diamonds', 'clubs', 'spades']
		@deck = []

		values.each do |num|
			suits.map do |kind|
				card = Hash.new
				card[:suit] = kind
				card[:value] = num
				@deck << card 
			end
		end
		@deck.shuffle! # made every 'deck' an instance variable

		# puts "The deck has #{deck.size} cards."
		# puts "The top card is the #{deck.first[:value]} of #{deck.first[:suit]}."
	end

end

