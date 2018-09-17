class DiyprojectsController < ApplicationController
	include ParentsSessionsHelper
	before_action :set_diyproject, only: [:show, :edit, :update, :destroy]
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index
		@diyprojects = Diyproject.all.order("created_at DESC")
	end

	def new
		@diyproject = Diyproject.new
	end

	def create
		@diyproject = Diyproject.new(valid_params)
		@diyproject.parent = current_parent
		if @diyproject.save
			flash[:success] = "Thank You! Your project is uploaded successfully!"
			redirect_to diyproject_path(@diyproject)
		else 
			flash[:danger] = "Something went wrong. Try again"
			render:new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @diyproject.update_attributes(valid_params)
			redirect_to diyproject_path(@diyproject)
			flash[:success] = "DIY project updated successfully"
		else
			flash[:alert] = "Error updating DIY Project. Try again"
			render :edit
		end
	end

	def destroy
		@diyproject.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js { render "destroy", locals: {id: @diyproject.id} }
		end 
	end

	def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: @diyproject_path)
  end

  private
		def valid_params
			params.require(:diyproject).permit(:title, :description, images: [])
		end

		def require_login
			if !logged_in?
				flash[:danger] = "You must be logged in to perform this action"
				redirect_back(fallback_location: root_path)
			end
		end

		def set_diyproject
			@diyproject = Diyproject.find(params[:id])
		end

	end










