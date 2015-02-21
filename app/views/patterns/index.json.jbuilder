json.array!(@patterns) do |pattern|
  json.extract! pattern, :id, :name, :pattern_type_id
  json.url pattern_url(pattern, format: :json)
end
