# Rently administrator class
class RentlyAdmin < ApplicationRecord

  # Composition relationship (for database use)
  belongs_to :rently_application, optional: true

  # Aggregation relationship (for database use)
  has_many :history_item

  # Note: All fields are defined in the database wrapper in 'db/migrate/20171203164933_create_rently_admins'

  # All functions below are private
  private

  # Approve a particular Store in the database
  def approve_store_app(uid)
    Store.unlock.where(uid: uid)
  end

  # Reject a particular Store in the database
  def reject_store_app(uid)
    Store.lock.where(uid: uid)
  end

  # Edit a particular Store in the database
  def edit_store(edited_store)
    store = Store.find(edited_store.uid)
    store.attributes = edited_store.attributes
    store.save!
  end

  # Delete a particular Store in the database
  def delete_store(uid)
    store = Store.find(uid)
    store.delete!
  end

  # Create a new User in the database
  def create_user(name, email, password)

    # Password is hashed automatically
    user = User.new(name: name, email: email, password: password)
    user.save!
  end

  # Edit a User in the database
  def edit_user(edited_user)
    user = User.find(edited_user.email)
    user.attributes = edited_user.attributes
    user.save!
  end

  # Delete a particular User in the database
  def delete_user(user_email)
    user = User.all.where(email: user_email)
    user.delete!
  end

end
