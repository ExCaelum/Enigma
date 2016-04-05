require 'date'
require './lib/key_gen'
require 'pry'
class OffsetCalculator
  attr_reader :date, :key, :hashcode, :keyvalues

  def initialize(key = KeyGenerator.new.generate, date = Date.parse("2002-02-24"))
    @date = format_date(date)
    @key = key
    @hashcode
    @keyvalues = {'a' => 8, 'b' => 56, 'c' => 42, 'd' => 59, 'e' => 48, 'f' => 19, 'g' => 64, 'h' => 28, 'i' => 24, 'j' => 3,
                  'k' => 92, 'l' => 86, 'm' => 46, 'n' => 96, 'o' => 14, 'p' => 85, 'q' => 57, 'r' => 60, 's' => 67,
                  't' => 34, 'u' => 40, 'v' => 88, 'w' => 1, 'x' => 16, 'y' => 33, 'z' => 70}
  end

  def calculate_code
    create_code_arrays
    hash_code
  end

  private

  def format_date(date)
    date = date.strftime("%d%m%y").to_i
    date = (date ** 2).to_s
    date[-4..-1]
  end

  def create_a_value
    a = @key[0]
    a = @keyvalues[a]
    aoff = @date[0].to_i
    aval = a + aoff
  end

  def create_b_value
    b = @key[1]
    b = @keyvalues[b]
    boff = @date[1].to_i
    bval = b + boff
  end

  def create_c_value
    c = @key[2]
    c = @keyvalues[c]
    coff = @date[2].to_i
    cval = c + coff
  end

  def create_d_value
    d = @key[3]
    d = @keyvalues[d]
    doff = @date[3].to_i
    dval = d + doff
  end

  def create_code_arrays
    @key = key.to_s.chars
    @date = date.to_s.chars
  end

  def hash_code
    @hashcode = {}
    @hashcode["a"] = create_a_value
    @hashcode["b"] = create_b_value
    @hashcode["c"] = create_c_value
    @hashcode["d"] = create_d_value
    @hashcode
  end

end
