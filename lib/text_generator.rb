require_relative 'dictionary'

## REMOVE NUMS FROM TEST TXT FILES

class TextGenerator
  attr_reader :dictionary, :sets, :text, :first_braille_line, :second_braille_line, :third_braille_line, :count

  def initialize(first_braille_line, second_braille_line, third_braille_line)
    @dictionary = Dictionary.new
    @first_braille_line = first_braille_line
    @second_braille_line = second_braille_line
    @third_braille_line = third_braille_line
    @count = 0
    @sets = []
    @text = []
  end

  def braille_to_letters
    while first_braille_line[count] != nil
      sets << first_line_to_text
      sets << second_line_to_text
      sets << third_line_to_text
      letter = dictionary.braille.invert[sets]
      if letter == "capital"
        @count += 1
        sets.clear
        sets << first_line_to_text
        sets << second_line_to_text
        sets << third_line_to_text
        letter = dictionary.braille.invert[sets]
        text << letter.upcase
        @count += 1
      else
        text << dictionary.braille.invert[sets]
        @count += 1
      end
      sets.clear
    end
  end

  def braille_lines
    [first_line_to_text, second_line_to_text, third_line_to_text]
  end

  def first_line_to_text
    first_braille_line[count].split
  end

  def second_line_to_text
    second_braille_line[count].split
  end

  def third_line_to_text
    third_braille_line[count].split
  end

  def output
    output = text.join
  end

end
