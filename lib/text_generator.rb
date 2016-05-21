require_relative 'dictionary'

class TextGenerator
  attr_reader :braille, :dictionary, :letters

  def initialize(braille)
    @dictionary = Dictionary.new
    @braille = braille
    @letters = []
  end

  def first_line_to_text(braille)
    braille = braille[0].join
    binding.pry #use INVERT and see if it works 
      letters << dictionary.first_line.key(braille)
  end

  def letter_processer(letter)
  end

  def dictionary_lines
    [dictionary.first_line, dictionary.second_line, dictionary.third_line]
  end

end
