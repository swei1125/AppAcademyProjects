require 'rspec'
require 'towers_of_hanoi'

describe Hanoi do
  subject(:hanoi) { Hanoi.new }
  describe "#initialize" do
    it "Starts with 3 piles of arrays" do
      expect(hanoi.piles.length).to eq(3)
    end
  end

  describe "#setup" do
    it "set up the first piles with 3 discs" do
      expect(hanoi.piles[0]).to eq([1,2,3])
    end
  end

  describe "#move" do
    it "moves a disc to an empty pile" do
      hanoi.move(0, 1)
      expect(hanoi.piles).to eq([[2, 3], [1], []])
    end

    it "moves a smaller disc to a bigger disc" do
      hanoi.move(0, 1)
      hanoi.move(0, 2)
      hanoi.move(1, 2)
      expect(hanoi.piles).to eq([[3], [], [1, 2]])
    end
  end

  describe "#won?" do
    it "return false if first pile is not empty" do
      hanoi.move(0, 1)
      expect(hanoi.won?).to be false
    end

    it "returns true if all dics are moved to pile 2 or 3" do
      hanoi.move(0, 1)
      hanoi.move(0, 2)
      hanoi.move(1, 2)
      hanoi.move(0, 1)
      hanoi.move(2, 0)
      hanoi.move(2, 1)
      hanoi.move(0, 1)
      expect(hanoi.won?).to be true
    end
  end

end
