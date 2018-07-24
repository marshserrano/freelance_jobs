class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :status
      t.integer :sender_id
      t.string :recipient_id
      t.string :integer
      t.references :job_post

      t.timestamps
    end
  end
end
