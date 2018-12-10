require 'test_helper'

class ConsumerDebtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumer_debt = consumer_debts(:one)
  end

  test "should get index" do
    get consumer_debts_url
    assert_response :success
  end

  test "should get new" do
    get new_consumer_debt_url
    assert_response :success
  end

  test "should create consumer_debt" do
    assert_difference('ConsumerDebt.count') do
      post consumer_debts_url, params: { consumer_debt: { balance: @consumer_debt.balance, monthly_minimum: @consumer_debt.monthly_minimum, name: @consumer_debt.name } }
    end

    assert_redirected_to consumer_debt_url(ConsumerDebt.last)
  end

  test "should show consumer_debt" do
    get consumer_debt_url(@consumer_debt)
    assert_response :success
  end

  test "should get edit" do
    get edit_consumer_debt_url(@consumer_debt)
    assert_response :success
  end

  test "should update consumer_debt" do
    patch consumer_debt_url(@consumer_debt), params: { consumer_debt: { balance: @consumer_debt.balance, monthly_minimum: @consumer_debt.monthly_minimum, name: @consumer_debt.name } }
    assert_redirected_to consumer_debt_url(@consumer_debt)
  end

  test "should destroy consumer_debt" do
    assert_difference('ConsumerDebt.count', -1) do
      delete consumer_debt_url(@consumer_debt)
    end

    assert_redirected_to consumer_debts_url
  end
end
