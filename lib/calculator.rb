class Calculator
  def add(input_string)
    return 0 if input_string.empty?

    if input_string.start_with?('//')
      numbers = delimiter_stripping(input_string)
    else
      numbers = input_string.split(/[\n,]/).map(&:to_i)
    end
    ensure_non_negatives(numbers)
    
    numbers = numbers.select { |num| num <= 1000 } #numbers >1000 should be ignored
    numbers.sum
  end

  private

  def delimiter_stripping(input_string)
    delimiter_input = get_delimiters(input_string)
    numbers_input_string = get_numbers_input_string(input_string)

    # considering single char delimter when delimter_input is '//delimiter'
    # multi char delimiter when delimiter_input is '//[delimiter]'
    custom_delimiter = if delimiter_input.scan(/\[(.*?)\]/).flatten.empty?
                          delimiter_input[2]
                        else
                          Regexp.union(delimiter_input.scan(/\[(.*?)\]/).flatten)
                        end
    numbers = numbers_input_string.split(custom_delimiter).map(&:to_i)
  end

  def get_delimiters(input_string)
    # considering substring before \n from “//[delimiter]\n[numbers…]”
    input_string.split("\n")[0]
  end

  def get_numbers_input_string(input_string)
    # considering substring after \n from “//[delimiter]\n[numbers…]”
    input_string.split("\n")[1]
  end

  def ensure_non_negatives(numbers)
    negative_numbers = numbers.select(&:negative?)
    if negative_numbers.length.positive?
      raise ArgumentError,
            "negative numbers not allowed: #{negative_numbers.join(',')}"
    end
  end
end
