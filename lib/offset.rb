require 'date'
require './lib/key_gen'
require 'pry'
class OffsetCalculator
  attr_reader :date, :key, :code, :keyvalues

  def initialize(key = KeyGenerator.new.generate, date = Date.parse("2002-02-24"))
    @date = format_date(date)
    @key = key
    @keyvalues = {'a' => 8, 'b' => 56, 'c' => 42, 'd' => 59, 'e' => 48, 'f' => 19, 'g' => 64, 'h' => 28, 'i' => 24, 'j' => 3,
                  'k' => 92, 'l' => 86, 'm' => 46, 'n' => 96, 'o' => 14, 'p' => 85, 'q' => 57, 'r' => 60, 's' => 67,
                  't' => 34, 'u' => 40, 'v' => 88, 'w' => 1, 'x' => 16, 'y' => 33, 'z' => 70}
  end

  def calculate_code
    modify_offsets
    create_code
  end

  private

  def format_date(date)
    date = date.strftime("%d%m%y").to_i
    date = (date ** 2).to_s
    date[-4..-1]
  end

  def create_value(i)
    letter = key[i]
    value = keyvalues[letter]
    offset = date[i].to_i
    value + offset
  end

  def modify_offsets
    @key = key.to_s.chars
    @date = date.to_s.chars
  end

  def create_code
    code = {}
    code["a"] = create_value(0)
    code["b"] = create_value(1)
    code["c"] = create_value(2)
    code["d"] = create_value(3)
    code
  end

end
