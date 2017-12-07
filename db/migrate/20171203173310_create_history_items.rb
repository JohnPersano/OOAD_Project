class CreateHistoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :history_items do |t|
      t.string :actionName
      t.string :actionItem
      t.datetime :actionDate
      t.string :actionResult
      t.string :priviledges
      t.string :priviledgesUsed
      t.string :storeUID
      t.string :userEmail

      t.timestamps
    end
  end
end
