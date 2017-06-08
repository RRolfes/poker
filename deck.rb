require_relative "card"
class Deck
  attr_accessor :deck

  SUITS = %i[spades clubs diamonds hearts]

  def initialize(deck = Deck.make_deck)
    @deck = deck
    @deck.shuffle
  end

  def self.make_deck
    deck = []
    SUITS.each do |suit|
      (1..13).each do |num|
        deck << Card.new(num, suit)
      end
    end
    deck
  end
end
