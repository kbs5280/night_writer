require_relative 'dictionary'

class TextGenerator
  attr_reader :dictionary, :input, :letters, :braille

  def initialize(input)
    @dictionary = Dictionary.new
    @input = input
    @letters = []
    @braille = []
  end

  

end
