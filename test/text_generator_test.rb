require_relative './test_helper'
require './lib/text_generator'

class TextGeneratorTest < Minitest::Test

  def test_it_can_convert_the_first_line_of_a_letter
    t = TextGenerator.new([["O."], [".."], [".."]])
    assert_equal ["a", "b"], t.first_line_to_text([["O."], [".."], [".."]])
  end

end
