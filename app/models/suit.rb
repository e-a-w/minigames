class Suit < ApplicationRecord
  belongs_to :deck
  has_many :cards

  delegate :_type, to: :deck

  def display_name
    _type === 'tea' ? "#{name} tea" : name
  end
end
