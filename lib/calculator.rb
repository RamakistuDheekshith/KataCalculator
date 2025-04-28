class Calculator
  def add(input_string)
    return 0 if input_string.empty?
    numbers = input_string.split(',').map(&:to_i)
    numbers.sum
  end
end