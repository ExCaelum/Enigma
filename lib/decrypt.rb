require 'date'
require './lib/offset.rb'

class Decrypt

    CHARMAP = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x",
      "y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W",
      "X","Y","Z","0","1","2","3","4","5","6","7","8","9","@","#","$","%","^","&","*","(",")","[","]",",",
      ".","<",">",";",":","/","?","|","!"," "]

  def decrypt(message, key, date)
    key = OffsetCalculator.new(key, date).calculate_code
    decrypted = ""
    message.chars.each_with_index do |char, index|
      cipher(char, index, key, decrypted)
    end
    decrypted
  end

  private

  def cipher(char, index, key, decrypted)
    starting_point = CHARMAP.find_index(char)
    if index % 4 == 0
      offset_a(starting_point, key, decrypted)
    elsif index % 4 == 1
      offset_b(starting_point, key, decrypted)
    elsif index % 4 == 2
      offset_c(starting_point, key, decrypted)
    else
      offset_d(starting_point, key, decrypted)
    end
  end

  def offset_a(starting_point,key, decrypted)
    amount = starting_point - key['a']
    decrypted << "#{CHARMAP[amount % 84]}"
  end

  def offset_b(starting_point, key, decrypted)
    amount = starting_point - key['b']
    decrypted << "#{CHARMAP[amount % 84]}"
  end

  def offset_c(starting_point, key, decrypted)
    amount = starting_point - key['c']
    decrypted << "#{CHARMAP[amount % 84]}"
  end

  def offset_d(starting_point, key, decrypted)
    amount = starting_point - key['d']
    decrypted << "#{CHARMAP[amount % 84]}"
  end
end
