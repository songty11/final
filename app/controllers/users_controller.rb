class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if !@user || (@user.id != session[:user_id].to_i)
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:user][:name]
    @user.gender = params[:user][:gender]
    @user.birthday = params[:user][:birthday]
    @user.note = params[:user][:note]
    @user.save
    redirect_to users_url(@user)
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save
    Avatar.create(image_url:"male_default.png",user_id:user.id)
    redirect_to root_path
  end

  def destroy
    User.delete(params[:id])
    redirect_to root_path
  end

end
