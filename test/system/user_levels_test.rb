require "application_system_test_case"

class UserLevelsTest < ApplicationSystemTestCase
  setup do
    @user_level = user_levels(:one)
  end

  test "visiting the index" do
    visit user_levels_url
    assert_selector "h1", text: "User Levels"
  end

  test "creating a User level" do
    visit user_levels_url
    click_on "New User Level"

    fill_in "Level", with: @user_level.level
    click_on "Create User level"

    assert_text "User level was successfully created"
    click_on "Back"
  end

  test "updating a User level" do
    visit user_levels_url
    click_on "Edit", match: :first

    fill_in "Level", with: @user_level.level
    click_on "Update User level"

    assert_text "User level was successfully updated"
    click_on "Back"
  end

  test "destroying a User level" do
    visit user_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User level was successfully destroyed"
  end
end
