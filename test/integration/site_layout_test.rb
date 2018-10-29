require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "リンクが正しく存在しているか" do
    get root_path
    assert_template 'users/home'
    assert_select "a[href=?]",root_path
    # assert_select "a[href=?]",users_show_path
  end
end
