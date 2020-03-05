class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :overview
      t.integer :rating
      t.integer :meal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
