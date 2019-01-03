require 'test_helper'

class MortgageAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mortgage_account = mortgage_accounts(:one)
  end

  test "should get index" do
    get mortgage_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_mortgage_account_url
    assert_response :success
  end

  test "should create mortgage_account" do
    assert_difference('MortgageAccount.count') do
      post mortgage_accounts_url, params: { mortgage_account: { balance: @mortgage_account.balance } }
    end

    assert_redirected_to mortgage_account_url(MortgageAccount.last)
  end

  test "should show mortgage_account" do
    get mortgage_account_url(@mortgage_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_mortgage_account_url(@mortgage_account)
    assert_response :success
  end

  test "should update mortgage_account" do
    patch mortgage_account_url(@mortgage_account), params: { mortgage_account: { balance: @mortgage_account.balance } }
    assert_redirected_to mortgage_account_url(@mortgage_account)
  end

  test "should destroy mortgage_account" do
    assert_difference('MortgageAccount.count', -1) do
      delete mortgage_account_url(@mortgage_account)
    end

    assert_redirected_to mortgage_accounts_url
  end
end
