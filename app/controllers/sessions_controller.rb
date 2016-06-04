class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        flash[:success] = "Welcome back, #{user.name}"
        redirect_to albums_url
        return
      else
      end
    else
    end
    flash[:danger] = "Invalid email or password"
    redirect_to login_url
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
