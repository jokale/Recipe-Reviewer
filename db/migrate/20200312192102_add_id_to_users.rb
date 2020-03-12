class AddIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :recipe_id, :integer
    add_column :users, :review_id, :integer
  end
end
