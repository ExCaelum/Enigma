require 'date'
require './lib/offset.rb'
require './lib/encrypt.rb'
require './lib/decrypt.rb'
require './lib/crack.rb'
require 'pry'
class Enigma
  attr_accessor :keyword, :num

  def encrypt(message, key = KeyGenerator.new.generate, date = Date.today)
    @keyword = key
    @num = date
    Encrypt.new.encrypt(message, key, date)
  end

  def decrypt(message, key = KeyGenerator.new.generate, date = Date.today)
    @keyword = key
    @num = date
    Decrypt.new.decrypt(message, key, date)
  end

  def crack(message, date = Date.today)
    @num = date
    @decoder = Crack.new.crack(message, date)
  end
end
