class AddUserLevelsAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :user_levels, :user_id, :integer
  end
end
