require './lib/enigma'
require 'date'

class Crack

  # CHARMAP = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x",
  #   "y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W",
  #   "X","Y","Z","0","1","2","3","4","5","6","7","8","9","@","#","$","%","^","&","*","(",")","[","]",",",
  #   ".","<",">",";",":","/","?","|","!"," "]

  def crack(message=nil, date=nil)
    @key = KeyGenerator.new
    @enigma = Enigma.new
    @message = message
    @date = date || Date.today
    offset = OffsetCalculator.new(nil, @date)
    while message[-7..-1] != "..end.."
      @temp_key = @key.codewords.sample
      message = @enigma.decrypt(@message, @temp_key, @date)
      decoded = "#{message}, #{@temp_key}"
    end
    decoded
  end
end

# def crack(message=nil, date=nil)
#   @key = KeyGenerator.new
#   @enigma = Enigma.new
#   @message = message
#   @date = date || Date.today
#   offset = OffsetCalculator.new(nil, @date)
#   100000.times do
#     temp_key = @key.codewords.sample
#     temp_message = @enigma.decrypt(@message, temp_key, @date)
#     return temp_array = [temp_message, temp_key] if temp_message[-7..-1] == "..end.."
#   end
# end





# def crack(message, date)
#   enigma = Enigma.new
#   counter = 0
#   60.times do
#     enigma.decrypt(message, )
#
# end


# if message.length % 4 == 0
#   message[-4..-1] = "nd.."
# elsif message.length % 4 == 1
#   message[-5..-2] = "end."
# elsif message.length % 4 == 2
#   message[-6..-3] = ".end"
# else message.length % 4 == 3
#   message[-7..-4] = "..en"
# end
