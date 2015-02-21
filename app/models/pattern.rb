class Pattern < ActiveRecord::Base
  has_many :pattern_type
  has_many :key_words, through: :key_word_patterns
  belongs_to :pattern_type
end
