class ArtistsController < ApplicationController

  def index

     @artists = Artist.order('id ASC').reorder('name ASC')
     if params[:keyword].present?
       @artists = @artists.where("name LIKE ?","%#{params[:keyword]}%")
     end
     @artists = @artists.limit(50)
  end

  def show
     @artist = Artist.find_by(id: params[:id])
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
    redirect_to albums_url notice: '#{artist.name} was successfully deleted'
  end
  
end
