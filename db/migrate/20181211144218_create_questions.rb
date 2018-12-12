class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :occupation
      t.date :birthday
      t.integer :annual_income
      t.integer :paycheck
      t.integer :paycheck_occurance
      t.integer :card_debt
      t.integer :consumer_debt
      t.integer :mortgage_balance
      t.integer :retirment_contribution
      t.integer :college_contribution
      t.integer :cash_savings

      t.timestamps
    end
  end
end
