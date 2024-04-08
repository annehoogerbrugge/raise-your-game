json.player do
  json.id           @player.id
  json.name         @player.name
  json.created_at   @player.created_at
  json.updated_at   @player.updated_at
end