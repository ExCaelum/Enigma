require './lib/enigma'
require 'date'

class Encryptor
  attr_reader :encrypted, :enimga

  def encrypt_file
    message = File.read(ARGV[0])
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt(message, key, date)
  end

  def write_to_file
    File.write(ARGV[1], @encrypted)
    puts "Created #{ARGV[1]} with the key '#{@enigma.keyword}' and date #{@enigma.num.strftime("%d%m%y")}"
  end

  private

  def date
    if ARGV[3] == nil
      Date.today
    else
      Date.parse(ARGV[3])
    end
  end

  def key
    if ARGV[2] == nil
      KeyGenerator.new.generate
    else
      ARGV[2]
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  e = Encryptor.new
  e.encrypt_file
  e.write_to_file
end
