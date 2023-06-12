class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :game, foreign_key: true, null: false
      t.float :rating, null: false
      t.text :comment

      t.timestamps
    end
  end
end
