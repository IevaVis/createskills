class TeachersController < ApplicationController
		

	before_action :set_teacher, only: [:show, :edit, :update, :destroy]

	def index
		@teachers = Teacher.all
	end


	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(valid_params)
		if @teacher.save
			session[:teacher_id] = @teacher.id
			flash[:success] = "Welcome #{@teacher.teacher_name}!"
			redirect_to documents_path
		else 
			render:new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @teacher.update(valid_params)
			flash[:success] = "Your account is updated"
			redirect_to teacher_path(@teacher)
		else
			render :edit
		end
	end

	def destroy
			@teacher.destroy
			flash[:danger] = "Your profile and all associated documents have been deleted successfully"
			redirect_to root_path
	end

	private

	def valid_params
		params.require(:teacher).permit(:teacher_name, :teacher_country, :email, :password, :password_confirmation, :area_field, :grade_of_teaching)
	end

	def set_teacher
			@teacher = Teacher.find(params[:id])
	end

end