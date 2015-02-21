json.array!(@pattern_types) do |pattern_type|
  json.extract! pattern_type, :id, :name, :pattern_text
  json.url pattern_type_url(pattern_type, format: :json)
end
