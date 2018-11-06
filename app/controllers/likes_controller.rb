class LikesController < ApplicationController
  def create
    @tweetpost = Tweetpost.find(params[:tweetpost_id])
    unless @tweetpost.do_like(current_user)
      @tweetpost.do_like(current_user)
      @tweetpost.reload
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
    end
    end
  end

  def destroy
    @tweetpost = Like.find(params[:id]).tweetpost
    
    if @tweetpost.like?(current_user)
      @tweetpost.do_unlike(current_user)
      @tweetpost.reload
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    end
  end
end
