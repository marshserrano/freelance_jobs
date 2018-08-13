class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :skills, :string
    remove_column :users, :location, :string
  end
end
