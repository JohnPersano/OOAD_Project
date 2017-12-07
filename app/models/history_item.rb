# HistoryItem class
class HistoryItem < ApplicationRecord

  # Aggregate relationship (for database use)
  belongs_to :rently_admin, optional: true

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171203173310_create_history_items'

  # Add item to database
  def add_item
    self.save!
  end

end
