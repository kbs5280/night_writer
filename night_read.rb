require './lib/braille_handler.rb'
require './lib/text_generator.rb'
require 'pry'

handler = BrailleHandler.new(ARGV[0], ARGV[1])
handler.braille_parser

t = TextGenerator.new(handler.braille_lines)
t.braille_to_text

output = t.output
handler.write(output)
