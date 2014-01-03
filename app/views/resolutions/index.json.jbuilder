json.array!(@resolutions) do |resolution|
  json.extract! resolution, :id, :description, :progress
  json.url resolution_url(resolution, format: :json)
end
