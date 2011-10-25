
# yield calls a provided block.
def method_with_block
  yield
end

# and this is how you can provide a block to a method call.
result = method_with_block { 1 + 2 }

puts "result from method_with_block: #{result}"

#you can also assign the provided block to a variable.
def method_with_block_parameter &block
  block.call("called from method")
  yield "called from method with yield"
end

method_with_block_parameter { |s| puts "### #{s} ###"}

#html templates will look somehow like this:
def html
  #this is a way to create longer strings in place easily.
  x = <<DELIM
<html>
<body>
#{yield}
</body>
</html>
DELIM
end

puts html { "put your content here" }

content = "something calculated".upcase

# Procs can also be explicitly created and have access to the variables in their environment.
content_proc = Proc.new {
  "and it might contain #{content}."
}
#or:
content_proc = proc {
  "and it might contain #{content}."
}

puts html &content_proc


# in fact, procs are closures!
# that is, they preserve the variable bindings from the place where they are defined.

def create_counter
  n = 0
  proc { n+=1 }
end

first_counter =create_counter
puts first_counter.call
puts first_counter.call

second_counter =create_counter
puts second_counter.call
puts first_counter.call


class ProcContainer
  attr_accessor :increment
  def initialize
    @increment = 2
  end
  def create_counter
    increment =@increment =3
    n = 0;
    return proc { n +=@increment}
  end
  def increment_changer
    return proc { |new_increment| @increment=new_increment}
  end
end

p "ProcContainer"
c =ProcContainer.new
counter =c.create_counter
p counter.call
p counter.call
c.increment=2
p counter.call

c.increment_changer.call(8)
p counter.call


