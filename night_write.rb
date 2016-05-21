require './lib/file_handler.rb'
require './lib/braille_converter.rb'
require 'pry'

handler = FileHandler.new(ARGV[0])
bc = BrailleConverter.new(handler.text)

bc.string_it_up

output = bc.output
handler.write(output)
