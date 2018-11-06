module SessionsHelper

  def current_user
   if session[:user_id]
    @current_user = @current_user || User.find_by(id: session[:user_id])
   end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # リクエストによって保存されたurlもしくはデフォルトで指定したurlを返す
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # リクエストが送られたurlを保存するメソッド
  def store_url
    session[:forwarding_url] = request.fullpath if request.get?
  end

end
