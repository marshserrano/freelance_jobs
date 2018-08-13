class RenameColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :company_name, :company
  end
end
