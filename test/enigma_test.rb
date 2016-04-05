require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_encrypt_works
    assert_equal '4xrwtb kn1npnv', @e.encrypt('parker', 12345, Date.parse("2016-04-02"))
  end


  def test_you_can_assign_custom_codes_to_encrypt
    assert_equal "73rwwh kq7npq1", @e.encrypt('parker', 12345, Date.parse("2016-02-04"))
  end

  def test_decrypt_works
    assert_equal 'parker', @e.decrypt('4xrwtb', 12345, Date.parse("2016-04-02"))
  end

  def test_you_can_assign_custom_codes_to_decrypt
    assert_equal 'hello ..end..', @e.decrypt("r05tytsgo9xgi", 49204, Date.parse("2002-02-24 "))
  end

  def test_character_map_is_correct
    assert_equal 39, @e.charmap.count
  end

end
