require './lib/enigma'
require 'date'

class Cracker
  attr_reader :decrypted, :enimga

  def crack_file
    message = File.read(ARGV[0])
    @enigma = Enigma.new
    @cracked = @enigma.crack(message, date)
    @key = @cracked[-4..-1]
  end

  def write_to_file
    File.write(ARGV[1], @cracked[0..-7])
    puts "Cracked to #{ARGV[1]} with the cracked key '#{@key}' and date #{@enigma.num.strftime("%d%m%y")}"
  end

  private

  def date
    if ARGV[2] == nil
      Date.today
    else
      Date.parse(ARGV[2])
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  e = Cracker.new
  e.crack_file
  e.write_to_file
end
