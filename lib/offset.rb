require 'date'
require_relative 'key_gen'
require 'pry'
class OffsetCalculator
  attr_reader :date, :key, :aval, :bval, :cval, :dval

  def initialize(key = KeyGenerator.new.key, date = Date.today)
    @date = ((((date.strftime("%d%m%y").to_i) ** 2).to_s)[-4..-1]).to_i
    @key = key
    @aval
    @bval
    @cval
    @dval
  end

  def create_code
    create_code_arrays
    create_a_value
    create_b_value
    create_c_value
    create_d_value
  end

  private

  def create_a_value
    a = @key[0..1].join.to_i
    aoff = @date[0].to_i
    @aval = a + aoff
  end

  def create_b_value
    b = @key[1..2].join.to_i
    boff = @date[1].to_i
    @bval = b + boff
  end

  def create_c_value
    c = @key[2..3].join.to_i
    coff = @date[2].to_i
    @cval = c + coff
  end

  def create_d_value
    d = @key[3..4].join.to_i
    doff = @date[3].to_i
    @dval = d + doff
  end

  def create_code_arrays
    @key = key.to_s.chars
    @date = date.to_s.chars
  end

end
