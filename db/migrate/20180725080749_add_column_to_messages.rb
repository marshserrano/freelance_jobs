class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :accepted, :boolean, default: false
    add_column :messages, :completed, :boolean, default: false
  end
end
