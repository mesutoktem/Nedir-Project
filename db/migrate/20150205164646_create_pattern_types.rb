class CreatePatternTypes < ActiveRecord::Migration
  def change
    create_table :pattern_types do |t|
      t.string :name
      t.text :pattern_text

      t.timestamps null: false
    end
  end
end
