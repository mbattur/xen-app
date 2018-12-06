require "application_system_test_case"

class CreditCardDebtsTest < ApplicationSystemTestCase
  setup do
    @credit_card_debt = credit_card_debts(:one)
  end

  test "visiting the index" do
    visit credit_card_debts_url
    assert_selector "h1", text: "Credit Card Debts"
  end

  test "creating a Credit card debt" do
    visit credit_card_debts_url
    click_on "New Credit Card Debt"

    fill_in "Balance", with: @credit_card_debt.balance
    fill_in "Monthly Minimum", with: @credit_card_debt.monthly_minimum
    fill_in "Name", with: @credit_card_debt.name
    click_on "Create Credit card debt"

    assert_text "Credit card debt was successfully created"
    click_on "Back"
  end

  test "updating a Credit card debt" do
    visit credit_card_debts_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @credit_card_debt.balance
    fill_in "Monthly Minimum", with: @credit_card_debt.monthly_minimum
    fill_in "Name", with: @credit_card_debt.name
    click_on "Update Credit card debt"

    assert_text "Credit card debt was successfully updated"
    click_on "Back"
  end

  test "destroying a Credit card debt" do
    visit credit_card_debts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Credit card debt was successfully destroyed"
  end
end
