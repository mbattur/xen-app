require 'test_helper'

class StackAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stack_account = stack_accounts(:one)
  end

  test "should get index" do
    get stack_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_stack_account_url
    assert_response :success
  end

  test "should create stack_account" do
    assert_difference('StackAccount.count') do
      post stack_accounts_url, params: { stack_account: { balance: @stack_account.balance } }
    end

    assert_redirected_to stack_account_url(StackAccount.last)
  end

  test "should show stack_account" do
    get stack_account_url(@stack_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_stack_account_url(@stack_account)
    assert_response :success
  end

  test "should update stack_account" do
    patch stack_account_url(@stack_account), params: { stack_account: { balance: @stack_account.balance } }
    assert_redirected_to stack_account_url(@stack_account)
  end

  test "should destroy stack_account" do
    assert_difference('StackAccount.count', -1) do
      delete stack_account_url(@stack_account)
    end

    assert_redirected_to stack_accounts_url
  end
end
