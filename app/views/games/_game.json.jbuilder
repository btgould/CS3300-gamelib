json.extract! game, :id, :title, :genre, :price, :interest, :description, :created_at, :updated_at
json.url game_url(game, format: :json)
