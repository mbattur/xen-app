class CreateCreditCardDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_card_debts do |t|
      t.string :name
      t.decimal :balance
      t.decimal :monthly_minimum

      t.timestamps
    end
  end
end
