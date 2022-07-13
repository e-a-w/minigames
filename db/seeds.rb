puts "--- STARTING ---"

puts "destroying records"

Game.delete_all
Deck.delete_all
Card.delete_all
Rank.delete_all
Suit.delete_all

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

tea_deck_id = Deck.where(_type: 0).first.id
fish_deck_id = Deck.where(_type: 1).first.id
standard_deck_id = Deck.where(_type: 2).first.id

puts "creating games"

Game.create!([
  {
    name: 'Matching',
    description: 'a fun matching game',
    rules: 'Match the cards',
    deck_id: tea_deck_id
  },
  {
    name: 'Go Fish',
    description: 'a fun fishing game',
    rules: 'Find the fish',
    deck_id: fish_deck_id
  },
  {
    name: 'War',
    description: 'a fun battling game',
    rules: 'Take all the cards',
    deck_id: standard_deck_id
  },
])

puts "creating tea cards, ranks, suits"

TEA_VARIETIES = [
  {name: 'Black', color: 'silver'},
  {name: 'Green', color: 'lightgreen'},
  {name: 'Herbal', color: 'lightpink'},
  {name: 'Oolong', color: 'khaki'},
  {name: 'White', color: 'seashell'},
].freeze

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
  {name: 'shark', color: 'grey', fishes: %w[great_white thresher mako whale]},
  {name: 'ray', color: 'goldenrod', fishes: %w[manta eagle sting cownose]},
  {name: 'eel', color: 'yellowgreen', fishes: %w[electric moray conger sawtooth]},
  {name: 'saltwater', color: 'mediumorchid', fishes: %w[tuna yellow_tang angler_fish swordfish]},
  {name: 'freshwater', color: 'mediumturquoise', fishes: %w[rainbow_trout bluegill carp striped_bass]},
].freeze

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

STANDARD_SUITS.each do |suit|
  suit = Suit.create!(deck_id: standard_deck_id, name: suit[:name], color: suit[:color])
  STANDARD_RANKS.each_with_index do |rank, idx|
    rank = Rank.create!(name: rank, value: idx, deck_id: standard_deck_id)
    Card.create!(suit_id: suit.id, rank_id: rank.id, deck_id: standard_deck_id)
  end
end

puts "--- FINISHED ---"