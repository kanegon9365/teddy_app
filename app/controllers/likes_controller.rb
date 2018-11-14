class LikesController < ApplicationController

  before_action :set_tweetpost

  def create
    @like = Like.create(user_id: current_user.id, tweetpost_id: params[:tweetpost_id])
    @likes = Like.where(tweetpost_id: params[:tweetpost_id])
    @tweetpost.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweetpost_id: params[:tweetpost_id])
    like.destroy
    @likes = Like.where(tweetpost_id: params[:tweetpost_id])
    @tweetpost.reload
  end

  private

  def set_tweetpost
    @tweetpost = Tweetpost.find(params[:tweetpost_id])
  end

end
