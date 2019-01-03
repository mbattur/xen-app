require "application_system_test_case"

class BigEmergenciesTest < ApplicationSystemTestCase
  setup do
    @big_emergency = big_emergencies(:one)
  end

  test "visiting the index" do
    visit big_emergencies_url
    assert_selector "h1", text: "Big Emergencies"
  end

  test "creating a Big emergency" do
    visit big_emergencies_url
    click_on "New Big Emergency"

    fill_in "Balance", with: @big_emergency.balance
    click_on "Create Big emergency"

    assert_text "Big emergency was successfully created"
    click_on "Back"
  end

  test "updating a Big emergency" do
    visit big_emergencies_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @big_emergency.balance
    click_on "Update Big emergency"

    assert_text "Big emergency was successfully updated"
    click_on "Back"
  end

  test "destroying a Big emergency" do
    visit big_emergencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Big emergency was successfully destroyed"
  end
end
