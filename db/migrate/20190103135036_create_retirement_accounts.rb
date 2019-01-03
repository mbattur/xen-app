class CreateRetirementAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :retirement_accounts do |t|
      t.float :balance

      t.timestamps
    end
  end
end
