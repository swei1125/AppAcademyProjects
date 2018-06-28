require_relative "card"

class Hand
  attr_reader :hand_cards, :rank

  def initialize(cards)
    @hand_cards = cards
    @rank = 1
  end

  def check_rank
    @rank = 2 if one_pair?
    @rank = 3 if two_pair?
    @rank = 4 if three_of_a_kind?
    @rank = 5 if straight?
    @rank = 6 if flush?
    @rank = 7 if full_house?
    @rank = 8 if four_of_a_kind?
    @rank = 9 if straight_flush?
    @rank
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
    @hand_cards.each {|card| arr << card.value}
    value_arr
  end

  def suit_arr
    suit_arr = []
    @hand_cards.each {|card| arr << card.suit}
    suit_arr
  end
end
