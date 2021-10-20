class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :lundi
      t.string :mardi
      t.string :mercredi
      t.string :jeudi
      t.string :vendredi
      t.string :samedi
      t.string :dimanche

      t.timestamps
    end
  end
end
