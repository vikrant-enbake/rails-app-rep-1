class PicsController < ApplicationController
	def index
		
	end
	def new
		@pic = Pic.new

	end
	def create
		debugger
		@pic= Pic.new(params.require(:pics).permit(:name,:desc,:album_id, :avatar))	
		@pic.save
		redirect_to album_path(session[:current_album_id])
	end
	def show
		@pic = Pic.find(params[:id])

	end

		def destroy 
		@pic=Pic.find(params[:id])
		@pic.destroy
		redirect_to albums_path
	end
end
