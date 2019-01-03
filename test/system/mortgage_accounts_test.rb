require "application_system_test_case"

class MortgageAccountsTest < ApplicationSystemTestCase
  setup do
    @mortgage_account = mortgage_accounts(:one)
  end

  test "visiting the index" do
    visit mortgage_accounts_url
    assert_selector "h1", text: "Mortgage Accounts"
  end

  test "creating a Mortgage account" do
    visit mortgage_accounts_url
    click_on "New Mortgage Account"

    fill_in "Balance", with: @mortgage_account.balance
    click_on "Create Mortgage account"

    assert_text "Mortgage account was successfully created"
    click_on "Back"
  end

  test "updating a Mortgage account" do
    visit mortgage_accounts_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @mortgage_account.balance
    click_on "Update Mortgage account"

    assert_text "Mortgage account was successfully updated"
    click_on "Back"
  end

  test "destroying a Mortgage account" do
    visit mortgage_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mortgage account was successfully destroyed"
  end
end
