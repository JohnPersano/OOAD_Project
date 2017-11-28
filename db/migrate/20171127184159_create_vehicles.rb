class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :store_item_id

      t.string :vin
      t.string :plate
      t.integer :mileage
      t.string :image_url

      t.timestamps
    end
  end
end
