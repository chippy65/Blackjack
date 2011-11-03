class Cardtable < ActiveRecord::Base

  def self.startup
   # Create a new shuffled desk of cards
   @deck = Deck.new

  # Create a new dealer
    @dealer = Player.new("Dealer", 0)

  # Create a new player
    @player = Player.new(User.username, 0)

  end

  def setBet
   @bet = 100 # params(:bet)
  end

  def deal
    # Create a new dealer
    @dealer = Player.new("Dealer", @bet)

    # Create a new player
    @player = Player.new(User.username, @bet)

  end

  def newShuffle
    # Shuffle the deck
    @deck = @deck.shuffle
  end

  def endGame
    # Collect all the dealer cards and players cards and put them
    # to the end of the deck

    # Update the stats for the dealer

    # Update the stats for the player

  end

  def self.show(whichPlayer, whichCard)
    # Show the whichCard for whichPlayer

    @deck.cards[0].image
  end


class Player

  attr_accessor :name, :hand, :bet, :winner

  def initialize(name, bet)
    @name = name
    @bet = bet
    @winner = false
  end
end

class Card
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SCORES = %w(2 3 4 5 6 7 8 9 10 10 10 10 11)
  SUITS = %w(Spades Clubs Hearts Diamonds)

  attr_accessor :rank, :score, :suit, :image

  def initialize(index)
    self.rank = RANKS[index % 13]
    self.score = SCORES[index % 13]
    self.suit = SUITS[index % 4]
    self.image = "/images/" + self.rank + self.suit + ".png"
  end

end

class Deck
 
  attr_accessor :cards

  def initialize
    self.cards = (0..51).to_a.shuffle.collect { |index| Card.new(index) }
  end
end
end
