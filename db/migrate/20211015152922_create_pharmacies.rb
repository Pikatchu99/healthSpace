class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :whatsapp

      t.timestamps
    end
  end
end
