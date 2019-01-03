class AddMortgageAccountsAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :mortgage_accounts, :user_id, :integer
  end
end
