class AddUserToPharmacies < ActiveRecord::Migration[6.0]
  def change
    add_reference :pharmacies, :user, foreign_key: true
  end
end
