require_relative 'dictionary'
require 'pry'

# need to add a test for a string NEED TO ADD SPACES, then characters

class BrailleConverter
  attr_reader :dictionary,
              :first_braille_line,
              :second_braille_line,
              :third_braille_line,
              :text

  def initialize(text)
    @dictionary           = Dictionary.new
    @text                 = text
    @first_braille_line   = ""
    @second_braille_line  = ""
    @third_braille_line   = ""
  end

  # LATIN TO BRAILLE

  def string_it_up
    text.chars.each do |letter|
      first_line_to_braille(letter)
      second_line_to_braille(letter)
      third_line_to_braille(letter)
    end
  end

  def first_line_to_braille(input)
    first_braille_line << dictionary.first_line(input)
  end

  def second_line_to_braille(input)
    second_braille_line << dictionary.second_line(input)
  end

  def third_line_to_braille(input)
    third_braille_line << dictionary.third_line(input)
  end

  # COALLATE THE LINES OF BRAILLE

  def output
    [first_braille_line, second_braille_line, third_braille_line].join("\n")
  end

end
