require_relative 'dictionary'

class TextGenerator
  attr_reader :dictionary, :braille_lines, :sets, :text, :marker

  def initialize(braille_lines)
    @dictionary = Dictionary.new
    @braille_lines = braille_lines
    @marker = 0
    @sets = []
    @text = []
  end

  def braille_to_text
    while braille_lines[0][marker] != nil
      parsed_braille_lines.each { |line| sets << line }
      letter = dictionary.braille.invert[sets]
      capitals_and_numbers(letter)
    end
  end

  def capitals_and_numbers(letter)
    if letter == "capital"
     find_capital
   elsif
     letter == "#"
     find_number
   else
      text << dictionary.braille.invert[sets]
   end
   reset
 end

  def parsed_braille_lines
    [first_line_to_text, second_line_to_text, third_line_to_text]
  end

  def first_line_to_text
    braille_lines[0][marker].split
  end

  def second_line_to_text
    braille_lines[1][marker].split
  end

  def third_line_to_text
    braille_lines[2][marker].split
  end

  def find_capital
    reset
    parsed_braille_lines.each { |line| sets << line }
    letter = dictionary.braille.invert[sets]
    text << letter.upcase
  end

  def find_number
    number = nil
    until number == " "
      reset
      parsed_braille_lines.each { |line| sets << line }
      number = dictionary.numbers.invert[sets]
      text << number
    end
  end

  def reset
    @marker += 1
    sets.clear
  end

  def output
    output = text.join
  end

end
