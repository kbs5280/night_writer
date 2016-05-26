require_relative 'test_helper'
require './lib/braille_handler.rb'

class BrailleHandlerTest < Minitest::Test
  attr_reader :handler

  def setup
    input_file= "./input/braille_phrase.txt"
    output_file = "this_is_a_test_message.txt"
    @handler = BrailleHandler.new(input_file, output_file)
  end

  def test_it_can_read_in_a_file
    assert_equal ["..000..0..0.0..0..", "......00..0...000.", ".0....0.......0.00"], handler.input
  end

  def test_it_can_parse_the_first_line_of_the_file
    handler.braille_parser

    assert_equal [["..", "00", "0.", ".0", "..", "0.", "0.", ".0", ".."]], handler.braille_by_line[0]
  end

  def test_it_can_parse_the_second_line_of_the_file
    handler.braille_parser

    assert_equal [["..", "..", "..", "00", "..", "0.", "..", "00", "0."]], handler.braille_by_line[1]
  end

  def test_it_can_parse_the_third_line_of_the_file
    handler.braille_parser

    assert_equal [[".0", "..", "..", "0.", "..", "..", "..", "0.", "00"]], handler.braille_by_line[2]
  end

  def test_it_writes_to_file
    handler.write("Test it writes to a file.")

    assert_equal "Test it writes to a file.", File.read("this_is_a_test_message.txt")
  end

  def test_it_can_count_characters_in_a_file
    assert_equal "15", handler.write("add bat bad add")
  end

end
