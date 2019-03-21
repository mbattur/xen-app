# frozen_string_literal: true

require 'pry'

class UsersController < ApplicationController
  helper_method :cash_on_hand, :sorted_consumer_debts, :sorted_credit_card_debts,
                :smallest_balance, :largest_balance, :current_level, :stack_account_remaining,
                :pay_smallest_cards

  def my_portfolio
    @user_credit_card_debts = current_user.credit_card_debts
    @user_consumer_debts = current_user.consumer_debts
    @user_questions = current_user.questions
    @user = current_user
  end

  def stack_account_remaining
    remaining = 1000 - current_user.stack_account.balance
    remaining.round(2)
  end

  # credt_cards_controller
  # def pay
  #   CreditCard.find(params[:id]).pay!
  # end

  def pay_each_debts(cards)
    stack = current_user.stack_account
    cards.each do |card|
      if card.balance <= stack.balance
        stack.balance = stack.balance - card.balance
        stack.save!
        card.destroy!
      else card.balance > stack.balance
        card.balance = card.balance - stack.balance
        card.save
        stack.balance = 0
        stack.save!
      end
    end
  end

  def pay_smallest_cards(card_debts)
    sorted_array = []
    card_debts.each do |debt|
      sorted_array.push(debt)
    end
    sorted_array = sorted_array.sort_by &:balance
    pay_each_debts(sorted_array)
  end

  def pay_smallest_consumer_debts(consumer_debts)
    sorted_array = []
    consumer_debts.each do |debt|
      sorted_array.push(debt)
    end
    sorted_array = sorted_array.sort_by &:balance
    pay_each_debts(sorted_array)
  end

  def current_level
    has_card_debt = current_user.credit_card_debts.present?
    has_consumer_debt = current_user.consumer_debts.present?
    small_em = current_user.small_emergency
    big_em = current_user.big_emergency
    stack = current_user.stack_account
    level = current_user.user_level

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
      pay_smallest_cards(current_user.credit_card_debts)
      level.level = 3
      level.save!
    elsif stack.balance >= 1000 && small_em.balance == 1000 && !has_card_debt && has_consumer_debt
      pay_smallest_consumer_debts(current_user.consumer_debts)
      level.level = 4
      level.save!
    elsif stack.balance >= 1000 && small_em.balance == 1000 && !has_card_debt && !has_consumer_debt && big_em < 15_000
      # transfer stack account to user's savings account until it reaches $15,000
      stack.balance = stack.balance - 1000
      stack.save!
      level.level = 5
      level.save!
    elsif stack.balance >= 1000 && small_em.balance == 1000 && !has_card_debt && !has_consumer_debt && big_em = 15_000
      #   #transfer to etf and pay mortgage
      stack.balance = stack.balance - 1000
      stack.save!
      level.level = 7
      level.save!
    end

    level.level
  end

  def cash_on_hand
    cash_array = []

    current_user.questions.each do |debt|
      cash_array.push(debt)
    end
    cash_array
  end

  def sorted_consumer_debts
    balance_array = []

    current_user.consumer_debts.each do |debt|
      balance_array.push(debt)
    end
    balance_array.sort_by &:balance
  end

  def sorted_credit_card_debts
    balance_array = []

    current_user.credit_card_debts.each do |debt|
      balance_array.push(debt)
    end
    balance_array.sort_by &:balance
  end

  def consumer_debts; end

  def initial_questions; end
end
