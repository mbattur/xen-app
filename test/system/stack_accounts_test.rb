require "application_system_test_case"

class StackAccountsTest < ApplicationSystemTestCase
  setup do
    @stack_account = stack_accounts(:one)
  end

  test "visiting the index" do
    visit stack_accounts_url
    assert_selector "h1", text: "Stack Accounts"
  end

  test "creating a Stack account" do
    visit stack_accounts_url
    click_on "New Stack Account"

    fill_in "Balance", with: @stack_account.balance
    click_on "Create Stack account"

    assert_text "Stack account was successfully created"
    click_on "Back"
  end

  test "updating a Stack account" do
    visit stack_accounts_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @stack_account.balance
    click_on "Update Stack account"

    assert_text "Stack account was successfully updated"
    click_on "Back"
  end

  test "destroying a Stack account" do
    visit stack_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stack account was successfully destroyed"
  end
end
