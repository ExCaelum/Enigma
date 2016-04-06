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


  def test_you_can_assign_custom_dates_to_encrypt
    assert_equal "yo4rn5", @e.encrypt('parker', "claw", Date.parse("2016-02-04"))
  end

  def test_decrypt_works
    assert_equal 'parker ..end..', @e.decrypt('vi4rkzkfem0keg', "claw", Date.parse("2016-04-02"))
  end

  def test_you_can_assign_custom_dates_to_decrypt
    assert_equal 'hello ..end..', @e.decrypt("kutqrngdh3ldb", "claw", Date.parse("2002-02-24 "))
  end

end
