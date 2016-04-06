require 'date'
require './lib/offset.rb'

class Decrypt

    CHARMAP = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ', '.', ',',]

  def decrypt(message, key, date)
    @key = OffsetCalculator.new(key, date).calculate_code
    decrypted = ""
    message.chars.each_with_index do |char, index|
      starting_point = CHARMAP.find_index(char)
      if index % 4 == 0
        amount = starting_point - @key['a']
        decrypted << "#{CHARMAP[amount % 39]}"
      elsif index % 4 == 1
        amount = starting_point - @key['b']
        decrypted << "#{CHARMAP[amount % 39]}"
      elsif index % 4 == 2
        amount = starting_point - @key['c']
        decrypted << "#{CHARMAP[amount % 39]}"
      else
        amount = starting_point - @key['d']
        decrypted << "#{CHARMAP[amount % 39]}"
      end
    end
    decrypted
  end
end




# require './lib/enigma'
# require 'date'
# e = Enigma.new
# puts "What message would you like to decrypt? "
# message = gets.chomp
#
# puts "What is the five digit key you recieved? "
# key = gets.chomp
# if key == 'random'
#   key = KeyGenerator.new.key
# elsif key == String
#   puts "Please enter a five digit number."
# elsif key.length < 5
#   puts "Please enter a five digit number."
# else
#   key = key.to_i
# end
# puts Date.today.strftime("%d,%m,%y")
# puts key
# puts e.decrypt(message, key)
