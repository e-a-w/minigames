class Rank < ApplicationRecord
  belongs_to :deck
  has_many :cards

  delegate :_type, to: :deck
end
