class UsersController < ApplicationController
  helper_method :smallest_balance, :largest_balance

  def my_portfolio
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user = current_user
  end

  def smallest_balance
    balance_array = []
    @user_consumer_debts.all.each do |debt|
      balance_array.push(debt.balance)
    end
    balance_array.min
  end

  def largest_balance
    balance_array = []
    @user_consumer_debts.all.each do |debt|
      balance_array.push(debt.balance)
    end
    balance_array.max
  end

  def consumer_debts

  end

  def initial_questions

  end

  def levels

  end
end
