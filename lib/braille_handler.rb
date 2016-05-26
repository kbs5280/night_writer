require './lib/text_generator.rb'

class BrailleHandler
  attr_reader :input, :output_file, :braille_by_line, :marker

  def initialize(input_file, output_file = ARGV[1])
    file_processor(input_file)
    @output_file = output_file
    @braille_by_line = [[],[],[]]
    @marker = 0
  end

  def file_processor(input_file)
    if File.exist?(input_file)
      @input = File.read(input_file)
      @input = input.split
    else puts "\nFile does not exist\n\n"
      exit
    end
  end

  def braille_parser
    until input[marker] == nil
      braille_by_line[0] << input[marker].chars.each_slice(2).map(&:join)
      braille_by_line[1] << input[marker + 1].chars.each_slice(2).map(&:join)
      braille_by_line[2] << input[marker + 2].chars.each_slice(2).map(&:join)
      @marker += 3
    end
    braille_lines
  end

  def braille_lines
    @braille_by_line.map { |line| line.flatten }
  end

  def write(output)
    file = File.open(output_file, 'w') { |file| file.write(output) }
    print "\nCreated #{output_file} containing #{file} characters.\n\n"
    file.inspect
  end

end
