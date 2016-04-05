require 'date'
require_relative 'key_gen'
require 'pry'
class OffsetCalculator
  attr_reader :date, :key, :hashcode

  def initialize(key = KeyGenerator.new.key, date = Date.parse("2002-02-24"))
    @date = format_date(date)
    @key = key
    @hashcode
  end

  def format_date(date)
    date = date.strftime("%d%m%y").to_i
    date = (date ** 2).to_s
    date[-4..-1]
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
    a = @key[0..1].join.to_i
    aoff = @date[0].to_i
    aval = a + aoff
  end

  def create_b_value
    b = @key[1..2].join.to_i
    boff = @date[1].to_i
    bval = b + boff
  end

  def create_c_value
    c = @key[2..3].join.to_i
    coff = @date[2].to_i
    cval = c + coff
  end

  def create_d_value
    d = @key[3..4].join.to_i
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
