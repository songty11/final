class SongsController < ApplicationController
  def show
     @song = Song.find_by(id: params[:id])
  end
end
