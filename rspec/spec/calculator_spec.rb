#spec/calculator_spec.rb
require './lib/calculator'

describe Calculator do
  describe '#add' do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5,2)).to eq(7)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eq(14)
    end
  end

  describe '#multiply' do
    it "returns the product of two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(4, 2)).to eq(8)
    end

    it "returns the product of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(4, 2, 8)).to eq(64)
    end
  end
end