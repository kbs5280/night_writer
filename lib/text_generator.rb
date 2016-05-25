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
      letter = find_letter
      #if previous letter == Fixnum
      capitals_and_numbers(letter)
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

  def find_letter
    braille_lines.each { |line| sets << line }
    dictionary.braille.invert[sets]
  end

  def find_number
    braille_lines.each { |line| sets << line }
    dictionary.number.invert[sets]
  end

  def capitals_and_numbers(letter)
    if letter == "capital"
      # the next 3 lines could be a method
      reset
      letter = find_letter
      text << letter.upcase
    elsif letter == "#"
      reset
      number = find_number
      text < number
      #get the next letter
      #if the next letter is a letter get the number
      #if the next letter is a space then continue (braille_to_text)
    else
      text << dictionary.braille.invert[sets]
    end
    reset
  end

  def number(letter)
  end

  def reset
    @count += 1
    sets.clear
  end

  def output
    output = text.join
  end

end
