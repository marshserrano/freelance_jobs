class RemoveUserIdFromJobPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_posts, :user_id, :integer
  end
end
