class AlbumsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :create
	def index
		@albums = Album.all
		@albums = @albums.limit(100)
	end

	def show
		@album = Album.find_by(id: params[:id])
  	end

	def new
		redirect_to rspotifys_url
	end

	def create
		@album = Album.new
	    @album.title = params[:title]
	    @album.image_url = params[:image_url]
	    # @album.singer_id = params[:album][:singer_id]
	    @album.year = params[:year]
	    
	    artist = Artist.find_by(name: params[:artist])
	    if artist==nil
	    	artist = Artist.create(name:params[:artist])
	    end
			@album.artist_id = artist.id

	    if @album.save
	    	mtracks = RSpotify::Album.find(params[:spotifyid]).tracks
	    	mtracks.each do |song|
	    		@newsong = Song.new(name: song.name, runtime:song.duration_ms, album_id: @album.id, artist_id: artist.id, preview_url: song.preview_url)
	    		@newsong.save
	    		Track.create(song_id: @newsong.id, album_id:@album.id)
	   		 end
	      redirect_to albums_url, notice: "Album added! Thanks!"
	    else
	      render 'new'
	    end
	end

	def edit

	end

	def update

	end

	def destroy

	end


end
