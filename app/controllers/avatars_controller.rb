class AvatarsController < ApplicationController
  def edit
    @avatar = Avatar.find_by(id: params[:id])
  end

  def update
    
    @avatar = Avatar.find_by(id: params[:id])
    if params[:avatar]!=nil
      @avatar.image_url = params[:avatar][:image_url]
      @avatar.save
    end
    @user = User.find_by(id:@avatar.user_id)
    redirect_to user_url(@user)
  end
end
