class CreateJobPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_posts do |t|
      t.string :name
      t.string :description
      t.string :skills
      t.float :budget
      t.integer :hours_of_work
      t.string :status

      t.timestamps
    end
  end
end
