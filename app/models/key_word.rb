class KeyWord < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :key_word_patterns
  has_many :patterns, through: :key_word_patterns
end
