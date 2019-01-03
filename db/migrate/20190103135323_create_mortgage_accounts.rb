class CreateMortgageAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :mortgage_accounts do |t|
      t.float :balance

      t.timestamps
    end
  end
end
