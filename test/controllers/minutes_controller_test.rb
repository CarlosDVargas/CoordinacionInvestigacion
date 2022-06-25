require "test_helper"

class MinutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minute = minutes(:one)
  end

  test "should get index" do
    get minutes_url
    assert_response :success
  end

  test "should get new" do
    get new_minute_url
    assert_response :success
  end

  test "should create minute" do
    assert_difference("Minute.count") do
      post minutes_url, params: { minute: { date: @minute.date, number: @minute.number } }
    end

    assert_redirected_to minute_url(Minute.last)
  end

  test "should show minute" do
    get minute_url(@minute)
    assert_response :success
  end

  test "should get edit" do
    get edit_minute_url(@minute)
    assert_response :success
  end

  test "should update minute" do
    patch minute_url(@minute), params: { minute: { date: @minute.date, number: @minute.number } }
    assert_redirected_to minute_url(@minute)
  end

  test "should destroy minute" do
    assert_difference("Minute.count", -1) do
      delete minute_url(@minute)
    end

    assert_redirected_to minutes_url
  end
end
