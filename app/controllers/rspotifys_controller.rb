class RspotifysController < ApplicationController
	def show
		@album = RSpotify::Album.find(params[:id])
  	end

	def index
     	if params[:album_name]!=nil and params[:album_name].length>0
     		@album = RSpotify::Album.search(params[:album_name])
     	end
	end


end
