class Dictionary
  attr_reader :first, :second, :third

  def initialize

    def first_line(input)
      first.detect { |key, value| key.include?(input) }.last
    end

    def second_line(input)
      second.detect { |key, value| key.include?(input) }.last
    end

    def third_line(input)
      third.detect { |key, value| key.include?(input) }.last
    end

    @first = {   "ab" => '0.',
                      "d" => "00",
                      "t" => ".0",
                      " " => " "}

    @second = {  "a" => "..",
                      "b" => "0.",
                      "d" => ".0",
                      "t" => "00",
                      " " => " "}

    @third = {   "a" => '..',
                      "b" => '..',
                      "d" => "..",
                      "t" => "0.",
                      " " => " "}

  end

end
