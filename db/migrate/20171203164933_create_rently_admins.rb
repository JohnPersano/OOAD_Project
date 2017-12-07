class CreateRentlyAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :rently_admins do |t|
      t.string :email
      t.string :password
      t.datetime :lastLogin
      t.string :privileges

      t.timestamps
    end
  end
end
