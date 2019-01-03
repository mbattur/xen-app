require "application_system_test_case"

class RetirementAccountsTest < ApplicationSystemTestCase
  setup do
    @retirement_account = retirement_accounts(:one)
  end

  test "visiting the index" do
    visit retirement_accounts_url
    assert_selector "h1", text: "Retirement Accounts"
  end

  test "creating a Retirement account" do
    visit retirement_accounts_url
    click_on "New Retirement Account"

    fill_in "Balance", with: @retirement_account.balance
    click_on "Create Retirement account"

    assert_text "Retirement account was successfully created"
    click_on "Back"
  end

  test "updating a Retirement account" do
    visit retirement_accounts_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @retirement_account.balance
    click_on "Update Retirement account"

    assert_text "Retirement account was successfully updated"
    click_on "Back"
  end

  test "destroying a Retirement account" do
    visit retirement_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Retirement account was successfully destroyed"
  end
end
