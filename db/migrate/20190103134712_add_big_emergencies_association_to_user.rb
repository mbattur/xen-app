class AddBigEmergenciesAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :big_emergencies, :user_id, :integer
  end
end
