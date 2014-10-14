class Student
  # NAME = "Slim Shady"

  def initialize(name, age=100)
    @name = name
    @age = age
  end

  def name  #getter
    @name
  end

  def to_s # inside instance method, refers to instance method
    return self.name
  end

  def age # OR attr_accessor :age
    @age
  end

  def name=(new_name)
    @name = new_name
  end

  def say_hello
    if self.age < 18
      return "Sup? I'm #{self.name}."
    else
      return "Hi, my name is #{self.name}."
    end
  end

end

# ==== Getter/Setter practice ====
# bob = Student.new("Bob")
# Calls the setter method to set name to Robert:
# puts bob.name #= "Robert"

# ===== Instance method practice =====
marshall = Student.new("Slim Shady", 32)
elizabeth = Student.new("Beth", 16)

puts marshall.say_hello
puts elizabeth.say_hello


# =====  =====
