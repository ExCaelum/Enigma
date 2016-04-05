require 'Minitest/autorun'
require 'Minitest/pride'
require '../lib/key_gen'
require 'pry'

class KeyGenTest < Minitest::Test
  def setup
    @key = KeyGenerator.new
  end

  def test_key_generator_exists
    assert_equal KeyGenerator, @key.class
  end

  def test_can_generate_keys
    assert_equal @key.key, @key.key
  end

  def test_it_can_be_assigned_keys
    key = KeyGenerator.new(19439)
    assert_equal 19439, key.key
  end
end
