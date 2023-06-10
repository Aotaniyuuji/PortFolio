class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :genre, foreign_key: true,  null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :all_rating, null: false

      t.timestamps
    end
  end
end
