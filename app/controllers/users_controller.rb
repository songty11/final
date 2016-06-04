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
    if User.find_by(email:params[:user][:email])!=nil
      flash[:danger]="Email already exists"
        redirect_to new_user_url
    else
      if params[:user][:password] == params[:user][:password_confirmation]
        user = User.new
        user.name = params[:user][:name]
        user.email = params[:user][:email]
        user.password = params[:user][:password]
        user.image = "male_default.png"
        if user.save
          flash[:success] = "User was successfully created."
          redirect_to login_url
        else
          flash[:danger] = "Somgthing went wrong"
          redirect_to new_user_url
        end
      else
        flash[:danger]="Password not match"
        redirect_to new_user_url
      end
    end
  end

  def destroy
    @user.destroy
    redirect_to albums_url, notice: 'User was successfully deleted'
  end

  private
  def set_user
      @user = User.find(params[:id])
  end
  def user_params
      params.require(:user).permit(:name,:image, :gender, :birthday, :email)
  end
end
