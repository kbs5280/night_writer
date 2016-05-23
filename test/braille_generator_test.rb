require './test/test_helper'
require './lib/braille_generator.rb'
require './lib/file_handler'

class BrailleGeneratorTest < Minitest::Test

# TESTING THE FIRST LINE

  def test_it_can_generat_the_first_line_of_a_letter
    text = ("a")
    con = BrailleGenerator.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_capital_letter
    text = ("A")
    con = BrailleGenerator.new(text)
    assert_equal "..0.", con.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_another_letter
    text = ("b")
    con = BrailleGenerator.new(text)
    assert_equal "0.", con.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_another_capital_letter
    text = ("B")
    con = BrailleGenerator.new(text)
    assert_equal "..0.", con.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_space
    text = (" ")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_symbol
    text = ("!")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_number
    text = ("1")
    con = BrailleGenerator.new(text)
    assert_equal ".0", con.first_line_to_braille(text)
  end

  # TESTING THE SECOND LINE

  def test_it_can_generat_the_second_line_of_a_letter
    text = ("a")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_capital_letter
    text = ("A")
    con = BrailleGenerator.new(text)
    assert_equal "....", con.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_another_letter
    text = ("b")
    con = BrailleGenerator.new(text)
    assert_equal "0.", con.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_another_capital_letter
    text = ("B")
    con = BrailleGenerator.new(text)
    assert_equal "..0.", con.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_space
    text = (" ")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_symbol
    text = ("!")
    con = BrailleGenerator.new(text)
    assert_equal "00", con.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_number
    text = ("1")
    con = BrailleGenerator.new(text)
    assert_equal "00", con.second_line_to_braille(text)
  end

  # TESTING THE THIRD LINE

  def test_it_can_generat_the_third_line_of_a_letter
    text = ("a")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_capital_letter
    text = ("A")
    con = BrailleGenerator.new(text)
    assert_equal ".0..", con.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_another_letter
    text = ("b")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_another_capital_letter
    text = ("B")
    con = BrailleGenerator.new(text)
    assert_equal ".0..", con.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_space
    text = (" ")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_symbol
    text = ("!")
    con = BrailleGenerator.new(text)
    assert_equal "0.", con.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_number
    text = ("1")
    con = BrailleGenerator.new(text)
    assert_equal "..", con.third_line_to_braille(text)
  end

  # TEST PHRASE GENERATION

  def test_it_can_generate_a_word
    text = ("cat")
    con = BrailleGenerator.new(text)
    con.text_to_braille
    assert_equal "000..0\n....00\n....0.", con.output
  end

  def test_it_can_generate_a_phrase
    text = ("1 cat bat")
    con = BrailleGenerator.new(text)
    con.text_to_braille
    assert_equal ".0..000..0..0.0..0\n00......00..0...00\n........0.......0.", con.output
  end

end
