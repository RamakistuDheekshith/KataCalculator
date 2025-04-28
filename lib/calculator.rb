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
    negative_numbers = numbers.select { |number| number < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.length > 0
    numbers.sum
  end
end