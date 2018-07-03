class Card

  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K',
    ace: 'A'
  }
  attr_reader :value, :suit

  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  def initialize(value, suit)
    unless Card.suits.include?(suit) && Card.values.include?(value)
      fail "illegal suit (#{suit}) or value (#{value})"
    end
    @value = value
    @suit = suit
  end

  def to_s
    VALUE_STRINGS[@value] + SUIT_STRINGS[@suit]
  end
end
