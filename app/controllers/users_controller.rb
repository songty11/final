class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    if !@user || (@user.id != session[:user_id].to_i)
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.image = "male_default.png"
    user.save
    redirect_to login_url
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
    redirect_to root_path
  end

  private
  def set_user
      @user = User.find(params[:id])
  end
  def user_params
      params.require(:user).permit(:name,:image, :gender, :birthday, :email)
    end
end
