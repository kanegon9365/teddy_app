class TweetpostsController < ApplicationController

  before_action :require_login, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def new
    @tweetposts = current_user.tweetposts.build
  end

  def create
    @tweetpost = current_user.tweetposts.build(tweet_params)
      if @tweetpost.save
        redirect_to root_path
      else
        @q = Tweetpost.none.ransack
        @feed = current_user.feed
        render 'users/home'
      end
  end

  def destroy
    @tweetpost.destroy
    redirect_to request.referrer || root_path
  end

  def show
    @tweetpost = Tweetpost.find(params[:id])
    @comment = Comment.new
    @comments = @tweetpost.comments
  end

  def tweet_params
    params.require(:tweetpost).permit(:content, :picture)
  end
  
  # ログインしているユーザーのpostの中にdeleteを要求したpost.idが存在すればtrueしなければfalseを返す
  def correct_user
    @tweetpost = current_user.tweetposts.find_by(id: params[:id])
    redirect_to root_path if @tweetpost.nil?
  end


end
