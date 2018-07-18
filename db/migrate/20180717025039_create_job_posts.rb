class CreateJobPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_posts do |t|
      t.string :name
      t.text :description
      t.string :skills
      t.float :budget
      t.integer :hours_of_work
      t.string :status
      t.references :users, foreign_key: true

      t.timestamps
    end
    add_index :job_posts, [:user_id, :created_at]
  end
end
