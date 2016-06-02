class ArtistsController < ApplicationController

  def index
     @artists = Artist.all
     @artists = @artists.limit(50)
  end

  def show
     @artist = Artist.find_by(id: params[:id])
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
    if @artists
      @artists.delete
    end
    redirect_to albums_url
  end
  
end
