require_relative 'test_helper'
require './lib/text_handler.rb'

class TextHandlerTest < Minitest::Test

  def test_it_can_read_in_a_file
    filename = "./input/phrase.txt"
    handler = TextHandler.new(filename)

    assert_equal "1 bad cat bat!\n", handler.input
  end

  def test_it_can_parse_the_file
    filename = "./input/phrase.txt"
    handler = TextHandler.new(filename)

    assert_equal "1 bad cat bat!", handler.text
  end

  def test_it_can_record_the_time
    filename = "./input/phrase.txt"
    handler = TextHandler.new(filename)

    assert_equal Time.now.strftime("%Y-%m-%e-%I:%M%p"), handler.time
  end

  def test_it_can_count_characters_in_a_file
    filename = "./input/phrase.txt"
    handler = TextHandler.new(filename)

    assert_equal "6", handler.write("0.....")
  end

end
