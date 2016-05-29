class AlbumsController < ApplicationController

	def index
		@albums = Album.all
		@albums = @albums.limit(100)
	end

	def show
		@album = Album.find_by(id: params[:id])
		if @album == nil
			@album = RSpotify::Album.find(params[:id])
		end
  	end

	def new
		if params[:album_name]!=nil
     		@album = RSpotify::Album.search(params[:album_name])
     	end
	end

	def create
		@album = Album.new
	    @album.title = params[:album][:title]
	    @album.description = params[:album][:description]
	    @album.image_url = params[:album][:image_url]
	    @album.singer_id = params[:album][:singer_id]
	    @album.year = params[:album][:year]
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
