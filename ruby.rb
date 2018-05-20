# General Notes
# 	Commands can be separated by ; - this is not required

# Console Output
puts "Your console output!"

# Console Input
myvar = gets

# Access Arguments
ARGV[0]

# Comment

# Interpreter
ruby --version
ruby myfile.rb
ruby -e "puts 'test string!'"

# Specials
puts "Print me several times! " * 3

system "your favorite command line call goes here..."
puts "Your command line output says: " + `ruby --version`
eval "Your ruby expression?"




# Types (checks at run time)
# Fixnum = Integer

# get class of object
my_variable.class
my_variable.class.superclass        # also possible: reflection
# object ID (garbage collection)
my_variable.object_id
# convert to integer
my_variable.to_i

# Arrays
# out of bounds not possible => empty values are filled with nil
# heterogeneous types

my_array = []     # new (needs to be defined before assignment)
my_array[0..2]    # range
my_array.push(42) # add element
my_array.pop      # delete last value/return it

# Hashes

my_hash = {1 => 'bla', 2 => 'blo', 3 => 'blu'}
my_hash[1]

# Conditions

if n < 1
  puts "IF"
elsif  n == 1
  puts "ELSE IF"
else
  puts "ELSE"
end

puts "IF" if n < 1

# Iteration

i = 100
i.times {puts 'Hello'}

# Blocks

# Variant 1

def my_method
  puts 'Test'
  yield # execute injected code block
end

my_method {puts 'TestBlock'}  # inject code block

# Variant 2

def my_method(&block)
  puts 'Test'
  block.call
end

my_method {puts 'TestBlock'}  # inject code block

# Functions

def my_function_name(parameter_1)

  my_return_value = parameter_1 + 1

  # Explicit Return
  return parameter_1 if parameter_1 == 42

  # Multiple Return Values
  return my_return_value+3, my_return_value+2

  # Implicit Return: Last mentioned value in function
  my_return_value
end

# Classes

# cf. include
require 'somefile.rb'

class MyClass

  attr_accessor :attrib1, :attrib2

  # Constructor
  def initialize(param1)
    @attrib1 = 1
    @attrib2 = 2
  end

  # self = this

end

# Initialize
my_class_instance = MyClass.new(param1)

# Exceptions

raise "This is an exception"

# Parallel Assignment

a,b = my_function2(x,y)