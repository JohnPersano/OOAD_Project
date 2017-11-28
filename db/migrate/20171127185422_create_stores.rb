class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :uid
      t.string :name
      t.string :phone_number
      t.string :image_url
      t.string :hours

      t.timestamps
    end
  end
end
