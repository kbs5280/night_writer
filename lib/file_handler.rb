class FileHandler
attr_reader :text

  def self.read(filename)
    text = File.read(filename)
    stripped_text = text.strip
    convert_to_braille(stripped_text)
  end

  def convert_to_braille(stripped_text)
    Converter.new(text)
  end

end
