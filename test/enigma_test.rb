require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_encrypt_works
    assert_equal '!oI$[F', @e.encrypt('parker', "gone", Date.parse("2016-04-02"))
  end

  def test_encrypt_has_default_random_key
    key = KeyGenerator.new
    @e.encrypt("this is my message")

    assert key.codewords.include?(@e.keyword)
  end

  def test_you_can_assign_custom_keys
    @e.encrypt("message", "doom", Date.today)

    assert_equal "doom", @e.keyword
  end

  def test_you_can_assign_custom_dates_to_encrypt
    assert_equal "uWE<j%", @e.encrypt('parker', "lead", Date.parse("2016-04-06"))
  end

  def test_decrypt_works
    assert_equal 'parker ..end..', @e.decrypt(':yP$&PxS1CL51o', "rife", Date.parse("2016-04-06"))
  end

  def test_decrypt_is_assigned_key
    @e.decrypt("message", "doom", Date.today)

    assert_equal "doom", @e.keyword
  end

  def test_decrypt_is_assigned_date
    @e.decrypt("kutqrngdh3ldb", "claw", Date.parse("2002-02-24 "))
    assert_equal "240202", @e.num.strftime("%d%m%y")
  end

  def test_you_can_decrypt_with_custom_dates
    assert_equal 'hello ..end..', @e.decrypt("[oJ[:joY*xBY2", "glib", Date.parse("2002-02-24 "))
  end

  def test_you_can_encrypt_then_decrypt
    assert_equal 'bycC.P', @e.encrypt('parker', "sign", Date.parse("2016-04-02"))
    assert_equal 'parker', @e.decrypt('bycC.P', "sign", Date.parse("2016-04-02"))
  end

  def test_you_can_crack
    decoded = "This is the test message for the Crack function ..end.."
    encoded = "CjL?^kV9cjH9cgV|^oH?bcJ^^hR/^vK^^EU@(mC&dpF|<qQ95>H<)>t"
    assert_equal "#{decoded}, glib", @e.crack(encoded, Date.parse("2016-04-06"))
  end
end
