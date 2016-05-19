require './test/test_helper'
require './lib/converter.rb'

class ConverterTest < Minitest::Test
  attr_reader :con

  def setup
    @con = Converter.new
  end

  def test_it_can_convert_the_first_line_of_a_letter
    assert_equal "0.", con.first_line_to_braille("a")
  end

  def test_it_can_convert_the_first_line_of_another_letter
    assert_equal "0.", con.first_line_to_braille("b")
  end

  def test_it_can_store_the_first_line_of_a_letter_in_an_object
    assert_equal "0.", con.first_line_to_braille("a")
    assert_equal "0.", con.first_braille_line
  end

  def test_it_can_store_multiple_letters_in_an_object
    assert_equal "0.", con.first_line_to_braille("a")
    assert_equal "0.0.", con.first_line_to_braille("b")
    assert_equal "0.0.00", con.first_line_to_braille("d")
    assert_equal "0.0.00", con.first_braille_line
  end

  def test_it_can_convert_the_first_line_of_a_string
    con.string_it_up("add")
    assert_equal "0.0000", con.first_braille_line
  end

  def test_it_can_convert_the_second_line_of_a_letter
    assert_equal "..", con.second_line_to_braille("a")
  end

  def test_it_can_convert_the_second_line_of_a_string
    con.string_it_up("add")
    assert_equal "...0.0", con.second_braille_line
  end

  def test_it_can_convert_the_third_line_of_a_letter
    assert_equal "..", con.third_line_to_braille("a")
  end

  def test_it_can_convert_the_third_line_of_a_string
    con.string_it_up("add")
    assert_equal "......", con.third_braille_line
  end

end
