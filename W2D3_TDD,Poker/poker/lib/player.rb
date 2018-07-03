require_relative 'deck'
require_relative 'hand'

class Player
  attr_reader :name, :bankroll
  def initialize(name, bankroll)
    @name, @bankroll = name, bankroll
    @hand = Hand.draw_cards(deck)
    @current_bet = 0
  end

  def discard(cards)
    cards.each do |card|
      raise "Can't discard this card" unless @hand.cards.include?(card)
      @hand.cards.delete(card)
    end
  end

  

end
