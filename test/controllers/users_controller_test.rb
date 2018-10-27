require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get users_home_url
    assert_response :success
  end

  test "should get about" do
    get users_about_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
