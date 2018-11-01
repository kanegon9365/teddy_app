class SessionsController < ApplicationController
  def new
  end
   
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_back_or user
    else
      flash.now[:danger] = "メールアドレスもしくはパスワードが正しくありません"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
