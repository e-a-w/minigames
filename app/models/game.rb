class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, through: :deck

  def card_collection(shuffled: true)
    collection = deck.tea? ? cards.zip(cards).flatten : cards

    shuffled ? collection.shuffle : collection
  end
end
