class RenameTableJobPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :job_posts, :posts
  end
end
