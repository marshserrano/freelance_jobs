class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.text :content
      t.integer :status, default: 0
      t.integer :sender_id
      t.integer :recipient_id
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
