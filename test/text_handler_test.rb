require_relative 'test_helper'
require './lib/text_handler.rb'

class TextHandlerTest < Minitest::Test
  attr_reader :filename,
              :handler

  def setup
    @filename = "./input/phrase.txt"
    @handler = TextHandler.new(filename)
  end

  def test_it_can_read_in_a_file
    assert_equal "bad cat bat!\n", handler.input
  end

  def test_it_can_parse_the_file
    assert_equal "bad cat bat!", handler.text
  end

  def test_it_can_record_the_time
    assert_equal Time.now.strftime("%Y-%m-%e-%I:%M%p"), handler.time
  end

  def test_it_can_count_character
    assert_equal "6", handler.write("0.....")
  end

end
