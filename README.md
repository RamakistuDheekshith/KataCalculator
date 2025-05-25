# TDD Kata: String Calculator

This project is a step-by-step **Test-Driven Development (TDD)** challenge that outlines criteria to be met incrementally.

---

## Challenge Criteria

### 1. Handle Basic Addition
Implement addition for two numbers, including cases with an empty string.
* **Input**: A string of comma-separated numbers
* **Output**: An integer, sum of the numbers

| Input    | Output |
| :------- | :----- |
| `""`     | `0`    |
| `"1"`    | `1`    |
| `"1,5"`  | `6`    |

### 2. Allow any amount of numbers
The `add` method should be able to handle any number of inputs (e.g., `"1,2,3"` should return `6`).

### 3. Handle new lines between numbers
The `add` method should handle new lines as delimiters (e.g., `"1\n2,3"` should return `6`).

### 4. Support different delimiters
To change the delimiter, the string will start with `//[delimiter]\n`. For example, `"//;\n1;2"` where the delimiter is `;` should return `3`.

### 5. Handle negative numbers
Calling `add` with a negative number will throw an exception: `"negative numbers not allowed <negative_numbers>"`.

### 6. Multiple negative numbers and ignoring large numbers
If there are multiple negative numbers, show all of them in the exception message, separated by commas. Numbers larger than 1000 should be ignored (e.g., `2 + 1001 = 2`).

### 7. Delimiters of any length
Delimiters can be of any length using the format `//[delimiter]\n` (e.g., `"//[***]\n1***2***3"` should return `6`).

### 8. Allow multiple delimiters
Multiple delimiters are supported with the format `//[delim1][delim2]\n` (e.g., `"//[*][%]\n1*2%3"` should return `6`).

### 9. Multiple delimiters with longer length
Ensure support for multiple delimiters that are longer than one character.

---

## Running Tests

This project uses **RSpec** for testing.

### Prerequisites

Make sure you have **Ruby** (version 3.x.x or latest) and **Bundler** installed. You can install RSpec, or simply run:

```bash
`bundle install`
```

#### Executing Tests

To run all test cases, use the following command:

```bash
bundle exec rspec
```

As we only have a single test file, you can use the command below to run it. If you want to run a different file, simply replace `spec/calculator_spec.rb` with the path to your desired test file.

```bash
bundle exec rspec spec/calculator_spec.rb
```

To run a specific test case, use the following command:

```bash
bundle exec rspec spec/your_file_spec.rb:LINE_NUMBER
```