class CreateVehicleDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_descriptions do |t|
      t.integer :vehicle_id
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.text :description
      t.integer :seats
      t.integer :doors

      t.timestamps
    end
  end
end
