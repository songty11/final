class AlbumsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :create
	def index
		@albums = Album.all
		
		if params[:keyword].present?
     	 @albums = @albums.where("title LIKE ? OR year = ?",
                                             "%#{params[:keyword]}%", params[:keyword])
    	end
		@albums = @albums.limit(100)
		@albums = @albums.shuffle
	end

	def show
		@album = Album.find_by(id: params[:id])
  	end

	def new
		redirect_to rspotifys_url
	end

	def create
		if Album.find_by(spotify_id:params[:spotifyid]) == nil
			@album = Album.new
		    @album.title = params[:title]
		    @album.image_url = params[:image_url]
		    @album.year = params[:year]
		    @album.popularity = params[:popularity]
		    @album.total_tracks = params[:total_tracks]
		    @album.album_type = params[:album_type]
		    @album.spotify_id = params[:spotifyid]
		    artist = Artist.find_by(spotify_id: params[:artist_sid])
		    if artist==nil
		    	spotifyartist = RSpotify::Artist.find(params[:artist_sid])
		    	artist = Artist.create(name:params[:artist],spotify_id:spotifyartist.id,photo_url: spotifyartist.images[1]['url'])
		    	spotifyartist.top_tracks('us').each do |top|
		    		Toptrack.create(name:top.name, preview_url:top.preview_url, artist_id:artist.id)
		    	end
		    end
				@album.artist_id = artist.id

		    if @album.save
		    	mtracks = RSpotify::Album.find(params[:spotifyid])
		    	mtracks.tracks.each do |song|
		    		@newsong = Song.new(name: song.name, runtime:song.duration_ms, album_id: @album.id, artist_id: artist.id, preview_url: song.preview_url,popularity: song.popularity)
		    		@newsong.save
		   		end


		      redirect_to albums_url, notice: "Album added! Thanks!"
		    else
		      render 'new'
		    end

		else
			flash[:warning] = "Album already exsists!"
			redirect_to albums_url
		end

	end

	def edit

	end

	def update

	end

	def destroy
		Album.delete(params[:id])
    	redirect_to albums_url
	end


end
