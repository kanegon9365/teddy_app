require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:michael)
    @other = users(:archer)
    log_in_as(@user)
  end

  test "should follow a user with Ajax" do
    assert_difference '@user.following.count', 1 do
      post relationships_path, xhr: true, params: { followed_id: @other.id }
    end
  end
end