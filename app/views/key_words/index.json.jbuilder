json.array!(@key_words) do |key_word|
  json.extract! key_word, :id, :name, :pattern_type_id
  json.url key_word_url(key_word, format: :json)
end
