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
    @first_braille_line = []
    @second_braille_line = []
    @third_braille_line = []
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
      dictionary.braille[text.downcase][0]
    else
      dictionary.braille["capital"][0] + dictionary.braille[text.downcase][0]
    end
  end

  def second_line_to_braille(text)
    if text == text.downcase
      dictionary.braille[text.downcase][1]
    else
      dictionary.braille["capital"][1] + dictionary.braille[text.downcase][1]
    end
  end

  def third_line_to_braille(text)
    if text == text.downcase
      dictionary.braille[text.downcase][2]
    else
      dictionary.braille["capital"][2] + dictionary.braille[text.downcase][2]
    end
  end

  def braille_by_line
    lines = [first_braille_line, second_braille_line, third_braille_line]
    slices = []
    lines.each do |line|
      line.each_slice(4) { |string| slices << string.join }
    end
    slices
  end

  def output
    braille_by_line
  end

end
