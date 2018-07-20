require "rspec"
require "deck"

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "contains an array of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "contains card objects in the cards instance variable" do
      expect(deck.cards.all? {|el| el.is_a?(Card)}).to be true
    end
  end

  describe "#deal" do
    it "deals a top card from cards instance variable" do
      card = deck.cards[0]
      expect(deck.deal).to eq(card)
    end

    it "does not contain the card after deal" do
      card = deck.deal
      expect(deck.cards).not_to include(card)
    end

    it "raises error if deck is empty" do
      52.times { deck.deal}
      expect{deck.deal}.to raise_error("Error")
    end
  end

end
