require 'date'
require './lib/offset.rb'
require 'pry'

class Rotator
  attr_reader :final_message

    CHARMAP = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x",
      "y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W",
      "X","Y","Z","0","1","2","3","4","5","6","7","8","9","@","#","$","%","^","&","*","(",")","[","]",",",
      ".","<",">",";",":","/","?","|","!"," "]

  def initialize
    @final_message = ""
  end

  def encrypt(message, key, date)
    key = standard_key(key, date)
    rotation(message, key)
    final_message
  end

  def decrypt(message, key, date)
    key = decryption_key(key, date)
    rotation(message, key)
    final_message
  end

  private

  def decryption_key(key, date)
    keyhash = standard_key(key, date)
    keyhash.each {|key, value| keyhash[key] = value * -1}
  end

  def standard_key(key, date)
    OffsetCalculator.new(key, date).calculate_code
  end

  def rotation(message, key)
    message = message.strip.chars
    message.each_with_index do |char, index|
      cipher(char, index, key)
    end
  end

  def cipher(char, index, key)
    starting_point = CHARMAP.find_index(char)
    if index % 4 == 0
      offset_a(starting_point, key)
    elsif index % 4 == 1
      offset_b(starting_point, key)
    elsif index % 4 == 2
      offset_c(starting_point, key)
    else
      offset_d(starting_point, key)
    end
  end

  def offset_a(starting_point, key)
    amount = starting_point + key['a']
    final_message << "#{CHARMAP[amount % CHARMAP.length]}"
  end

  def offset_b(starting_point, key)
    amount = starting_point + key['b']
    final_message << "#{CHARMAP[amount % CHARMAP.length]}"
  end

  def offset_c(starting_point, key)
    amount = starting_point + key['c']
    final_message << "#{CHARMAP[amount % CHARMAP.length]}"
  end

  def offset_d(starting_point, key)
    amount = starting_point + key['d']
    final_message << "#{CHARMAP[amount % CHARMAP.length]}"
  end
end
