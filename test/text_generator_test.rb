require_relative './test_helper'
require './lib/text_generator'
require './lib/braille_handler.rb'

class TextGeneratorTest < Minitest::Test
  attr_reader :first_braille_line, :second_braille_line, :third_braille_line, :t

  def setup
    filename = ("./input/braille_phrase.txt")
    handler = BrailleHandler.new(filename)
    @t = TextGenerator.new(handler.first_braille_line, handler.second_braille_line, handler.third_braille_line)
  end

  def test_it_can_get_the_first_index_from_from_the_first_line
    assert_equal [".."], t.first_line_to_text
  end

  def test_it_can_get_the_second_index_from_from_the_first_line
    assert_equal [".."], t.second_line_to_text
  end

  def test_it_can_get_the_third_index_from_from_the_first_line
    assert_equal [".0"], t.third_line_to_text
  end

  def test_it_can_collate_the_lines_of_braille_to_a_letter
    t.braille_to_text

    assert_equal "C", t.text[0]
  end

  def test_it_can_generate_a_word_with_a_space
    t.braille_to_text

    assert_equal ["C", "a", "t", " ", "b", "a", "t", "?"], t.text
    t.output
  end

  def test_it_can_generate_a_word_with_an_uppercase_letter
    t.braille_to_text

    assert_equal ["C", "a", "t", " ", "b", "a", "t", "?"], t.text
    t.output
  end

  def test_it_generates_text_output
    t.braille_to_text

    assert_equal ["C", "a", "t", " ", "b", "a", "t", "?"], t.text
    assert_equal "Cat bat?", t.output
  end

end
