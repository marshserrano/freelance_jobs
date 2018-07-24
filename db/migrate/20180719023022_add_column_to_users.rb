class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_name, :string
    add_column :users, :job_title, :string
    add_column :users, :brief_intro, :string
    add_column :users, :summary, :text
    add_column :users, :skills, :string
    add_column :users, :location, :string
  end
end
