class AddPostToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :post, foreign_key: true
  end
end
