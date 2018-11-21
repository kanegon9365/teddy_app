class UsersController < ApplicationController

  before_action :require_login, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  
  def home 
    
    @tweetposts = current_user.tweetposts.build if logged_in?
    if logged_in?
        if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
          @q = current_user.feed.ransack(current_user_tweetposts_search_params)
          @feed = @q.result.paginate(page: params[:page], per_page:10)
        else
          @q = Tweetpost.none.ransack
          @feed = current_user.feed.paginate(page: params[:page], per_page:10)
        end
      @url = root_path
    end
  end

  def search_all
    
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = Tweetpost.ransack(all_tweetpost_search_params, activated_true: true)
    else
      @q = Tweetpost.ransack(activated_true: true)
    end
    @tweetposts = @q.result.paginate(page: params[:page],per_page:15)
    @url = search_tweetpost_path
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @tweetposts = @user.tweetposts.paginate(page: params[:page], per_page:15)
    
   
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

  def edit_password
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

    def user_search_params
      params.require(:q).permit(:name_cont)
    end

    def all_tweetpost_search_params
      params.require(:q).permit(:content_cont)
    end

    def current_user_tweetposts_search_params
      params.require(:q).permit(:content_cont)
    end

end
