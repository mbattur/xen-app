class UsersController < ApplicationController
  helper_method :cash_on_hand, :sorted_consumer_debts, :sorted_credit_card_debts,
                :smallest_balance, :largest_balance, :current_level, :stack_account_remaining

  def levels
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user_stack_accounts = current_user.stack_account
    @user_small_emergency = current_user.small_emergency
    @user_big_emergency = current_user.big_emergency
    @user_retirement_account = current_user.retirement_account
    @user_mortgage_account = current_user.mortgage_account
    @user_level = current_user.user_level
    @user = current_user
  end

  def my_portfolio
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user = current_user
  end

  def stack_account_remaining
    remaining = 1000 - @user_stack_accounts.balance
    remaining.round(2)
  end

  def current_level
    has_card_debt = @user_credit_card_debts.present?
    has_consumer_debt = @user_consumer_debts.present?
    small_em = @user_small_emergency
    big_em = @user_big_emergency.balance
    retire = @user_retirement_account.balance
    stack = @user_stack_accounts
    level = @user_level

    if stack.balance >= 1 && small_em.balance == 0
      level.level = 1
      level.save!
    # elsif stack.balance >= 1000 && small_em.balance == 0
    #   small_em.balance = 1000
    #   small_em.save!
    #   stack.balance = stack.balance - 1000
    #   stack.save!
    #   level = 2
    # elsif stack.balance < 1000 && small_em.balance == 1000
    #   level = 2
    # elsif stack.balance >= 1000 && small_em.balance == 1000 && has_card_debt && level == 2
    #   stack.balance = stack.balance - 1000
    #   stack.save!
    #   level = 3
    else
      level = 999
    end

    # if small_em > 1000 && big_em > 15000  && !has_card_debt && !has_consumer_debt && retire > 0
    #   level = 7
    # elsif small_em > 1000 && big_em > 15000  && !has_card_debt && !has_consumer_debt
    #   level = 6
    # elsif small_em > 1000 && big_em <= 15000 && !has_card_debt && !has_consumer_debt
    #   level = 5
    # elsif small_em > 1000 && !has_card_debt && has_consumer_debt
    #   level = 4
    # elsif small_em > 1000 && has_card_debt
    #   level = 3
    # elsif small_em == 0 && stack >= 1000
    #   level = 2
    #   small_em = 1000
    #   stack -= 1000
    # else
    #   level = 1
    # end
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
