class CreateStres < ActiveRecord::Migration
  def change
    create_table :stres do |t|
      t.text :title
      t.text :content

      t.timestamps null: false
    end
  end
end
