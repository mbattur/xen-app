class AddRetirementAccountsAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :retirement_accounts, :user_id, :integer
  end
end
