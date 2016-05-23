require_relative 'dictionary'

## REMOVE NUMS FROM TEST TXT FILES

class TextGenerator
  attr_reader :dictionary, :letters, :braille, :first_braille_line, :second_braille_line, :third_braille_line

  def initialize(first_braille_line, second_braille_line, third_braille_line)
    @dictionary = Dictionary.new
    @first_braille_line = first_braille_line
    @second_braille_line = second_braille_line
    @third_braille_line = third_braille_line
    # @letters = []
    # @braille = []
  end

  def first_line_to_text
    first_braille_line[0] # index with the count from the array receiving info
  end

  #take in 3 lines
  #go through the first line and get the first[0] set of characters
  #put the first set into an array
  #go through the second line and get the first set of characters
  #put that set into the same array
  #go through the third line and get the first set of characters
  #put that set into the same array
  #take that array and retrieve the value by inverting the dict hash
  # put that letter into an array
  #go through the first line and get the second[1] set of characters
  #put that an a new array etc...

end
