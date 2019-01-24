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

    if stack.balance == 0 && small_em.balance == 0
      level.level = 0
      level.save!
    elsif stack.balance <= 999 && small_em.balance == 0
      level.level = 1
      level.save!
    elsif level.level == 1 && stack.balance >= 1000 && small_em.balance == 0
      small_em.balance = 1000
      small_em.save!
      stack.balance = stack.balance - 1000
      stack.save!
      level.level = 2
      level.save!
    elsif stack.balance >= 1000 && small_em.balance == 1000 && has_card_debt
      #pay smallest credit card
      stack.balance = stack.balance - 1000
      stack.save!
      level.level = 3
      level.save!
    elsif stack.balance >= 1000 && small_em.balance == 1000 && !has_card_debt && has_consumer_debt
      #pay smallest consumer debt
      stack.balance = stack.balance - 1000
      stack.save!
      level.level = 4
      level.save!
    elsif stack.balance >= 1000 && small_em.balance == 1000 && !has_card_debt && !has_consumer_debt && big_em < 15000
      #transfer stack account to user's savings account until it reaches $15,000
      stack.balance = stack.balance - 1000
      stack.save!
      level.level = 5
      level.save!
    # else stack.balance >= 1000 && small_em.balance == 1000 && !has_card_debt && !has_consumer_debt && big_em >= 15000
    #   #transfer to etf and pay mortgage
    #   if stack.balance > 0
    #     stack.balance = stack.balance - 1000
    #     stack.save!
    #   end
    #   level.level = 7
    #   level.save!
    end

    level.level
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
