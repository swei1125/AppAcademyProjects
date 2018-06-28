require 'tdd_practice'
require 'rspec'

describe Array do
  describe "#my_uniq" do
    it "return an empty array if original array is empty" do
      expect([].my_uniq).to be_empty
    end

    it "result array should not include duplicated elments" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    it "should return sorted result array" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns array of index's value that sum to zero" do
      arr = [-1, 0, 2, -2, 1]
      result = arr.two_sum
      value = result.all? {|array| arr[array[0]] + arr[array[1]] == 0}
      expect(value).to be true
    end
  end
end


describe "#my_transpose" do
  it "covert the row-oriented and column-oriented representations" do
    expect(my_transpose([[0, 1, 2], [3, 4, 5], [6 ,7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "#stock_picker" do
  it "return an array of most profitable pair of days to buy and sell" do
    expect(stock_picker([4, 3, 1, 7, 5])).to eq([2, 3])
  end

  it "first result number should be less than the second number" do
    expect(stock_picker([4, 2, 7, 1, 5])).to eq([1, 2])
  end
end
