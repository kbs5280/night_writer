class TextHandler
  attr_reader :input

  # may want an additional tests to see if the file exists
  # or test File.open if possible

  def initialize(filename)
    file_processor(filename)
  end

  def text
    input.strip
  end

  def time
    Time.now.strftime("%Y-%m-%e-%I:%M%p")
  end

  def write(output)
    file = File.open("braille-#{time}.txt", 'w') { |file| file.write(output) }
    print "\nCreated 'braille-#{time}.txt' containing #{file} characters.\n\n"
    file.inspect
  end

  def file_processor(filename)
    if File.exist?(filename)
      @input = File.read(filename)
    else puts "\nFile does not exist\n\n"
      exit
    end
  end

end
