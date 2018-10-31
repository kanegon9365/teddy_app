class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to about_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to about_path
  end
end
