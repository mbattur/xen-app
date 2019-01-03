require 'test_helper'

class BigEmergenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @big_emergency = big_emergencies(:one)
  end

  test "should get index" do
    get big_emergencies_url
    assert_response :success
  end

  test "should get new" do
    get new_big_emergency_url
    assert_response :success
  end

  test "should create big_emergency" do
    assert_difference('BigEmergency.count') do
      post big_emergencies_url, params: { big_emergency: { balance: @big_emergency.balance } }
    end

    assert_redirected_to big_emergency_url(BigEmergency.last)
  end

  test "should show big_emergency" do
    get big_emergency_url(@big_emergency)
    assert_response :success
  end

  test "should get edit" do
    get edit_big_emergency_url(@big_emergency)
    assert_response :success
  end

  test "should update big_emergency" do
    patch big_emergency_url(@big_emergency), params: { big_emergency: { balance: @big_emergency.balance } }
    assert_redirected_to big_emergency_url(@big_emergency)
  end

  test "should destroy big_emergency" do
    assert_difference('BigEmergency.count', -1) do
      delete big_emergency_url(@big_emergency)
    end

    assert_redirected_to big_emergencies_url
  end
end
