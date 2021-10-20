class AddColumntoProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :first_image, :text
    add_column :products, :second_image,:text
  end
end
