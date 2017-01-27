module UsersHelper
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def user_rankings
    @users = User.all
    @users.sort {|a,b| b.wins <=> a.wins}
  end

  def user_ranking(user_object)
    users = user_rankings
    users.index(user_object) + 1
  end

  def total_users
    User.all.length
  end
end
