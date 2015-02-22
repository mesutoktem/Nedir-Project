class PatternType < ActiveRecord::Base

  has_many :patterns

  def self.keyword_symbol
    return "*-*"
  end

end


