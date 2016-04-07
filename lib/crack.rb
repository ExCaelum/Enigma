require './lib/enigma'
require 'date'

class Crack
  attr_reader :temp_key

  def crack(message=nil, date=nil)
    key = KeyGenerator.new
    enigma = Enigma.new
    temp_message = message
    final_date = date || Date.today
    offset = OffsetCalculator.new(nil, final_date)
    decode(key, message, temp_message, final_date, enigma)
  end

  private

  def decode(key, message, temp_message, final_date, enigma)
    while message[-7..-1] != "..end.."
      temp_key = key.codewords.sample
      message = enigma.decrypt(temp_message, temp_key, final_date)
      decoded = "#{message}, #{temp_key}"
    end
    decoded
  end
end
