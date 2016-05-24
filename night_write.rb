require './lib/text_handler.rb'
require './lib/braille_generator.rb'
require 'pry'

handler = TextHandler.new(ARGV[0])
b = BrailleGenerator.new(handler.text)

b.text_to_braille
b.braille_by_line
output = b.output
handler.write(output)
