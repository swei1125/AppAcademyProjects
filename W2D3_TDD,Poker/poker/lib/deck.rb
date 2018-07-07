require_relative 'card'

class Deck
  attr_reader :cards

  def self.dealt_card
    Card.suits.product(Card.values).map do |suit, value|
      Card.new(suit, value)
    end
  end

  def initialize(cards = Deck.dealt_card)
    @cards = cards.shuffle
  end

  def take(n)
    @cards.shift(n)
  end
end
