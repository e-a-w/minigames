puts "--- STARTING ---"

puts "destroying records"

Game.destroy_all
Deck.destroy_all
Card.destroy_all
Rank.destroy_all
Suit.destroy_all

puts "creating games"

Game.create!([
  {
    name: 'Matching',
    description: 'a fun matching game',
    rules: 'Match the cards'
  },
  {
    name: 'Go Fish',
    description: 'a fun fishing game',
    rules: 'Find the fish'
  },
  {
    name: 'War',
    description: 'a fun battling game',
    rules: 'Take all the cards'
  },
])

puts "creating decks"

Deck.create!([
  {
    _type: 0,
    name: "tea",
    description: "a deck of tea cards"
  },
  {
    _type: 1,
    name: "fish",
    description: "a deck of fish cards"
  },
  {
    _type: 2,
    name: "standard",
    description: "a standard deck of cards"
  },
])

puts "creating tea cards, ranks, suits"

TEA_VARIETIES = [
  {name: 'Black', color: 'black'},
  {name: 'Green', color: 'green'},
  {name: 'Herbal', color: 'rose'},
  {name: 'Oolong', color: 'amber'},
  {name: 'White', color: 'gray'},
].freeze

tea_deck_id = Deck.where(_type: 0).first.id

TEA_VARIETIES.each do |tea|
  suit = Suit.create!(deck_id: tea_deck_id, name: tea[:name].downcase, color: tea[:color])
  4.times do |i|
    tea_name = Faker::Tea.unique.variety(type: tea[:name]).downcase
    rank = Rank.create!(value: i, deck_id: tea_deck_id, name: tea_name)
    Card.create!(deck_id: tea_deck_id, rank_id: rank.id, suit_id: suit.id)
  end
end

puts "creating fish cards, ranks, suits"

FISH_VARIETIES = [
  {name: 'shark', color: 'stone', fishes: %w[great_white thresher mako whale]},
  {name: 'ray', color: 'green', fishes: %w[manta eagle sting cownose]},
  {name: 'eel', color: 'lime', fishes: %w[electric moray conger sawtooth]},
  {name: 'saltwater', color: 'fuchsia', fishes: %w[tuna yellow_tang angler_fish swordfish]},
  {name: 'freshwater', color: 'blue', fishes: %w[rainbow_trout bluegill carp striped_bass]},
].freeze

fish_deck_id = Deck.where(_type: 1).first.id

FISH_VARIETIES.each do |fish|
  suit = Suit.create!(deck_id: fish_deck_id, name: fish[:name], color: fish[:color])
  4.times do |i|
    fish_name = fish[:fishes][i]
    rank = Rank.create!(value: i, deck_id: fish_deck_id, name: fish_name)
    Card.create!(deck_id: fish_deck_id, rank_id: rank.id, suit_id: suit.id)
  end
end

puts "creating standard cards, ranks, suits"

STANDARD_SUITS = [
  {name: 'spades', color: 'black'},
  {name: 'clubs', color: 'black'},
  {name: 'hearts', color: 'red'},
  {name: 'diamonds', color: 'red'},
].freeze

STANDARD_RANKS = %w[ace two three four five six seven eight nine ten jack queen king].freeze

standard_deck_id = Deck.where(_type: 2).first.id

STANDARD_SUITS.each do |suit|
  suit = Suit.create!(deck_id: standard_deck_id, name: suit[:name], color: suit[:color])
  STANDARD_RANKS.each_with_index do |rank, idx|
    rank = Rank.create!(name: rank, value: idx, deck_id: standard_deck_id)
    Card.create!(suit_id: suit.id, rank_id: rank.id, deck_id: standard_deck_id)
  end
end

puts "--- FINISHED ---"