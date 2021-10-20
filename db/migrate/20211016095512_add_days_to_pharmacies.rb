class AddDaysToPharmacies < ActiveRecord::Migration[6.0]
  def change
    add_column :pharmacies, :days, :text, array: true, default: []
  end
end
