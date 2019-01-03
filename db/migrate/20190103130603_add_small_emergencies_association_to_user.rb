class AddSmallEmergenciesAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :small_emergencies, :user_id, :integer
  end
end
