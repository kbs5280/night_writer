require './lib/text_generator.rb'

class BrailleHandler
  attr_reader :input,
              :first_braille_line,
              :second_braille_line,
              :third_braille_line

  def initialize(filename)
    file_processor(filename)
    @first_braille_line = []
    @second_braille_line = []
    @third_braille_line = []
    @count = 0
  end

  def braille_parser
    until input[@count] == nil
      first_braille_line << input[@count].chars.each_slice(2).map(&:join)
      second_braille_line << input[@count + 1].chars.each_slice(2).map(&:join)
      third_braille_line << input[@count + 2].chars.each_slice(2).map(&:join)
      @count += 3
    end
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
      @input = input.split
    else puts "\nFile does not exist\n\n"
      exit
    end
  end

end
