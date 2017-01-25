module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) # if @current_user comes back nil, find the user in the database with the id that matches the 'user_id' in the 'session' hash and assign it to @current_user
  end

  def logged_in?
    !!current_user
  end

  def set_session(user)
    session[:user_id] = user.id
  end

end
