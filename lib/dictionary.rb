class Dictionary
  attr_reader :first_line, :second_line, :third_line

  def initialize

    @first_line = {   "a" => '0.',
                      "b" => '0.',
                      "d" => "00",
                      "t" => ".0"}

    @second_line = {  "a" => "..",
                      "b" => "0.",
                      "d" => ".0",
                      "t" => "00"}

    @third_line = {   "a" => '..',
                      "b" => '..',
                      "d" => "..",
                      "t" => "0."}

  end

end
