require './test/test_helper'
require './lib/converter.rb'

class ConverterTest < Minitest::Test

  def test_it_can_convert_the_first_line_of_a_letter
    text = ("a")
    con = Converter.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
  end

  def test_it_can_convert_the_first_line_of_another_letter
    text = ("b")
    con = Converter.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
  end

  def test_it_can_store_the_first_line_of_a_letter_in_an_object
    text = ("b")
    con = Converter.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
    assert_equal "0.", con.first_braille_line
  end
  #
  # def test_it_can_store_multiple_letters_in_an_object
  #   text = ("ad")
  #   con = Converter.new(text)
  #   assert_equal "0.0.00", con.first_line_to_braille
  #   assert_equal "0.0.00", con.first_braille_line
  # end
  #
  def test_it_can_convert_the_first_line_of_a_string
    text = ("add")
    con = Converter.new(text)
    con.string_it_up
    assert_equal "0.0000", con.first_braille_line
  end

  def test_it_can_convert_the_second_line_of_a_letter
    text = ("d")
    con = Converter.new(text)
    assert_equal ".0", con.second_line_to_braille(text)
  end

  def test_it_can_convert_the_second_line_of_a_string
    text = ("add")
    con = Converter.new(text)
    con.string_it_up
    assert_equal "...0.0", con.second_braille_line
  end

  def test_it_can_convert_the_third_line_of_a_letter
    text = ("a")
    con = Converter.new(text)
    assert_equal "..", con.third_line_to_braille(text)
  end

  def test_it_can_convert_the_third_line_of_a_string
    text = ("add")
    con = Converter.new(text)
    con.string_it_up
    assert_equal "......", con.third_braille_line
  end

  def test_it_can_assemble_one_letter
    # test is rigged to pass for now
    text = ("add")
    con = Converter.new(text)
    con.string_it_up
    assert_equal ["0.0000", "...0.0", "......"], con.assembled
    con.write
  end

end
