require './test/test_helper'
require './lib/braille_converter.rb'
require './lib/file_handler'

class BrailleConverterTest < Minitest::Test

  def test_it_can_convert_the_first_line_of_a_letter
    text = ("a")
    con = BrailleConverter.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
  end

  def test_it_can_convert_the_first_line_of_another_letter
    text = ("b")
    con = BrailleConverter.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
  end

  def test_it_can_store_the_first_line_of_a_letter_in_an_object
    text = ("b")
    con = BrailleConverter.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
    assert_equal "0.", con.first_braille_line
  end

  def test_it_can_convert_the_first_line_of_a_string
    text = ("add")
    con = BrailleConverter.new(text)
    con.string_it_up
    assert_equal "0.0000", con.first_braille_line
  end

  def test_it_can_convert_the_second_line_of_a_letter
    text = ("d")
    con = BrailleConverter.new(text)
    assert_equal ".0", con.second_line_to_braille(text)
  end

  def test_it_can_convert_the_second_line_of_a_string
    text = ("add")
    con = BrailleConverter.new(text)
    con.string_it_up
    assert_equal "...0.0", con.second_braille_line
  end

  def test_it_can_convert_the_third_line_of_a_letter
    text = ("a")
    con = BrailleConverter.new(text)
    assert_equal "..", con.third_line_to_braille(text)
  end

  def test_it_can_convert_the_third_line_of_a_string
    text = ("add")
    con = BrailleConverter.new(text)
    con.string_it_up
    assert_equal "......", con.third_braille_line
  end

  def test_it_can_assemble_the_output_of_one_word
    text = ("add")
    con = BrailleConverter.new(text)
    con.string_it_up
    assert_equal "0.0000\n...0.0\n......", con.output
  end

  def test_it_can_coallate_the_output_of_a_phrase_including_spaces
    text = ("add bat bad add")
    con = BrailleConverter.new(text)
    con.string_it_up
    assert_equal "0.0000 0.0..0 0.0.00 0.0000\n...0.0 0...00 0....0 ...0.0\n...... ....0. ...... ......", con.output
  end

  #MORE TESTS FOR CHARACTERS AND EDGE TESTS

end
