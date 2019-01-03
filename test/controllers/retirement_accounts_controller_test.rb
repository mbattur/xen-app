require 'test_helper'

class RetirementAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retirement_account = retirement_accounts(:one)
  end

  test "should get index" do
    get retirement_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_retirement_account_url
    assert_response :success
  end

  test "should create retirement_account" do
    assert_difference('RetirementAccount.count') do
      post retirement_accounts_url, params: { retirement_account: { balance: @retirement_account.balance } }
    end

    assert_redirected_to retirement_account_url(RetirementAccount.last)
  end

  test "should show retirement_account" do
    get retirement_account_url(@retirement_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_retirement_account_url(@retirement_account)
    assert_response :success
  end

  test "should update retirement_account" do
    patch retirement_account_url(@retirement_account), params: { retirement_account: { balance: @retirement_account.balance } }
    assert_redirected_to retirement_account_url(@retirement_account)
  end

  test "should destroy retirement_account" do
    assert_difference('RetirementAccount.count', -1) do
      delete retirement_account_url(@retirement_account)
    end

    assert_redirected_to retirement_accounts_url
  end
end
