require_relative 'test_helper'
require './lib/text_handler.rb'

class TextHandlerTest < Minitest::Test
  attr_reader :handler

  def setup
    input_file = "./input/phrase.txt"
    output_file = "this_is_a_braille_message.txt"
    @handler = TextHandler.new(input_file, output_file)
  end

  def test_it_can_read_in_a_file
    assert_equal "bad cat bat!\n", handler.input
  end

  def test_it_can_parse_the_file
    assert_equal "bad cat bat!", handler.text
  end

  def test_it_writes_to_file
    handler.write("Test it writes to a file.")

    assert_equal "Test it writes to a file.", File.read("this_is_a_test_message.txt")
  end

  def test_it_can_count_characters_in_a_file
    assert_equal "12", handler.write("00..00..00..")
  end

end
