require "application_system_test_case"

class SmallEmergenciesTest < ApplicationSystemTestCase
  setup do
    @small_emergency = small_emergencies(:one)
  end

  test "visiting the index" do
    visit small_emergencies_url
    assert_selector "h1", text: "Small Emergencies"
  end

  test "creating a Small emergency" do
    visit small_emergencies_url
    click_on "New Small Emergency"

    fill_in "Balance", with: @small_emergency.balance
    click_on "Create Small emergency"

    assert_text "Small emergency was successfully created"
    click_on "Back"
  end

  test "updating a Small emergency" do
    visit small_emergencies_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @small_emergency.balance
    click_on "Update Small emergency"

    assert_text "Small emergency was successfully updated"
    click_on "Back"
  end

  test "destroying a Small emergency" do
    visit small_emergencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Small emergency was successfully destroyed"
  end
end
