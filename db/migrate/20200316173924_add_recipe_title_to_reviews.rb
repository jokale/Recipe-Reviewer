class AddRecipeTitleToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :recipe_title, :string
  end
end
