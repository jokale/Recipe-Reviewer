class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
