class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :store_uid
      t.string :vehicle_vin
      t.datetime :date
      t.string :status
      t.decimal :total

      t.timestamps
    end
  end
end
