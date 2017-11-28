class CreateStoreItems < ActiveRecord::Migration[5.1]
  def change
    create_table :store_items do |t|
      t.integer :store_id
      t.integer :quantity
      t.boolean :available
      t.datetime :available_time
      t.decimal :cost
      t.decimal :discount
      t.string :dropoff_location

      t.timestamps
    end
  end
end
