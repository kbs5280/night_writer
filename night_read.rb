require './lib/braille_handler.rb'
require './lib/text_generator.rb'
require 'pry'

handler = BrailleHandler.new(ARGV[0])
t = TextGenerator.new(handler.text)

t.braille_to_text

output = t.output
handler.write(output)
