class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :rank
  belongs_to :suit

  delegate :color, to: :suit

  def name
    if deck.standard?
      rank.name + " of " + suit.name
    else
      rank.name + ", " + suit.name
    end
  end

  def bg_color
    color
  end

  def text_color
    deck.tea? ? '#000000' : '#ffffff'
  end
end
