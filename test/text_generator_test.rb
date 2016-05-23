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
    assert_equal "00", t.first_line_to_text
  end

  # def test_it_can_convert_the_first_line_of_another_letter
  #   braille = ("0.")
  #   t = TextGenerator.new(braille)
  #   assert_equal "ab", t.first_line_to_text(braille)
  # end
  #
  # def test_it_can_convert_the_second_line_of_letter
  #   braille = ("0.")
  #   t = TextGenerator.new(braille)
  #   assert_equal "b", t.second_line_to_text(braille)
  # end
  #
  # def test_it_can_convert_the_first_line_of_letter
  #   braille = ([["0."], [".."], [".."]])
  #   t = TextGenerator.new(braille)
  #   assert_equal ["abd"], t.third_line_to_text(braille)
  # end
  #
  # def test_it_can_isolate_the_correct_letter
  #   braille = ([["0."], [".."], [".."]])
  #   t = TextGenerator.new(braille)
  #   assert_equal ["ab"], t.first_line_to_text(braille)
  #   assert_equal ["ab", "a"], t.second_line_to_text(braille)
  #   assert_equal ["ab", "a", "abd"], t.third_line_to_text(braille)
  #   assert_equal ["ab", "a", "abd"], t.letters
  #   assert_equal "a", t.generate_letter
  # end
  #
  # def test_it_can_store_the_correct_letter
  #   braille = ([["0."], [".."], [".."]])
  #   t = TextGenerator.new(braille)
  #   assert_equal ["ab"], t.first_line_to_text(braille)
  #   assert_equal ["ab", "a"], t.second_line_to_text(braille)
  #   assert_equal ["ab", "a", "abd"], t.third_line_to_text(braille)
  #   assert_equal ["ab", "a", "abd"], t.letters
  #   assert_equal "a", t.generate_letter
  #   assert_equal "a", t.braille
  # end
  #
  # def test_it_can_generate_a_word
  #   braille = ([[["0."], [".."], [".."]],[["0."], ["0."], [".."]], [["0."], [".."], [".."]]])
  #   t = TextGenerator.new(braille)
  #   t.generate_braille(braille)
  #   assert_equal "aba", t.braille
  # end
  #
  # def test_it_can_generate_a_word_with_a_space
  #   braille = ([[["0."], [".."], [".."]],[[".."], [".."], [".."]], [["0."], ["0."], [".."]], [["0."], [".."], [".."]],[[".0"], ["00"], ["0."]]])
  #   t = TextGenerator.new(braille)
  #   t.generate_braille(braille)
  #   assert_equal " a bat", t.braille
  # end
  #

end
