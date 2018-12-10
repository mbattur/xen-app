require "application_system_test_case"

class ConsumerDebtsTest < ApplicationSystemTestCase
  setup do
    @consumer_debt = consumer_debts(:one)
  end

  test "visiting the index" do
    visit consumer_debts_url
    assert_selector "h1", text: "Consumer Debts"
  end

  test "creating a Consumer debt" do
    visit consumer_debts_url
    click_on "New Consumer Debt"

    fill_in "Balance", with: @consumer_debt.balance
    fill_in "Monthly Minimum", with: @consumer_debt.monthly_minimum
    fill_in "Name", with: @consumer_debt.name
    click_on "Create Consumer debt"

    assert_text "Consumer debt was successfully created"
    click_on "Back"
  end

  test "updating a Consumer debt" do
    visit consumer_debts_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @consumer_debt.balance
    fill_in "Monthly Minimum", with: @consumer_debt.monthly_minimum
    fill_in "Name", with: @consumer_debt.name
    click_on "Update Consumer debt"

    assert_text "Consumer debt was successfully updated"
    click_on "Back"
  end

  test "destroying a Consumer debt" do
    visit consumer_debts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consumer debt was successfully destroyed"
  end
end
