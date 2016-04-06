require './lib/enigma'
require 'date'

class Cracker
  attr_reader :decrypted, :enimga

  def crack_file
    message = File.read(ARGV[0])
    @enigma = Enigma.new
    date = Date.parse(ARGV[2])
    @cracked = @enigma.crack(message, date)
  end

  def write_to_file
    File.write(ARGV[1], @cracked)
    puts "Cracked to #{ARGV[1]} with the key '#{@decoder.temp_key}' and date #{@enigma.num.strftime("%d%m%y")}"
  end
end

if __FILE__ == $PROGRAM_NAME
  e = Cracker.new
  e.crack_file
  e.write_to_file
end
