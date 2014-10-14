require 'minitest/autorun'
require_relative 'gladiator_code_along.rb' # allows you to keep your testing separate

describe Gladiator do
  it 'has a name' do
    gladiator = Gladiator.new('Bob', nil)

    gladiator.name.must_equal 'Bob'
  end

  it 'has a weapon' do
    gladiator = Gladiator.new(nil, 'Trident')

    gladiator.weapon.must_equal 'Trident'
  end
end

describe Arena do
  describe '#name' do
    it 'return the instance name' do
      arena = Arena.new('Thunderdome') #instance of a class

      arena.name.must_equal 'Thunderdome'
    end

    it 'is capitalized' do
      arena = Arena.new('fragglerock')

      arena.name.must_equal 'Fragglerock'
    end

    it 'has gladiators' do
      arena = Arena.new('Thunderdome')

      arena.gladiators.must_equal []
    end

    it 'can add between zero and two gladiators to itself' do
      arena = Arena.new('Thunderdome')
      bob = Gladiator.new(nil, nil)
      babak = Gladiator.new(nil, nil)

      arena.add_gladiators(bob, babak)
      arena.gladiators.must_equal [bob, babak]
    end

    it 'cannot have more than two gladiators' do
      arena = Arena.new('Thunderdome')
      bob = Gladiator.new(nil, nil)
      babak = Gladiator.new(nil, nil)
      robert = Gladiator.new(nil, nil)

      error = lambda { arena.add_gladiators(bob, babak, robert) }.must_raise(RuntimeError)
      error.message.must_match(/too many/)
    end
  end
end
