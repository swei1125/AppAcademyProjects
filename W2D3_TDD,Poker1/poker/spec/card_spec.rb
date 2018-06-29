require "card"
require "rspec"

describe Card do
  describe "#initialize" do
    it "assigns value and suit" do
      card = Card.new(1, "spade")
      expect(card.value).to eq(1)
      expect(card.suit).to eq("spade")
    end
  end
end
