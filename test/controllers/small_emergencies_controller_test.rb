require 'test_helper'

class SmallEmergenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @small_emergency = small_emergencies(:one)
  end

  test "should get index" do
    get small_emergencies_url
    assert_response :success
  end

  test "should get new" do
    get new_small_emergency_url
    assert_response :success
  end

  test "should create small_emergency" do
    assert_difference('SmallEmergency.count') do
      post small_emergencies_url, params: { small_emergency: { balance: @small_emergency.balance } }
    end

    assert_redirected_to small_emergency_url(SmallEmergency.last)
  end

  test "should show small_emergency" do
    get small_emergency_url(@small_emergency)
    assert_response :success
  end

  test "should get edit" do
    get edit_small_emergency_url(@small_emergency)
    assert_response :success
  end

  test "should update small_emergency" do
    patch small_emergency_url(@small_emergency), params: { small_emergency: { balance: @small_emergency.balance } }
    assert_redirected_to small_emergency_url(@small_emergency)
  end

  test "should destroy small_emergency" do
    assert_difference('SmallEmergency.count', -1) do
      delete small_emergency_url(@small_emergency)
    end

    assert_redirected_to small_emergencies_url
  end
end
