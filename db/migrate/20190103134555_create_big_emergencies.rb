class CreateBigEmergencies < ActiveRecord::Migration[5.2]
  def change
    create_table :big_emergencies do |t|
      t.float :balance

      t.timestamps
    end
  end
end
