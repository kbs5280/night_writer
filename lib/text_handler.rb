class TextHandler
  attr_reader :input, :output_file

  def initialize(input_file, output_file = ARGV[1])
    file_processor(input_file)
    @output_file = output_file
  end

  def file_processor(filename)
    if File.exist?(filename)
      @input = File.read(filename)
    else puts "\nFile does not exist\n\n"
      exit
    end
  end

  def text
    input.strip
  end

  def write(output)
    file = File.open(output_file, 'w') { |file| file.write(output) }
    print "\nCreated #{output_file} containing #{file} characters.\n\n"
    file.inspect
  end


end
