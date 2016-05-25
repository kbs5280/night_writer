require_relative 'dictionary'

class TextGenerator
  attr_reader :dictionary, :sets, :text, :first_braille_line,
              :second_braille_line, :third_braille_line, :count

  def initialize(first_braille_line, second_braille_line, third_braille_line)
    @dictionary = Dictionary.new
    @first_braille_line = first_braille_line.flatten
    @second_braille_line = second_braille_line.flatten
    @third_braille_line = third_braille_line.flatten
    @count = 0
    @sets = []
    @text = []
  end

  def braille_to_text
    while first_braille_line[count] != nil
      letter = look_up
      capital_letters(letter)
      binding.pry
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

  def look_up
    braille_lines.each { |line| sets << line }
    letter = dictionary.braille.invert[sets]
  end

  def capital_letters_and_numbers(letter)
    if letter == "capital"
      capital_letter(letter)
    elsif letter.class == "#"
      number(letter)
    end
  end

  def capital_letter(letter)
    if letter == "capital"
      reset
      letter = look_up
      text << letter.upcase
    else
      text << dictionary.braille.invert[sets]
    end
    reset
  end

  def reset
    @count += 1
    sets.clear
  end

  def output
    output = text.join
  end

end
