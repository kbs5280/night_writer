require_relative 'test_helper'
require './lib/braille_handler.rb'

class BrailleHandlerTest < Minitest::Test
  attr_reader :filename,
              :handler

  def setup
    @filename = "./input/braille_phrase.txt"
    @handler = BrailleHandler.new(filename)
  end

  def test_it_can_read_in_a_file
    assert_equal "..000..0..0.0..0\n......00..0...00\n.0....0.......0.\n", handler.input
  end

  def test_it_can_parse_the_first_line_of_the_file
    assert_equal ["..", "00", "0.", ".0", "..", "0.", "0.", ".0"], handler.first_braille_line
  end

  def test_it_can_parse_the_second_line_of_the_file
    assert_equal ["..", "..", "..", "00", "..", "0.", "..", "00"], handler.second_braille_line
  end

  def test_it_can_parse_the_third_line_of_the_file
    assert_equal [".0", "..", "..", "0.", "..", "..", "..", "0."], handler.third_braille_line
  end

  def test_it_can_record_the_time
    assert_equal Time.now.strftime("%Y-%m-%e-%I:%M%p"), handler.time
  end

  def test_it_can_count_characters_in_a_file
    assert_equal "15", handler.write("add bat bad add")
  end

end
