require 'spec_helper'
require 'calculator'

RSpec.describe Calculator do
	let(:calculator) { Calculator.new }

  context "add using input string" do
		it "contains empty value in it" do
			expect(calculator.add("")).to eq(0)
		end
	end
end