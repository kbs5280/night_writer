require './lib/text_handler.rb'
require './lib/braille_generator.rb'
require 'pry'

handler = TextHandler.new(ARGV[0])
b = BrailleGenerator.new(handler.text)

b.text_to_braille
b.first_line_set
b.second_line_set
b.third_line_set
b.transpose
output = b.output
handler.write(output)
