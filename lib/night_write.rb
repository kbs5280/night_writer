# this is my runner, yo

require './lib/converter.rb'

file = FileHandler.new(ARGV[0])
con = Converter.new

con.start
