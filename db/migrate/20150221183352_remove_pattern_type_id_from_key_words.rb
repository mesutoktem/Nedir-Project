class RemovePatternTypeIdFromKeyWords < ActiveRecord::Migration
  def change
    remove_column :key_words, :pattern_type_id, :integer
  end
end
