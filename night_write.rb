require './lib/converter.rb'
require './lib/file_handler.rb'

con = Filehandler.new(ARGV[0])

con.start
