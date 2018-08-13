class ChangeColumnDefaultStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :status, 0
  end
end
