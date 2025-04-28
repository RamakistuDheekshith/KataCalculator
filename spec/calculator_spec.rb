require 'spec_helper'
require 'calculator'

RSpec.describe Calculator do
	let(:calculator) { Calculator.new }

  context "add using input string" do
		it "contains empty value in it" do
			expect(calculator.add("")).to eq(0)
		end
		
		it "contains one number" do
	    expect(calculator.add("1")).to eq(1)
		end

		it "contains two numbers comma separated" do
	    expect(calculator.add("1,5")).to eq(6)
		end

		it "contains multiple numbers" do
			expect(calculator.add("1, 5, 5, 6, 7, 3")).to eq(27)
		end

		it "handle input with new line chars" do
			expect(calculator.add("1\n2,3")).to eq(6)
		end
	end
end