class CreateSmallEmergencies < ActiveRecord::Migration[5.2]
  def change
    create_table :small_emergencies do |t|
      t.float :balance

      t.timestamps
    end
  end
end
