json.play_through do
  json.id                 @play_through.id
  json.score              @play_through.score
  json.time_spent_in_sec  @play_through.time_spent
  json.player do            
    json.id               @play_through.player.id
    json.name             @play_through.player.name
  end
end