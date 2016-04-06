require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require 'Minitest/pride'
require 'date'
require './lib/offset'
require 'pry'

class OffsetCalculatorTest < Minitest::Test
  def setup
    @offset = OffsetCalculator.new
  end

  def test_OffsetCalculator_exists
    assert_equal OffsetCalculator, @offset.class
  end

  def test_OffsetCalculator_has_key
    assert @offset.key
  end

  def test_OffsetCalculator_can_be_assigned_key
    offset = OffsetCalculator.new("fish")

    assert_equal "fish", offset.key
  end

  def test_can_insert_custom_dates
    date = Date.parse("2002-02-24")
    offset = OffsetCalculator.new("claw", date)

    assert_equal "0804", offset.date
  end

  def test_the_date_is_encoded
    date = Date.parse("2016-04-02")
    offset = OffsetCalculator.new("thom", date)

    assert_equal "3056", offset.date
  end

  def test_code_is_finalized
    date = Date.parse("2016-04-02")
    offset = OffsetCalculator.new("wash", date)
    answer = ({'a' => 4, 'b' => 8, 'c' => 72, 'd' => 34})

    assert_equal answer, offset.calculate_code
  end
end
