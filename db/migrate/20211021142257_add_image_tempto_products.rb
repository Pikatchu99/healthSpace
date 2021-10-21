class AddImageTemptoProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :first_image_temp, :text
    add_column :products, :second_image_temp, :text
  end
end
