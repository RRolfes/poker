class Hand
  def initialize
    @hand = []
    @value = 0
  end

  def check_hand
    @value = 1 if @hand.pair?
    @value = 2 if @hand.pair?
    @value = 3 if @hand.pair?
    @value = 4 if @hand.pair?
    @value = 5 if @hand.pair?
    @value = 6 if @hand.pair?
    @value = 7 if @hand.pair?
    @value = 8 if @hand.pair?
  end

  def pair?
    cards = @hand.value.sort
    cards.each_with_index do |card|
      return true if card.value == cards[idx + 1].value
    end
    false
  end

  def two_pair?
    cards = @hand.value.sort
    pair_count = 0
    cards.each_with_index do |card, idx|
      if card.value == cards[idx + 1].value
        pair_count += 1 unless card.value == cards[idx - 1].value
      end
    end

    pair_count == 2 ? true : false
  end

  def three_kind?
    cards = @hand.value.sort
    cards.each_with_index do |card|
      return true if cards.pair? && card.value == cards[idx + 2].value
    end
    false
  end


  def straight?
    cards = @hand.value.sort
    cards.first.value + 4 == cards.last.value ? true : false
  end

  def flush?
    f_suit = @hand.first.suit
    @hand.all? { |card| card.suit == f_suit } ? true : false
  end

  def full_house?
    cards = @hand
    three_card = cards[2]
    others = []

    if cards.three_kind?
      cards.each do |card|
        others << card if card.value != three_card.value
      end
    else
      return false
    end

    if others.pair?
      return true
    end
  end

  def four_of_a_kind?
    cards = @hand.value.sort
    cards.each_with_index do |card|
    cards.three_kind? && card.value == cards[idx + 3].value ? true : false
  end


  def straight_flush?
    @hand.straight? && @hand.flush? ? true : false
  end


end
