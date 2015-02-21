class CreateKeyWords < ActiveRecord::Migration
  def change
    create_table :key_words do |t|
      t.string :name
      t.integer :pattern_type_id

      t.timestamps null: false
    end
  end
end
