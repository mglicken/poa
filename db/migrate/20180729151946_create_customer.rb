class CreateCustomer < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :property_name
      t.integer :occupancy_id
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end
