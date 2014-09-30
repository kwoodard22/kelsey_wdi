def deck_o_cards
	values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
	suits = ['hearts', 'diamonds', 'clubs', 'spades']

	deck = []

	values.each do |num|
		suits.map do |kind|
			card = Hash.new
			card[:suit] = kind
			card[:value] = num
			deck << card 
		end
	end

	print deck
	deck.shuffle!
	puts "The deck has #{deck.size} cards."
	puts "The top card is the #{deck[0][:value]} of #{deck[0][:suit]}."


end

deck_o_cards
