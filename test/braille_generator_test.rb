require './test/test_helper'
require './lib/braille_generator.rb'
require './lib/text_handler'

class BrailleGeneratorTest < Minitest::Test

# TESTING THE FIRST LINE

  def test_it_can_generat_the_first_line_of_a_letter
    text = ("a")
    b = BrailleGenerator.new(text)
    assert_equal "0.", b.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_capital_letter
    text = ("A")
    b = BrailleGenerator.new(text)
    assert_equal "..0.", b.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_another_letter
    text = ("b")
    b = BrailleGenerator.new(text)
    assert_equal "0.", b.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_another_capital_letter
    text = ("B")
    b = BrailleGenerator.new(text)
    assert_equal "..0.", b.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_space
    text = (" ")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.first_line_to_braille(text)
  end

  def test_it_can_generate_the_first_line_of_a_symbol
    text = ("!")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.first_line_to_braille(text)
  end

  # TESTING THE SECOND LINE

  def test_it_can_generat_the_second_line_of_a_letter
    text = ("a")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_capital_letter
    text = ("A")
    b = BrailleGenerator.new(text)
    assert_equal "....", b.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_another_letter
    text = ("b")
    b = BrailleGenerator.new(text)
    assert_equal "0.", b.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_another_capital_letter
    text = ("B")
    b = BrailleGenerator.new(text)
    assert_equal "..0.", b.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_space
    text = (" ")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.second_line_to_braille(text)
  end

  def test_it_can_generate_the_second_line_of_a_symbol
    text = ("!")
    b = BrailleGenerator.new(text)
    assert_equal "00", b.second_line_to_braille(text)
  end

  # TESTING THE THIRD LINE

  def test_it_can_generat_the_third_line_of_a_letter
    text = ("a")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_capital_letter
    text = ("A")
    b = BrailleGenerator.new(text)
    assert_equal ".0..", b.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_another_letter
    text = ("b")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_another_capital_letter
    text = ("B")
    b = BrailleGenerator.new(text)
    assert_equal ".0..", b.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_space
    text = (" ")
    b = BrailleGenerator.new(text)
    assert_equal "..", b.third_line_to_braille(text)
  end

  def test_it_can_generate_the_third_line_of_a_symbol
    text = ("!")
    b = BrailleGenerator.new(text)
    assert_equal "0.", b.third_line_to_braille(text)
  end

  # TEST PHRASE GENERATION

  def test_it_can_generate_a_word
    text = ("cat")
    b = BrailleGenerator.new(text)
    b.text_to_braille
    assert_equal "000..0\n....00\n....0.", b.output
  end

  def test_it_can_generate_a_phrase
    text = ("cat bat")
    b = BrailleGenerator.new(text)
    b.text_to_braille
    assert_equal "000..0..0.0..0\n....00..0...00\n....0.......0.", b.output
  end

  def test_it_can_format_first_line
    text = ("test this line to see if it can be separated into an array of x braille characters")
    b = BrailleGenerator.new(text)
    b.text_to_braille
    b.first_line_set
  end


end
