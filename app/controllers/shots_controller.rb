class ShotsController < ApplicationController
	def index
		@shots = Shot.all
		# reset sessions shot_id
		session[:shot_ids]||=[]
		session[:shot_ids] = []
	end

	def show
		@shots = Shot.all
	end

	def create
		@shot = Shot.new(shot_params)
		respond_to do |format|
			if @shot.save
				# add this shot to the array
				session[:shot_ids] << @shot.id
				format.json { render json: {files: [@shot.to_jq_upload]}, status: :created, location: @shot }
			else
				format.json { render json: @shot.errors, status: :unprocessable_entity }
			end
		end
	end

	def new
		@shot = Shot.new
	end

	def destroy
	    set_shot.destroy
	end

private
	def set_shot
		@shot = Shot.find(params[:id])
	end
	def shot_params
		params.require(:shot).permit(
			:image,
			:image_url,
			:remove_image,
			:retained_image)
	end
end


# using .map returns an array
# .map(&:id)