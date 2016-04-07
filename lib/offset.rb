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

  def create_a_value
    a_letter = key[0]
    first_value = keyvalues[a_letter]
    a_offset = date[0].to_i
    first_value + a_offset
  end

  def create_b_value
    b_letter = key[1]
    second_value = keyvalues[b_letter]
    b_offset = date[1].to_i
    second_value + b_offset
  end

  def create_c_value
    c_letter = key[2]
    third_value = keyvalues[c_letter]
    c_offset = date[2].to_i
    third_value + c_offset
  end

  def create_d_value
    d_letter = key[3]
    fourth_value = keyvalues[d_letter]
    d_offset = date[3].to_i
    fourth_value + d_offset
  end

  def modify_offsets
    @key = key.to_s.chars
    @date = date.to_s.chars
  end

  def create_code
    code = {}
    code["a"] = create_a_value
    code["b"] = create_b_value
    code["c"] = create_c_value
    code["d"] = create_d_value
    code
  end

end
