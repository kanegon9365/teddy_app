require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name:"kanegon", email:"kanegon@example.com", profile:"sampletext", password: "aaaaaa", password_confirmation: "aaaaaa")
  end

  test "ユーザーが正しく存在しているか" do
    assert @user.valid?
  end

  test "ユーザー名が存在しておりかつ文字数が制限内で収まっているか" do
    @user.name=" "
    assert_not @user.valid?
    @user.name = "a"*21
    assert_not @user.valid?
  end

  test "メールアドレスが存在しておりかつ文字数が制限内に収まっているか" do
    @user.email = " "
    assert_not @user.valid?
    @user.email = "a"*51
    assert_not @user.valid?
  end

  test "メールアドレスに一意性があるか" do
    duplicate = @user.dup
    duplicate.email = @user.email.upcase
    @user.save
    assert_not duplicate.valid?
  end

  test "プロフィール紹介文の文字数が制限内に収まっているか" do
    @user.profile = "a"*301
    assert_not @user.valid?
  end

  test "パスワードが存在するか及び文字数が正しいか" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "パスワードの文字数が正しいか?" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "ユーザーが削除された際にユーザーが持っているtweetも一緒に削除されるか" do
    @user.save
    @user.tweetposts.create(content:"aaa")
    assert_difference 'Tweetpost.count', -1 do
      @user.destroy
    end
  end



end
