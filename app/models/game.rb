class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, through: :deck

  def card_collection
    if deck.tea?
      cards + cards
    else
      cards
    end
  end
end
