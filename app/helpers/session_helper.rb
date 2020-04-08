module SessionHelper
  # Remembers a user in a persistent session.
  def remember(user)
    user.create_remember_token
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.permanent.signed[:user_id]) if cookies.permanent.signed[:user_id]
  end

  def current_user_check(current_user)
    return true if session[:user_id].eql?(current_user.id)
  end

  def logged_in?
    !current_user.nil?
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def log_out
    cookies.permanent.signed[:user_id] = nil
    cookies.permanent[:remember_token] = nil
    @current_user = nil
  end
end
