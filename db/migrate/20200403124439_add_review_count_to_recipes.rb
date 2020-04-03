class AddReviewCountToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :review_count, :int
  end
end
