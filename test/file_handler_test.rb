require_relative 'test_helper'
require './lib/file_handler.rb'

class FileHandlerTest < Minitest::Test

  def test_it_can_read_in_a_file
    filename = "./text_files/phrase.txt"
    handler = FileHandler.new(filename)

    assert_equal "add bat bad add\n", handler.input
  end

  def test_it_can_parse_the_file
    filename = "./text_files/phrase.txt"
    handler = FileHandler.new(filename)

    assert_equal "add bat bad add", handler.text
  end

  def test_it_can_record_the_time
    filename = "./text_files/phrase.txt"
    handler = FileHandler.new(filename)

    assert_equal Time.now.strftime("%Y-%m-%e-%I:%M%p"), handler.time
  end

  def test_it_can_count_characters_in_a_file
    filename = "./text_files/phrase.txt"
    handler = FileHandler.new(filename)

    assert_equal "15", handler.write("add bat bad add")
  end

end
