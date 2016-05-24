require './lib/braille_handler.rb'
require './lib/text_generator.rb'
require 'pry'

handler = BrailleHandler.new(ARGV[0])
t = TextGenerator.new(handler.first_braille_line, handler.second_braille_line, handler.third_braille_line)

t.braille_to_letters

output = t.output
handler.write(output)
