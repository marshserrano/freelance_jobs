class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :barangay
      t.string :city_municipality
      t.string :province
      t.integer :zip_code
      t.references :user

      t.timestamps
    end
  end
end
