json.array! @players do |player|
  json.id               player.id
  json.name             player.name
  json.total_score      player.total_score
  json.total_duration   player.total_duration
end