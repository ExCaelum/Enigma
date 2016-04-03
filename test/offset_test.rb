require 'Minitest/autorun'
require 'Minitest/pride'
require 'date'
require '../lib/offset'
require 'pry'

class OffsetCalculatorTest < Minitest::Test
  def setup
    @offset = OffsetCalculator.new
  end

  def test_OffsetCalculator_exists
    assert_equal OffsetCalculator, @offset.class
  end

  def test_OffsetCalculator_has_key
    refute_equal nil, @offset.key
  end

  def test_OffsetCalculator_can_be_assigned_key
    offset = OffsetCalculator.new(38563)

    assert_equal 38563, offset.key
  end

  def test_can_insert_custom_dates
    date = Date.parse("2002-02-24")
    offset = OffsetCalculator.new(38945, date)
    assert_equal 804, offset.date
  end

  def test_the_date_is_encoded
    date = Date.parse("2016-04-02")
    offset = OffsetCalculator.new(75839, date)
    assert_equal 3056, offset.date
  end

  def test_code_is_finalized
    date = Date.parse("2016-04-02")
    offset = OffsetCalculator.new(91303, date)
    offset.create_code

    assert_equal 94, offset.aval
    assert_equal 13, offset.bval
    assert_equal 35, offset.cval
    assert_equal 9, offset.dval
  end
end
