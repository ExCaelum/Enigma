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
    assert_equal 'vi4rkz', @e.encrypt('parker', "claw", Date.parse("2016-04-02"))
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
    assert_equal "yo4rn5", @e.encrypt('parker', "claw", Date.parse("2016-02-04"))
  end

  def test_decrypt_works
    assert_equal 'parker ..end..', @e.decrypt('vi4rkzkfem0keg', "claw", Date.parse("2016-04-02"))
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
    assert_equal 'hello ..end..', @e.decrypt("kutqrngdh3ldb", "claw", Date.parse("2002-02-24 "))
  end

  def test_you_can_encrypt_then_decrypt
    assert_equal 'vi4rkz', @e.encrypt('parker', "claw", Date.parse("2016-04-02"))
    assert_equal 'parker', @e.decrypt('vi4rkz', "claw", Date.parse("2016-04-02"))
  end

  def test_you_can_crack #uses clue
    decoded = "This is the test message for the Crack function ..end.."
    encoded = "&c;NMdEVFc7VF`EOMh7NE\9@MaAMMo:@M>D<5fMAGi5O;j@V[)7I6)["
    assert_equal decoded, @e.crack(encoded, Date.parse("2016-04-06"))
end
