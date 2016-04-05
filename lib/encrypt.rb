require './lib/enigma'
require 'date'
e = Enigma.new
puts "What message would you like to encrypt? "
message = gets.chomp

puts "What would you like your five digit key to be? "
key = gets.chomp
if key == 'random'
  key = KeyGenerator.new.key
elsif key == String
  puts "Please enter a five digit number."
elsif key.length < 5
  puts "Please enter a five digit number."
else
  key = key.to_i
end

puts Date.today.strftime("%d,%m,%y")
puts key
puts e.encrypt(message, key,)
