class ParentsController < ApplicationController
		

	before_action :set_parent, only: [:show, :edit, :update, :destroy]

	def new
		@parent = Parent.new
	end

	def create
		@parent = Parent.new(valid_params)
		if @parent.save
			session[:parent_id] = @parent.id
			flash[:success] = "Welcome #{@parent.parent_name}!"
			redirect_to parent_path(@parent)
		else 
			render:new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @parent.update(valid_params)
			flash[:success] = "Your account is updated"
			redirect_to parent_path(@parent)
		else
			render :edit
		end
	end

	def destroy
			@parent.destroy
			flash[:danger] = "Your profile and all associated DIY projects have been deleted successfully"
			redirect_to root_path
	end

	private

	def valid_params
		params.require(:parent).permit(:parent_name, :parent_country, :email, :password, :password_confirmation)
	end

	def set_parent
			@parent = Parent.find(params[:id])
	end

end