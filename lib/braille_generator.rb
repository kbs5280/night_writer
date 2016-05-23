require_relative 'dictionary'
require 'pry'

class BrailleGenerator
  attr_reader :dictionary,
              :text,
              :first_braille_line,
              :second_braille_line,
              :third_braille_line

  def initialize(text)
    @dictionary           = Dictionary.new
    @text                 = text
    @first_braille_line = ""
    @second_braille_line = ""
    @third_braille_line = ""
  end

  def text_to_braille
    text.chars.each do |letter|
      first_braille_line << first_line_to_braille(letter)
      second_braille_line << second_line_to_braille(letter)
      third_braille_line << third_line_to_braille(letter)
    end
  end

  def first_line_to_braille(text)
    if text == text.downcase
      dictionary.braille[text.downcase][0].join
    else
      dictionary.braille["capital"][0].join + dictionary.braille[text.downcase][0].join
    end
  end

  def second_line_to_braille(text)
    if text == text.downcase
      dictionary.braille[text.downcase][1].join
    else
      dictionary.braille["capital"][1].join + dictionary.braille[text.downcase][1].join
    end
  end

  def third_line_to_braille(text)
    if text == text.downcase
      dictionary.braille[text.downcase][2].join
    else
      dictionary.braille["capital"][2].join + dictionary.braille[text.downcase][2].join
    end
  end

  def output
    [first_braille_line, second_braille_line, third_braille_line].join("\n")
  end
  
end
