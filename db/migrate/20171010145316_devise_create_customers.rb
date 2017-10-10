class DeviseCreateCustomers < ActiveRecord::Migration[5.1]

  def change
    create_table :customers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Other fields
      t.string :name,               null: false, default: ''
      t.string :phone_number,       null: false, default: ''
      t.string :license_id,         null: false, default: ''
      t.datetime :dob

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
  end
end
