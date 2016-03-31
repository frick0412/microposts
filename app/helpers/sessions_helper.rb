module SessionsHelper
  
   # 与えられたユーザーがログイン済みユーザーであればtrueを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
   # 与えられたユーザーをログイン
  def logged_in?
    !!current_user
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  #記憶したURLにリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end