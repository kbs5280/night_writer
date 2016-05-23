class BrailleHandler
  attr_reader :input

  def initialize(filename)
    file_processor(filename)
  end

  def text
    input.split("\n")
    binding.pry
  end

  def time
    Time.now.strftime("%Y-%m-%e-%I:%M%p")
  end

  def write(output)
    file = File.open("message-#{time}.txt", 'w') { |file| file.write(output) }
    print "\nCreated 'messsage-#{time}.txt' containing #{file} characters.\n\n"
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
