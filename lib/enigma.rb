require 'date'
require_relative 'offset.rb'
require 'pry'
class Enigma
  attr_reader :key, :charmap

  def initialize
    @charmap = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
                't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ', '.', ',',]
  end

  def encrypt(message, key = KeyGenerator, date = Date.today)
    @key = OffsetCalculator.new(key, date).calculate_code
    encrypted = ""
    message = message << ' ..end..'
    message = message.downcase
    message = message.chars
    message.each_with_index do |char, index|
      starting_point = @charmap.find_index(char)
      if index % 4 == 0
        amount = starting_point + @key['a']
        encrypted << "#{@charmap[amount % 39]}"
      elsif index % 4 == 1
        amount = starting_point + @key['b']
        encrypted << "#{@charmap[amount % 39]}"
      elsif index % 4 == 2
        amount = starting_point + @key['c']
        encrypted << "#{@charmap[amount % 39]}"
      else
        amount = starting_point + @key['d']
        encrypted << "#{@charmap[amount % 39]}"
      end
    end
    encrypted
  end

  def decrypt(message, key = KeyGenerator, date = Date.today)
    @key = OffsetCalculator.new(key, date).calculate_code
    decrypted = ""
    message.chars.each_with_index do |char, index|
      starting_point = @charmap.find_index(char)
      if index % 4 == 0
        amount = starting_point - @key['a']
        decrypted << "#{@charmap[amount % 39]}"
      elsif index % 4 == 1
        amount = starting_point - @key['b']
        decrypted << "#{@charmap[amount % 39]}"
      elsif index % 4 == 2
        amount = starting_point - @key['c']
        decrypted << "#{@charmap[amount % 39]}"
      else
        amount = starting_point - @key['d']
        decrypted << "#{@charmap[amount % 39]}"
      end
    end
    decrypted
  end
end
