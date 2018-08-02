class RemoveHoursOfWorkFromJobPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_posts, :hours_of_work, :integer
  end
end
