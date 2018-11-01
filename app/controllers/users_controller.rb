class UsersController < ApplicationController

  before_action :require_login, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def home
  end

  def about
  end

  def show
    @user=User.find(params[:id])
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
    @users = User.all
  end

  
  def require_login
    unless logged_in?
      store_url
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
