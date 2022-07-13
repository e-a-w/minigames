# base deck class
class Deck < ApplicationRecord
  enum _type: { tea: 0, fish: 1, standard: 2 }

  has_many :ranks
  has_many :suits
  has_many :cards

  def deck_size
    cards.count
  end

  def suit_names
    suits.pluck(:name)
  end

  def rank_names
    ranks.pluck(:name)
  end

  def card_names
    cards.map(&:name)
  end
end
