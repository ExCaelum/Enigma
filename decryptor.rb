require './lib/enigma'
require 'date'

class Decryptor
  attr_reader :decrypted, :enimga

  def decrypt_file
    message = File.read(ARGV[0])
    @enigma = Enigma.new
    @decrypted = @enigma.decrypt(message, ARGV[2])
  end

  def write_to_file
    File.write(ARGV[1], @decrypted)
    puts "Decrypted to #{ARGV[1]} with the key '#{@enigma.keyword}' and date #{@enigma.num.strftime("%d%m%y")}"
  end
end

if __FILE__ == $PROGRAM_NAME
  e = Decryptor.new
  e.decrypt_file
  e.write_to_file
end
