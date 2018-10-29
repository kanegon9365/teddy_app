require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "ユーザー登録失敗" do 
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {
                                          name: " ",
                                          email: "false@ma,il",
                                          password: "aaa",
                                          password_digest: "aaa"
      }}
    end
    assert_template 'users/new'
  end
 
  test "ユーザー登録成功" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {
                                         name: "test",
                                         email: "test@example.com",
                                         password: "aaaaaa",
                                         password_digest: "aaaaaa"
      }}
    end
    follow_redirect!
    assert_template 'succeed'
  end



end
