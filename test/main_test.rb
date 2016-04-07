require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require 'Minitest/pride'
require 'pry'
require './cracker.rb'
require './decryptor.rb'
require './encryptor.rb'
require 'date'

class MainTest < Minitest::Test
  ENCRYPTED_TEXT = "!3pAK4zh40zBT9nh43lhQ*uk44vvL7pB9VvnK0uk2]wBAVkmN%Fx4LgiYZgk2WjsK1ptPVymLZlz3VhvOVDzT&lz3V|!P9k!B"
  DECRYPTED_TEXT = "This is testing the functionality of encrypt, decrypt, and crack file readers and writers ..end.."

  def test_encryptor_can_encrypt_from_terminal
    ARGV[0] = File.join(Dir.pwd,'/test/support/sample.txt')
    output_file = File.join(Dir.pwd,'/test/support/encrypt.txt')
    ARGV[1] = output_file
    ARGV[2] = 'tell'
    ARGV[3] = "2016-04-07"
    e = Encryptor.new
    e.encrypt_file
    e.write_to_file

    assert_equal File.read(output_file), ENCRYPTED_TEXT
  end

  def test_decryptor_can_decrypt_from_terminal
    ARGV[0] = File.join(Dir.pwd,'/test/support/encrypt.txt')
    output_file = File.join(Dir.pwd, '/test/support/decrypt.txt')
    ARGV[1] = output_file
    ARGV[2] = 'tell'
    ARGV[3] = "2016-04-07"
    d = Decryptor.new
    d.decrypt_file
    d.write_to_file

    assert_equal File.read(output_file), DECRYPTED_TEXT
  end

  def test_cracker_can_crack_from_terminal
    ARGV[0] = File.join(Dir.pwd,'/test/support/encrypt.txt')
    output_file = File.join(Dir.pwd, '/test/support/decrypt.txt')
    ARGV[1] = output_file
    ARGV[2] = "2016-04-07"
    c = Cracker.new
    c.crack_file
    c.write_to_file

    assert_equal File.read(output_file), DECRYPTED_TEXT
  end
end
