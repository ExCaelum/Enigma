require 'date'
require './lib/offset.rb'

class Encrypt

    CHARMAP = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x",
      "y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W",
      "X","Y","Z","0","1","2","3","4","5","6","7","8","9","@","#","$","%","^","&","*","(",")","[","]",",",
      ".","<",">",";",":","/","?","|","!"," "]

  def encrypt(message, key, date)
    @key = OffsetCalculator.new(key, date).calculate_code
    encrypted = ""
    message = message.strip
    message = message.chars
    message.each_with_index do |char, index|
      starting_point = CHARMAP.find_index(char)
      if index % 4 == 0
        amount = starting_point + @key['a']
        encrypted << "#{CHARMAP[amount % 84]}"
      elsif index % 4 == 1
        amount = starting_point + @key['b']
        encrypted << "#{CHARMAP[amount % 84]}"
      elsif index % 4 == 2
        amount = starting_point + @key['c']
        encrypted << "#{CHARMAP[amount % 84]}"
      else
        amount = starting_point + @key['d']
        encrypted << "#{CHARMAP[amount % 84]}"
      end
    end
    encrypted
  end
end
