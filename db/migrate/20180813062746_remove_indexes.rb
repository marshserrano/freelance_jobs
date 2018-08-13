class RemoveIndexes < ActiveRecord::Migration[5.2]
  def change
    remove_index :reviews, column: :job_post_id
    remove_index :messages, column: :job_post_id
  end
end
