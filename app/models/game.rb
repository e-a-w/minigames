class Game < ApplicationRecord
  belongs_to :deck
  has_many :cards, through: :deck

  enum _type: { standard: 0, matching: 1, go_fish: 2 }

  def card_collection(shuffled: true)
    collection = deck.tea? ? cards.zip(cards).flatten : cards

    shuffled ? collection.shuffle : collection
  end
end
