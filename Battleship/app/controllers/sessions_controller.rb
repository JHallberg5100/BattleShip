class SessionsController < ApplicationController
  def new
  end

  def create
    p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    p sessions_params
    user = User.find_by(email: sessions_params[:email])
    if user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.alert = "Invalid login info"
      render 'new'
    end
  end



  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
