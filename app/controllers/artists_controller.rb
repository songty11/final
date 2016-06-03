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
    artist = Artist.find_by(id:params[:id])
    if artist
       albums = Album.where(artist_id:artist.id)
       albums.each do |album|
        album.delete
       end
      songs = Song.where(artist_id:artist.id)
      songs.each do |song|
        song.delete
      end
      artist.delete
    end
    redirect_to albums_url
  end
  
end
