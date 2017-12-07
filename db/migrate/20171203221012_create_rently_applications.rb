class CreateRentlyApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :rently_applications do |t|
      t.integer :server_uptime
      t.integer :connections_served
      t.string :stacktraces

      t.timestamps
    end
  end
end
