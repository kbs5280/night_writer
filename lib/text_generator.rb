require_relative 'dictionary'

class TextGenerator
  attr_reader :dictionary, :braille_lines, :sets, :text, :count

  def initialize(braille_lines)
    @dictionary = Dictionary.new
    @braille_lines = braille_lines
    @count = 0
    @sets = []
    @text = []
  end

  def braille_to_text
    while braille_lines[0][count] != nil
      letter = find_letter

    # if previous letter is a Fixnum go to get number
    # otherwise letter = find_letter
    # then go to find_number method ( which needs to go to the next letter )
    # if letter is "#"
      # shovel in number
    # if letter is "capital"
      # then go to capital
      #shovel in the number
    #otherwise shovel in the letter


      #if previous letter == Fixnum
      capitals_and_numbers(letter)
    end
  end

  def parsed_braille_lines
    [first_line_to_text, second_line_to_text, third_line_to_text]
  end

  def first_line_to_text
    braille_lines[0][count].split
  end

  def second_line_to_text
    braille_lines[1][count].split
  end

  def third_line_to_text
    braille_lines[2][count].split
  end

  def find_letter
    parsed_braille_lines.each { |line| sets << line }
    dictionary.braille.invert[sets]
  end

  def find_number
    parsed_braille_lines.each { |line| sets << line }
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
