class RemovePostIdColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :post_id, :bigint
  end
end
