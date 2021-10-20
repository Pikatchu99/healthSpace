class AddPharmacyToSchedules < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacies, :days, :text
    add_reference :schedules, :pharmacy, foreign_key: true
  end
end
