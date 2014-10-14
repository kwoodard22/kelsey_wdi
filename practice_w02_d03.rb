module Animal
  def eat
    "Nom nom nom"
  end
end

class Pet
  def speak
    "Hi!"
  end
end

class Cat < Pet
  include Animal
end

class Skunk
  include Animal
end

class Dog < Pet
  include Animal

  def speak
    "WOOF!"
  end
end

#puts Pet.new.speak
puts Dog.new.speak
puts Dog.new.eat

puts Cat.new.eat
puts Skunk.new.eat