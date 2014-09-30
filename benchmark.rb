require 'benchmark'

require_relative 'deck_o_cards_FINAL'

puts Benchmark.measure {
	1_000.times do 
		deck_o_cards
	end
}