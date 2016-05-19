require_relative 'dictionary.rb'

class Converter
  attr_reader :dictionary,
              :first_braille_line,
              :second_braille_line,
              :third_braille_line

  def initialize
    @dictionary           = Dictionary.new
    @first_braille_line   = ""
    @second_braille_line  = ""
    @third_braille_line   = ""
  end

#maybe a start method that takes in the text and gets the show rolling

  def string_it_up(string)
    string.chars.each do |letter|
      first_line_to_braille(letter)
      second_line_to_braille(letter)
      third_line_to_braille(letter)
    end
  end

  def first_line_to_braille(string)
    first_braille_line << dictionary.first_line[string]
  end

  def second_line_to_braille(string)
    second_braille_line << dictionary.second_line[string]
  end

  def third_line_to_braille(string)
    third_braille_line << dictionary.third_line[string]
  end

end
