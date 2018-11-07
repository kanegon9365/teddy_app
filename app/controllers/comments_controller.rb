class CommentsController < ApplicationController

  # 投稿にコメントを作成するメソッド
  def create
    @tweetpost = Tweetpost.find(params[:tweetpost_id])
    @comment = @tweetpost.comments.build(comment_params)
    @comment.user_id = current_user.id 
    
    if @comment.save
      render :index
    end
  end

  # 投稿についているコメントを削除するメソッド
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end


  private
    
    def comment_params
      params.require(:comment).permit(:content, :user_id, :tweetpost_id)
    end

end


