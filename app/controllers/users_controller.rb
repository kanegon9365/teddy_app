class UsersController < ApplicationController

  before_action :require_login, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  
  def home
    if logged_in?
      @tweetposts = current_user.tweetposts.build
        if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
          @q = current_user.feed.ransack(tweetposts_search_params)
          @feed = @q.result
        else
          @q = Tweetpost.none.ransack
          @feed = current_user.feed
        end
      @url = root_path
    end
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @tweetposts = @user.tweetposts
    
   
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to succeed_path
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # データーベースから取得したオブジェクトを更新/保存
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def succeed
  end

  def index
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = User.ransack(search_params, activated_true: true)
    else
      @q = User.ransack(activated_true: true)
    end
    @users = @q.result
  end

  def search
    
  end

  
  

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end

  

  private

    def user_params
      params.require(:user).permit(:name, :email, :profile, :picture, :password, :password_confirmation)
    end

    def search_params
      params.require(:q).permit(:name_cont)
    end

    def tweetposts_search_params
      params.require(:q).permit(:content_cont)
    end

end
