class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(session_params[:email], session_params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = 'Logged in'
      redirect_to root_path
    else
      flash[:danger] = 'Wrong username and/or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
