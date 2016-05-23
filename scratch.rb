class Dictionary
  attr_reader :first, :second, :third

  def initialize

    # TO BRAILLE

    def first_line_braille(input)
      first.detect { |key, value| key.include?(input) }.last
    end

    def second_line_braille(input)
      second.detect { |key, value| key.include?(input) }.last
    end

    def third_line_braille(input)
      third.detect { |key, value| key.include?(input) }.last
    end

    # TO TEXT

    def first_line_text(input)
      first.invert[input]
    end

    def second_line_text(input)
      second.invert[input]
    end

    def third_line_text(input)
      third.invert[input]
    end

    #DICTIONARY

    @first = {        " " => "..",
                      "abehklruvz" => "0.",
                      "cdfgmnpqxz" => "00",
                      "ijstw" => ".0",
                      " " => " "}

    @second = {       "acmux" => "..",
                      "bfilpqrstvw" => "0.",
                      "denoyz" => ".0",
                      "ghjqrtw" => "00",
                      " " => " "}

    @third = {        "abdcdefghij" => "..",
                      "klmnopqrstt" => "0.",
                      "w" => ".0",
                      "uvxyz" => "00",
                      " " => " "}

  end

end
NoMethodError: undefined method `join' for nil:NilClass
