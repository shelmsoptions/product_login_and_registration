class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users"
    else
      flash[:errors] = ["Email/Password isn't found"]
      redirect_to "/"
    end
  end

  def destroy
    reset_session
    redirect_to "/"
  end

end
