class Calculator
  def add(input_string)
    return 0 if input_string.empty?

    if input_string.start_with?('//')
      # considering substring before \n from “//[delimiter]\n[numbers…]”
      delimiter_input = input_string.split("\n")[0]
      # considering single char delimter when delimter_input is '//delimiter'
      # multi char delimiter when delimiter_input is '//[delimiter]'
      numbers_input_string = input_string.split("\n")[1]
      custom_delimiter = if delimiter_input.scan(/\[(.*?)\]/).flatten.empty?
                           delimiter_input[2]
                         else
                           Regexp.union(delimiter_input.scan(/\[(.*?)\]/).flatten)
                         end
      numbers = numbers_input_string.split(custom_delimiter).map(&:to_i)
    else
      numbers = input_string.split(/[\n,]/).map(&:to_i)
    end
    negative_numbers = numbers.select(&:negative?)
    if negative_numbers.length.positive?
      raise ArgumentError,
            "negative numbers not allowed: #{negative_numbers.join(',')}"
    end

    numbers = numbers.select { |num| num <= 1000 }
    numbers.sum
  end
end
