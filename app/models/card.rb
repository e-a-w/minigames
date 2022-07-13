class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :rank
  belongs_to :suit

  delegate :color, to: :suit
  delegate :_type, to: :deck

  def name
    case _type
    when 'standard'
      rank.name + " of " + suit.name
    else
      rank.name + ", " + suit.name
    end
  end
end
