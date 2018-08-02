class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.integer :reviewer_id
      t.integer :reviewee_id
      t.references :job_post

      t.timestamps
    end
  end
end
