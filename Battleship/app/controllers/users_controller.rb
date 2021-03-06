class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(users_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
  end

  def show
    @user = User.find_by(id: params[:id])
    @games = @user.hosted_games + @user.joined_games
  end

  private
  def users_params
    params.require(:user).permit(:username, :email, :password)
  end
end
