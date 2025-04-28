class Calculator
  def add(input_string)
    return 0 if input_string.empty?
    if input_string.start_with?("//")
      custom_delimiter = input_string.split("\n")[0][2]
      numbers_input_string = input_string.split("\n")[1]
      numbers = numbers_input_string.split(custom_delimiter).map(&:to_i)
    else
      numbers = input_string.split(/[\n,]/).map(&:to_i)
    end
    numbers.sum
  end
end