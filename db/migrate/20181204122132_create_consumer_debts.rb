class CreateConsumerDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :consumer_debts do |t|
      t.string :name
      t.decimal :balance
      t.decimal :monthly_minimum

      t.timestamps
    end
  end
end
