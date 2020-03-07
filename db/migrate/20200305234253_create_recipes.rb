class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients
      t.text :cooking_instruction
      t.integer :user_id 
      t.integer :meal_id

      t.timestamps
    end
  end
end
