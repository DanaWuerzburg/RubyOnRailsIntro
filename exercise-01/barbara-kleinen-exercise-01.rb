
class Result
  attr_accessor :person1,:person2, :matching_hobbies
  def initialize(person1,person2,matching_hobbies)
    @person1=person1
    @person2=person2
    @matching_hobbies=matching_hobbies
  end
  def to_s
    return "#{person1.name} and #{person2.name} have #{matching_hobbies.size} hobbies in common: #{matching_hobbies.join(", ")}\n"
  end
end

class Person
  attr_accessor :name, :hobbies
  @@instances = []

  def Person.matches
    matches =[]
    max_index =(@@instances.size) -1
   (0..max_index).each do | i |
      (i+1..max_index).each do |j|
        p1 =@@instances[i]
        p2 =@@instances[j]
        matching_hobbies = p1.match_hobbies(p2)
        if matching_hobbies.size > 0
          matches << Result.new(p1,p2,matching_hobbies)
        end
      end
    end
    matches = matches.sort {|result1,result2| result1.matching_hobbies.size <=> result2.matching_hobbies.size}
    return matches.reverse
  end

  def initialize(name, hobbies)
    @name =name
    @hobbies =hobbies.split(",").map {|s| s.strip}
    @@instances << self
  end

  def match_hobbies(otherPerson)
    return hobbies.map(&:capitalize) & otherPerson.hobbies.map(&:capitalize)
  end

end

p1 = Person.new("Barbara", "GeoCaching, Stunt Kites, Go, Bicycles")
p2 = Person.new("Matthias", "GO , Bicycles, Geocaching")
p3 = Person.new("Shorty", "Stunt Kites, Go")
p4 = Person.new("Ruth","Geocaching")

matches =Person.matches
puts matches.inspect
