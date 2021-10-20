class AddPharmacyToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :pharmacy, foreign_key: true
  end
end
