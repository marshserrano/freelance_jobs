class AddHoursOfWorkToJobPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :job_posts, :hours_of_work, :float
  end
end
