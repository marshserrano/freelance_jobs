class RemoveIntegerFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :integer, :string
  end
end
