class CreateBillingInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :billing_informations do |t|
      t.integer :cardNumber
      t.date :cardExpiration
      t.decimal :total
      t.decimal :salesTax

      t.timestamps
    end
  end
end
