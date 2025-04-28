class Calculator
  def add(input_string)
    return 0 if input_string.empty?
    numbers = input_string.split(',')
    if numbers.length == 1
      return numbers[0].to_i
    else
      return numbers[0].to_i + numbers[1].to_i
    end
  end
end