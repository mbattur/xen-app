require 'test_helper'

class CreditCardDebtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_card_debt = credit_card_debts(:one)
  end

  test "should get index" do
    get credit_card_debts_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_card_debt_url
    assert_response :success
  end

  test "should create credit_card_debt" do
    assert_difference('CreditCardDebt.count') do
      post credit_card_debts_url, params: { credit_card_debt: { balance: @credit_card_debt.balance, monthly_minimum: @credit_card_debt.monthly_minimum, name: @credit_card_debt.name } }
    end

    assert_redirected_to credit_card_debt_url(CreditCardDebt.last)
  end

  test "should show credit_card_debt" do
    get credit_card_debt_url(@credit_card_debt)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_card_debt_url(@credit_card_debt)
    assert_response :success
  end

  test "should update credit_card_debt" do
    patch credit_card_debt_url(@credit_card_debt), params: { credit_card_debt: { balance: @credit_card_debt.balance, monthly_minimum: @credit_card_debt.monthly_minimum, name: @credit_card_debt.name } }
    assert_redirected_to credit_card_debt_url(@credit_card_debt)
  end

  test "should destroy credit_card_debt" do
    assert_difference('CreditCardDebt.count', -1) do
      delete credit_card_debt_url(@credit_card_debt)
    end

    assert_redirected_to credit_card_debts_url
  end
end
