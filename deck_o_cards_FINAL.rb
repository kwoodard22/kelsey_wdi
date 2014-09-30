
def deck_o_cards
	values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
	suits = ['hearts', 'diamonds', 'clubs', 'spades']
	deck = []
	
	values.each do |num|
		suits.map do |kind|
			card = Hash.new
			# can do --> card = {suit: kind, value: num}
			card[:suit] = kind
			card[:value] = num
			deck << card 
		end
	end
	deck.shuffle!
	puts "The deck has #{deck.size} cards."
	puts "The top card is the #{deck.first[:value]} of #{deck.first[:suit]}."

end

# could instead do...
			# deck.push ({
				# value: v,
				# suit: s,
				# })

# draw = deck.pop