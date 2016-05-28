class ArtistsController < ApplicationController

  def index
    if params[:artist_name]!=nil
     @artists = RSpotify::Artist.search(params[:artist_name])
   else
     redirect_to albums_url
   end
  end

  def show
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
