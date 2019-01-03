class AddStackAccountsAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :stack_accounts, :user_id, :integer
  end
end
