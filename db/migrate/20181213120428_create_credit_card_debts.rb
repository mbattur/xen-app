class CreateCreditCardDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_card_debts do |t|
      t.string :card_name
      t.float :balance
      t.integer :card_number
      t.string :payee_name
      t.string :payee_address1
      t.string :payee_address2
      t.string :payee_city
      t.string :payee_state
      t.integer :payee_zip

      t.timestamps
    end
  end
end
