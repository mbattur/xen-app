class AddConsumerDebtsAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :consumer_debts, :user_id, :integer
  end
end
