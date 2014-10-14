
class Gladiator
  attr_reader :name, :weapon

  def initialize(name, weapon)
    @name = name
    @weapon = weapon #instance variable
  end

end

class Arena
  attr_reader :name, :gladiators

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
  end

  def add_gladiators(*gladiators)
    if gladiators.length > 2
      raise 'You have attempted to add too many gladiators to the arena. Only add two.'
    end
    @gladiators = gladiators
  end

end
