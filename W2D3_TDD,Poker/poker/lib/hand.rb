require_relative "deck"

class Hand
  attr_reader :cards, :rank

  def self.draw_cards(deck)
    Hand.new(deck.take(5))
  end

  def initialize(cards)
    @cards = cards
    @rank = 1
  end

  def check_rank
    if straight_flush?
      @rank = 9
    elsif four_of_a_kind?
      @rank = 8
    elsif full_house?
      @rank = 7
    elsif flush?
      @rank = 6
    elsif straight?
      @rank = 5
    elsif three_of_a_kind?
      @rank = 4
    elsif two_pair?
      @rank = 3
    elsif one_pair?
      @rank = 2
    end
    @rank
  end

  def beats?(other_hand)
    @rank > other_hand.rank
  end

  def draw?(other_hand)
    @rank == other_hand.rank
  end

  def hit(deck, n)
    raise "You only have up to 3 cards to draw" if n > 3
    @cards += deck.take(n)
  end

  def show
    p @cards.map {|card| card.to_s}
  end
  
  def one_pair?
    arr = value_arr
    arr.any? {|value| arr.count(value) == 2}
  end

  def two_pair?
    arr = value_arr
    result = []
    arr.each { |value| result << value if arr.count(value) == 1 }
    reuslt.length == 1
  end

  def three_of_a_kind?
    arr = value_arr
    arr.any? {|value| arr.count(value) == 3}
  end

  def straight?
    arr = value_arr.sort
    (0..3).all? {|i| arr[i] + 1 == arr[i+1]}
  end

  def flush?
    arr = suit_arr
    arr.all? {|suit| @hand_cards[0].suit == suit}
  end

  def full_house?
    track = Hash.new(0)
    arr = value_arr
    arr.each {|value| track[value] += 1}
    track.keys.length == 2
  end

  def four_of_a_kind?
    arr = value_arr
    arr.any? {|value| arr.count(value) == 4}
  end

  def straight_flush?
    straight? && flush?
  end



  private
  def value_arr
    value_arr = []
    @cards.each {|card| arr << card.value}
    value_arr
  end

  def suit_arr
    suit_arr = []
    @cards.each {|card| arr << card.suit}
    suit_arr
  end
end
