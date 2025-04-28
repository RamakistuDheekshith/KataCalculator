class Calculator
  def add(input_string)
    return 0 if input_string.empty?

    if input_string.start_with?('//')
      # considering substring before \n from “//[delimiter]\n[numbers…]”
      delimiter_input = input_string.split("\n")[0]
      # considering single char delimter when delimter_input is '//delimiter'
      # multi char delimiter when delimiter_input is '//[delimiter]'
      numbers_input_string = input_string.split("\n")[1]
      if delimiter_input.scan(/\[(.*?)\]/).flatten.empty?
        custom_delimiter =  delimiter_input[2]
      else 
        custom_delimiter = Regexp.new("[#{delimiter_input.scan(/\[(.*?)\]/).flatten.join('')}]")
      end  
      numbers = numbers_input_string.split(custom_delimiter).map(&:to_i)
    else
      numbers = input_string.split(/[\n,]/).map(&:to_i)
    end
    negative_numbers = numbers.select { |number| number < 0 }
    raise ArgumentError, "negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.length > 0

    numbers = numbers.select { |num| num <= 1000 }
    numbers.sum
  end
end
