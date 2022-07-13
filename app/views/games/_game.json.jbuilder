json.extract! game, :id, :name, :description, :rules, :created_at, :updated_at
json.url game_url(game, format: :json)
