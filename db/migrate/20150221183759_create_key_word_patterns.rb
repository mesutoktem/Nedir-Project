class CreateKeyWordPatterns < ActiveRecord::Migration
  def change
    create_table :key_word_patterns do |t|
      t.string :key
      t.integer :key_word_id
      t.integer :pattern_id
      t.text :content

      t.timestamps null: false
    end
  end
end
