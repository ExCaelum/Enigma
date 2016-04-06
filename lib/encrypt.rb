require 'date'
require './lib/offset.rb'

class Encrypt

    CHARMAP = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ', '.', ',',]

  def encrypt(message, key, date)
    @key = OffsetCalculator.new(key, date).calculate_code
    encrypted = ""
    message = message.strip
    message = message.downcase
    message = message.chars
    message.each_with_index do |char, index|
      starting_point = CHARMAP.find_index(char)
      if index % 4 == 0
        amount = starting_point + @key['a']
        encrypted << "#{CHARMAP[amount % 39]}"
      elsif index % 4 == 1
        amount = starting_point + @key['b']
        encrypted << "#{CHARMAP[amount % 39]}"
      elsif index % 4 == 2
        amount = starting_point + @key['c']
        encrypted << "#{CHARMAP[amount % 39]}"
      else
        amount = starting_point + @key['d']
        encrypted << "#{CHARMAP[amount % 39]}"
      end
    end
    encrypted
  end
end








# require './lib/enigma'
# require 'date'
# e = Enigma.new
# puts "What message would you like to encrypt? "
# message =
#
# puts "What would you like your five digit key to be? "
# key = gets.chomp
# if key == 'random'
#   key = KeyGenerator.new.generate
# elsif key == String
#   puts "Please enter a five digit number."
# elsif key.length < 5
#   puts "Please enter a five digit number."
# else
#   key = key.to_i
# end
#
# puts Date.today.strftime("%d,%m,%y")
# puts key
# puts e.encrypt(message, key)
