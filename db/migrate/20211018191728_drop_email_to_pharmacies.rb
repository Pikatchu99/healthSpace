class DropEmailToPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacies, :email
    add_column :pharmacies, :city, :string
    add_column :pharmacies, :quartier, :string
  end
end
