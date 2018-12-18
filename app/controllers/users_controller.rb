class UsersController < ApplicationController

  def my_portfolio
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user = current_user
  end

  def consumer_debts

  end

  def initial_questions

  end

  def levels

  end
end
