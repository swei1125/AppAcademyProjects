require_relative 'card'

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    setup
  end

  def setup
    ["diamond", "heart", "spade", "club"].each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end

    @cards.shuffle
  end

  def deal
    dealt_card = @cards.shift
    raise "Error" if dealt_card.nil?
    dealt_card
  end
end
