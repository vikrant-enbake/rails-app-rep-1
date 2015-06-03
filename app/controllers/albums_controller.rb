class AlbumsController < ApplicationController
	def index
		
		@user = current_user
		
	end
	def new
		@album = current_user.album.new
		@user = current_user
	    
	    @pics = @album.pics.new

	    @pics.tags.build
		

	    
		
	end
	def create 
		
		@album=current_user.album.new(album_params)
		

		if @album.save
			
	    	redirect_to @album
		else
			render 'new'
		end
	end

	def show
		@album=Album.find(params[:id])
		session[:current_album_id] = @album.id
	end

	def edit
		@album=Album.find(params[:id])
	end

	def update
	  @album =current_user.album.find(params[:id])
	  if @album.update(album_params)
	    redirect_to @album
	  else
	    render 'edit'
	  end
	end

	def destroy 
		@album=Album.find(params[:id])
		@album.destroy
		redirect_to albums_path
	end

private
    def album_params
      params.require(:album).permit(:name, :description,  pics_attributes: [:name,:avatar,tags_attributes: [:name]])
     end
end
