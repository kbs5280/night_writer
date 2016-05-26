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
    if !!/\A\d+\z/.match(text)
      dictionary.braille["#"][0].join + dictionary.numbers[text][0].join
    elsif text == text.downcase
      dictionary.braille[text.downcase][0].join
    else
      dictionary.braille["capital"][0].join + dictionary.braille[text.downcase][0].join
    end
  end

  def second_line_to_braille(text)
    if !!/\A\d+\z/.match(text)
      dictionary.braille["#"][1].join + dictionary.numbers[text][1].join
    elsif text == text.downcase
      dictionary.braille[text.downcase][1].join
    else
      dictionary.braille["capital"][1].join + dictionary.braille[text.downcase][1].join
    end
  end

  def third_line_to_braille(text)
    if !!/\A\d+\z/.match(text)
      dictionary.braille["#"][2].join + dictionary.numbers[text][2].join
    elsif text == text.downcase
      dictionary.braille[text.downcase][2].join
    else
      dictionary.braille["capital"][2].join + dictionary.braille[text.downcase][2].join
    end
  end

  def first_line_set
    first = []
    first_braille_line.chars.each_slice(160) { |slice| first << slice.join }
    first
  end

  def second_line_set
    second = []
    second_braille_line.chars.each_slice(160) { |slice| second << slice.join }
    second
  end

  def third_line_set
    third = []
    third_braille_line.chars.each_slice(160) { |slice| third << slice.join }
    third
  end

  def transpose
    sets = [first_line_set, second_line_set, third_line_set]
    sets.transpose
  end

  def output
    transpose.join("\n")
  end

end
