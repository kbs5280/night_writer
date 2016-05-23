require_relative 'dictionary'

## REMOVE NUMS FROM TEST TXT FILES

class TextGenerator
  attr_reader :dictionary, :sets, :text, :first_braille_line, :second_braille_line, :third_braille_line

  def initialize(first_braille_line, second_braille_line, third_braille_line)
    @dictionary = Dictionary.new
    @first_braille_line = first_braille_line
    @second_braille_line = second_braille_line
    @third_braille_line = third_braille_line
    @sets = []
    @text = []
  end

  def braille_to_letters
    while first_braille_line[text.count] != nil
      sets << first_line_to_text
      sets << second_line_to_text
      sets << third_line_to_text
      # need to deal with caps
      @text << dictionary.braille.invert[sets]
      sets.clear
    end
  end

  def braille_lines
    [first_line_to_text, second_line_to_text, third_line_to_text]
  end

  def first_line_to_text
    first_braille_line[text.count].split
    # binding.pry
  end

  def second_line_to_text
    second_braille_line[text.count].split
  end

  def third_line_to_text
    third_braille_line[text.count].split
  end

  def output
    output = text.join
    binding.pry
  end

end
