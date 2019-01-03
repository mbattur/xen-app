class UsersController < ApplicationController
  helper_method :cash_on_hand, :sorted_consumer_debts, :sorted_credit_card_debts,
                :smallest_balance, :largest_balance, :current_level, :stack_account_remaining

  def levels
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user_stack_accounts = current_user.stack_account
    @user = current_user
  end
  
  def my_portfolio
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user = current_user
  end

  def stack_account_remaining
    remaining = 2000 - @user_stack_accounts.balance
    remaining
  end

  def current_level
    level = 1
    card = @user_credit_card_debts.present?
    consumer = @user_consumer_debts.present?

    @user_questions.all.each do |question|
      if question.cash_savings <= 1000
        level = 2
      elsif question.cash_savings >= 1000 && card
        level = 3
      elsif question.cash_savings >= 1000 && !card && consumer
        level = 4
      elsif question.cash_savings <= 15000 && !card && !consumer
        level = 5
      elsif question.cash_savings >= 15000 && !card && !consumer && question.retirment_contribution <= 0
        level = 6
      else
        level = 7
      end
    end
    level
  end

  def cash_on_hand
    cash_array = []

    @user_questions.all.each do |debt|
      cash_array.push(debt)
    end
    cash_array
  end

  def sorted_consumer_debts
    balance_array = []

    @user_consumer_debts.all.each do |debt|
      balance_array.push(debt)
    end
    balance_array.sort_by &:balance
  end

  def sorted_credit_card_debts
    balance_array = []

    @user_credit_card_debts.all.each do |debt|
      balance_array.push(debt)
    end
    balance_array.sort_by &:balance
  end


  def consumer_debts

  end

  def initial_questions

  end
end
