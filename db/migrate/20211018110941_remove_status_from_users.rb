class RemoveStatusFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :status, :boolean
    add_column :users, :user_role, :string, :default =>  "Patient"
  end
end
