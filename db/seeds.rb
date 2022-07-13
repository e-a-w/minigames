Game.destroy_all

Game.create([
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
