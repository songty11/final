class AlbumsController < ApplicationController

	def index
		@albums = Album.all
		@albums = @albums.limit(100)
	end

	def show
		
  	end

	def new
		if params[:album_name]!=nil
     		@album = RSpotify::Album.search(params[:album_name])
     	end
	end

	def create
		@album = Album.new
	    @album.title = params[:movie][:title]
	    @album.description = params[:movie][:description]
	    @album.image_url = params[:movie][:image_url]
	    @album.singer_id = params[:movie][:singer_id]
	    @album.year = params[:movie][:year]
	    if @album.save
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
