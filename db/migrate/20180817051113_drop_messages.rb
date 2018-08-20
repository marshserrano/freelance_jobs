class DropMessages < ActiveRecord::Migration[5.2]
  def up
    drop_table :messages
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
