json.array!(@stres) do |stre|
  json.extract! stre, :id, :title, :content
  json.url stre_url(stre, format: :json)
end
