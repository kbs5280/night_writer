require_relative 'dictionary'
require_relative 'file_handler'
require 'pry'

class Converter
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

  def start
    #string_it_up
    #create a method that calls all three lines together
    #call that method in write
    #write the file (maybe in the filehandler)
  end

  # ROMAN TO BRAILLE

  def string_it_up
    text.chars.each do |letter|
      first_line_to_braille(letter)
      second_line_to_braille(letter)
      third_line_to_braille(letter)
    end
  end

  def first_line_to_braille(input)
    first_braille_line << dictionary.first_line[input]
  end

  def second_line_to_braille(string)
    second_braille_line << dictionary.second_line[string]
  end

  def third_line_to_braille(string)
    third_braille_line << dictionary.third_line[string]
  end

  # ASSEMBLE THE LINES OF BRAILLE

  def assembled
    [first_braille_line, second_braille_line, third_braille_line].join("\n")
  end

  # WRITE

  def time
    Time.now.strftime("%Y-%m-%e-%I:%M%p")
  end

  def write
    File.open("braille-#{time}.txt", 'w') { |file| file.write(assembled) }
  end


end
