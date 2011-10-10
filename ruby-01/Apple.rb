
class Apple
  attr_accessor :color
  @@number_of_apples = 0

  def initialize(color)
    @color = color if color
    @@number_of_apples += 1
  end
  def Apple.count
    @@number_of_apples

  end
  def
  def to_s
    "I'm a #{@color} apple."
  end

end


a1 = Apple.new("red")
a1.insta
a2 = Apple.new("green")
puts a2.to_s
puts "There are #{Apple.count} apples."
puts "This apple is #{a1.color}."