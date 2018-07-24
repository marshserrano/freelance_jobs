class ChangeColumnDefaultStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :messages, :status, 'pending'
  end
end
