class AddCreditCardDebtsAssociationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_card_debts, :user_id, :integer
  end
end
