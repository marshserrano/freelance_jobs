class RemovePostIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_index :reviews, column: :post_id
  end
end
